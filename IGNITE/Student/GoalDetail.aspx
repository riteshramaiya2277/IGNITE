<%@ Page Title="Goal Detail" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true"
    CodeBehind="GoalDetail.aspx.cs" Inherits="IGNITE.Student.GoalDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/dashboard.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%= ResolveUrl("~/Content/goals.css?v=" + DateTime.Now.Ticks) %>" rel="stylesheet" type="text/css" />
    <style>
        .goal-detail-canvas {
            padding: 0 10px 40px 10px;
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #18181B;
        }
        .goal-detail-top-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            flex-wrap: wrap;
            gap: 16px;
        }
        .goal-breadcrumb {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.88rem;
            font-weight: 600;
        }
        .goal-breadcrumb-link {
            color: #78716C;
            text-decoration: none;
            transition: color 0.15s ease;
        }
        .goal-breadcrumb-link:hover {
            color: #18181B;
        }
        .breadcrumb-sep {
            color: #A8A29E;
        }
        .breadcrumb-current {
            color: #18181B;
            font-weight: 700;
        }
        .goal-detail-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .btn-goal-action-text {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: transparent;
            border: none;
            color: #DF6A74;
            font-size: 0.88rem;
            font-weight: 700;
            cursor: pointer;
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 8px;
            transition: all 0.15s ease;
        }
        .btn-goal-action-text:hover {
            background-color: rgba(223, 106, 116, 0.08);
        }
        .btn-goal-pause {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background-color: #FFFFFF;
            border: 1px solid #DDD6CB;
            color: #EA580C;
            font-size: 0.88rem;
            font-weight: 700;
            padding: 8px 16px;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.15s ease;
        }
        .btn-goal-pause:hover {
            background-color: #FFF7ED;
            border-color: #FDBA74;
        }
        .btn-goal-pause.paused {
            background-color: #EA580C;
            color: #FFFFFF;
            border-color: #EA580C;
        }
        .btn-goal-complete {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background-color: #DF6A74;
            color: #FFFFFF;
            border: none;
            font-size: 0.88rem;
            font-weight: 700;
            padding: 9px 20px;
            border-radius: 10px;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(223, 106, 116, 0.3);
            transition: all 0.15s ease;
        }
        .btn-goal-complete:hover {
            background-color: #D45B65;
            transform: translateY(-1px);
        }
        .btn-goal-complete.completed-state {
            background-color: #10B981;
            box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
        }
        .goal-detail-layout {
            display: grid;
            grid-template-columns: 1fr 340px;
            gap: 24px;
            align-items: start;
        }
        .goal-detail-main-col {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .goal-detail-side-col {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .goal-hero-card {
            background-color: #EDE8DE;
            border-radius: 24px;
            padding: 32px 36px;
            border: 1px solid rgba(0, 0, 0, 0.04);
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.03);
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .goal-hero-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
        }
        .goal-hero-title {
            font-size: 1.85rem;
            font-weight: 800;
            color: #18181B;
            margin: 0 0 6px 0;
            letter-spacing: -0.02em;
        }
        .goal-hero-subtitle {
            font-size: 0.95rem;
            color: #57534E;
            margin: 0;
            line-height: 1.5;
        }
        .goal-hero-pct-wrap {
            text-align: right;
            flex-shrink: 0;
        }
        .hero-pct-number {
            font-size: 1.75rem;
            font-weight: 900;
            color: #DF6A74;
            line-height: 1;
            display: block;
        }
        .hero-pct-label {
            font-size: 0.68rem;
            font-weight: 800;
            color: #8C827A;
            letter-spacing: 0.06em;
        }
        .goal-hero-progress-track {
            width: 100%;
            height: 14px;
            background-color: #E2DBD0;
            border-radius: 9999px;
            overflow: hidden;
        }
        .goal-hero-progress-fill {
            height: 100%;
            background-color: #DF6A74;
            border-radius: 9999px;
            transition: width 0.4s ease;
        }
        .goal-hero-pills {
            display: flex;
            align-items: center;
            gap: 16px;
            flex-wrap: wrap;
            margin-top: 4px;
        }
        .goal-stat-pill {
            display: flex;
            align-items: center;
            gap: 10px;
            background-color: #F7F5F0;
            padding: 8px 14px;
            border-radius: 12px;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }
        .stat-pill-icon-box {
            width: 22px;
            height: 22px;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .stat-pill-icon-box.red-box {
            background-color: #FEECEE;
            color: #DF6A74;
        }
        .stat-pill-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
        }
        .stat-pill-dot.blue-dot {
            background-color: #3B82F6;
        }
        .stat-pill-dot.green-hollow {
            border: 2px solid #10B981;
            background: transparent;
        }
        .stat-pill-info {
            display: flex;
            flex-direction: column;
        }
        .stat-pill-label {
            font-size: 0.64rem;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.05em;
            line-height: 1;
        }
        .stat-pill-value {
            font-size: 0.85rem;
            font-weight: 700;
            color: #18181B;
            margin-top: 2px;
        }
        .stat-pill-value.text-green {
            color: #059669;
        }
        .smart-framework-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }
        .smart-card {
            background-color: #EDE8DE;
            border-radius: 20px;
            padding: 22px 24px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            border: 1px solid rgba(0, 0, 0, 0.04);
        }
        .smart-card-header {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .smart-badge {
            width: 26px;
            height: 26px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFFFFF;
            font-size: 0.82rem;
            font-weight: 900;
        }
        .smart-badge.badge-s { background-color: #DF6A74; }
        .smart-badge.badge-m { background-color: #8B5CF6; }
        .smart-badge.badge-a { background-color: #0D9488; }
        .smart-badge.badge-r { background-color: #EA580C; }
        .smart-card-title {
            font-size: 0.85rem;
            font-weight: 800;
            color: #18181B;
            letter-spacing: 0.05em;
        }
        .smart-card-text {
            font-size: 0.88rem;
            color: #57534E;
            line-height: 1.5;
            margin: 0;
        }
        .related-tasks-card {
            background-color: #EDE8DE;
            border-radius: 24px;
            padding: 24px 28px;
            display: flex;
            flex-direction: column;
            gap: 18px;
            border: 1px solid rgba(0, 0, 0, 0.04);
        }
        .related-tasks-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .related-tasks-title {
            font-size: 1.05rem;
            font-weight: 800;
            color: #18181B;
            margin: 0;
        }
        .btn-add-related-task {
            background: transparent;
            border: none;
            color: #4F46E5;
            font-size: 0.85rem;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 6px 12px;
            border-radius: 8px;
            transition: background 0.15s ease;
        }
        .btn-add-related-task:hover {
            background-color: rgba(79, 70, 229, 0.08);
        }
        .related-tasks-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        .related-task-item {
            background-color: #F7F5F0;
            border-radius: 14px;
            padding: 14px 18px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            transition: transform 0.15s ease;
        }
        .related-task-item:hover {
            transform: translateY(-1px);
        }
        .task-item-left {
            display: flex;
            align-items: center;
            gap: 14px;
        }
        .task-check-circle {
            width: 22px;
            height: 22px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            flex-shrink: 0;
            border: 2px solid #CBD5E1;
            background: #FFFFFF;
            transition: all 0.2s ease;
        }
        .task-check-circle.completed {
            background-color: #10B981;
            border-color: #10B981;
            color: #FFFFFF;
        }
        .task-item-content {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }
        .task-item-title {
            font-size: 0.92rem;
            font-weight: 700;
            color: #18181B;
            margin: 0;
            transition: all 0.2s ease;
        }
        .task-item-title.completed-text {
            text-decoration: line-through;
            color: #9CA3AF;
        }
        .task-item-subtext {
            font-size: 0.78rem;
            color: #78716C;
            margin: 0;
        }
        .task-freq-badge {
            padding: 4px 10px;
            border-radius: 9999px;
            font-size: 0.72rem;
            font-weight: 800;
            letter-spacing: 0.04em;
            text-transform: uppercase;
        }
        .task-freq-badge.badge-weekly {
            background-color: #E0F2FE;
            color: #0284C7;
        }
        .task-freq-badge.badge-daily {
            background-color: #FFEDD5;
            color: #EA580C;
        }
        .goal-milestones-card {
            background-color: #EDE8DE;
            border-radius: 24px;
            padding: 24px 26px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            border: 1px solid rgba(0, 0, 0, 0.04);
        }
        .milestones-card-title {
            font-size: 1.05rem;
            font-weight: 800;
            color: #18181B;
            margin: 0;
        }
        .milestones-vertical-list {
            position: relative;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .milestone-timeline-item {
            position: relative;
            display: flex;
            align-items: flex-start;
            gap: 14px;
        }
        .milestone-timeline-item:not(:last-child)::after {
            content: '';
            position: absolute;
            left: 10px;
            top: 24px;
            bottom: -16px;
            width: 2px;
            background-color: #DDD6CB;
        }
        .milestone-icon-indicator {
            width: 20px;
            height: 20px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            z-index: 1;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        .milestone-icon-indicator.checked-green {
            background-color: #10B981;
            border: 2px solid #10B981;
            color: #FFFFFF;
        }
        .milestone-icon-indicator.box-red {
            border: 2px solid #EF4444;
            background-color: #FAF8F5;
        }
        .milestone-icon-indicator.box-gray {
            border: 2px solid #CBD5E1;
            background-color: #FAF8F5;
        }
        .milestone-text-group {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }
        .milestone-item-name {
            font-size: 0.88rem;
            font-weight: 700;
            color: #18181B;
        }
        .milestone-item-date {
            font-size: 0.76rem;
            color: #78716C;
        }
        .milestone-item-date.text-red {
            color: #DC2626;
            font-weight: 600;
        }
        .btn-add-milestone-full {
            width: 100%;
            background-color: #FAF8F5;
            border: 1px solid #DDD6CB;
            padding: 10px 16px;
            border-radius: 12px;
            font-size: 0.85rem;
            font-weight: 700;
            color: #57534E;
            cursor: pointer;
            transition: all 0.15s ease;
            text-align: center;
        }
        .btn-add-milestone-full:hover {
            background-color: #FFFFFF;
            border-color: #DF6A74;
            color: #DF6A74;
        }
        .quest-reward-card {
            background-color: #EDE8DE;
            border-radius: 24px;
            padding: 24px 26px;
            display: flex;
            flex-direction: column;
            gap: 14px;
            position: relative;
            border: 1px solid rgba(0, 0, 0, 0.04);
        }
        .quest-reward-header-pill {
            align-self: flex-end;
            font-size: 0.65rem;
            font-weight: 800;
            color: #EA580C;
            letter-spacing: 0.06em;
            text-transform: uppercase;
        }
        .quest-reward-icon-circle {
            width: 36px;
            height: 36px;
            border-radius: 10px;
            background-color: #DF6A74;
            color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .quest-reward-title {
            font-size: 1.05rem;
            font-weight: 800;
            color: #18181B;
            margin: 0;
        }
        .quest-reward-desc {
            font-size: 0.84rem;
            color: #57534E;
            line-height: 1.45;
            margin: 0;
        }
        .quest-reward-avatars {
            display: flex;
            align-items: center;
            gap: 6px;
            margin-top: 4px;
        }
        .avatar-mini {
            width: 26px;
            height: 26px;
            border-radius: 50%;
            border: 2px solid #FFFFFF;
            background-color: #3B82F6;
            color: #FFFFFF;
            font-size: 0.65rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        .avatar-mini img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .avatar-mini.av-sarah {
            background-color: #10B981;
        }
        .avatar-mini-count {
            font-size: 0.75rem;
            font-weight: 800;
            color: #EA580C;
            margin-left: 4px;
        }
        @media (max-width: 1024px) {
            .goal-detail-layout {
                grid-template-columns: 1fr;
            }
            .smart-framework-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="goal-detail-canvas">
        <!-- Top Nav / Breadcrumb / Actions -->
        <div class="goal-detail-top-nav">
            <div class="goal-breadcrumb">
                <a href="Goals.aspx" class="goal-breadcrumb-link">Goals</a>
                <span class="breadcrumb-sep">&gt;</span>
                <span class="breadcrumb-current">Master Advanced Calculus</span>
            </div>

            <div class="goal-detail-actions">
                <a href="CreateGoal.aspx?edit=1" class="btn-goal-action-text" title="Edit this goal">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                    </svg>
                    Edit Goal
                </a>
                <button type="button" class="btn-goal-pause" id="btnPauseQuest" onclick="togglePauseQuest()">
                    <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                    </svg>
                    <span id="pauseQuestLabel">Pause Quest</span>
                </button>
                <button type="button" class="btn-goal-complete" id="btnCompleteGoal" onclick="completeGoal()">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5">
                        <polyline points="20 6 9 17 4 12"></polyline>
                    </svg>
                    <span id="completeGoalLabel">Complete Goal</span>
                </button>
            </div>
        </div>

        <!-- 2 Column Layout -->
        <div class="goal-detail-layout">
            <!-- Left Main Column -->
            <div class="goal-detail-main-col">
                <!-- Hero Card -->
                <div class="goal-hero-card">
                    <div class="goal-hero-top">
                        <div>
                            <h1 class="goal-hero-title">Master Advanced Calculus &#128208;</h1>
                            <p class="goal-hero-subtitle">Achieve a grade of 90% or higher in the final semester examination.</p>
                        </div>
                        <div class="goal-hero-pct-wrap">
                            <span class="hero-pct-number" id="goalProgressText">65%</span>
                            <span class="hero-pct-label">PROGRESS</span>
                        </div>
                    </div>

                    <div class="goal-hero-progress-track">
                        <div class="goal-hero-progress-fill" id="goalProgressBar" style="width: 65%;"></div>
                    </div>

                    <div class="goal-hero-pills">
                        <!-- Deadline -->
                        <div class="goal-stat-pill">
                            <div class="stat-pill-icon-box red-box">
                                <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                            </div>
                            <div class="stat-pill-info">
                                <span class="stat-pill-label">DEADLINE</span>
                                <span class="stat-pill-value">Dec 15, 2024</span>
                            </div>
                        </div>

                        <!-- Days Left -->
                        <div class="goal-stat-pill">
                            <div class="stat-pill-dot blue-dot"></div>
                            <div class="stat-pill-info">
                                <span class="stat-pill-label">DAYS LEFT</span>
                                <span class="stat-pill-value">42 Days</span>
                            </div>
                        </div>

                        <!-- Status -->
                        <div class="goal-stat-pill">
                            <div class="stat-pill-dot green-hollow"></div>
                            <div class="stat-pill-info">
                                <span class="stat-pill-label">STATUS</span>
                                <span class="stat-pill-value text-green">On Track</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SMART Framework 2x2 Grid -->
                <div class="smart-framework-grid">
                    <!-- Specific -->
                    <div class="smart-card">
                        <div class="smart-card-header">
                            <div class="smart-badge badge-s">S</div>
                            <span class="smart-card-title">SPECIFIC</span>
                        </div>
                        <p class="smart-card-text">
                            Complete all problem sets in Stewart's Calculus and attend weekly TA sessions for multidimensional integration.
                        </p>
                    </div>

                    <!-- Measurable -->
                    <div class="smart-card">
                        <div class="smart-card-header">
                            <div class="smart-badge badge-m">M</div>
                            <span class="smart-card-title">MEASURABLE</span>
                        </div>
                        <p class="smart-card-text">
                            Achieving at least 85% on all intermediate quizzes and a final exam score of 90%+.
                        </p>
                    </div>

                    <!-- Achievable -->
                    <div class="smart-card">
                        <div class="smart-card-header">
                            <div class="smart-badge badge-a">A</div>
                            <span class="smart-card-title">ACHIEVABLE</span>
                        </div>
                        <p class="smart-card-text">
                            Dedicate 10 hours per week to study and utilizing university tutoring center twice a month.
                        </p>
                    </div>

                    <!-- Relevant -->
                    <div class="smart-card">
                        <div class="smart-card-header">
                            <div class="smart-badge badge-r">R</div>
                            <span class="smart-card-title">RELEVANT</span>
                        </div>
                        <p class="smart-card-text">
                            Foundational knowledge required for next semester's Quantum Mechanics and Advanced Engineering courses.
                        </p>
                    </div>
                </div>

                <!-- Related Daily/Weekly Tasks -->
                <div class="related-tasks-card">
                    <div class="related-tasks-header">
                        <h2 class="related-tasks-title">Related Daily/Weekly Tasks</h2>
                        <button type="button" class="btn-add-related-task" onclick="addNewRelatedTask()">
                            + New Task
                        </button>
                    </div>

                    <div class="related-tasks-list" id="relatedTasksContainer">
                        <!-- Task 1 (Completed) -->
                        <div class="related-task-item" id="taskRow1">
                            <div class="task-item-left">
                                <div class="task-check-circle completed" onclick="toggleTaskCompletion(1)">
                                    <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3">
                                        <polyline points="20 6 9 17 4 12"></polyline>
                                    </svg>
                                </div>
                                <div class="task-item-content">
                                    <p class="task-item-title completed-text" id="taskTitle1">Watch week 8 lecture recordings</p>
                                    <p class="task-item-subtext">Monday, 10:00 AM</p>
                                </div>
                            </div>
                            <span class="task-freq-badge badge-weekly">WEEKLY</span>
                        </div>

                        <!-- Task 2 (Pending) -->
                        <div class="related-task-item" id="taskRow2">
                            <div class="task-item-left">
                                <div class="task-check-circle" onclick="toggleTaskCompletion(2)"></div>
                                <div class="task-item-content">
                                    <p class="task-item-title" id="taskTitle2">Solve 15 integration-by-parts problems</p>
                                    <p class="task-item-subtext">Daily Habit &bull; 0/15 Today</p>
                                </div>
                            </div>
                            <span class="task-freq-badge badge-daily">DAILY</span>
                        </div>

                        <!-- Task 3 (Pending) -->
                        <div class="related-task-item" id="taskRow3">
                            <div class="task-item-left">
                                <div class="task-check-circle" onclick="toggleTaskCompletion(3)"></div>
                                <div class="task-item-content">
                                    <p class="task-item-title" id="taskTitle3">Attend Friday TA session</p>
                                    <p class="task-item-subtext">Starts in 2 hours</p>
                                </div>
                            </div>
                            <span class="task-freq-badge badge-weekly">WEEKLY</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Sidebar Column -->
            <div class="goal-detail-side-col">
                <!-- Goal Milestones Card -->
                <div class="goal-milestones-card">
                    <h3 class="milestones-card-title">Goal Milestones</h3>

                    <div class="milestones-vertical-list" id="milestonesListContainer">
                        <!-- Milestone 1 -->
                        <div class="milestone-timeline-item">
                            <div class="milestone-icon-indicator checked-green" onclick="toggleMilestone(this)">
                                <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </div>
                            <div class="milestone-text-group">
                                <span class="milestone-item-name">Finish Unit 1-3 Review</span>
                                <span class="milestone-item-date">Completed Oct 12</span>
                            </div>
                        </div>

                        <!-- Milestone 2 -->
                        <div class="milestone-timeline-item">
                            <div class="milestone-icon-indicator checked-green" onclick="toggleMilestone(this)">
                                <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </div>
                            <div class="milestone-text-group">
                                <span class="milestone-item-name">Pass Midterm with 85%+</span>
                                <span class="milestone-item-date">Completed Oct 28</span>
                            </div>
                        </div>

                        <!-- Milestone 3 -->
                        <div class="milestone-timeline-item">
                            <div class="milestone-icon-indicator box-red" onclick="toggleMilestone(this)"></div>
                            <div class="milestone-text-group">
                                <span class="milestone-item-name">Complete Practice Final</span>
                                <span class="milestone-item-date text-red">Upcoming: Nov 20</span>
                            </div>
                        </div>

                        <!-- Milestone 4 -->
                        <div class="milestone-timeline-item">
                            <div class="milestone-icon-indicator box-gray" onclick="toggleMilestone(this)"></div>
                            <div class="milestone-text-group">
                                <span class="milestone-item-name">Official Semester Exam</span>
                                <span class="milestone-item-date">Upcoming: Dec 12</span>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="btn-add-milestone-full" onclick="addNewMilestone()">
                        + Add New Milestone
                    </button>
                </div>

                <!-- Quest Reward Card -->
                <div class="quest-reward-card">
                    <span class="quest-reward-header-pill">QUEST REWARD</span>
                    <div class="quest-reward-icon-circle">
                        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                        </svg>
                    </div>

                    <h4 class="quest-reward-title">Legendary Finisher</h4>
                    <p class="quest-reward-desc">
                        Completing this SMART goal will grant you 500 XP and the "Math Wizard" badge for your profile.
                    </p>

                    <div class="quest-reward-avatars">
                        <div class="avatar-mini" title="Alex">
                            <span>AM</span>
                        </div>
                        <div class="avatar-mini av-sarah" title="Sarah">
                            <span>SJ</span>
                        </div>
                        <div class="avatar-mini" style="background-color: #8B5CF6;" title="David">
                            <span>DL</span>
                        </div>
                        <span class="avatar-mini-count">+12</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        function toggleTaskCompletion(taskId) {
            var row = document.getElementById('taskRow' + taskId);
            if (!row) return;
            var circle = row.querySelector('.task-check-circle');
            var title = document.getElementById('taskTitle' + taskId);

            if (circle.classList.contains('completed')) {
                circle.classList.remove('completed');
                circle.innerHTML = '';
                if (title) title.classList.remove('completed-text');
            } else {
                circle.classList.add('completed');
                circle.innerHTML = '<svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>';
                if (title) title.classList.add('completed-text');
            }
        }

        function toggleMilestone(indicator) {
            if (indicator.classList.contains('checked-green')) {
                indicator.className = 'milestone-icon-indicator box-gray';
                indicator.innerHTML = '';
            } else {
                indicator.className = 'milestone-icon-indicator checked-green';
                indicator.innerHTML = '<svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>';
            }
        }

        function addNewMilestone() {
            var name = prompt("Enter new milestone name:", "Read Stewart Chapter 14");
            if (!name || !name.trim()) return;
            var date = prompt("Enter target deadline (e.g. Dec 5):", "Upcoming: Dec 5");

            var container = document.getElementById('milestonesListContainer');
            var item = document.createElement('div');
            item.className = 'milestone-timeline-item';
            item.innerHTML = '<div class="milestone-icon-indicator box-gray" onclick="toggleMilestone(this)"></div>' +
                '<div class="milestone-text-group">' +
                '<span class="milestone-item-name">' + escapeHtml(name.trim()) + '</span>' +
                '<span class="milestone-item-date">' + escapeHtml(date ? date.trim() : 'Upcoming') + '</span>' +
                '</div>';
            container.appendChild(item);
        }

        function addNewRelatedTask() {
            var title = prompt("Enter task title:", "Complete Stewart Problem Set 8.2");
            if (!title || !title.trim()) return;
            var freq = prompt("Frequency (DAILY or WEEKLY):", "DAILY");
            freq = (freq && freq.toUpperCase().indexOf('W') !== -1) ? 'WEEKLY' : 'DAILY';
            var badgeClass = freq === 'WEEKLY' ? 'badge-weekly' : 'badge-daily';

            var container = document.getElementById('relatedTasksContainer');
            var item = document.createElement('div');
            var newId = Date.now();
            item.className = 'related-task-item';
            item.id = 'taskRow' + newId;
            item.innerHTML = '<div class="task-item-left">' +
                '<div class="task-check-circle" onclick="toggleTaskCompletion(' + newId + ')"></div>' +
                '<div class="task-item-content">' +
                '<p class="task-item-title" id="taskTitle' + newId + '">' + escapeHtml(title.trim()) + '</p>' +
                '<p class="task-item-subtext">Due in 2 days</p>' +
                '</div></div>' +
                '<span class="task-freq-badge ' + badgeClass + '">' + freq + '</span>';
            container.appendChild(item);
        }

        function togglePauseQuest() {
            var btn = document.getElementById('btnPauseQuest');
            var label = document.getElementById('pauseQuestLabel');
            if (btn.classList.contains('paused')) {
                btn.classList.remove('paused');
                label.innerText = 'Pause Quest';
            } else {
                btn.classList.add('paused');
                label.innerText = 'Resume Quest';
            }
        }

        function completeGoal() {
            var btn = document.getElementById('btnCompleteGoal');
            var label = document.getElementById('completeGoalLabel');
            var progText = document.getElementById('goalProgressText');
            var progBar = document.getElementById('goalProgressBar');

            if (confirm("Congratulations! Mark 'Master Advanced Calculus' as completed and claim 500 XP?")) {
                btn.classList.add('completed-state');
                label.innerText = 'Goal Completed!';
                if (progText) progText.innerText = '100%';
                if (progBar) progBar.style.width = '100%';
            }
        }

        function escapeHtml(text) {
            var div = document.createElement('div');
            div.innerText = text;
            return div.innerHTML;
        }
    </script>
</asp:Content>
