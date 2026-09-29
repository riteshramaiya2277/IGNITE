/**
 * IGNITE — Student Master Page Interactive Scripts
 * Handles user profile dropdown, responsive mobile drawer toggle, and UI micro-interactions.
 */

document.addEventListener('DOMContentLoaded', function () {
    initUserProfileDropdown();
    initMobileNav();
});

/**
 * Initializes the student user profile dropdown menu.
 */
function initUserProfileDropdown() {
    const trigger = document.getElementById('userProfileTrigger');
    const dropdown = document.getElementById('userDropdownMenu');

    if (!trigger || !dropdown) return;

    trigger.addEventListener('click', function (e) {
        e.stopPropagation();
        const isOpen = dropdown.classList.contains('show');
        if (isOpen) {
            dropdown.classList.remove('show');
            trigger.classList.remove('active');
        } else {
            dropdown.classList.add('show');
            trigger.classList.add('active');
        }
    });

    // Close when clicking outside
    document.addEventListener('click', function (e) {
        if (!dropdown.contains(e.target) && !trigger.contains(e.target)) {
            dropdown.classList.remove('show');
            trigger.classList.remove('active');
        }
    });

    // Close on Escape key press
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape' && dropdown.classList.contains('show')) {
            dropdown.classList.remove('show');
            trigger.classList.remove('active');
            trigger.focus();
        }
    });
}

/**
 * Initializes mobile responsive navigation drawer.
 */
function initMobileNav() {
    const toggleBtn = document.getElementById('mobileNavToggle');
    const mainNav = document.getElementById('mainNav');

    if (!toggleBtn || !mainNav) return;

    toggleBtn.addEventListener('click', function (e) {
        e.stopPropagation();
        mainNav.classList.toggle('mobile-open');
    });

    // Close mobile nav when clicking any nav link
    const navLinks = mainNav.querySelectorAll('.nav-item-link');
    navLinks.forEach(function (link) {
        link.addEventListener('click', function () {
            mainNav.classList.remove('mobile-open');
        });
    });

    // Close on outside click on mobile
    document.addEventListener('click', function (e) {
        if (mainNav.classList.contains('mobile-open') && !mainNav.contains(e.target) && !toggleBtn.contains(e.target)) {
            mainNav.classList.remove('mobile-open');
        }
    });
}
