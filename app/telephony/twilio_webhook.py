from __future__ import annotations

from datetime import datetime

from fastapi import APIRouter, Depends, Form, HTTPException
from fastapi.responses import Response
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from twilio.twiml.voice_response import VoiceResponse

from ..db import get_session
from ..models import Call, Facility

router = APIRouter(prefix="/twilio", tags=["twilio"])


@router.post("/voice")
async def voice_webhook(
    From: str = Form(...),
    To: str = Form(...),
    CallSid: str = Form(...),
    AccountSid: str = Form(...),
    session: AsyncSession = Depends(get_session),
):
    result = await session.execute(select(Facility).where(Facility.phone_number == To))
    facility = result.scalars().first()
    if not facility:
        raise HTTPException(status_code=404, detail="Facility not found for phone number")

    call = Call(
        facility_id=facility.id,
        caller_phone=From,
        started_at=datetime.utcnow(),
        meta={"CallSid": CallSid, "AccountSid": AccountSid},
    )
    session.add(call)
    await session.commit()

    response = VoiceResponse()
    response.say("Connecting you to our automated assistant. Please hold.")
    response.connect().stream(url="wss://your-ngrok-or-domain.twilio/media")

    return Response(content=str(response), media_type="application/xml")
