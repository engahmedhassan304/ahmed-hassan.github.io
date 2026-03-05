/* ============================================================
   data-loader.js — Fetches content from Supabase & renders it
   ============================================================ */

(async function () {
  // ── Init Supabase client ──────────────────────────────────
  const { createClient } = supabase;
  const db = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

  // ── Fetch all data in parallel ────────────────────────────
  const [heroRes, expRes, skillsRes, certsRes, clientsRes, contactRes] =
    await Promise.all([
      db.from('hero').select('*').single(),
      db.from('experience').select('*').order('sort_order'),
      db.from('skills').select('*').order('sort_order'),
      db.from('certifications').select('*').order('sort_order'),
      db.from('clients').select('*').order('sort_order'),
      db.from('contact').select('*').single(),
    ]);

  // ── HERO ─────────────────────────────────────────────────
  if (heroRes.data) {
    const h = heroRes.data;
    setHTML('heroTag',         h.tag);
    setHTML('heroName',        `${h.name_line1}<br/><span>${h.name_line2}</span>`);
    setHTML('heroTitle',       h.title);
    setHTML('heroDesc',        h.description);
    setHTML('statYears',       h.stat_years);
    setHTML('statProjects',    h.stat_projects);
    setHTML('statCerts',       h.stat_certs);
  }

  // ── EXPERIENCE ───────────────────────────────────────────
  if (expRes.data) {
    const grid = document.getElementById('expGrid');
    grid.innerHTML = expRes.data.map(e => `
      <div class="exp-card reveal">
        <div class="exp-top">
          <div class="exp-role">${e.role}</div>
          <div class="exp-period">${e.period}</div>
        </div>
        <div class="exp-company">${e.company}</div>
        <ul class="exp-bullets">
          ${(e.bullets || []).map(b => `<li>${b}</li>`).join('')}
        </ul>
        <div class="exp-tags">
          ${(e.tags || []).map(t => `<span class="exp-tag">${t}</span>`).join('')}
        </div>
      </div>
    `).join('');
  }

  // ── SKILLS ───────────────────────────────────────────────
  if (skillsRes.data) {
    const grid = document.getElementById('skillsGrid');
    grid.innerHTML = skillsRes.data.map(s => `
      <div class="skill-card reveal" data-level="${s.level}">
        <div class="skill-icon">${s.icon}</div>
        <div class="skill-name">${s.name}</div>
        <div class="skill-bar-wrap"><div class="skill-bar"></div></div>
      </div>
    `).join('');
  }

  // ── CERTIFICATIONS ───────────────────────────────────────
  if (certsRes.data) {
    const grid = document.getElementById('certsGrid');
    grid.innerHTML = certsRes.data.map(c => `
      <div class="cert-card reveal">
        <div class="cert-icon">${c.icon}</div>
        <div class="cert-name">${c.name}</div>
      </div>
    `).join('');
  }

  // ── CLIENTS (marquee — duplicated for seamless loop) ──────
  if (clientsRes.data) {
    const track = document.getElementById('marqueeTrack');
    const items = clientsRes.data
      .map(c => `<span class="client-item">${c.name}</span><span class="client-dot">&#9670;</span>`)
      .join('');
    track.innerHTML = items + items; // duplicate for seamless loop
  }

  // ── CONTACT ───────────────────────────────────────────────
  if (contactRes.data) {
    const c = contactRes.data;
    setHTML('contactLocation',  c.location);
    setHTML('contactPhone',     `<a href="tel:${c.phone.replace(/\s/g, '')}">${c.phone}</a>`);
    setHTML('contactEmail',     `<a href="mailto:${c.email}">${c.email}</a>`);
    setHTML('contactLinkedin',  `<a href="https://www.linkedin.com/in/${c.linkedin}" target="_blank">${c.linkedin}</a>`);
    setHTML('contactEducation', c.education);
    setHTML('langBadge1',       `${c.lang1} <span>${c.lang1_level}</span>`);
    setHTML('langBadge2',       `${c.lang2} <span>${c.lang2_level}</span>`);
  }

  // ── Remove skeleton loaders ───────────────────────────────
  document.querySelectorAll('.loading-skeleton').forEach(el => el.remove());

  // ── Init scroll reveal ────────────────────────────────────
  const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) entry.target.classList.add('visible');
    });
  }, { threshold: 0.15 });
  document.querySelectorAll('.reveal').forEach(el => revealObserver.observe(el));

  // ── Init skill bars ───────────────────────────────────────
  const skillObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const bar   = entry.target.querySelector('.skill-bar');
        const level = entry.target.getAttribute('data-level');
        if (bar && level) setTimeout(() => { bar.style.width = level + '%'; }, 200);
        skillObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.3 });
  document.querySelectorAll('.skill-card[data-level]').forEach(el => skillObserver.observe(el));

  // ── Init cursor hover on dynamic cards ────────────────────
  document.querySelectorAll('.skill-card, .cert-card, .exp-card').forEach(el => {
    el.addEventListener('mouseenter', () => document.body.classList.add('cursor-hover'));
    el.addEventListener('mouseleave', () => document.body.classList.remove('cursor-hover'));
  });

  // ── Helper ────────────────────────────────────────────────
  function setHTML(id, html) {
    const el = document.getElementById(id);
    if (el) el.innerHTML = html;
  }
})();
