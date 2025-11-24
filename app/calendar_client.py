from __future__ import annotations

from datetime import datetime, timedelta
from typing import List, Tuple

# TODO: Implement Google Calendar OAuth flow and persistence. For now we stub minimal behavior.


async def get_busy_intervals(calendar_id: str, start: datetime, end: datetime) -> List[Tuple[datetime, datetime]]:
    """Return busy intervals for the given calendar between start and end.

    This stub returns an empty list. Integrate google-api-python-client or
    google calendar async client and pull events with timeMin/timeMax.
    """

    # Placeholder: Replace with Google Calendar API calls using stored credentials.
    return []


async def create_event(
    calendar_id: str,
    summary: str,
    start: datetime,
    end: datetime,
    description: str | None = None,
) -> str:
    """Create an event on the provided calendar and return the event ID.

    This stub returns a fake event id. Replace with Google Calendar API logic.
    """

    # Placeholder: perform actual event creation.
    fake_event_id = f"evt_{int(start.timestamp())}"
    return fake_event_id
