from __future__ import annotations

from functools import lru_cache
from pydantic import BaseSettings, Field


class Settings(BaseSettings):
    database_url: str = Field(..., env="DATABASE_URL")
    openai_api_key: str = Field(..., env="OPENAI_API_KEY")
    twilio_account_sid: str = Field(..., env="TWILIO_ACCOUNT_SID")
    twilio_auth_token: str = Field(..., env="TWILIO_AUTH_TOKEN")
    google_project_id: str | None = Field(None, env="GOOGLE_PROJECT_ID")
    google_calendar_id: str | None = Field(None, env="GOOGLE_CALENDAR_ID")
    google_credentials_json: str | None = Field(None, env="GOOGLE_CREDENTIALS_JSON")

    class Config:
        env_file = ".env"
        case_sensitive = False


@lru_cache(maxsize=1)
def get_settings() -> Settings:
    return Settings()
