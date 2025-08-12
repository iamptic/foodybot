# ---- Base image
FROM python:3.11-slim

# ---- System settings (чуть быстрее и тише)
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# ---- Workdir
WORKDIR /app

# ---- Install deps только для backend
COPY backend/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# ---- Copy project
COPY . /app

# ---- Run backend from backend.main:app (НЕ из корня!)
# Railway даст $PORT, подставляем с дефолтом 8000 для локального запуска
CMD ["sh", "-c", "uvicorn backend.main:app --host 0.0.0.0 --port ${PORT:-8000}"]
