create table if not exists public.incidents (
  run_id text primary key,
  request_hash text not null,
  status text not null default 'received',
  incident jsonb not null default '{}'::jsonb,
  diagnosis jsonb,
  approval_required boolean not null default false,
  approval_status text not null default 'not_required',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create table if not exists public.receipts (
  id bigint generated always as identity primary key,
  run_id text not null references public.incidents(run_id) on delete cascade,
  receipt_id text not null unique,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);
create table if not exists public.action_logs (
  id bigint generated always as identity primary key,
  run_id text not null references public.incidents(run_id) on delete cascade,
  action text not null,
  status text not null,
  details jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);
alter table public.incidents enable row level security;
alter table public.receipts enable row level security;
alter table public.action_logs enable row level security;
