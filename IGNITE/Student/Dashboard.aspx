<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="IGNITE.Student.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/dashboard.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-canvas">
        <!-- 1. Header Greeting Section -->
        <section class="dashboard-greeting">
            <h1 class="greeting-title">Good morning, <asp:Literal ID="litGreetingName" runat="server">Alex</asp:Literal>!</h1>
            <p class="greeting-subtitle">You're on a <asp:Literal ID="litGreetingStreak" runat="server">15</asp:Literal>-day streak. Ready to crush your goals today?</p>
        </section>

        <!-- 2. Two-Column Dashboard Layout -->
        <div class="dashboard-grid">
            <!-- ================= LEFT COLUMN ================= -->
            <div class="dashboard-column">
                
                <!-- Card: Today's Habits -->
                <section class="dash-card">
                    <div class="dash-card-header">
                        <h2 class="dash-card-title">Today's Habits</h2>
                        <a href="<%= ResolveUrl("~/Student/Habits.aspx") %>" class="dash-card-link">View All &gt;</a>
                    </div>

                    <div class="habits-list">
                        <!-- Habit 1: Drink 2L Water (Completed) -->
                        <div class="habit-row" id="habitRow1">
                            <div class="habit-left">
                                <div class="habit-icon-wrap habit-icon-water" title="Water">
                                    <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                        <path d="M12 2.69l5.66 5.66a8 8 0 1 1-11.31 0z" />
                                    </svg>
                                </div>
                                <div class="habit-details">
                                    <span class="habit-title">Drink 2L Water</span>
                                    <span class="habit-category">Health &amp; Wellness</span>
                                </div>
                            </div>
                            <div class="habit-right">
                                <span class="badge-pill-completed">COMPLETED</span>
                                <div class="check-circle-icon" title="Completed">
                                    <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3">
                                        <polyline points="20 6 9 17 4 12"></polyline>
                                    </svg>
                                </div>
                            </div>
                        </div>

                        <!-- Habit 2: Deep Work: Focus Study (In Progress with Progress Bar and + button) -->
                        <div class="habit-row" id="habitRow2">
                            <div class="habit-left">
                                <div class="habit-icon-wrap habit-icon-study" title="Focus Study">
                                    <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                        <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                    </svg>
                                </div>
                                <div class="habit-study-content">
                                    <div class="habit-study-top">
                                        <span class="habit-title">Deep Work: Focus Study</span>
                                        <span class="habit-study-metric" id="lblFocusProgress">2 / 4 hours</span>
                                    </div>
                                    <div class="habit-study-track">
                                        <div class="habit-study-fill" id="barFocusProgress" style="width: 50%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="habit-right">
                                <button type="button" class="btn-habit-plus" id="btnFocusAdd" title="Log 1 hour of focus study" onclick="incrementStudyHours()">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <line x1="12" y1="5" x2="12" y2="19"></line>
                                        <line x1="5" y1="12" x2="19" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <!-- Habit 3: Evening Gym Session (Mark Done Button) -->
                        <div class="habit-row" id="habitRow3">
                            <div class="habit-left">
                                <div class="habit-icon-wrap habit-icon-gym" title="Fitness">
                                    <svg viewBox="0 0 24 24" width="19" height="19" fill="currentColor">
                                        <path d="M6 5h2v14H6V5zm10 0h2v14h-2V5zM3 8h2v8H3V8zm16 0h2v8h-2V8zM8 11h8v2H8v-2z" />
                                    </svg>
                                </div>
                                <div class="habit-details">
                                    <span class="habit-title">Evening Gym Session</span>
                                    <span class="habit-category">Fitness</span>
                                </div>
                            </div>
                            <div class="habit-right">
                                <button type="button" class="btn-mark-done" id="btnGymDone" onclick="toggleGymSession(this)">Mark Done</button>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Card: Upcoming Tasks -->
                <section class="dash-card">
                    <div class="dash-card-header">
                        <div class="tasks-card-header-left">
                            <h2 class="dash-card-title">Upcoming Tasks</h2>
                            <span class="badge-pill-overdue-count">3 Overdue</span>
                        </div>
                        <a href="<%= ResolveUrl("~/Student/Tasks.aspx") %>" class="dash-card-link">Manage All</a>
                    </div>

                    <!-- Tasks Table -->
                    <div class="tasks-table-header">
                        <div>TASK TITLE</div>
                        <div>SUBJECT</div>
                        <div>DUE DATE</div>
                        <div>PRIORITY</div>
                        <div>STATUS</div>
                    </div>

                    <div class="tasks-list">
                        <!-- Task 1: Overdue -->
                        <div class="task-row task-row-overdue" id="taskItem1">
                            <div class="task-title-cell">
                                <label class="task-checkbox-wrap">
                                    <input type="checkbox" class="task-checkbox-input" onchange="toggleTaskRow(this, 'taskItem1')" />
                                    <span class="task-custom-checkbox checkbox-overdue"></span>
                                </label>
                                <span class="task-name-text">Chapter 4 Lab Report</span>
                            </div>
                            <div class="task-subject-cell">Physics 101</div>
                            <div class="task-duedate-cell task-duedate-overdue">Oct 22 (2d ago)</div>
                            <div class="task-priority-cell">
                                <span class="priority-dot priority-dot-high" title="High Priority"></span>
                            </div>
                            <div class="task-status-cell">
                                <span class="badge-status badge-status-overdue">OVERDUE</span>
                            </div>
                        </div>

                        <!-- Task 2: In Progress -->
                        <div class="task-row" id="taskItem2">
                            <div class="task-title-cell">
                                <label class="task-checkbox-wrap">
                                    <input type="checkbox" class="task-checkbox-input" onchange="toggleTaskRow(this, 'taskItem2')" />
                                    <span class="task-custom-checkbox checkbox-progress"></span>
                                </label>
                                <span class="task-name-text">History Essay Draft</span>
                            </div>
                            <div class="task-subject-cell">World History</div>
                            <div class="task-duedate-cell">Today, 6 PM</div>
                            <div class="task-priority-cell">
                                <span class="priority-dot priority-dot-medium" title="Medium Priority"></span>
                            </div>
                            <div class="task-status-cell">
                                <span class="badge-status badge-status-inprogress">IN PROGRESS</span>
                            </div>
                        </div>

                        <!-- Task 3: Pending -->
                        <div class="task-row" id="taskItem3">
                            <div class="task-title-cell">
                                <label class="task-checkbox-wrap">
                                    <input type="checkbox" class="task-checkbox-input" onchange="toggleTaskRow(this, 'taskItem3')" />
                                    <span class="task-custom-checkbox"></span>
                                </label>
                                <span class="task-name-text">Math Problem Set #8</span>
                            </div>
                            <div class="task-subject-cell">Calculus II</div>
                            <div class="task-duedate-cell">Tomorrow</div>
                            <div class="task-priority-cell">
                                <span class="priority-dot priority-dot-normal" title="Normal Priority"></span>
                            </div>
                            <div class="task-status-cell">
                                <span class="badge-status badge-status-pending">PENDING</span>
                            </div>
                        </div>
                    </div>
                </section>

            </div>

            <!-- ================= RIGHT COLUMN ================= -->
            <div class="dashboard-column">
                
                <!-- Card: Daily Quests -->
                <section class="dash-card">
                    <div class="dash-card-header">
                        <h2 class="dash-card-title">Daily Quests</h2>
                        <span class="quests-reset-tag">RESET IN 4H</span>
                    </div>

                    <div class="quests-list">
                        <!-- Quest 1: Log 3 Habits -->
                        <div class="quest-item">
                            <div class="quest-icon-circle">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                                </svg>
                            </div>
                            <div class="quest-content">
                                <div class="quest-top">
                                    <span class="quest-title">Log 3 Habits</span>
                                    <span class="quest-fraction" id="lblQuestHabits">1/3</span>
                                </div>
                                <div class="quest-track">
                                    <div class="quest-fill" id="barQuestHabits" style="width: 33.3%;"></div>
                                </div>
                            </div>
                        </div>

                        <!-- Quest 2: Review Notes -->
                        <div class="quest-item">
                            <div class="quest-icon-circle">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="8" r="6"></circle>
                                    <path d="M15.477 12.89 17 22l-5-3-5 3 1.523-9.11"></path>
                                </svg>
                            </div>
                            <div class="quest-content">
                                <div class="quest-top">
                                    <span class="quest-title">Review Notes</span>
                                    <span class="quest-done-text">Done!</span>
                                </div>
                                <div class="quest-track">
                                    <div class="quest-fill" style="width: 100%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Milestone Subsection -->
                    <div class="milestone-section">
                        <div class="milestone-header-label">WEEKLY MILESTONE</div>
                        <div class="milestone-card">
                            <div>
                                <h3 class="milestone-title">Exam Warrior</h3>
                                <p class="milestone-subtext">Complete 5 Study Sessions</p>
                            </div>
                            <div class="milestone-score">3/5</div>
                        </div>
                    </div>
                </section>

                <!-- Card: Active Challenges -->
                <section class="dash-card">
                    <div class="dash-card-header">
                        <h2 class="dash-card-title">Active Challenges</h2>
                    </div>

                    <div class="challenges-list">
                        <!-- Challenge 1: Morning Bird Challenge -->
                        <div class="challenge-row">
                            <div class="challenge-top">
                                <span class="challenge-title">Morning Bird Challenge</span>
                                <span class="challenge-deadline">End in 3d</span>
                            </div>
                            <div class="challenge-difficulty difficulty-hard">HARD DIFFICULTY</div>
                            <div class="challenge-bottom">
                                <div class="challenge-avatars">
                                    <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=50&auto=format&fit=crop&q=80" alt="avatar" class="challenge-avatar-img" />
                                    <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50&auto=format&fit=crop&q=80" alt="avatar" class="challenge-avatar-img" />
                                    <span class="challenge-avatar-more">+12</span>
                                </div>
                                <div class="challenge-track">
                                    <div class="challenge-fill" style="width: 65%;"></div>
                                </div>
                                <span class="challenge-pct">65%</span>
                            </div>
                        </div>

                        <!-- Challenge 2: Reading Marathon -->
                        <div class="challenge-row">
                            <div class="challenge-top">
                                <span class="challenge-title">Reading Marathon</span>
                                <span class="challenge-deadline">End in 12d</span>
                            </div>
                            <div class="challenge-difficulty difficulty-medium">MEDIUM DIFFICULTY</div>
                            <div class="challenge-bottom">
                                <div class="challenge-track">
                                    <div class="challenge-fill" style="width: 20%;"></div>
                                </div>
                                <span class="challenge-pct">20%</span>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Card: Academic Feed -->
                <section class="dash-card">
                    <div class="dash-card-header">
                        <h2 class="dash-card-title">Academic Feed</h2>
                    </div>

                    <div class="academic-feed-list">
                        <!-- Event 1 -->
                        <div class="feed-item">
                            <div class="date-box">
                                <span class="date-box-month">OCT</span>
                                <span class="date-box-day">26</span>
                            </div>
                            <div class="feed-info">
                                <h3 class="feed-title">Midterm: Bio-Chem</h3>
                                <p class="feed-meta">Room 402 &bull; 09:00 AM</p>
                            </div>
                        </div>

                        <!-- Event 2 -->
                        <div class="feed-item">
                            <div class="date-box">
                                <span class="date-box-month">OCT</span>
                                <span class="date-box-day">30</span>
                            </div>
                            <div class="feed-info">
                                <h3 class="feed-title">Library Group Study</h3>
                                <p class="feed-meta">Main Hall &bull; 02:30 PM</p>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        // 1. Focus Study increment micro-interaction
        var currentFocusHours = 2;
        var maxFocusHours = 4;

        function incrementStudyHours() {
            if (currentFocusHours < maxFocusHours) {
                currentFocusHours++;
            } else {
                currentFocusHours = 1; // cycle back for demo
            }

            var pct = (currentFocusHours / maxFocusHours) * 100;
            document.getElementById('lblFocusProgress').innerText = currentFocusHours + ' / ' + maxFocusHours + ' hours';
            document.getElementById('barFocusProgress').style.width = pct + '%';
        }

        // 2. Gym Session Mark Done toggle
        function toggleGymSession(btn) {
            if (btn.classList.contains('done')) {
                btn.classList.remove('done');
                btn.innerText = 'Mark Done';
            } else {
                btn.classList.add('done');
                btn.innerText = 'Done ✓';
            }
        }

        // 3. Task Complete Toggle
        function toggleTaskRow(checkbox, rowId) {
            var row = document.getElementById(rowId);
            if (!row) return;

            if (checkbox.checked) {
                row.classList.add('task-completed');
            } else {
                row.classList.remove('task-completed');
            }
        }
    </script>
</asp:Content>