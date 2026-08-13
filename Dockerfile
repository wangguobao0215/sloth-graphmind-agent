# syntax=docker/dockerfile:1
FROM node:26-alpine AS frontend-builder

WORKDIR /app
COPY explorer/package*.json ./explorer/
WORKDIR /app/explorer
RUN npm ci

COPY explorer/ ./
RUN mkdir -p /app/graphmind && npm run build

FROM python:3.14-slim AS runtime

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    FALKORDB_HOST=falkordb \
    FALKORDB_PORT=6379 \
    ALLOWED_ORIGINS=http://localhost:8000,http://127.0.0.1:8000

WORKDIR /app

RUN groupadd --system graphmind \
    && useradd --system --gid graphmind --home-dir /app --shell /usr/sbin/nologin graphmind

COPY pyproject.toml README.md LICENSE MANIFEST.in ./
COPY sloth_graphmind/ ./sloth_graphmind/
COPY integrations/ ./integrations/
COPY --from=frontend-builder /app/graphmind/static ./sloth_graphmind/static

RUN pip install --no-cache-dir ".[explorer]" \
    && chown -R graphmind:graphmind /app

USER graphmind

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
    CMD python -c "import json, urllib.request; data=json.load(urllib.request.urlopen('http://127.0.0.1:8000/api/health', timeout=3)); raise SystemExit(0 if data.get('status') == 'ok' else 1)"

CMD ["python", "-m", "uvicorn", "sloth_graphmind.explorer.app:app", "--host", "0.0.0.0", "--port", "8000"]
