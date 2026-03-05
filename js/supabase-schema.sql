-- -- ============================================================
-- --  Ahmed Hassan Portfolio — Supabase Schema + Seed Data
-- --  Run this in your Supabase SQL Editor
-- -- ============================================================

-- -- ── TABLES ───────────────────────────────────────────────────

-- create table if not exists hero (
--   id          uuid default gen_random_uuid() primary key,
--   tag         text default '// Based in Cairo, Egypt',
--   name_line1  text default 'AHMED',
--   name_line2  text default 'HASSAN',
--   title       text default 'IT & NETWORK ENGINEER',
--   description text default 'Motivated IT & Network Engineer with hands-on experience managing enterprise infrastructure, configuring network and security systems across multi-branch environments.',
--   stat_years  text default '5+',
--   stat_projects text default '20+',
--   stat_certs  text default '6',
--   updated_at  timestamptz default now()
-- );

-- create table if not exists experience (
--   id          uuid default gen_random_uuid() primary key,
--   role        text not null,
--   period      text not null,
--   company     text not null,
--   bullets     jsonb default '[]',
--   tags        jsonb default '[]',
--   sort_order  int  default 0,
--   created_at  timestamptz default now()
-- );

-- create table if not exists skills (
--   id          uuid default gen_random_uuid() primary key,
--   icon        text default '🔧',
--   name        text not null,
--   level       int  default 80 check (level between 0 and 100),
--   sort_order  int  default 0
-- );

-- create table if not exists certifications (
--   id          uuid default gen_random_uuid() primary key,
--   icon        text default '🎆',
--   name        text not null,
--   sort_order  int  default 0
-- );

-- create table if not exists clients (
--   id          uuid default gen_random_uuid() primary key,
--   name        text not null,
--   sort_order  int  default 0
-- );

-- create table if not exists contact (
--   id          uuid default gen_random_uuid() primary key,
--   location    text default 'Cairo, Egypt',
--   phone       text default '+20 106 073 5117',
--   email       text default 'engahmedhassan3042030@gmail.com',
--   linkedin    text default 'ahmedhassan-network',
--   education   text default 'B.Com Accounting — Abbassia Institute, Cairo (2025)',
--   lang1       text default 'Arabic',
--   lang1_level text default 'Native',
--   lang2       text default 'English',
--   lang2_level text default 'Intermediate',
--   updated_at  timestamptz default now()
-- );

-- -- ── ROW LEVEL SECURITY ────────────────────────────────────────

-- alter table hero           enable row level security;
-- alter table experience     enable row level security;
-- alter table skills         enable row level security;
-- alter table certifications enable row level security;
-- alter table clients        enable row level security;
-- alter table contact        enable row level security;

-- -- Public can read everything
-- create policy "Public read hero"           on hero           for select using (true);
-- create policy "Public read experience"     on experience     for select using (true);
-- create policy "Public read skills"         on skills         for select using (true);
-- create policy "Public read certifications" on certifications for select using (true);
-- create policy "Public read clients"        on clients        for select using (true);
-- create policy "Public read contact"        on contact        for select using (true);

-- -- Only authenticated users (admin) can write
-- create policy "Auth write hero"           on hero           for all using (auth.role() = 'authenticated');
-- create policy "Auth write experience"     on experience     for all using (auth.role() = 'authenticated');
-- create policy "Auth write skills"         on skills         for all using (auth.role() = 'authenticated');
-- create policy "Auth write certifications" on certifications for all using (auth.role() = 'authenticated');
-- create policy "Auth write clients"        on clients        for all using (auth.role() = 'authenticated');
-- create policy "Auth write contact"        on contact        for all using (auth.role() = 'authenticated');

-- -- ── SEED DATA ────────────────────────────────────────────────

-- -- Hero (one row)
-- insert into hero (tag, name_line1, name_line2, title, description, stat_years, stat_projects, stat_certs)
-- values (
--   '// Based in Cairo, Egypt',
--   'AHMED', 'HASSAN',
--   'IT & NETWORK ENGINEER',
--   'Motivated IT & Network Engineer with hands-on experience managing enterprise infrastructure, configuring network and security systems across multi-branch environments.',
--   '5+', '20+', '6'
-- );

