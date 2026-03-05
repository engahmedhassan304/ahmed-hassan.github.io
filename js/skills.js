/* ============================================
   skills.js — Animated skill progress bars
   ============================================ */
const skillObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const bar   = entry.target.querySelector('.skill-bar');
      const level = entry.target.getAttribute('data-level');
      if (bar && level) {
        setTimeout(() => { bar.style.width = level + '%'; }, 200);
      }
      skillObserver.unobserve(entry.target); // animate once
    }
  });
}, { threshold: 0.3 });

document.querySelectorAll('.skill-card[data-level]').forEach(el => skillObserver.observe(el));
