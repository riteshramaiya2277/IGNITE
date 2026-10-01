<%@ Page Title="Challenge Detail — IGNITE" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="ChallengeDetail.aspx.cs" Inherits="IGNITE.Student.ChallengeDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/challenges.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="challenge-detail-canvas">

        <!-- Back to Browse Link -->
        <div class="back-browse-bar">
            <a href="Challenges.aspx" class="back-browse-link">
                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.5">
                    <line x1="19" y1="12" x2="5" y2="12"></line>
                    <polyline points="12 19 5 12 12 5"></polyline>
                </svg>
                <span>Back to Browse</span>
            </a>
        </div>

        <!-- ====================================================================
             VIEW A: PREVIEW / AVAILABLE CHALLENGE (Matches Image 1)
             ==================================================================== -->
        <div id="previewChallengeView" runat="server">
            <!-- Big Hero Card with Graduation Cap Watermark -->
            <div class="detail-hero-banner">
                <div class="detail-hero-content">
                    <div class="detail-hero-badges">
                        <span class="badge-pill-rose">Academic Excellence</span>
                        <span class="badge-pill-amber">
                            <svg viewBox="0 0 24 24" width="12" height="12" fill="currentColor">
                                <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                            </svg>
                            Medium Difficulty
                        </span>
                        <span class="badge-pill-neutral">
                            <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                            7 Days
                        </span>
                    </div>

                    <h1 class="detail-hero-title">The Academic Sprint</h1>
                    <p class="detail-hero-desc">
                        Boost your focus and productivity by completing 5 deep study sessions this week. This challenge is designed to help you build the momentum needed for upcoming exams or major projects.
                    </p>
                </div>

                <!-- Watermark icon (Graduation Cap matching Image 1) -->
                <div class="detail-hero-watermark">
                    <svg viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 3L1 9l11 6 9-4.91V17h2V9L12 3z M5 13.18v4L12 21l7-3.82v-4L12 17l-7-3.82z" />
                    </svg>
                </div>
            </div>

            <!-- Two-column workspace -->
            <div class="detail-workspace-grid" style="margin-top: 24px;">

                <!-- Left Column: Requirements Checklist -->
                <div class="requirements-panel">
                    <h2 class="requirements-header-title">
                        <svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="2">
                            <line x1="8" y1="6" x2="21" y2="6"></line>
                            <line x1="8" y1="12" x2="21" y2="12"></line>
                            <line x1="8" y1="18" x2="21" y2="18"></line>
                            <line x1="3" y1="6" x2="3.01" y2="6"></line>
                            <line x1="3" y1="12" x2="3.01" y2="12"></line>
                            <line x1="3" y1="18" x2="3.01" y2="18"></line>
                        </svg>
                        <span>Requirements</span>
                    </h2>

                    <div class="sessions-checklist">
                        <!-- Session 1 -->
                        <div class="session-card-item" onclick="toggleSessionCheck(this)">
                            <div class="session-left-info">
                                <div class="circle-check-box">
                                    <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3" style="display: none;">
                                        <polyline points="20 6 9 17 4 12"></polyline>
                                    </svg>
                                </div>
                                <div class="session-text-group">
                                    <div class="session-main-name">Session 1: Deep Focus</div>
                                    <div class="session-sub-desc">Complete a 60-minute uninterrupted study session</div>
                                </div>
                            </div>
                            <div class="session-time-chip">0 / 60m</div>
                        </div>

                        <!-- Session 2 -->
                        <div class="session-card-item" onclick="toggleSessionCheck(this)">
                            <div class="session-left-info">
                                <div class="circle-check-box">
                                    <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3" style="display: none;">
                                        <polyline points="20 6 9 17 4 12"></polyline>
                                    </svg>
                                </div>
                                <div class="session-text-group">
                                    <div class="session-main-name">Session 2: Knowledge Build</div>
                                    <div class="session-sub-desc">Complete a 60-minute uninterrupted study session</div>
                                </div>
                            </div>
                            <div class="session-time-chip">0 / 60m</div>
                        </div>

                        <!-- Session 3 -->
                        <div class="session-card-item" onclick="toggleSessionCheck(this)">
                            <div class="session-left-info">
                                <div class="circle-check-box">
                                    <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3" style="display: none;">
                                        <polyline points="20 6 9 17 4 12"></polyline>
                                    </svg>
                                </div>
                                <div class="session-text-group">
                                    <div class="session-main-name">Session 3: Core Concepts</div>
                                    <div class="session-sub-desc">Complete a 60-minute uninterrupted study session</div>
                                </div>
                            </div>
                            <div class="session-time-chip">0 / 60m</div>
                        </div>

                        <!-- Session 4 -->
                        <div class="session-card-item" onclick="toggleSessionCheck(this)">
                            <div class="session-left-info">
                                <div class="circle-check-box">
                                    <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3" style="display: none;">
                                        <polyline points="20 6 9 17 4 12"></polyline>
                                    </svg>
                                </div>
                                <div class="session-text-group">
                                    <div class="session-main-name">Session 4: Synthesis</div>
                                    <div class="session-sub-desc">Complete a 60-minute uninterrupted study session</div>
                                </div>
                            </div>
                            <div class="session-time-chip">0 / 60m</div>
                        </div>

                        <!-- Session 5 -->
                        <div class="session-card-item" onclick="toggleSessionCheck(this)">
                            <div class="session-left-info">
                                <div class="circle-check-box">
                                    <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3" style="display: none;">
                                        <polyline points="20 6 9 17 4 12"></polyline>
                                    </svg>
                                </div>
                                <div class="session-text-group">
                                    <div class="session-main-name">Session 5: Final Review</div>
                                    <div class="session-sub-desc">Complete a 60-minute uninterrupted study session</div>
                                </div>
                            </div>
                            <div class="session-time-chip">0 / 60m</div>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Rewards, Join Action, Contenders -->
                <div class="detail-sidebar-col">

                    <!-- Challenge Rewards Card -->
                    <div class="rewards-panel-card">
                        <h3 class="sidebar-card-title">Challenge Rewards</h3>

                        <!-- 500 XP Box -->
                        <div class="reward-highlight-box star-reward">
                            <svg class="star-xp-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                            </svg>
                            <div class="reward-xp-details">
                                <span class="reward-xp-big">500 XP</span>
                                <span class="reward-xp-sub">Experience Points</span>
                            </div>
                        </div>

                        <!-- Sprint Master Badge Box -->
                        <div class="reward-highlight-box badge-reward">
                            <div class="badge-gold-circle">
                                <svg viewBox="0 0 24 24" width="32" height="32" fill="currentColor">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                            </div>
                            <div class="badge-name-large">Sprint Master</div>
                            <div class="badge-desc-sub">Permanent Badge &amp; Achievement unlocked upon completion</div>
                        </div>
                    </div>

                    <!-- Join Challenge Action Card -->
                    <div class="join-action-panel-card">
                        <button type="button" class="btn-detail-join-action" onclick="activateThisChallenge()">Join Challenge</button>

                        <div class="join-tip-box">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                            <span>You can only have one active challenge in this category at a time. Joining this will pause other <strong>Academic</strong> challenges.</span>
                        </div>
                    </div>

                    <!-- Current Contenders -->
                    <div class="contenders-panel-card">
                        <h4 class="sidebar-card-title" style="font-size: 0.95rem;">Current Contenders</h4>
                        <div class="contenders-avatars-row">
                            <div class="contender-avatar" style="background-color: #FED7AA;">👩‍🎓</div>
                            <div class="contender-avatar" style="background-color: #BFDBFE;">👨‍🎓</div>
                            <div class="contender-avatar" style="background-color: #FBCFE8;">👩‍💻</div>
                            <div class="contender-avatar" style="background-color: #BBF7D0;">👨‍🔬</div>
                            <div class="contender-avatar contender-count-pill">+1.2k</div>
                        </div>
                        <p class="contenders-count-text">1,248 students are currently pushing through this sprint.</p>
                    </div>

                </div>
            </div>
        </div>

        <!-- ====================================================================
             VIEW B: ACTIVE TRACKER VIEW (Matches Image 2: Mindful Mornings)
             ==================================================================== -->
        <div id="activeTrackerView" runat="server" style="display: none;">
            <!-- Active Hero Card -->
            <div class="active-tracker-hero">
                <div class="active-hero-top">
                    <div class="detail-hero-badges">
                        <span class="badge-pill-rose">Wellness</span>
                        <span class="badge-pill-amber">Intermediate</span>
                        <span class="badge-pill-neutral">Oct 1 - Oct 30</span>
                    </div>
                    <h1 class="detail-hero-title">30 Days of Mindful Mornings</h1>
                    <p class="detail-hero-desc">
                        Start your day with intention. This challenge focuses on building a sustainable morning routine that includes meditation, journaling, and light movement.
                    </p>
                </div>

                <div class="active-hero-bottom-row">
                    <div class="active-hero-rewards-group">
                        <div class="reward-inline-item">
                            <span class="label">Reward</span>
                            <span>500 XP</span>
                        </div>
                        <div class="reward-inline-item">
                            <span class="label">Achievement</span>
                            <span>🏅 Zen Master Badge</span>
                        </div>
                    </div>

                    <a href="Challenges.aspx?tab=active" class="btn-continue-action">Continue Challenge</a>
                </div>
            </div>

            <!-- Two Column Layout: Challenge Timeline + Today's Focus -->
            <div class="detail-workspace-grid" style="margin-top: 24px;">

                <!-- Left Column: Challenge Timeline (21 Days Grid matching Image 2) -->
                <div class="timeline-panel-card">
                    <div class="timeline-header-row">
                        <h2 class="requirements-header-title">
                            <span>Challenge Timeline</span>
                        </h2>
                        <div class="timeline-legend">
                            <span class="legend-chip">
                                <span class="legend-box completed"></span>
                                <span>Completed</span>
                            </span>
                            <span class="legend-chip">
                                <span class="legend-box remaining"></span>
                                <span>Remaining</span>
                            </span>
                        </div>
                    </div>

                    <!-- 21 Day Grid (Days 1 to 12 completed, Day 13 today, Days 14 to 21 remaining) -->
                    <div class="timeline-days-grid" id="timelineGrid">
                        <!-- Days 1 to 12 (Completed) -->
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 1</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 2</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 3</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 4</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 5</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 6</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 7</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>

                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 8</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 9</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 10</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 11</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>
                        <div class="timeline-day-box completed">
                            <span class="day-box-title">Day 12</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        </div>

                        <!-- Day 13: Today -->
                        <div class="timeline-day-box today" id="dayBoxToday">
                            <span class="today-flag-pill">Today</span>
                            <span class="day-box-title">Day 13</span>
                            <span class="day-box-status" id="dayStatusText">Pending</span>
                        </div>

                        <!-- Day 14 -->
                        <div class="timeline-day-box remaining">
                            <span class="day-box-title">Day 14</span>
                        </div>

                        <!-- Days 15 to 21 -->
                        <div class="timeline-day-box remaining"><span class="day-box-title">Day 15</span></div>
                        <div class="timeline-day-box remaining"><span class="day-box-title">Day 16</span></div>
                        <div class="timeline-day-box remaining"><span class="day-box-title">Day 17</span></div>
                        <div class="timeline-day-box remaining"><span class="day-box-title">Day 18</span></div>
                        <div class="timeline-day-box remaining"><span class="day-box-title">Day 19</span></div>
                        <div class="timeline-day-box remaining"><span class="day-box-title">Day 20</span></div>
                        <div class="timeline-day-box remaining"><span class="day-box-title">Day 21</span></div>
                    </div>
                </div>

                <!-- Right Column: Today's Focus Checklist (matching Image 2) -->
                <div class="today-focus-panel-card">
                    <h3 class="sidebar-card-title">Today's Focus</h3>

                    <div class="focus-tasks-list">
                        <!-- Task 1 (Checked by default) -->
                        <div class="focus-task-item checked" onclick="toggleFocusItem(this)">
                            <div class="focus-left-group">
                                <svg class="focus-task-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M12 2a7 7 0 0 0-7 7c0 5 7 13 7 13s7-8 7-13a7 7 0 0 0-7-7z"></path>
                                    <circle cx="12" cy="9" r="2.5"></circle>
                                </svg>
                                <div>
                                    <div class="focus-task-name">Morning Meditation</div>
                                    <div class="focus-sub">10 mins of silence</div>
                                </div>
                            </div>
                            <div class="focus-checkbox-square">
                                <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </div>
                        </div>

                        <!-- Task 2 (Unchecked) -->
                        <div class="focus-task-item" onclick="toggleFocusItem(this)">
                            <div class="focus-left-group">
                                <svg class="focus-task-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                                <div>
                                    <div class="focus-task-name">Intentional Journaling</div>
                                    <div class="focus-sub">Write 3 daily goals</div>
                                </div>
                            </div>
                            <div class="focus-checkbox-square">
                                <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3" style="display: none;">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </div>
                        </div>

                        <!-- Task 3 (Unchecked) -->
                        <div class="focus-task-item" onclick="toggleFocusItem(this)">
                            <div class="focus-left-group">
                                <svg class="focus-task-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="5" r="2"></circle>
                                    <path d="M10 22v-5l-2-2v-4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v4l-2 2v5"></path>
                                </svg>
                                <div>
                                    <div class="focus-task-name">Light Movement</div>
                                    <div class="focus-sub">15 mins stretch/walk</div>
                                </div>
                            </div>
                            <div class="focus-checkbox-square">
                                <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3" style="display: none;">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="btn-complete-day-action" id="btnCompleteDay" onclick="completeToday()">Complete Day 13</button>
                </div>
            </div>
        </div>

    </div>

    <!-- Toast Notification -->
    <div id="detailToast" class="toast-notice">
        <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2.5">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
        <span id="detailToastMsg">Challenge Activated!</span>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        // Toggle interactive session item in Preview view
        function toggleSessionCheck(itemEl) {
            var box = itemEl.querySelector('.circle-check-box');
            var svg = box.querySelector('svg');
            var timeChip = itemEl.querySelector('.session-time-chip');

            if (box.classList.contains('checked')) {
                box.classList.remove('checked');
                svg.style.display = 'none';
                if (timeChip) timeChip.innerText = '0 / 60m';
            } else {
                box.classList.add('checked');
                svg.style.display = 'block';
                if (timeChip) timeChip.innerText = '60 / 60m';
            }
        }

        // Activate / Join Challenge action from detail page
        function activateThisChallenge() {
            showToast('🎉 Challenge Activated! Welcome to The Academic Sprint.');

            // Smoothly switch to Active Timeline view or navigate to active tab
            setTimeout(function () {
                window.location.href = 'Challenges.aspx?tab=active';
            }, 1200);
        }

        // Toggle focus items in Active Tracker view
        function toggleFocusItem(taskEl) {
            var box = taskEl.querySelector('.focus-checkbox-square');
            var svg = box.querySelector('svg');

            if (taskEl.classList.contains('checked')) {
                taskEl.classList.remove('checked');
                if (svg) svg.style.display = 'none';
            } else {
                taskEl.classList.add('checked');
                if (svg) svg.style.display = 'block';
            }
        }

        // Complete Day 13
        function completeToday() {
            var todayBox = document.getElementById('dayBoxToday');
            var statusText = document.getElementById('dayStatusText');
            var btn = document.getElementById('btnCompleteDay');

            // Check all items
            var tasks = document.querySelectorAll('.focus-task-item');
            tasks.forEach(function (task) {
                task.classList.add('checked');
                var svg = task.querySelector('.focus-checkbox-square svg');
                if (svg) svg.style.display = 'block';
            });

            if (todayBox) {
                todayBox.classList.remove('today');
                todayBox.classList.add('completed');
                var flag = todayBox.querySelector('.today-flag-pill');
                if (flag) flag.style.display = 'none';
                if (statusText) statusText.outerHTML = '<svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>';
            }

            if (btn) {
                btn.innerText = '✓ Day 13 Completed';
                btn.style.backgroundColor = '#DCFCE7';
                btn.style.borderColor = '#86EFAC';
                btn.style.color = '#15803D';
                btn.disabled = true;
            }

            showToast('⭐ Day 13 Complete! Streak updated and +50 XP awarded!');
        }

        function showToast(msg) {
            var toast = document.getElementById('detailToast');
            var toastMsg = document.getElementById('detailToastMsg');
            if (toast && toastMsg) {
                toastMsg.innerText = msg;
                toast.classList.add('show');
                setTimeout(function () {
                    toast.classList.remove('show');
                }, 3500);
            }
        }
    </script>
</asp:Content>