-- -- Experience
-- insert into experience (role, period, company, bullets, tags, sort_order) values
-- (
--   'Network Systems Administrator',
--   'Jul 2023 — Present',
--   'New Scarab for Tourist Bazaar Management — Cairo, Egypt',
--   '["Sole IT administrator managing infrastructure for HQ, Luxor, Aswan, and two Haram branches.", "Implemented networking solutions, server setups, and surveillance systems.", "Provided ongoing technical support, updates, and troubleshooting across all sites."]',
--   '["Network Admin", "Server Setup", "CCTV", "Multi-Branch"]',
--   1
-- ),
-- (
--   'General Manager',
--   'Oct 2020 — Dec 2022',
--   'Multimedia House for Electronic Systems — Cairo, Egypt',
--   '["Progressed from Technician to Assistant Manager to General Manager.", "Managed full-scale projects for security systems, networks, and server deployments.", "Led teams across surveillance, fire alarm, access control, PA systems, and network infrastructure.", "Delivered projects for Etoile, El-Dohah Factory, Al-Nakheel Factory, and Armed Forces Engineering Authority."]',
--   '["Team Lead", "LAN/WAN", "Fiber Optics", "Access Control"]',
--   2
-- ),
-- (
--   'Freelance Network Engineer',
--   'Jan 2023 — Dec 2024',
--   'Independent — Cairo, Egypt',
--   '["Delivered advanced IT solutions for BMW (Obour, Sheraton, Desert Road branches).", "Implemented infrastructure for Geely Mercedes Exit showroom and 2B HQ (Smart Village).", "Deployed network solutions across WE (Egypt Telecom) branches throughout Greater Cairo."]',
--   '["BMW", "WE Telecom", "Smart Village", "Infrastructure"]',
--   3
-- );

-- -- Skills
-- insert into skills (icon, name, level, sort_order) values
-- ('🔄', 'Network Design & Troubleshooting',   90, 1),
-- ('💻', 'Windows Server Administration',       85, 2),
-- ('🔥', 'Firewall Configuration (Fortinet)',   80, 3),
-- ('🌐', 'Cisco Routing & Switching',           88, 4),
-- ('💡', 'Fiber Optics & Structured Cabling',   82, 5),
-- ('🐧', 'Linux & OS Management',               75, 6),
-- ('📹', 'CCTV & Access Control Systems',       85, 7),
-- ('🎧', 'Client Support & Ticket Management',  80, 8);

-- -- Certifications
-- insert into certifications (icon, name, sort_order) values
-- ('🎆', 'Cisco Certified Network Associate (CCNA)',      1),
-- ('🎆', 'Microsoft Certified Solutions Associate (MCSA)', 2),
-- ('🎆', 'CompTIA A+',                                    3),
-- ('🎆', 'CompTIA Security+',                             4),
-- ('🎆', 'Firewall Configuration & Management',           5),
-- ('🎆', 'Linux Administration',                          6);

-- -- Clients
-- insert into clients (name, sort_order) values
-- ('BMW',                       1),
-- ('WE TELECOM',                2),
-- ('GEELY MERCEDES',            3),
-- ('2B HQ SMART VILLAGE',       4),
-- ('ETOILE',                    5),
-- ('ARMED FORCES ENGINEERING',  6),
-- ('EL-DOHAH FACTORY',          7),
-- ('AL-NAKHEEL FACTORY',        8);

-- -- Contact (one row)
-- insert into contact (location, phone, email, linkedin, education, lang1, lang1_level, lang2, lang2_level)
-- values (
--   'Cairo, Egypt',
--   '+20 106 073 5117',
--   'engahmedhassan3042030@gmail.com',
--   'ahmedhassan-network',
--   'B.Com Accounting — Abbassia Institute, Cairo (2025)',
--   'Arabic', 'Native',
--   'English', 'Intermediate'
-- );
