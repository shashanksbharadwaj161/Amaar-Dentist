# patient

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

## Backend (FastAPI) for AI Receptionist

This repository now contains a FastAPI backend skeleton for an AI-powered badminton receptionist. Key pieces:

- Async FastAPI application under `app/` with SQLAlchemy models, booking logic, and telephony hooks for Twilio.
- PostgreSQL via Supabase (configure `DATABASE_URL` in `.env`).
- Google Calendar and OpenAI Realtime API integration stubs.

Run locally:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

Environment variables are listed in `.env.example`.
