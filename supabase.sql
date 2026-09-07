create table if not exists public.jobs (
  id text primary key,
  name text not null,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.jobs enable row level security;

drop policy if exists "Public can read jobs" on public.jobs;
drop policy if exists "Public can create jobs" on public.jobs;
drop policy if exists "Public can update jobs" on public.jobs;
drop policy if exists "Public can delete jobs" on public.jobs;

create policy "Public can read jobs"
  on public.jobs for select
  to anon
  using (true);

create policy "Public can create jobs"
  on public.jobs for insert
  to anon
  with check (true);

create policy "Public can update jobs"
  on public.jobs for update
  to anon
  using (true)
  with check (true);

create policy "Public can delete jobs"
  on public.jobs for delete
  to anon
  using (true);
