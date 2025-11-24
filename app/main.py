from __future__ import annotations

from datetime import datetime
from fastapi import Depends, FastAPI
from sqlalchemy.ext.asyncio import AsyncSession

from .booking_service import check_availability, create_booking
from .db import get_session
from .schemas import AvailabilityRequest, AvailabilityResponse, BookingRequest, BookingResponse, SlotOption
from .telephony.twilio_webhook import router as twilio_voice_router
from .telephony.twilio_media import router as twilio_media_router

app = FastAPI(title="AI Badminton Receptionist")
app.include_router(twilio_voice_router)
app.include_router(twilio_media_router)


@app.get("/health")
async def health() -> dict[str, str]:
    return {"status": "ok"}


@app.post("/availability", response_model=AvailabilityResponse)
async def availability(request: AvailabilityRequest, session: AsyncSession = Depends(get_session)):
    slots = await check_availability(session, request.facility_id, datetime.combine(request.date, datetime.min.time()))
    return AvailabilityResponse(slots=slots)


@app.post("/book", response_model=BookingResponse)
async def book(request: BookingRequest, session: AsyncSession = Depends(get_session)):
    slot = SlotOption(start=request.start, end=request.end)
    booking = await create_booking(
        session=session,
        facility_id=request.facility_id,
        customer_name=request.customer_name,
        customer_phone=request.customer_phone,
        slot=slot,
    )
    return BookingResponse(booking_id=booking.id, start=booking.start_time, end=booking.end_time, status=booking.status)
