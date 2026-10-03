/**
 * IGNITE — Admin Master Page Interactive Scripts
 * Handles mobile sidebar drawer, search bar events, and micro-interactions.
 */

document.addEventListener('DOMContentLoaded', function () {
    initAdminMobileNav();
    initAdminSearch();
});

/**
 * Initializes mobile responsive navigation drawer.
 */
function initAdminMobileNav() {
    const toggleBtn = document.getElementById('adminMobileNavToggle');
    const sidebar = document.getElementById('adminSidebar');
    const backdrop = document.getElementById('adminSidebarBackdrop');

    if (!toggleBtn || !sidebar) return;

    function openSidebar() {
        sidebar.classList.add('mobile-open');
        if (backdrop) {
            backdrop.classList.add('show');
        }
        document.body.style.overflow = 'hidden';
    }

    function closeSidebar() {
        sidebar.classList.remove('mobile-open');
        if (backdrop) {
            backdrop.classList.remove('show');
        }
        document.body.style.overflow = '';
    }

    toggleBtn.addEventListener('click', function (e) {
        e.stopPropagation();
        if (sidebar.classList.contains('mobile-open')) {
            closeSidebar();
        } else {
            openSidebar();
        }
    });

    if (backdrop) {
        backdrop.addEventListener('click', function () {
            closeSidebar();
        });
    }

    // Close on Escape
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape' && sidebar.classList.contains('mobile-open')) {
            closeSidebar();
        }
    });
}

/**
 * Initializes quick search input behavior.
 */
function initAdminSearch() {
    const searchInput = document.getElementById('adminSearchInput');
    if (!searchInput) return;

    searchInput.addEventListener('keydown', function (e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            const query = searchInput.value.trim();
            if (query.length > 0) {
                // If on a page with a search receiver, trigger or navigate
                const currentUrl = new URL(window.location.href);
                currentUrl.searchParams.set('q', query);
                window.location.href = currentUrl.toString();
            }
        }
    });
}
