from __future__ import annotations

from typing import Any, Dict


def build_system_prompt(facility: Dict[str, Any]) -> str:
    name = facility.get("name", "Badminton Center")
    timezone = facility.get("timezone", "Asia/Kolkata")
    slot_minutes = facility.get("slot_minutes", 60)
    open_hours = facility.get("open_hours", {})

    hours_summary = "; ".join(
        f"{day.upper()}: {', '.join(ranges)}" for day, ranges in open_hours.items()
    )
    return (
        "You are an AI phone receptionist for a badminton center. "
        "Your job is to answer calls, help callers book badminton courts, and answer simple questions. "
        "Always confirm date, time and name before booking. If unsure about something that is not part of the tools, "
        "say a human will call back later. "
        f"Facility: {name}. Timezone: {timezone}. Slot length: {slot_minutes} minutes. "
        f"Operating hours: {hours_summary}."
    )
