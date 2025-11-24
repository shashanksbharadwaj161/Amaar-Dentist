from __future__ import annotations

from datetime import datetime, date
from typing import List, Optional
from uuid import UUID

from pydantic import BaseModel, Field


class AvailabilityRequest(BaseModel):
    facility_id: UUID
    date: date


class SlotOption(BaseModel):
    start: datetime
    end: datetime


class AvailabilityResponse(BaseModel):
    slots: List[SlotOption]


class BookingRequest(BaseModel):
    facility_id: UUID
    customer_name: str
    customer_phone: str
    start: datetime
    end: datetime


class BookingResponse(BaseModel):
    booking_id: UUID
    start: datetime
    end: datetime
    status: str = Field(default="confirmed")


class TwilioVoiceWebhook(BaseModel):
    From: str
    To: str
    CallSid: str
    AccountSid: str
