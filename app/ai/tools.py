from __future__ import annotations

from datetime import datetime
from typing import Any, Dict
from uuid import UUID

from sqlalchemy.ext.asyncio import AsyncSession

from ..booking_service import check_availability, create_booking
from ..schemas import SlotOption


class ToolContext:
    def __init__(self, session: AsyncSession):
        self.session = session


async def check_availability_tool(context: ToolContext, facility_id: UUID, date: str) -> Dict[str, Any]:
    target_date = datetime.fromisoformat(date)
    slots = await check_availability(context.session, facility_id, target_date)
    return {"slots": [slot.dict() for slot in slots]}


async def create_booking_tool(
    context: ToolContext,
    facility_id: UUID,
    customer_name: str,
    customer_phone: str,
    start: str,
    end: str,
) -> Dict[str, Any]:
    slot = SlotOption(start=datetime.fromisoformat(start), end=datetime.fromisoformat(end))
    booking = await create_booking(
        session=context.session,
        facility_id=facility_id,
        customer_name=customer_name,
        customer_phone=customer_phone,
        slot=slot,
    )
    return {
        "booking_id": str(booking.id),
        "start": booking.start_time.isoformat(),
        "end": booking.end_time.isoformat(),
        "status": booking.status,
    }
