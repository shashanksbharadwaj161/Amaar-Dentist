from __future__ import annotations

from fastapi import APIRouter, WebSocket, WebSocketDisconnect

from ..ai.realtime_client import RealtimeAIClient

router = APIRouter(prefix="/twilio", tags=["twilio"])


@router.websocket("/media")
async def media_stream(websocket: WebSocket):
    await websocket.accept()
    ai_client = RealtimeAIClient()
    # TODO: handshake with OpenAI realtime, attach tools for booking logic.
    # TODO: link Twilio media stream to AI audio stream.

    try:
        while True:
            message = await websocket.receive_text()
            # Twilio sends JSON with event and audio payload (base64). Parse and feed to AI.
            # Example shape: {"event": "media", "media": {"payload": "..."}}
            # ai_client.send_audio(media_payload)

            # TODO: receive AI generated audio chunks and send to Twilio via websocket.send_text/binary
            # Example: await websocket.send_text(json.dumps(twilio_media_response))
    except WebSocketDisconnect:
        # TODO: close AI client session and cleanup
        await ai_client.close()
    except Exception:
        await ai_client.close()
        raise
