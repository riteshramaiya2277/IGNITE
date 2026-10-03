<%@ Page Title="Daily Deep Work" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="HabitDetailMeasurable.aspx.cs" Inherits="IGNITE.Student.HabitDetailMeasurable" %>

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
                <span class="breadcrumb-current">Daily Deep Work</span>
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
                <h1 class="habit-main-title">Daily Deep Work</h1>
                <span class="badge-tag-category">ACADEMIC EXCELLENCE</span>
            </div>

            <div class="habit-meta-row">
                <div class="habit-meta-item" title="Habit Type">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
                    </svg>
                    <span>Measurable</span>
                </div>
                <div class="habit-meta-item" title="Tracking Frequency">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    <span>Daily</span>
                </div>
                <div class="habit-meta-item" title="Goal Target">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <circle cx="12" cy="12" r="10"></circle>
                        <circle cx="12" cy="12" r="6"></circle>
                        <circle cx="12" cy="12" r="2"></circle>
                    </svg>
                    <span>4 hours daily target</span>
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

                <!-- Calendar Matrix -->
                <div class="calendar-matrix-wrap">
                    <div class="calendar-matrix-grid grid-cols-7">

                        <!-- Row 1 -->
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 1: 4.0 hrs (Goal Met)"></div>
                            <span class="tile-date-label">May 1</span>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 2: 4.5 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 3: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-missed" data-tooltip="May 4: Missed session"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 5: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 6: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 7: 4.2 hrs (Goal Met)"></div>
                        </div>

                        <!-- Row 2 -->
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 8: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 9: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-missed" data-tooltip="May 10: Missed session"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 11: 4.5 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 12: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 13: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 14: 4.0 hrs (Goal Met)"></div>
                        </div>

                        <!-- Row 3 -->
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed tile-active-ring" data-tooltip="May 15: Today in progress (2.5 hrs)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 16: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 17: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 18: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 19: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 20: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 21: 4.0 hrs (Goal Met)"></div>
                        </div>

                        <!-- Row 4 -->
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 22: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 23: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 24: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 25: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 26: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 27: 4.0 hrs (Goal Met)"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-completed" data-tooltip="May 28: 4.0 hrs (Goal Met)"></div>
                        </div>

                        <!-- Row 5 (Scheduled) -->
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-scheduled" data-tooltip="May 29: Scheduled daily deep work"></div>
                        </div>
                        <div class="matrix-tile-wrapper">
                            <div class="calendar-tile tile-scheduled" data-tooltip="May 30: Scheduled daily deep work"></div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Right Column: Sidebar Panels -->
            <div class="habit-detail-sidebar">

                <!-- Panel 1: Today's Progress -->
                <div class="sidebar-panel-card">
                    <h3 class="panel-header-label">Today's Progress</h3>

                    <div class="progress-big-number-row">
                        <span class="progress-big-val" id="lblCurrentHours">2.5</span>
                        <span class="progress-goal-val">/ 4 hours</span>
                    </div>

                    <div class="progress-status-subtext" id="lblProgressPctText">62% of daily goal met</div>

                    <div class="sidebar-progress-track">
                        <div class="sidebar-progress-fill" id="sidebarProgressBar" style="width: 62%;"></div>
                    </div>
                </div>

                <!-- Panel 2: Add Progress -->
                <div class="sidebar-panel-card">
                    <h3 class="panel-header-label">Add Progress</h3>

                    <div class="add-progress-input-group">
                        <input type="number" step="0.5" min="0.1" max="10" value="0.5" id="txtAddHours" class="input-progress-amount" placeholder="0" />
                        <button type="button" class="btn-add-progress" onclick="handleAddHours()">Add</button>
                    </div>

                    <div class="points-earned-note" id="lblPointsNote">Earned today: 15 points</div>
                </div>

            </div>

        </div>

    </div>

    <!-- Edit Modal -->
    <div class="habit-modal-backdrop" id="modalEditHabit">
        <div class="habit-modal-card">
            <div class="habit-modal-header">
                <h3 class="habit-modal-title">Edit Daily Deep Work</h3>
                <button type="button" class="habit-modal-close" onclick="closeEditModal()">&times;</button>
            </div>
            <div class="habit-form-group">
                <label class="habit-form-label">Habit Name</label>
                <input type="text" id="editHabitName" class="habit-form-input" value="Daily Deep Work" />
            </div>
            <div class="habit-form-group">
                <label class="habit-form-label">Category</label>
                <input type="text" class="habit-form-input" value="Academic Excellence" disabled />
            </div>
            <div class="habit-form-group">
                <label class="habit-form-label">Daily Target (Hours)</label>
                <input type="number" id="editHabitTarget" class="habit-form-input" value="4" />
            </div>
            <div class="habit-modal-footer">
                <button type="button" class="btn-secondary-modal" onclick="closeEditModal()">Cancel</button>
                <button type="button" class="btn-primary-modal" onclick="saveEditHabit()">Save Changes</button>
            </div>
        </div>
    </div>

    <!-- Client-Side Logic & Postback Handling -->
    <script type="text/javascript">
        var currentHours = 2.5;
        var targetHours = 4.0;
        var pointsEarned = 15;

        function handleAddHours() {
            var input = document.getElementById('txtAddHours');
            var addVal = parseFloat(input.value);
            if (isNaN(addVal) || addVal <= 0) {
                alert("Please enter a valid positive number of hours.");
                return;
            }

            currentHours += addVal;
            if (currentHours > targetHours) {
                currentHours = targetHours;
            }
            pointsEarned += Math.round(addVal * 10);

            var pct = Math.min(100, Math.round((currentHours / targetHours) * 100));

            document.getElementById('lblCurrentHours').innerText = currentHours.toFixed(1);
            document.getElementById('lblProgressPctText').innerText = pct + "% of daily goal met";
            document.getElementById('sidebarProgressBar').style.width = pct + "%";
            document.getElementById('lblPointsNote').innerText = "Earned today: " + pointsEarned + " points";

            input.value = "0.5";
            showToast("Logged +" + addVal + " hrs! +" + Math.round(addVal * 10) + " points earned!");
        }

        var isPaused = false;
        function togglePauseHabit() {
            isPaused = !isPaused;
            var txt = document.getElementById('txtPauseHabit');
            if (isPaused) {
                txt.innerText = "Resume";
                showToast("Daily Deep Work is now paused.");
            } else {
                txt.innerText = "Pause";
                showToast("Daily Deep Work resumed.");
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
            showToast("Habit settings updated successfully!");
        }

        function confirmArchiveHabit() {
            if (confirm("Are you sure you want to archive Daily Deep Work? You can restore it anytime.")) {
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
