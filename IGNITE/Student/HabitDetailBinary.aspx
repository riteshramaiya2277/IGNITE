<%@ Page Title="Morning Meditation" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="HabitDetailBinary.aspx.cs" Inherits="IGNITE.Student.HabitDetailBinary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/habit-detail.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Fail-safe local link -->
    <link href="../Content/habit-detail.css" rel="stylesheet" type="text/css" />

    <div class="habit-detail-canvas">

        <!-- Top Navigation Row: Breadcrumbs & Actions -->
        <div class="habit-detail-top-nav">
            <nav class="habit-breadcrumb" aria-label="Breadcrumb">
                <a href="Habits.aspx" class="breadcrumb-link">Habits</a>
                <span class="breadcrumb-sep">&gt;</span>
                <span class="breadcrumb-current">Morning Meditation</span>
            </nav>

            <div class="habit-top-actions">
                <button type="button" class="btn-habit-action" id="btnPauseHabit" onclick="togglePauseHabit()">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <rect x="6" y="4" width="4" height="16" rx="1"></rect>
                        <rect x="14" y="4" width="4" height="16" rx="1"></rect>
                    </svg>
                    <span id="txtPauseHabit">Pause</span>
                </button>

                <button type="button" class="btn-habit-action" onclick="openEditModal()">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                    </svg>
                    <span>Edit</span>
                </button>

                <button type="button" class="btn-habit-action btn-archive" onclick="confirmArchiveHabit()">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <polyline points="3 6 5 6 21 6"></polyline>
                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                    </svg>
                    <span>Archive</span>
                </button>
            </div>
        </div>

        <!-- Habit Header Section -->
        <header class="habit-detail-header">
            <div class="habit-title-row">
                <h1 class="habit-main-title">Morning Meditation</h1>
                <span class="badge-tag-category">MENTAL WELL-BEING</span>
            </div>

            <div class="habit-meta-row">
                <div class="habit-meta-item" title="Habit Type">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <rect x="1" y="5" width="22" height="14" rx="7" ry="7"></rect>
                        <circle cx="16" cy="12" r="3"></circle>
                    </svg>
                    <span>Binary Habit</span>
                </div>
                <div class="habit-meta-item" title="Tracking Days">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    <span>Mon, Wed, Fri</span>
                </div>
                <div class="habit-meta-item" title="Reminder Time">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                        <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                    </svg>
                    <span>8:00 AM Reminder</span>
                </div>
            </div>
        </header>

        <!-- Two-Column Workspace Layout -->
        <div class="habit-detail-layout">

            <!-- Left Column: Completion History Grid -->
            <div class="habit-history-card">
                <div class="history-card-header">
                    <h2 class="history-card-title">Completion History</h2>
                    <div class="history-legend">
                        <div class="legend-item">
                            <span class="legend-color-box legend-completed"></span>
                            <span>Completed</span>
                        </div>
                        <div class="legend-item">
                            <span class="legend-color-box legend-missed"></span>
                            <span>Missed</span>
                        </div>
                        <div class="legend-item">
                            <span class="legend-color-box legend-scheduled"></span>
                            <span>Scheduled</span>
                        </div>
                    </div>
                </div>

                <!-- 5-Column Calendar Grid matching Screenshot 3 -->
                <div class="calendar-matrix-wrap">
                    <div class="calendar-matrix-grid grid-cols-5">

                        <!-- Row 1 -->
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="Apr 15: Completed"></div>
                            <span class="tile-date-label">Apr 15</span>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-binary-missed" data-tooltip="Apr 16: Off day"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="Apr 17: Completed"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-binary-missed" data-tooltip="Apr 18: Off day"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="Apr 19: Completed"></div>
                        </div>

                        <!-- Row 2 -->
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="Apr 20: Completed"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-binary-missed" data-tooltip="Apr 21: Off day"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="Apr 22: Completed"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-binary-missed" data-tooltip="Apr 23: Off day"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-binary-missed" data-tooltip="Apr 24: Off day"></div>
                        </div>

                        <!-- Row 3 -->
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="Apr 25: Completed"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-binary-missed" data-tooltip="Apr 26: Off day"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="Apr 27: Completed"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="Apr 28: Completed"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-binary-missed" data-tooltip="Apr 29: Off day"></div>
                        </div>

                        <!-- Row 4 -->
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="Apr 30: Completed"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-binary-missed" data-tooltip="May 1: Off day"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 2: Completed"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 3: Completed"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-binary-missed" data-tooltip="May 4: Off day"></div>
                        </div>

                        <!-- Row 5 (Today & Scheduled) -->
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-today" id="tileTodayMeditation" data-tooltip="Today: Pending completion">TODAY</div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-binary-missed" data-tooltip="Tomorrow: Scheduled"></div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Right Column: Sidebar Panels -->
            <div class="habit-detail-sidebar">

                <!-- Panel 1: Today's Goal -->
                <div class="sidebar-panel-card">
                    <h3 class="panel-header-label">Today's Goal</h3>

                    <div class="binary-goal-row">
                        <div class="binary-goal-icon-wrap" id="goalIconWrap">
                            <svg viewBox="0 0 24 24" id="goalIconSvg" fill="none" stroke="currentColor">
                                <line x1="18" y1="6" x2="6" y2="18"></line>
                                <line x1="6" y1="6" x2="18" y2="18"></line>
                            </svg>
                        </div>
                        <div class="binary-goal-text-group">
                            <div class="binary-goal-main" id="goalStatusTitle">Not completed today</div>
                            <div class="binary-goal-sub" id="goalStatusSub">0% Pending completion</div>
                        </div>
                    </div>

                    <div class="sidebar-progress-track">
                        <div class="sidebar-progress-fill" id="goalProgressBar" style="width: 0%;"></div>
                    </div>
                </div>

                <!-- Panel 2: Did you complete your habit today? -->
                <div class="sidebar-panel-card">
                    <div class="binary-question-row">
                        <div class="binary-q-icon-wrap">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                <polyline points="20 6 9 17 4 12"></polyline>
                            </svg>
                        </div>
                        <div class="binary-goal-text-group">
                            <h3 class="panel-header-label" style="font-size: 0.95rem; color: #18181B; margin: 0;">Did you complete your habit today?</h3>
                            <span class="binary-goal-sub" id="questionSubtext">Pending completion</span>
                        </div>
                    </div>

                    <div class="binary-buttons-group">
                        <button type="button" class="btn-binary-yes" id="btnYesComplete" onclick="handleBinaryComplete(true)">Yes</button>
                        <button type="button" class="btn-binary-no" id="btnNoComplete" onclick="handleBinaryComplete(false)">No</button>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Edit Modal -->
    <div class="habit-modal-backdrop" id="modalEditHabit">
        <div class="habit-modal-card">
            <div class="habit-modal-header">
                <h3 class="habit-modal-title">Edit Morning Meditation</h3>
                <button type="button" class="habit-modal-close" onclick="closeEditModal()">&times;</button>
            </div>
            <div class="habit-form-group">
                <label class="habit-form-label">Habit Name</label>
                <input type="text" id="editHabitName" class="habit-form-input" value="Morning Meditation" />
            </div>
            <div class="habit-form-group">
                <label class="habit-form-label">Category</label>
                <input type="text" class="habit-form-input" value="Mental Well-Being" disabled />
            </div>
            <div class="habit-form-group">
                <label class="habit-form-label">Reminder Time</label>
                <input type="time" class="habit-form-input" value="08:00" />
            </div>
            <div class="habit-modal-footer">
                <button type="button" class="btn-secondary-modal" onclick="closeEditModal()">Cancel</button>
                <button type="button" class="btn-primary-modal" onclick="saveEditHabit()">Save Changes</button>
            </div>
        </div>
    </div>

    <!-- Client-Side Logic -->
    <script type="text/javascript">
        var isCompleted = false;

        function handleBinaryComplete(completed) {
            isCompleted = completed;
            var goalIconWrap = document.getElementById('goalIconWrap');
            var goalIconSvg = document.getElementById('goalIconSvg');
            var goalTitle = document.getElementById('goalStatusTitle');
            var goalSub = document.getElementById('goalStatusSub');
            var goalBar = document.getElementById('goalProgressBar');
            var todayTile = document.getElementById('tileTodayMeditation');
            var qSub = document.getElementById('questionSubtext');
            var btnYes = document.getElementById('btnYesComplete');

            if (completed) {
                // Goal Completed State
                goalIconWrap.classList.add('completed');
                goalIconSvg.innerHTML = '<polyline points="20 6 9 17 4 12"></polyline>';
                goalTitle.innerText = "Completed today!";
                goalSub.innerText = "100% Goal Met &bull; +20 XP Earned";
                goalBar.style.width = "100%";

                todayTile.classList.remove('tile-today');
                todayTile.classList.add('tile-completed');
                todayTile.setAttribute('data-tooltip', 'Today: Completed (+20 XP)');

                qSub.innerText = "Completed today at " + new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
                btnYes.innerText = "Completed ✓";
                btnYes.style.backgroundColor = "#10B981";

                showToast("Great job! +20 XP earned for completing Morning Meditation!");
            } else {
                // Incomplete / Pending
                goalIconWrap.classList.remove('completed');
                goalIconSvg.innerHTML = '<line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line>';
                goalTitle.innerText = "Not completed today";
                goalSub.innerText = "0% Pending completion";
                goalBar.style.width = "0%";

                todayTile.classList.add('tile-today');
                todayTile.classList.remove('tile-completed');
                todayTile.innerText = "TODAY";
                todayTile.setAttribute('data-tooltip', 'Today: Pending completion');

                qSub.innerText = "Pending completion";
                btnYes.innerText = "Yes";
                btnYes.style.backgroundColor = "#DF6A74";

                showToast("Habit reset to pending.");
            }
        }

        var isPaused = false;
        function togglePauseHabit() {
            isPaused = !isPaused;
            var txt = document.getElementById('txtPauseHabit');
            if (isPaused) {
                txt.innerText = "Resume";
                showToast("Morning Meditation paused.");
            } else {
                txt.innerText = "Pause";
                showToast("Morning Meditation resumed.");
            }
        }

        function openEditModal() {
            document.getElementById('modalEditHabit').classList.add('open');
        }
        function closeEditModal() {
            document.getElementById('modalEditHabit').classList.remove('open');
        }
        function saveEditHabit() {
            var newName = document.getElementById('editHabitName').value.trim();
            if (newName) {
                document.querySelector('.habit-main-title').innerText = newName;
                document.querySelector('.breadcrumb-current').innerText = newName;
            }
            closeEditModal();
            showToast("Habit settings saved!");
        }

        function confirmArchiveHabit() {
            if (confirm("Are you sure you want to archive Morning Meditation?")) {
                showToast("Habit archived.");
                setTimeout(function() {
                    window.location.href = "Habits.aspx";
                }, 1000);
            }
        }

        function showToast(msg) {
            var toast = document.getElementById('toastNotice');
            if (!toast) {
                toast = document.createElement('div');
                toast.id = 'toastNotice';
                toast.className = 'habit-toast';
                document.body.appendChild(toast);
            }
            toast.innerText = msg;
            toast.classList.add('show');
            setTimeout(function() {
                toast.classList.remove('show');
            }, 3000);
        }
    </script>
</asp:Content>
