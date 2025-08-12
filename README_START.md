# Backend Start Bundle (Railway)

Drop these files in the **repo root** (same level as `backend/`, `web/`, `bot/`). Commit & push.

Included:
- `main.py` — tiny shim so `uvicorn main:app` loads `backend.main:app`
- `requirements.txt` — installs deps from `backend/requirements.txt`
- `Procfile` — explicit start command for Railway

## Expected repo structure

<repo-root>/
  backend/
    main.py
    requirements.txt
    ...
  web/
    ...
  bot/           (optional)
  main.py        (from this bundle)
  requirements.txt
  Procfile

## Railway service settings (backend)

- Build Command: `pip install -r requirements.txt`
  (or leave empty — Nixpacks will detect root requirements)
- Start Command: `uvicorn backend.main:app --host 0.0.0.0 --port $PORT`

After deploy check:
GET https://<your-backend-domain>/health  ->  {"ok": true}
