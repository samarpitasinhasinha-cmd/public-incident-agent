# Public Incident Agent

Vercel Node.js API backed by Supabase.

## Endpoints
- `POST /v2/incidents`
- `POST /v2/incidents/{runId}/receipts`
- `GET /v2/incidents/{runId}`

Set `SUPABASE_URL` to the project base URL (without `/rest/v1/`) and `SUPABASE_SECRET_KEY` to a server-side Supabase secret key in Vercel Production. Run `schema.sql` in Supabase SQL Editor.

The API performs cautious rule-based triage, persists incidents/receipts/action logs, detects matching retries and conflicts, and marks destructive requests as requiring approval without executing them. It emits trace IDs and structured logs; external OTLP export is not configured in this starter.
