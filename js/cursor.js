/* ============================================
   cursor.js — Custom cursor movement
   ============================================ */
const cursor     = document.getElementById('cursor');
const cursorRing = document.getElementById('cursorRing');

document.addEventListener('mousemove', (e) => {
  cursor.style.left = e.clientX + 'px';
  cursor.style.top  = e.clientY + 'px';
  setTimeout(() => {
    cursorRing.style.left = e.clientX + 'px';
    cursorRing.style.top  = e.clientY + 'px';
  }, 80);
});

// Grow cursor on hoverable elements
document.querySelectorAll('a, button, .skill-card, .cert-card, .exp-card').forEach(el => {
  el.addEventListener('mouseenter', () => document.body.classList.add('cursor-hover'));
  el.addEventListener('mouseleave', () => document.body.classList.remove('cursor-hover'));
});
