from __future__ import annotations

import asyncio
import json
from typing import Any, Dict

import websockets

from ..config import get_settings
from .prompt_builder import build_system_prompt


class RealtimeAIClient:
    def __init__(self) -> None:
        self.settings = get_settings()
        self.websocket: websockets.WebSocketClientProtocol | None = None

    async def connect(self, facility: Dict[str, Any], tools: Dict[str, Any]) -> None:
        """Connect to OpenAI Realtime endpoint and register tools."""
        headers = {"Authorization": f"Bearer {self.settings.openai_api_key}"}
        self.websocket = await websockets.connect("wss://api.openai.com/v1/realtime", extra_headers=headers)

        system_prompt = build_system_prompt(facility)
        init_payload = {
            "type": "session",  # depends on OpenAI Realtime spec
            "system": system_prompt,
            "tools": tools,
        }
        await self.websocket.send(json.dumps(init_payload))

    async def send_tool_result(self, tool_call_id: str, result: Dict[str, Any]) -> None:
        if not self.websocket:
            raise RuntimeError("Websocket not connected")
        payload = {"type": "tool_result", "tool_call_id": tool_call_id, "result": result}
        await self.websocket.send(json.dumps(payload))

    async def receive_loop(self, on_tool_call) -> None:
        if not self.websocket:
            raise RuntimeError("Websocket not connected")
        async for raw in self.websocket:
            message = json.loads(raw)
            if message.get("type") == "tool_call":
                await on_tool_call(message)
            # TODO: handle assistant audio/text messages and forward to caller

    async def close(self) -> None:
        if self.websocket:
            await self.websocket.close()
            self.websocket = None


async def run_realtime_session(facility: Dict[str, Any], tool_handler) -> None:
    """Helper to start a realtime session with tools."""
    client = RealtimeAIClient()
    await client.connect(facility=facility, tools=tool_handler.tool_specs)
    await client.receive_loop(tool_handler.handle_tool_call)
