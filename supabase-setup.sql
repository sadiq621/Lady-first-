-- LADY FIRST: SUPABASE DATABASE + STORAGE
-- Run this in Supabase Dashboard -> SQL Editor.

create extension if not exists pgcrypto;

create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  category text,
  description text,
  image_url text not null,
  storage_path text,
  is_active boolean not null default true,
  created_at timestamptz not null default now()
);

alter table public.products enable row level security;

drop policy if exists "Public can view active products" on public.products;
create policy "Public can view active products"
on public.products for select
to anon, authenticated
using (is_active = true);

drop policy if exists "Authenticated can insert products" on public.products;
create policy "Authenticated can insert products"
on public.products for insert
to authenticated
with check (true);

drop policy if exists "Authenticated can update products" on public.products;
create policy "Authenticated can update products"
on public.products for update
to authenticated
using (true) with check (true);

drop policy if exists "Authenticated can delete products" on public.products;
create policy "Authenticated can delete products"
on public.products for delete
to authenticated
using (true);

insert into storage.buckets (id,name,public)
values ('product-images','product-images',true)
on conflict (id) do update set public=true;

drop policy if exists "Public can view product images" on storage.objects;
create policy "Public can view product images"
on storage.objects for select
to anon, authenticated
using (bucket_id='product-images');

drop policy if exists "Authenticated can upload product images" on storage.objects;
create policy "Authenticated can upload product images"
on storage.objects for insert
to authenticated
with check (bucket_id='product-images');

drop policy if exists "Authenticated can delete product images" on storage.objects;
create policy "Authenticated can delete product images"
on storage.objects for delete
to authenticated
using (bucket_id='product-images');

-- Then go to Authentication -> Users and create your private admin email/password.
-- Never put your admin password into GitHub.
