/* ============================================
   navbar.js — Scroll shrink + mobile menu
   ============================================ */
const navbar     = document.getElementById('navbar');
const burger     = document.getElementById('navBurger');
const mobileMenu = document.getElementById('mobileMenu');

// Shrink nav on scroll
window.addEventListener('scroll', () => {
  navbar.classList.toggle('scrolled', window.scrollY > 60);
});

// Burger toggle
burger.addEventListener('click', () => {
  burger.classList.toggle('open');
  mobileMenu.classList.toggle('open');
  document.body.style.overflow = mobileMenu.classList.contains('open') ? 'hidden' : '';
});

// Close mobile menu on link click
document.querySelectorAll('.mobile-link').forEach(link => {
  link.addEventListener('click', () => {
    burger.classList.remove('open');
    mobileMenu.classList.remove('open');
    document.body.style.overflow = '';
  });
});
