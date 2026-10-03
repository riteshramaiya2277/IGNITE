<%@ Page Title="Habits Hub" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="HabitHub.aspx.cs" Inherits="IGNITE.Student.HabitHub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/habits.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Fail-safe stylesheet inclusion -->
    <link href="../Content/habits.css" rel="stylesheet" type="text/css" />

    <div class="habits-hub-canvas">

        <!-- Top Breadcrumb / Return Link -->
        <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
            <a href="Habits.aspx" class="filter-pill-btn" style="text-decoration: none;">
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5">
                    <line x1="19" y1="12" x2="5" y2="12"></line>
                    <polyline points="12 19 5 12 12 5"></polyline>
                </svg>
                <span>Back to Habits Overview</span>
            </a>
            <span style="font-size: 0.85rem; color: #78716C; font-weight: 600;">Categorized Hub View</span>
        </div>

        <!-- ==================================================================
             CATEGORY 1: Study & Productivity (3 Active)
             ================================================================== -->
        <section class="habit-category-section" id="secStudy">
            <div class="category-header-row">
                <h2 class="category-title">Study &amp; Productivity</h2>
                <span class="category-count-pill">3 Active</span>
            </div>

            <div class="category-cards-grid">

                <!-- Card 1: Deep Work Session (Measurable) -> Links to HabitDetailMeasurable.aspx -->
                <div class="habit-card" onclick="navigateToDetail('HabitDetailMeasurable.aspx', event)" title="View Deep Work details">
                    <div class="habit-card-header">
                        <div class="habit-card-header-left">
                            <div class="habit-icon-box" title="Study Focus">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                    <line x1="8" y1="7" x2="16" y2="7"></line>
                                    <line x1="8" y1="11" x2="14" y2="11"></line>
                                </svg>
                            </div>
                            <div class="habit-card-titles">
                                <div class="habit-card-title-row">
                                    <h3 class="habit-name">Deep Work Session</h3>
                                </div>
                                <span class="habit-subtitle">Daily &bull; 4 hours target</span>
                            </div>
                        </div>
                        <div class="streak-pill" title="12-Day Current Streak">
                            <svg viewBox="0 0 24 24">
                                <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                            </svg>
                            <span>12 DAYS</span>
                        </div>
                    </div>

                    <div class="habit-card-body">
                        <div class="progress-label-row">
                            <span>Today's Progress</span>
                            <span id="deepWorkFraction">3 / 4 hours</span>
                        </div>
                        <div class="progress-with-btn-row">
                            <div class="habit-progress-track">
                                <div class="habit-progress-fill" id="deepWorkBar" style="width: 75%;"></div>
                            </div>
                            <button type="button" class="btn-mini-add" title="Quick add +30 mins" onclick="quickAddDeepWork(event)">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <line x1="12" y1="5" x2="12" y2="19"></line>
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div class="habit-card-footer">
                        <span class="footer-section-label">ACTIVITY HISTORY</span>
                        <div class="activity-dots-row">
                            <span class="activity-dot dot-yellow"></span>
                            <span class="activity-dot dot-yellow"></span>
                            <span class="activity-dot"></span>
                            <span class="activity-dot dot-yellow"></span>
                            <span class="activity-dot"></span>
                            <span class="activity-dot dot-yellow"></span>
                            <span class="activity-dot dot-purple-ring"></span>
                        </div>
                    </div>
                </div>

                <!-- Card 2: Review Flashcards (Binary) -> Links to HabitDetailBinary.aspx -->
                <div class="habit-card" onclick="navigateToDetail('HabitDetailBinary.aspx', event)" title="View Review Flashcards details">
                    <div class="habit-card-header">
                        <div class="habit-card-header-left">
                            <div class="habit-icon-box" title="Flashcard Review">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path d="M10 2v7.31M14 9.31V2M8.5 2h7M14 9.31a6.5 6.5 0 1 1-4 0"></path>
                                    <path d="M5.52 16h12.96"></path>
                                </svg>
                            </div>
                            <div class="habit-card-titles">
                                <div class="habit-card-title-row">
                                    <h3 class="habit-name">Review Flashcards</h3>
                                </div>
                                <span class="habit-subtitle">Mon, Wed, Fri</span>
                            </div>
                        </div>
                        <div class="streak-pill" title="8-Day Current Streak">
                            <svg viewBox="0 0 24 24">
                                <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                            </svg>
                            <span>8 DAYS</span>
                        </div>
                    </div>

                    <div class="habit-card-body">
                        <div class="mark-complete-box" id="flashcardsBanner">
                            <span class="mark-complete-text" id="flashcardsText">Mark today as complete</span>
                            <button type="button" class="btn-check-circle" id="btnCheckFlashcards" title="Mark as completed today" onclick="toggleFlashcardsComplete(event)">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div class="habit-card-footer">
                        <span class="footer-section-label">WEEKLY STREAK</span>
                        <div class="weekly-streak-days">
                            <div class="day-col"><span class="day-letter">M</span><span class="day-dot past-day"></span></div>
                            <div class="day-col"><span class="day-letter">T</span><span class="day-dot past-day"></span></div>
                            <div class="day-col"><span class="day-letter">W</span><span class="day-dot past-day"></span></div>
                            <div class="day-col"><span class="day-letter">T</span><span class="day-dot"></span></div>
                            <div class="day-col"><span class="day-letter">F</span><span class="day-dot active-day"></span></div>
                            <div class="day-col"><span class="day-letter">S</span><span class="day-dot"></span></div>
                            <div class="day-col"><span class="day-letter">S</span><span class="day-dot"></span></div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <!-- ==================================================================
             CATEGORY 2: Health & Wellness
             ================================================================== -->
        <section class="habit-category-section" id="secHealth">
            <div class="category-header-row">
                <h2 class="category-title">Health &amp; Wellness</h2>
            </div>

            <div class="category-cards-grid">

                <!-- Card 3: Hydration Goal (Measurable / Dose) -->
                <div class="habit-card" onclick="navigateToDetail('HabitDetailMeasurable.aspx', event)" title="View Hydration details">
                    <div class="habit-card-header">
                        <div class="habit-card-header-left">
                            <div class="habit-icon-box" title="Hydration Track">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                                </svg>
                            </div>
                            <div class="habit-card-titles">
                                <div class="habit-card-title-row">
                                    <h3 class="habit-name">Hydration Goal</h3>
                                </div>
                                <span class="habit-subtitle">Daily &bull; 2500ml</span>
                            </div>
                        </div>
                        <div class="streak-pill" title="22-Day Streak">
                            <svg viewBox="0 0 24 24">
                                <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                            </svg>
                            <span>22 DAYS</span>
                        </div>
                    </div>

                    <div class="habit-card-body">
                        <div class="hydration-progress-row">
                            <div class="hydration-left-group">
                                <div class="circular-progress-wrap">
                                    <svg class="circular-progress-svg" viewBox="0 0 64 64">
                                        <circle class="circular-bg" cx="32" cy="32" r="26"></circle>
                                        <circle class="circular-meter" id="hydrationCircleMeter" cx="32" cy="32" r="26"
                                            stroke-dasharray="163.36" stroke-dashoffset="32.67"></circle>
                                    </svg>
                                    <span class="circular-progress-text" id="hydrationPercentText">80%</span>
                                </div>
                                <span class="hydration-target-text" id="hydrationVolText">2000ml / 2500ml</span>
                            </div>
                            <div class="hydration-quick-btns">
                                <button type="button" class="btn-quick-dose" onclick="addWater(250, event)">+ 250ml</button>
                                <button type="button" class="btn-quick-dose" onclick="addWater(500, event)">+ 500ml</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Card 4: Early Morning Yoga (Paused State) -->
                <div class="habit-card" onclick="navigateToDetail('HabitDetailBinary.aspx', event)" title="View Early Morning Yoga details">
                    <div class="habit-card-header">
                        <div class="habit-card-header-left">
                            <div class="habit-icon-box" title="Morning Yoga">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
                                </svg>
                            </div>
                            <div class="habit-card-titles">
                                <div class="habit-card-title-row">
                                    <h3 class="habit-name">Early Morning Yoga</h3>
                                    <span class="badge-paused" id="badgeYogaStatus">PAUSED</span>
                                </div>
                                <span class="habit-subtitle">Daily &bull; 20 mins</span>
                            </div>
                        </div>
                        <div class="streak-pill streak-zero" id="pillYogaStreak">
                            <svg viewBox="0 0 24 24">
                                <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                            </svg>
                            <span id="txtYogaDays">0 DAYS</span>
                        </div>
                    </div>

                    <div class="habit-card-body">
                        <div class="paused-habit-banner">
                            <span class="paused-banner-text" id="yogaBannerText">Resume this habit to start tracking again.</span>
                            <button type="button" class="btn-banner-resume" id="btnResumeYoga" onclick="toggleResumeYoga(event)">Resume</button>
                        </div>
                    </div>

                    <div class="habit-card-footer">
                        <span class="footer-section-label">PAST CONSISTENCY: 88%</span>
                        <div class="activity-dots-row">
                            <span class="activity-dot dot-yellow"></span>
                            <span class="activity-dot dot-yellow"></span>
                            <span class="activity-dot dot-yellow"></span>
                            <span class="activity-dot dot-yellow"></span>
                            <span class="activity-dot dot-yellow"></span>
                            <span class="activity-dot"></span>
                            <span class="activity-dot dot-yellow"></span>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <!-- ==================================================================
             CATEGORY 3: Personal Growth
             ================================================================== -->
        <section class="habit-category-section" id="secPersonal">
            <div class="category-header-row">
                <h2 class="category-title">Personal Growth</h2>
            </div>

            <div class="category-cards-grid">

                <!-- Card 5: Read 20 Mins (Timer / Heatmap Grid) -->
                <div class="habit-card" onclick="navigateToDetail('HabitDetailMeasurable.aspx', event)" title="View Reading details">
                    <div class="habit-card-header">
                        <div class="habit-card-header-left">
                            <div class="habit-icon-box" title="Reading Habit">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
                                    <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
                                </svg>
                            </div>
                            <div class="habit-card-titles">
                                <div class="habit-card-title-row">
                                    <h3 class="habit-name">Read 20 Mins</h3>
                                </div>
                                <span class="habit-subtitle">Daily &bull; Non-fiction</span>
                            </div>
                        </div>
                        <div class="streak-pill" title="45-Day High Streak">
                            <svg viewBox="0 0 24 24">
                                <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                            </svg>
                            <span>45 DAYS</span>
                        </div>
                    </div>

                    <div class="habit-card-body">
                        <div class="read-timer-row">
                            <span class="read-progress-label">Current Progress: <span class="read-progress-highlight" id="lblReadMins">12 / 20 mins</span></span>
                            <button type="button" class="btn-start-timer" onclick="openTimerModal(event)">Start Timer</button>
                        </div>
                        <div class="habit-progress-track">
                            <div class="habit-progress-fill" id="readProgressBar" style="width: 60%;"></div>
                        </div>
                    </div>

                    <div class="habit-card-footer">
                        <span class="footer-section-label">30-DAY GRID</span>
                        <div class="mini-month-grid">
                            <span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span>
                            <span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span>
                            <span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span><span class="mini-grid-cell cell-filled"></span>
                        </div>
                    </div>
                </div>

                <!-- Card 6: Dotted "+ Add another personal habit" Placeholder Card -->
                <div class="add-habit-placeholder-card" onclick="openAddHabitModal()">
                    <div class="add-placeholder-icon-wrap">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                    </div>
                    <span class="add-placeholder-text">Add another personal habit</span>
                </div>

            </div>
        </section>

    </div>

    <!-- Create Habit Modal Dialog -->
    <div class="modal-overlay" id="modalCreateHabit">
        <div class="modal-container">
            <div class="modal-header">
                <h3 class="modal-title">Create New Habit</h3>
                <button type="button" class="btn-close-modal" onclick="closeAddHabitModal()">&times;</button>
            </div>
            <div class="modal-form-group">
                <label class="modal-label">Habit Name</label>
                <input type="text" id="newHabitName" class="modal-input" placeholder="e.g., Morning Run, Daily Journaling" />
            </div>
            <div class="modal-form-group">
                <label class="modal-label">Category</label>
                <select id="newHabitCategory" class="modal-select">
                    <option value="Study">Study &amp; Productivity</option>
                    <option value="Health">Health &amp; Wellness</option>
                    <option value="Personal">Personal Growth</option>
                </select>
            </div>
            <div class="modal-form-group">
                <label class="modal-label">Habit Type</label>
                <select id="newHabitType" class="modal-select" onchange="toggleTypeInputs(this.value)">
                    <option value="measurable">Measurable (Target Value &amp; Unit)</option>
                    <option value="binary">Binary (Completed or Not)</option>
                </select>
            </div>
            <div class="modal-form-group" id="groupTargetValue">
                <label class="modal-label">Daily Target</label>
                <input type="text" id="newHabitTarget" class="modal-input" placeholder="e.g. 4 hours, 2500 ml" />
            </div>
            <div class="modal-actions">
                <button type="button" class="btn-modal-cancel" onclick="closeAddHabitModal()">Cancel</button>
                <button type="button" class="btn-modal-submit" onclick="saveNewHabit()">Create Habit</button>
            </div>
        </div>
    </div>

    <!-- Reading Timer Modal -->
    <div class="modal-overlay" id="modalTimer">
        <div class="modal-container" style="text-align: center; align-items: center;">
            <div class="modal-header" style="width: 100%;">
                <h3 class="modal-title">Focus Reading Session</h3>
                <button type="button" class="btn-close-modal" onclick="closeTimerModal()">&times;</button>
            </div>
            <div style="font-size: 3.5rem; font-weight: 800; color: #DF6A74; margin: 16px 0;" id="timerDisplay">20:00</div>
            <p style="color: #78716C; margin: 0 0 16px 0;">Target: Read 20 Mins &bull; Non-fiction</p>
            <div style="display: flex; gap: 12px; justify-content: center;">
                <button type="button" class="btn-modal-submit" id="btnToggleTimer" onclick="toggleTimer()">Start</button>
                <button type="button" class="btn-modal-cancel" onclick="addMinutesToRead(5)">+5 Mins</button>
                <button type="button" class="btn-modal-cancel" onclick="closeTimerModal()">Close</button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function navigateToDetail(pageUrl, event) {
            if (event && event.target && (event.target.tagName === 'BUTTON' || event.target.closest('button'))) {
                return;
            }
            window.location.href = pageUrl;
        }

        var currentHours = 3.0;
        function quickAddDeepWork(e) {
            e.stopPropagation();
            if (currentHours < 4.0) {
                currentHours += 0.5;
                if (currentHours > 4.0) currentHours = 4.0;
                document.getElementById('deepWorkFraction').innerText = currentHours.toFixed(1) + " / 4 hours";
                var pct = (currentHours / 4.0) * 100;
                document.getElementById('deepWorkBar').style.width = pct + "%";
                showToast("Logged +30 mins to Deep Work Session! Keep going!");
            } else {
                showToast("Deep work goal already completed for today! Awesome job!");
            }
        }

        var flashcardsDone = false;
        function toggleFlashcardsComplete(e) {
            e.stopPropagation();
            flashcardsDone = !flashcardsDone;
            var btn = document.getElementById('btnCheckFlashcards');
            var txt = document.getElementById('flashcardsText');
            if (flashcardsDone) {
                btn.classList.add('completed');
                txt.innerText = "Completed for today! +15 XP";
                txt.style.color = "#10B981";
                showToast("Flashcards marked completed! +15 XP earned!");
            } else {
                btn.classList.remove('completed');
                txt.innerText = "Mark today as complete";
                txt.style.color = "#B45309";
            }
        }

        var currentWater = 2000;
        var maxWater = 2500;
        function addWater(amount, e) {
            e.stopPropagation();
            currentWater += amount;
            if (currentWater > maxWater) currentWater = maxWater;
            var pct = Math.round((currentWater / maxWater) * 100);
            document.getElementById('hydrationPercentText').innerText = pct + "%";
            document.getElementById('hydrationVolText').innerText = currentWater + "ml / " + maxWater + "ml";
            
            var totalCircumference = 163.36;
            var offset = totalCircumference - (pct / 100) * totalCircumference;
            document.getElementById('hydrationCircleMeter').style.strokeDashoffset = offset;
            showToast("Added +" + amount + "ml! Hydration is at " + pct + "%!");
        }

        var yogaPaused = true;
        function toggleResumeYoga(e) {
            e.stopPropagation();
            yogaPaused = !yogaPaused;
            var badge = document.getElementById('badgeYogaStatus');
            var bannerText = document.getElementById('yogaBannerText');
            var resumeBtn = document.getElementById('btnResumeYoga');
            var streakPill = document.getElementById('pillYogaStreak');
            var daysText = document.getElementById('txtYogaDays');

            if (!yogaPaused) {
                badge.innerText = "ACTIVE";
                badge.style.backgroundColor = "#10B981";
                bannerText.innerText = "Active habit: Scheduled for tomorrow morning 6:30 AM.";
                resumeBtn.innerText = "Pause";
                streakPill.classList.remove('streak-zero');
                daysText.innerText = "1 DAY";
                showToast("Early Morning Yoga is now active!");
            } else {
                badge.innerText = "PAUSED";
                badge.style.backgroundColor = "#64748B";
                bannerText.innerText = "Resume this habit to start tracking again.";
                resumeBtn.innerText = "Resume";
                streakPill.classList.add('streak-zero');
                daysText.innerText = "0 DAYS";
                showToast("Early Morning Yoga paused.");
            }
        }

        function openAddHabitModal() {
            document.getElementById('modalCreateHabit').classList.add('open');
        }
        function closeAddHabitModal() {
            document.getElementById('modalCreateHabit').classList.remove('open');
        }
        function toggleTypeInputs(val) {
            document.getElementById('groupTargetValue').style.display = (val === 'binary') ? 'none' : 'flex';
        }
        function saveNewHabit() {
            var name = document.getElementById('newHabitName').value.trim();
            if (!name) {
                alert("Please enter a habit name");
                return;
            }
            closeAddHabitModal();
            showToast("Habit '" + name + "' created successfully!");
        }

        var timerInterval = null;
        var secondsLeft = 1200;
        function openTimerModal(e) {
            e.stopPropagation();
            document.getElementById('modalTimer').classList.add('open');
        }
        function closeTimerModal() {
            clearInterval(timerInterval);
            timerInterval = null;
            document.getElementById('modalTimer').classList.remove('open');
        }
        function toggleTimer() {
            var btn = document.getElementById('btnToggleTimer');
            if (timerInterval) {
                clearInterval(timerInterval);
                timerInterval = null;
                btn.innerText = "Start";
            } else {
                btn.innerText = "Pause";
                timerInterval = setInterval(function() {
                    if (secondsLeft > 0) {
                        secondsLeft--;
                        var m = Math.floor(secondsLeft / 60);
                        var s = secondsLeft % 60;
                        document.getElementById('timerDisplay').innerText = (m < 10 ? "0" + m : m) + ":" + (s < 10 ? "0" + s : s);
                    } else {
                        clearInterval(timerInterval);
                        alert("Reading session complete! Great work!");
                    }
                }, 1000);
            }
        }
        function addMinutesToRead(mins) {
            var el = document.getElementById('lblReadMins');
            el.innerText = "17 / 20 mins";
            document.getElementById('readProgressBar').style.width = "85%";
            showToast("Added +" + mins + " minutes reading progress!");
            closeTimerModal();
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
