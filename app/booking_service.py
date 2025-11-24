from __future__ import annotations

from datetime import datetime, timedelta
from typing import List
from uuid import UUID

from sqlalchemy import select
from sqlalchemy.orm import selectinload
from sqlalchemy.ext.asyncio import AsyncSession

from . import calendar_client
from .models import Booking, Customer, Facility, FacilityConfig
from .schemas import SlotOption
from .utils.time_utils import iter_slots, overlaps, to_utc


async def get_facility_with_config(session: AsyncSession, facility_id: UUID) -> Facility:
    result = await session.execute(
        select(Facility)
        .where(Facility.id == facility_id)
        .options(selectinload(Facility.config), selectinload(Facility.courts))
    )
    facility = result.scalars().first()
    if not facility:
        raise ValueError("Facility not found")
    return facility


async def check_availability(session: AsyncSession, facility_id: UUID, target_date: datetime) -> List[SlotOption]:
    facility = await get_facility_with_config(session, facility_id)
    config: FacilityConfig | None = facility.config
    if not config:
        raise ValueError("Facility config missing")

    weekday = target_date.strftime("%a").lower()[:3]
    open_hours = config.open_hours.get(weekday)
    if not open_hours:
        return []

    candidate_slots = iter_slots(open_hours, target_date, config.slot_minutes, facility.timezone)

    calendar_id = facility.courts[0].calendar_id if facility.courts else None
    if not calendar_id:
        calendar_id = facility.phone_number  # placeholder id if none provided

    day_start = candidate_slots[0][0] if candidate_slots else target_date
    day_end = candidate_slots[-1][1] if candidate_slots else target_date + timedelta(days=1)
    busy_intervals = await calendar_client.get_busy_intervals(calendar_id, day_start, day_end)

    available = []
    for slot in candidate_slots:
        if any(overlaps(slot, busy) for busy in busy_intervals):
            continue
        available.append(SlotOption(start=slot[0].astimezone(), end=slot[1].astimezone()))
    return available


async def upsert_customer(session: AsyncSession, facility_id: UUID, name: str, phone: str) -> Customer:
    result = await session.execute(
        select(Customer).where(Customer.facility_id == facility_id, Customer.phone == phone)
    )
    customer = result.scalars().first()
    if customer:
        if name and customer.name != name:
            customer.name = name
            session.add(customer)
        return customer

    customer = Customer(facility_id=facility_id, name=name, phone=phone)
    session.add(customer)
    await session.flush()
    return customer


async def create_booking(
    session: AsyncSession,
    facility_id: UUID,
    customer_name: str,
    customer_phone: str,
    slot: SlotOption,
) -> Booking:
    facility = await get_facility_with_config(session, facility_id)
    customer = await upsert_customer(session, facility_id, customer_name, customer_phone)

    calendar_id = facility.courts[0].calendar_id if facility.courts else None
    if not calendar_id:
        calendar_id = facility.phone_number

    start_utc = to_utc(slot.start)
    end_utc = to_utc(slot.end)

    event_id = await calendar_client.create_event(
        calendar_id=calendar_id,
        summary=f"Badminton booking - {customer_name}",
        start=slot.start,
        end=slot.end,
        description=f"Phone AI booking for {customer_phone}",
    )

    booking = Booking(
        facility_id=facility_id,
        customer_id=customer.id,
        start_time=start_utc,
        end_time=end_utc,
        google_event_id=event_id,
        status="confirmed",
        source="phone_ai",
    )
    session.add(booking)
    await session.commit()
    await session.refresh(booking)
    return booking
