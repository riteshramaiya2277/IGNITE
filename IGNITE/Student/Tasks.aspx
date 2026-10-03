<%@ Page Title="Tasks" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="IGNITE.Student.Tasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/tasks.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="tasks-canvas">
        <!-- Breadcrumb Navigation -->
        <div class="tasks-breadcrumb">
            <a href="<%= ResolveUrl("~/Student/Dashboard.aspx") %>" class="breadcrumb-link">Dashboard</a>
            <span class="breadcrumb-sep">&gt;</span>
            <span class="breadcrumb-current">Tasks</span>
        </div>

        <!-- Header: Task Dashboard & Action Button -->
        <div class="tasks-header">
            <h1 class="tasks-title">Task Dashboard</h1>
            <button type="button" class="btn-create-task" onclick="openQuickCreateModal()">
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5">
                    <line x1="12" y1="5" x2="12" y2="19"></line>
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                <span>Create Task</span>
            </button>
        </div>

        <!-- Filter Tabs -->
        <div class="tasks-filter-tabs">
            <button type="button" class="filter-tab-btn active" data-filter="all" onclick="filterTasks('all', this)">All Tasks</button>
            <button type="button" class="filter-tab-btn" data-filter="pending" onclick="filterTasks('pending', this)">Pending</button>
            <button type="button" class="filter-tab-btn" data-filter="progress" onclick="filterTasks('progress', this)">In Progress</button>
            <button type="button" class="filter-tab-btn" data-filter="completed" onclick="filterTasks('completed', this)">Completed</button>
            <button type="button" class="filter-tab-btn" data-filter="overdue" onclick="filterTasks('overdue', this)">Overdue</button>
        </div>

        <!-- Two-Column Workspace Layout -->
        <div class="tasks-grid">
            <!-- Left Column: Tasks List -->
            <div class="tasks-list-column" id="taskListContainer">
                
                <!-- 1. Overdue Task: Advanced Calculus -->
                <div class="task-card" id="taskCard-1" data-status="overdue" onclick="openTaskDetail('1')">
                    <div class="task-card-header">
                        <div class="task-title-group">
                            <h2 class="task-title">Advanced Calculus - Problem Set 4</h2>
                            <span class="badge-subject badge-subject-math">MATH</span>
                        </div>
                        <div class="task-card-actions">
                            <span class="badge-status badge-status-overdue">OVERDUE</span>
                            <button type="button" class="btn-task-edit-trigger" title="Edit Task" onclick="event.stopPropagation(); openEditTaskModal('1', 'Advanced Calculus - Problem Set 4', 'Mathematics', 'High Priority', 'Complete exercises 15 through 32 from Chapter 4 on Derivatives...', '05/12/2026', 'Term 2 Finals')">
                                <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <p class="task-description">
                        Complete exercises 15 through 32 from Chapter 4 on Derivatives...
                    </p>
                    <div class="task-card-footer">
                        <div class="task-meta-left">
                            <span class="task-meta-item">
                                <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                                <span>May 12, 11:59 PM</span>
                            </span>
                            <span class="task-meta-item priority-high">
                                <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <line x1="12" y1="8" x2="12" y2="12"></line>
                                    <line x1="12" y1="16" x2="12.01" y2="16"></line>
                                </svg>
                                <span>High Priority</span>
                            </span>
                            <span class="task-meta-item">
                                <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <circle cx="12" cy="12" r="6"></circle>
                                    <circle cx="12" cy="12" r="2"></circle>
                                </svg>
                                <span>Term 2 Finals</span>
                            </span>
                        </div>
                        <span class="badge-xp-reward badge-xp-reduced" title="Tasks completed after deadline receive reduced XP penalty" onclick="event.stopPropagation(); showReducedXPNotice();">
                            <span>Reduced XP Rewards</span>
                            <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                        </span>
                    </div>
                </div>

                <!-- 2. In Progress Task: Renaissance Art History -->
                <div class="task-card" id="taskCard-2" data-status="progress" onclick="openTaskDetail('2')">
                    <div class="task-card-header">
                        <div class="task-title-group">
                            <h2 class="task-title">Renaissance Art History Essay</h2>
                            <span class="badge-subject badge-subject-history">HISTORY</span>
                        </div>
                        <div class="task-card-actions">
                            <span class="badge-status badge-status-progress">IN PROGRESS</span>
                            <button type="button" class="btn-task-edit-trigger" title="Edit Task" onclick="event.stopPropagation(); openEditTaskModal('2', 'Renaissance Art History Essay', 'History', 'Medium Priority', 'Drafting the second section about the influence of patronage in Florence...', '05/15/2026', 'Pass Semester Finals')">
                                <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <p class="task-description highlight-orange">
                        Drafting the second section about the influence of patronage in Florence...
                    </p>
                    <div class="task-card-footer">
                        <div class="task-meta-left">
                            <span class="task-meta-item">
                                <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                                <span>Tomorrow, 5:00 PM</span>
                            </span>
                            <span class="task-meta-item priority-medium">
                                <span class="priority-dot-medium"></span>
                                <span>Medium Priority</span>
                            </span>
                        </div>
                        <span class="badge-xp-reward badge-xp-full">
                            +500 XP Full Reward
                        </span>
                    </div>
                </div>

                <!-- 3. Pending Task: Quantum Mechanics Quiz Prep -->
                <div class="task-card" id="taskCard-3" data-status="pending" onclick="openTaskDetail('3')">
                    <div class="task-card-header">
                        <div class="task-title-group">
                            <h2 class="task-title">Quantum Mechanics Quiz Prep</h2>
                            <span class="badge-subject badge-subject-physics">PHYSICS</span>
                        </div>
                        <div class="task-card-actions">
                            <span class="badge-status badge-status-pending">PENDING</span>
                            <button type="button" class="btn-task-edit-trigger" title="Edit Task" onclick="event.stopPropagation(); openEditTaskModal('3', 'Quantum Mechanics Quiz Prep', 'Physics', 'Low Priority', 'Reviewing Schrödinger equation and wave-particle duality concepts...', '05/18/2026', 'Pass Semester Finals')">
                                <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <p class="task-description">
                        Reviewing Schrödinger equation and wave-particle duality concepts...
                    </p>
                    <div class="task-card-footer">
                        <div class="task-meta-left">
                            <span class="task-meta-item">
                                <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                                <span>May 18, 9:00 AM</span>
                            </span>
                            <span class="task-meta-item priority-low">
                                <span class="priority-dot-low"></span>
                                <span>Low Priority</span>
                            </span>
                        </div>
                        <span class="badge-xp-reward badge-xp-full">
                            +250 XP Full Reward
                        </span>
                    </div>
                </div>

                <!-- 4. Completed Task: Sociology Case Study -->
                <div class="task-card is-completed" id="taskCard-4" data-status="completed" onclick="openTaskDetail('4')">
                    <div class="task-card-header">
                        <div class="task-title-group">
                            <h2 class="task-title">Sociology Case Study</h2>
                            <span class="badge-subject badge-subject-sociology">SOCIOLOGY</span>
                        </div>
                        <div class="task-card-actions">
                            <span class="badge-status badge-status-completed">COMPLETED</span>
                            <button type="button" class="btn-task-edit-trigger" title="Edit Task" onclick="event.stopPropagation(); openEditTaskModal('4', 'Sociology Case Study', 'Art', 'Medium Priority', 'Analyze the impact of social media on urban communities in the 21st century.', '05/10/2026', 'Urban Sociology Honor')">
                                <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <p class="task-description">
                        Analyze the impact of social media on urban communities in the 21st century.
                    </p>
                    <div class="task-card-footer">
                        <div class="task-meta-left">
                            <span class="task-meta-item">
                                <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="#9CA3AF" stroke-width="2.5">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                                <span>Submitted May 10</span>
                            </span>
                        </div>
                        <span class="badge-xp-reward badge-xp-earned">
                            &#9889; +450 XP Earned
                        </span>
                    </div>
                </div>


            </div>

            <!-- Right Column: Rewards Tracker, Student Insights & Upcoming Milestone -->
            <div class="tasks-widgets-column">

                <!-- 1. Rewards Tracker Widget -->
                <div class="task-widget-card">
                    <h2 class="widget-title">Rewards Tracker</h2>
                    <div class="rewards-sublabel">POTENTIAL XP TODAY</div>
                    <div class="rewards-value-row">
                        <span class="rewards-value" id="potentialXPValue">1,250</span>
                        <span class="rewards-unit">XP</span>
                    </div>
                    <div class="rewards-progress-track">
                        <div class="rewards-progress-fill" style="width: 85%;"></div>
                    </div>
                    <div class="rewards-metric-row">
                        <span class="rewards-metric-label">Milestone Progress</span>
                        <span class="rewards-metric-percent">85%</span>
                    </div>
                    <button type="button" class="btn-redeem-rewards" onclick="redeemRewards()">
                        Redeem Rewards
                    </button>
                </div>

                <!-- 2. Student Insights Widget -->
                <div class="task-widget-card">
                    <h2 class="widget-title">Student Insights</h2>
                    <div class="insights-list">
                        <!-- Current Productivity -->
                        <div class="insight-row">
                            <div class="insight-icon-circle">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                                    <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                                    <path d="M4 22h16"></path>
                                    <path d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34"></path>
                                    <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                                </svg>
                            </div>
                            <div class="insight-content">
                                <h3 class="insight-title">Current Productivity</h3>
                                <p class="insight-desc">8.5 hours avg/day</p>
                            </div>
                        </div>

                        <!-- Task Efficiency -->
                        <div class="insight-row">
                            <div class="insight-icon-circle">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path>
                                    <rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect>
                                    <polyline points="9 14 11 16 15 11"></polyline>
                                </svg>
                            </div>
                            <div class="insight-content">
                                <h3 class="insight-title">Task Efficiency</h3>
                                <p class="insight-desc">84% On-time completion</p>
                            </div>
                        </div>

                        <!-- Top Subject -->
                        <div class="insight-row">
                            <div class="insight-icon-circle">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2">
                                    <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                </svg>
                            </div>
                            <div class="insight-content">
                                <h3 class="insight-title">Top Subject</h3>
                                <p class="insight-desc">Mathematics (12 Tasks)</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 3. Upcoming Milestone Widget -->
                <div class="milestone-card">
                    <!-- Subtle gear/shield watermark in background -->
                    <svg class="milestone-watermark" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                    </svg>

                    <div class="milestone-sublabel">UPCOMING MILESTONE</div>
                    <h3 class="milestone-title">Finals Warrior Badge</h3>
                    <p class="milestone-desc">Complete 5 more high-priority tasks this week to unlock.</p>
                    
                    <div class="milestone-social">
                        <div class="avatar-stack">
                            <div class="avatar-bubble" title="Liam Chen">LC</div>
                            <div class="avatar-bubble" title="Sarah Jenkins">SJ</div>
                            <div class="avatar-bubble" title="Ritesh Ramaiya">RR</div>
                        </div>
                        <span class="milestone-social-text">14 classmates earned this</span>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Embedded Fail-Safe Styles for Modals (Ensures instant rendering regardless of browser cache) -->
    <style type="text/css">
        .modal-overlay {
            position: fixed !important;
            top: 0 !important;
            left: 0 !important;
            width: 100vw !important;
            height: 100vh !important;
            background-color: rgba(24, 24, 27, 0.45) !important;
            backdrop-filter: blur(4px) !important;
            -webkit-backdrop-filter: blur(4px) !important;
            display: none !important;
            align-items: center !important;
            justify-content: center !important;
            z-index: 99999 !important;
        }
        .modal-overlay.open {
            display: flex !important;
        }
        .modal-spec-card {
            background-color: #FAF8F5 !important;
            border-radius: 24px !important;
            width: 90% !important;
            max-width: 560px !important;
            border: 1px solid #DDD6CB !important;
            box-shadow: 0 24px 50px rgba(0, 0, 0, 0.22) !important;
            display: flex !important;
            flex-direction: column !important;
            overflow: hidden !important;
            margin: auto !important;
            box-sizing: border-box !important;
        }
        .modal-spec-header {
            padding: 24px 30px 16px 30px !important;
            display: flex !important;
            justify-content: space-between !important;
            align-items: center !important;
            box-sizing: border-box !important;
        }
        .modal-brand-wrap {
            display: flex !important;
            align-items: center !important;
            gap: 12px !important;
        }
        .modal-brand-wrap svg {
            width: 28px !important;
            height: 34px !important;
            max-width: 28px !important;
            max-height: 34px !important;
            flex-shrink: 0 !important;
            display: block !important;
        }
        .modal-brand-text {
            font-size: 1.55rem !important;
            font-weight: 900 !important;
            color: #18181B !important;
            letter-spacing: -0.02em !important;
        }
        .modal-spec-close-btn, .modal-close-btn {
            background: transparent !important;
            border: none !important;
            cursor: pointer !important;
            color: #78716C !important;
            padding: 6px !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            border-radius: 8px !important;
        }
        .modal-spec-body {
            padding: 0 30px 24px 30px !important;
            display: flex !important;
            flex-direction: column !important;
            gap: 16px !important;
            box-sizing: border-box !important;
        }
        .form-group-spec {
            display: flex !important;
            flex-direction: column !important;
            gap: 6px !important;
            width: 100% !important;
            box-sizing: border-box !important;
        }
        .form-input-spec {
            width: 100% !important;
            box-sizing: border-box !important;
            padding: 12px 16px !important;
            border-radius: 12px !important;
            border: 1px solid #DDD6CB !important;
            background-color: #FFFFFF !important;
            font-family: inherit !important;
            font-size: 0.92rem !important;
            color: #18181B !important;
            outline: none !important;
        }
        .form-input-spec.has-error {
            border: 1.5px solid #EF4444 !important;
            padding-right: 36px !important;
        }
        .error-dot-indicator {
            position: absolute !important;
            right: 14px !important;
            top: 50% !important;
            transform: translateY(-50%) !important;
            width: 8px !important;
            height: 8px !important;
            border-radius: 50% !important;
            background-color: #DC2626 !important;
            pointer-events: none !important;
        }
        .field-error-text {
            display: flex !important;
            align-items: center !important;
            gap: 6px !important;
            font-size: 0.78rem !important;
            font-weight: 700 !important;
            color: #DC2626 !important;
            margin-top: 2px !important;
        }
        .subject-pill-select {
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
            width: 100% !important;
            box-sizing: border-box !important;
            padding: 11px 16px !important;
            border-radius: 12px !important;
            border: 1px solid #DDD6CB !important;
            background-color: #FFFFFF !important;
            font-size: 0.92rem !important;
            font-weight: 600 !important;
            color: #18181B !important;
            cursor: pointer !important;
        }
        .priority-segmented-wrap {
            display: flex !important;
            background-color: #ECE7DE !important;
            border-radius: 12px !important;
            padding: 4px !important;
            gap: 4px !important;
            width: 100% !important;
            box-sizing: border-box !important;
        }
        .priority-seg-btn {
            flex: 1 !important;
            border: none !important;
            background: transparent !important;
            padding: 7px 10px !important;
            font-size: 0.84rem !important;
            font-weight: 600 !important;
            color: #78716C !important;
            border-radius: 9px !important;
            cursor: pointer !important;
            text-align: center !important;
        }
        .priority-seg-btn.active {
            background-color: #FFFFFF !important;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08) !important;
        }
        .priority-seg-btn.active.seg-high {
            color: #DC2626 !important;
            font-weight: 800 !important;
        }
        .priority-seg-btn.active.seg-med {
            color: #D97706 !important;
            font-weight: 800 !important;
        }
        .priority-seg-btn.active.seg-low {
            color: #10B981 !important;
            font-weight: 800 !important;
        }
        .datetime-with-goal-row {
            display: flex !important;
            align-items: center !important;
            gap: 12px !important;
            width: 100% !important;
        }
        .datetime-box {
            flex: 1 !important;
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
            padding: 11px 16px !important;
            border-radius: 12px !important;
            border: 1px solid #DDD6CB !important;
            background-color: #FFFFFF !important;
            font-size: 0.88rem !important;
            font-weight: 600 !important;
            color: #57534E !important;
            box-sizing: border-box !important;
        }
        .btn-linked-goal-pill {
            display: inline-flex !important;
            align-items: center !important;
            gap: 8px !important;
            border: 1.5px solid #6366F1 !important;
            background-color: #EEF2FF !important;
            color: #4F46E5 !important;
            font-size: 0.85rem !important;
            font-weight: 700 !important;
            padding: 11px 18px !important;
            border-radius: 12px !important;
            cursor: pointer !important;
            white-space: nowrap !important;
        }
        .modal-spec-footer {
            background-color: #FFFFFF !important;
            border-top: 1px solid #ECE7DD !important;
            padding: 18px 30px !important;
            display: flex !important;
            justify-content: flex-end !important;
            align-items: center !important;
            gap: 24px !important;
            box-sizing: border-box !important;
        }
        .btn-spec-cancel {
            background: none !important;
            border: none !important;
            font-size: 0.92rem !important;
            font-weight: 700 !important;
            color: #27272A !important;
            cursor: pointer !important;
        }
        .btn-spec-submit {
            background-color: #DF6A74 !important;
            color: #FFFFFF !important;
            font-size: 0.92rem !important;
            font-weight: 700 !important;
            padding: 11px 24px !important;
            border-radius: 12px !important;
            border: none !important;
            cursor: pointer !important;
            display: inline-flex !important;
            align-items: center !important;
            gap: 6px !important;
            box-shadow: 0 4px 12px rgba(223, 106, 116, 0.35) !important;
        }
        .edit-task-icon-box {
            width: 36px !important;
            height: 36px !important;
            border-radius: 10px !important;
            background-color: #FEECEE !important;
            border: 1px solid #FCD4D7 !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            color: #DF6A74 !important;
        }
        .edit-task-modal-heading {
            font-size: 1.25rem !important;
            font-weight: 800 !important;
            color: #18181B !important;
            margin: 0 !important;
        }
        .edit-form-textarea {
            width: 100% !important;
            box-sizing: border-box !important;
            padding: 12px 16px !important;
            border-radius: 12px !important;
            border: 1px solid #DDD6CB !important;
            background-color: #FFFFFF !important;
            font-family: inherit !important;
            font-size: 0.9rem !important;
            color: #18181B !important;
            outline: none !important;
            resize: none !important;
            min-height: 85px !important;
        }
        .category-pills-selector {
            display: flex !important;
            align-items: center !important;
            gap: 8px !important;
            flex-wrap: wrap !important;
        }
        .category-tag-btn {
            padding: 7px 16px !important;
            border-radius: 9999px !important;
            font-size: 0.82rem !important;
            font-weight: 700 !important;
            cursor: pointer !important;
            border: 1.5px solid transparent !important;
            user-select: none !important;
        }
        .category-tag-btn.tag-math { background-color: #E6FFFA !important; color: #0D9488 !important; }
        .category-tag-btn.tag-physics { background-color: #F3E8FF !important; color: #9333EA !important; }
        .category-tag-btn.tag-history { background-color: #FFF5F5 !important; color: #DF6A74 !important; border-color: #DF6A74 !important; }
        .category-tag-btn.tag-art { background-color: #EFF6FF !important; color: #2563EB !important; }
        .category-tag-btn.tag-new { background-color: #F3F4F6 !important; color: #6B7280 !important; }
        .category-tag-btn.selected { border-color: #DF6A74 !important; box-shadow: 0 2px 6px rgba(223, 106, 116, 0.25) !important; }
        .goal-input-box-wrap { position: relative !important; width: 100% !important; }
        .goal-input-box-wrap svg { position: absolute !important; right: 14px !important; top: 50% !important; transform: translateY(-50%) !important; color: #78716C !important; pointer-events: none !important; }
    </style>

    <!-- 1. Quick Create Task Modal (Matching Image 1) -->
    <div class="modal-overlay" id="quickCreateTaskModal">
        <div class="modal-spec-card">
            <!-- Modal Header: IGNITE Flame Logo + Brand Text + Close Button -->
            <div class="modal-spec-header">
                <div class="modal-brand-wrap">
                    <svg width="28" height="34" viewBox="0 0 32 38" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 28px !important; height: 34px !important; max-width: 28px !important; max-height: 34px !important; display: block; flex-shrink: 0;">
                        <path d="M16 0C16 0 20 8 18 14C17 17 14 19 14 22C14 26 17 29 21 29C25 29 28 26 28 22C28 17 25 13 25 13C25 13 32 17 32 25C32 32.18 24.84 38 16 38C7.16 38 0 32.18 0 25C0 16 8 8 10 6C11 5 11 8 12 9C13 10 15 11 15 8C15 5 16 0 16 0Z" fill="#18181B"/>
                    </svg>
                    <span class="modal-brand-text">IGNITE</span>
                </div>
                <button type="button" class="modal-close-btn" onclick="closeQuickCreateModal()" title="Close">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2.5" style="width: 20px; height: 20px;">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
            </div>

            <form id="quickCreateTaskForm" onsubmit="handleQuickCreateSubmit(event)">
                <div class="modal-spec-body">
                    <!-- Task Title Input with Validation -->
                    <div class="form-group-spec">
                        <label class="form-label" for="quickTaskTitle" style="font-size: 0.95rem; font-weight: 800; color: #18181B;">Task Title</label>
                        <div class="input-error-wrapper">
                            <input type="text" id="quickTaskTitle" class="form-input-spec has-error" placeholder="e.g. Physics Lab Report" oninput="validateQuickTitle()" />
                            <span class="error-dot-indicator" id="quickTitleDot"></span>
                        </div>
                        <div class="field-error-text" id="quickTitleError">
                            <svg viewBox="0 0 24 24" width="15" height="15" fill="#DC2626">
                                <circle cx="12" cy="12" r="10" />
                                <path d="M12 7v6M12 17h.01" stroke="#fff" stroke-width="2.2" stroke-linecap="round" />
                            </svg>
                            <span>Please provide a title for your task</span>
                        </div>
                    </div>

                    <!-- Subject & Priority Grid -->
                    <div class="form-row">
                        <div class="form-group-spec">
                            <label class="form-label" style="font-size: 0.95rem; font-weight: 800; color: #18181B;">Subject</label>
                            <div class="subject-pill-select" id="quickSubjectSelector" onclick="cycleQuickSubject()" title="Click to change subject">
                                <div class="subject-left-info">
                                    <span class="dot-subject-color" id="quickSubjectDot" style="background-color: #4F46E5;"></span>
                                    <span id="quickSubjectLabel" style="font-weight: 700; color: #18181B;">Mathematics</span>
                                </div>
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#78716C" stroke-width="2">
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </div>
                            <input type="hidden" id="quickSelectedSubject" value="Mathematics" />
                        </div>

                        <div class="form-group-spec">
                            <label class="form-label" style="font-size: 0.95rem; font-weight: 800; color: #18181B;">Priority</label>
                            <div class="priority-segmented-wrap" id="quickPrioritySegment">
                                <button type="button" class="priority-seg-btn" data-val="Low" onclick="selectQuickPriority('Low', this)">Low</button>
                                <button type="button" class="priority-seg-btn" data-val="Med" onclick="selectQuickPriority('Med', this)">Med</button>
                                <button type="button" class="priority-seg-btn active seg-high" data-val="High" onclick="selectQuickPriority('High', this)">High</button>
                            </div>
                            <input type="hidden" id="quickSelectedPriority" value="High" />
                        </div>
                    </div>

                    <!-- Due Date & Time with Goal Pill -->
                    <div class="form-group-spec">
                        <label class="form-label" style="font-size: 0.95rem; font-weight: 800; color: #18181B;">Due Date &amp; Time</label>
                        <div class="datetime-with-goal-row">
                            <div class="datetime-box">
                                <div class="datetime-box-left" style="width: 100%;">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                    <input type="text" id="quickDueDateTime" class="form-input-clean" value="Today, Oct 28 • 11:59 PM" />
                                </div>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                            </div>

                            <button type="button" class="btn-linked-goal-pill" id="btnQuickGoalPill" title="Linked Goal" onclick="cycleQuickGoal()">
                                <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <circle cx="12" cy="12" r="6"></circle>
                                    <circle cx="12" cy="12" r="2"></circle>
                                </svg>
                                <span id="quickGoalText">Ace Midterms</span>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Modal Bottom Bar (White) -->
                <div class="modal-spec-footer">
                    <button type="button" class="btn-spec-cancel" onclick="closeQuickCreateModal()">Cancel</button>
                    <button type="submit" class="btn-spec-submit">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                        <span>Quick Save</span>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- 2. Edit Task Modal (Matching Image 2) -->
    <div class="modal-overlay" id="editTaskModal">
        <div class="modal-spec-card">
            <!-- Modal Header: Edit Task Icon + Title + Close Button -->
            <div class="modal-spec-header">
                <div class="modal-edit-header-title">
                    <div class="edit-task-icon-box">
                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.5">
                            <line x1="8" y1="6" x2="21" y2="6"></line>
                            <line x1="8" y1="12" x2="21" y2="12"></line>
                            <line x1="8" y1="18" x2="21" y2="18"></line>
                            <line x1="3" y1="6" x2="3.01" y2="6"></line>
                            <line x1="3" y1="12" x2="3.01" y2="12"></line>
                            <line x1="3" y1="18" x2="3.01" y2="18"></line>
                        </svg>
                    </div>
                    <h2 class="edit-task-modal-heading">Edit Task</h2>
                </div>
                <button type="button" class="modal-close-btn" onclick="closeEditTaskModal()" title="Close">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2.5">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
            </div>

            <form id="editTaskForm" onsubmit="handleEditTaskSubmit(event)">
                <input type="hidden" id="editTaskId" value="" />
                <div class="modal-spec-body">
                    <!-- Task Title Input with Validation -->
                    <div class="form-group-spec">
                        <label class="edit-form-label" for="editTaskTitle">TASK TITLE</label>
                        <div class="input-error-wrapper">
                            <input type="text" id="editTaskTitle" class="form-input-spec has-error" placeholder="e.g. Physics Lab Report" oninput="validateEditTitle()" />
                        </div>
                        <div class="field-error-text" id="editTitleError">
                            <svg viewBox="0 0 24 24" width="15" height="15" fill="#DC2626">
                                <circle cx="12" cy="12" r="10" />
                                <path d="M12 7v6M12 17h.01" stroke="#fff" stroke-width="2.2" stroke-linecap="round" />
                            </svg>
                            <span>Title is required</span>
                        </div>
                    </div>

                    <!-- Description Textarea -->
                    <div class="form-group-spec">
                        <label class="edit-form-label" for="editTaskDesc">DESCRIPTION</label>
                        <textarea id="editTaskDesc" class="edit-form-textarea" placeholder="Add some details about this task..."></textarea>
                    </div>

                    <!-- Due Date & Priority Grid -->
                    <div class="form-row">
                        <div class="form-group-spec">
                            <label class="edit-form-label" for="editTaskDueDate">DUE DATE</label>
                            <div class="datetime-box">
                                <input type="text" id="editTaskDueDate" class="form-input-clean" placeholder="mm/dd/yyyy" />
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                            </div>
                        </div>

                        <div class="form-group-spec">
                            <label class="edit-form-label" for="editTaskPriority">PRIORITY</label>
                            <select id="editTaskPriority" class="form-select-spec">
                                <option value="Low Priority">Low Priority</option>
                                <option value="Medium Priority" selected>Medium Priority</option>
                                <option value="High Priority">High Priority</option>
                            </select>
                        </div>
                    </div>

                    <!-- Subject / Category Pills -->
                    <div class="form-group-spec">
                        <label class="edit-form-label">SUBJECT / CATEGORY</label>
                        <div class="category-pills-selector" id="editCategoryPills">
                            <span class="category-tag-btn tag-math" onclick="selectEditCategory(this, 'Mathematics')">Mathematics</span>
                            <span class="category-tag-btn tag-physics" onclick="selectEditCategory(this, 'Physics')">Physics</span>
                            <span class="category-tag-btn tag-history selected" onclick="selectEditCategory(this, 'History')">History</span>
                            <span class="category-tag-btn tag-art" onclick="selectEditCategory(this, 'Art')">Art</span>
                            <span class="category-tag-btn tag-new" onclick="addNewCategory(this)">+ New</span>
                        </div>
                        <input type="hidden" id="editSelectedCategory" value="History" />
                    </div>

                    <!-- Link to Goal (Optional) -->
                    <div class="form-group-spec">
                        <label class="edit-form-label" for="editTaskGoal">LINK TO GOAL (OPTIONAL)</label>
                        <div class="goal-input-box-wrap">
                            <input type="text" id="editTaskGoal" class="form-input-spec" placeholder="e.g. Pass Semester Finals" />
                            <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <circle cx="12" cy="12" r="6"></circle>
                                <circle cx="12" cy="12" r="2"></circle>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Modal Bottom Bar (White) -->
                <div class="modal-spec-footer">
                    <button type="button" class="btn-spec-cancel" onclick="closeEditTaskModal()">Cancel</button>
                    <button type="submit" class="btn-spec-submit">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                        <span>Edit Task</span>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Toast Notification -->
    <div class="toast-notice" id="toastNotice">
        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#10B981" stroke-width="2.5">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
        <span id="toastMessage">Success notification</span>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        // Open Task Detail View
        function openTaskDetail(taskId) {
            window.location.href = 'TaskDetail.aspx?taskId=' + encodeURIComponent(taskId);
        }

        // 1. Task Tab Filtering
        function filterTasks(status, btnElement) {
            document.querySelectorAll('.filter-tab-btn').forEach(btn => btn.classList.remove('active'));
            if (btnElement) {
                btnElement.classList.add('active');
            }

            const cards = document.querySelectorAll('#taskListContainer .task-card');
            cards.forEach(card => {
                const cardStatus = card.getAttribute('data-status');
                if (status === 'all' || cardStatus === status) {
                    card.style.display = 'flex';
                } else {
                    card.style.display = 'none';
                }
            });
        }

        // =========================================================================
        // 2. QUICK CREATE TASK MODAL (Modal 1 - Matching Image 1)
        // =========================================================================
        const quickSubjects = [
            { name: 'Mathematics', color: '#4F46E5', badgeClass: 'badge-subject-math' },
            { name: 'Physics', color: '#9333EA', badgeClass: 'badge-subject-physics' },
            { name: 'History', color: '#DF6A74', badgeClass: 'badge-subject-history' },
            { name: 'Art', color: '#2563EB', badgeClass: 'badge-subject-math' },
            { name: 'Sociology', color: '#10B981', badgeClass: 'badge-subject-sociology' }
        ];
        let currentSubjectIndex = 0;

        const quickGoals = ['Ace Midterms', 'Pass Semester Finals', 'Dean\'s Honor List', 'STEM Capstone Project'];
        let currentGoalIndex = 0;

        function openQuickCreateModal() {
            const modal = document.getElementById('quickCreateTaskModal');
            if (modal) {
                modal.classList.add('open');
                const titleInput = document.getElementById('quickTaskTitle');
                titleInput.value = '';
                validateQuickTitle();
                titleInput.focus();
            }
        }

        function closeQuickCreateModal() {
            const modal = document.getElementById('quickCreateTaskModal');
            if (modal) {
                modal.classList.remove('open');
            }
        }

        function validateQuickTitle() {
            const input = document.getElementById('quickTaskTitle');
            const dot = document.getElementById('quickTitleDot');
            const error = document.getElementById('quickTitleError');
            if (!input) return;

            const isEmpty = input.value.trim().length === 0;
            if (isEmpty) {
                input.classList.add('has-error');
                if (dot) dot.style.display = 'block';
                if (error) error.style.display = 'flex';
            } else {
                input.classList.remove('has-error');
                if (dot) dot.style.display = 'none';
                if (error) error.style.display = 'none';
            }
        }

        function selectQuickPriority(val, btn) {
            document.querySelectorAll('#quickPrioritySegment .priority-seg-btn').forEach(b => {
                b.classList.remove('active', 'seg-high', 'seg-med', 'seg-low');
            });
            btn.classList.add('active');
            if (val === 'High') btn.classList.add('seg-high');
            else if (val === 'Med') btn.classList.add('seg-med');
            else if (val === 'Low') btn.classList.add('seg-low');

            document.getElementById('quickSelectedPriority').value = val;
        }

        function cycleQuickSubject() {
            currentSubjectIndex = (currentSubjectIndex + 1) % quickSubjects.length;
            const sub = quickSubjects[currentSubjectIndex];
            document.getElementById('quickSubjectLabel').textContent = sub.name;
            document.getElementById('quickSubjectDot').style.backgroundColor = sub.color;
            document.getElementById('quickSelectedSubject').value = sub.name;
        }

        function cycleQuickGoal() {
            currentGoalIndex = (currentGoalIndex + 1) % quickGoals.length;
            document.getElementById('quickGoalText').textContent = quickGoals[currentGoalIndex];
        }

        function handleQuickCreateSubmit(e) {
            e.preventDefault();
            const titleInput = document.getElementById('quickTaskTitle');
            const title = titleInput.value.trim();

            if (!title) {
                validateQuickTitle();
                titleInput.focus();
                return;
            }

            const subject = document.getElementById('quickSelectedSubject').value;
            const priority = document.getElementById('quickSelectedPriority').value;
            const dueDateTime = document.getElementById('quickDueDateTime').value.trim() || 'Today, Oct 28 • 11:59 PM';
            const goal = document.getElementById('quickGoalText').textContent;

            // Pick badge class based on subject
            let subjectClass = 'badge-subject-math';
            if (subject === 'History') subjectClass = 'badge-subject-history';
            else if (subject === 'Physics') subjectClass = 'badge-subject-physics';
            else if (subject === 'Sociology') subjectClass = 'badge-subject-sociology';

            // Pick priority markup
            let priorityMarkup = '';
            if (priority === 'High') {
                priorityMarkup = `
                    <span class="task-meta-item priority-high">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5">
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="12" y1="8" x2="12" y2="12"></line>
                            <line x1="12" y1="16" x2="12.01" y2="16"></line>
                        </svg>
                        <span>High Priority</span>
                    </span>`;
            } else if (priority === 'Med' || priority === 'Medium') {
                priorityMarkup = `
                    <span class="task-meta-item priority-medium">
                        <span class="priority-dot-medium"></span>
                        <span>Medium Priority</span>
                    </span>`;
            } else {
                priorityMarkup = `
                    <span class="task-meta-item priority-low">
                        <span class="priority-dot-low"></span>
                        <span>Low Priority</span>
                    </span>`;
            }

            const newCardId = 'taskCard-' + Date.now();
            const newCard = document.createElement('div');
            newCard.className = 'task-card';
            newCard.id = newCardId;
            newCard.setAttribute('data-status', 'pending');
            newCard.onclick = function() { openTaskDetail(newCardId); };

            newCard.innerHTML = `
                <div class="task-card-header">
                    <div class="task-title-group">
                        <h2 class="task-title">${escapeHtml(title)}</h2>
                        <span class="badge-subject ${subjectClass}">${escapeHtml(subject.toUpperCase())}</span>
                    </div>
                    <div class="task-card-actions">
                        <span class="badge-status badge-status-pending">PENDING</span>
                        <button type="button" class="btn-task-edit-trigger" title="Edit Task" onclick="event.stopPropagation(); openEditTaskModal('${newCardId}', '${escapeHtml(title).replace(/'/g, "\\'")}', '${subject}', '${priority === 'High' ? 'High Priority' : (priority === 'Med' ? 'Medium Priority' : 'Low Priority')}', 'Created via Quick Save', '${escapeHtml(dueDateTime).replace(/'/g, "\\'")}', '${escapeHtml(goal).replace(/'/g, "\\'")}')">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                            </svg>
                        </button>
                    </div>
                </div>
                <p class="task-description">Linked Goal: ${escapeHtml(goal)}</p>
                <div class="task-card-footer">
                    <div class="task-meta-left">
                        <span class="task-meta-item">
                            <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                            <span>${escapeHtml(dueDateTime)}</span>
                        </span>
                        ${priorityMarkup}
                    </div>
                    <span class="badge-xp-reward badge-xp-full">
                        +350 XP Full Reward
                    </span>
                </div>
            `;

            const container = document.getElementById('taskListContainer');
            if (container) {
                container.prepend(newCard);
            }

            closeQuickCreateModal();
            showToast(`Task "${title}" created successfully!`);
        }

        // =========================================================================
        // 3. EDIT TASK MODAL (Modal 2 - Matching Image 2)
        // =========================================================================
        function openEditTaskModal(id, title, category, priority, desc, dueDate, goal) {
            const modal = document.getElementById('editTaskModal');
            if (!modal) return;

            document.getElementById('editTaskId').value = id || '';
            const titleInput = document.getElementById('editTaskTitle');
            titleInput.value = title || '';
            document.getElementById('editTaskDesc').value = desc || '';
            document.getElementById('editTaskDueDate').value = dueDate || '10/28/2026';
            document.getElementById('editTaskGoal').value = goal || 'Pass Semester Finals';

            // Select priority
            const prioritySelect = document.getElementById('editTaskPriority');
            if (prioritySelect) {
                if (priority && priority.includes('High')) prioritySelect.value = 'High Priority';
                else if (priority && priority.includes('Low')) prioritySelect.value = 'Low Priority';
                else prioritySelect.value = 'Medium Priority';
            }

            // Select category pill
            const targetCategory = category || 'History';
            let matched = false;
            document.querySelectorAll('#editCategoryPills .category-tag-btn').forEach(pill => {
                pill.classList.remove('selected');
                if (pill.textContent.trim().toLowerCase() === targetCategory.toLowerCase()) {
                    pill.classList.add('selected');
                    matched = true;
                }
            });
            if (!matched) {
                const historyPill = document.querySelector('#editCategoryPills .tag-history');
                if (historyPill) historyPill.classList.add('selected');
            }
            document.getElementById('editSelectedCategory').value = targetCategory;

            validateEditTitle();
            modal.classList.add('open');
            titleInput.focus();
        }

        function closeEditTaskModal() {
            const modal = document.getElementById('editTaskModal');
            if (modal) {
                modal.classList.remove('open');
            }
        }

        function validateEditTitle() {
            const input = document.getElementById('editTaskTitle');
            const error = document.getElementById('editTitleError');
            if (!input) return;

            const isEmpty = input.value.trim().length === 0;
            if (isEmpty) {
                input.classList.add('has-error');
                if (error) error.style.display = 'flex';
            } else {
                input.classList.remove('has-error');
                if (error) error.style.display = 'none';
            }
        }

        function selectEditCategory(pillElem, catName) {
            document.querySelectorAll('#editCategoryPills .category-tag-btn').forEach(p => p.classList.remove('selected'));
            pillElem.classList.add('selected');
            document.getElementById('editSelectedCategory').value = catName;
        }

        function addNewCategory(btn) {
            const newCat = prompt('Enter new subject / category name:');
            if (newCat && newCat.trim()) {
                const tag = document.createElement('span');
                tag.className = 'category-tag-btn selected';
                tag.style.backgroundColor = '#FEF3C7';
                tag.style.color = '#B45309';
                tag.textContent = newCat.trim();
                tag.onclick = function() { selectEditCategory(this, newCat.trim()); };

                document.querySelectorAll('#editCategoryPills .category-tag-btn').forEach(p => p.classList.remove('selected'));
                btn.parentNode.insertBefore(tag, btn);
                document.getElementById('editSelectedCategory').value = newCat.trim();
            }
        }

        function handleEditTaskSubmit(e) {
            e.preventDefault();
            const titleInput = document.getElementById('editTaskTitle');
            const title = titleInput.value.trim();

            if (!title) {
                validateEditTitle();
                titleInput.focus();
                return;
            }

            const id = document.getElementById('editTaskId').value;
            const category = document.getElementById('editSelectedCategory').value;
            const priority = document.getElementById('editTaskPriority').value;
            const desc = document.getElementById('editTaskDesc').value.trim();
            const dueDate = document.getElementById('editTaskDueDate').value.trim();
            const goal = document.getElementById('editTaskGoal').value.trim();

            // If an existing card exists, update its displayed content
            const existingCard = document.getElementById('taskCard-' + id);
            if (existingCard) {
                const titleElem = existingCard.querySelector('.task-title');
                if (titleElem) titleElem.textContent = title;

                const descElem = existingCard.querySelector('.task-description');
                if (descElem && desc) descElem.textContent = desc;

                const badgeElem = existingCard.querySelector('.badge-subject');
                if (badgeElem) badgeElem.textContent = category.toUpperCase();
            }

            closeEditTaskModal();
            showToast(`Task "${title}" updated successfully!`);
        }

        // 4. Redeem Rewards Celebration
        function redeemRewards() {
            showToast("🎉 1,250 XP redeemed towards your Level 13 Milestone!");
        }

        // 5. Reduced XP Notice
        function showReducedXPNotice() {
            showToast("ℹ️ Overdue tasks award 50% reduced XP to encourage on-time submissions.");
        }

        // 6. Toast Notification Helper
        function showToast(message) {
            const toast = document.getElementById('toastNotice');
            const msgSpan = document.getElementById('toastMessage');
            if (toast && msgSpan) {
                msgSpan.textContent = message;
                toast.classList.add('show');
                setTimeout(() => {
                    toast.classList.remove('show');
                }, 3500);
            }
        }

        function escapeHtml(text) {
            const div = document.createElement('div');
            div.textContent = text;
            return div.innerHTML;
        }

        // Close modals on backdrop click
        window.addEventListener('click', function (e) {
            const quickModal = document.getElementById('quickCreateTaskModal');
            if (e.target === quickModal) {
                closeQuickCreateModal();
            }
            const editModal = document.getElementById('editTaskModal');
            if (e.target === editModal) {
                closeEditTaskModal();
            }
        });
    </script>
</asp:Content>
