from __future__ import annotations

from datetime import datetime, time, timedelta, timezone
from typing import Iterable, List, Tuple

import pytz


def parse_time_range(range_str: str) -> Tuple[time, time]:
    start_str, end_str = range_str.split("-")
    start_time = datetime.strptime(start_str, "%H:%M").time()
    end_time = datetime.strptime(end_str, "%H:%M").time()
    return start_time, end_time


def localize(dt: datetime, tz_name: str) -> datetime:
    tz = pytz.timezone(tz_name)
    if dt.tzinfo is None:
        return tz.localize(dt)
    return dt.astimezone(tz)


def to_utc(dt: datetime) -> datetime:
    if dt.tzinfo is None:
        raise ValueError("Datetime must be timezone-aware")
    return dt.astimezone(timezone.utc)


def iter_slots(open_ranges: Iterable[str], target_date: datetime, slot_minutes: int, tz_name: str) -> List[Tuple[datetime, datetime]]:
    tz = pytz.timezone(tz_name)
    slots: List[Tuple[datetime, datetime]] = []
    for range_str in open_ranges:
        start_time, end_time = parse_time_range(range_str)
        window_start = tz.localize(datetime.combine(target_date.date(), start_time))
        window_end = tz.localize(datetime.combine(target_date.date(), end_time))
        cursor = window_start
        while cursor + timedelta(minutes=slot_minutes) <= window_end:
            slot_end = cursor + timedelta(minutes=slot_minutes)
            slots.append((cursor, slot_end))
            cursor = slot_end
    return slots


def overlaps(interval: Tuple[datetime, datetime], busy: Tuple[datetime, datetime]) -> bool:
    start, end = interval
    busy_start, busy_end = busy
    return start < busy_end and end > busy_start
