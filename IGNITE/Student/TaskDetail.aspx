<%@ Page Title="Task Detail" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true"
    CodeBehind="TaskDetail.aspx.cs" Inherits="IGNITE.Student.TaskDetail" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="<%= ResolveUrl("~/Content/tasks.css") %>" rel="stylesheet" type="text/css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
        Dashboard
    </asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <!-- Fail-safe stylesheet link for reliable local asset loading -->
        <link href="../Content/tasks.css" rel="stylesheet" type="text/css" />

        <div class="tasks-canvas">
            <!-- Breadcrumb Navigation matching Figma design: Dashboard > Tasks > Advanced Calculus - Problem Set 4 -->
            <div class="tasks-breadcrumb">
                <a href="Dashboard.aspx" class="breadcrumb-link">Dashboard</a>
                <span class="breadcrumb-sep">&gt;</span>
                <a href="Tasks.aspx" class="breadcrumb-link">Tasks</a>
                <span class="breadcrumb-sep">&gt;</span>
                <span class="breadcrumb-current" id="lblBreadcrumbTitle" runat="server">Advanced Calculus - Problem Set
                    4</span>
            </div>

            <!-- Two-Column Workspace Layout -->
            <div class="task-detail-grid">

                <!-- Left Column: Main Task Details & Action Bar -->
                <div class="task-detail-main-column">

                    <!-- Main Task Detail Card -->
                    <div class="task-detail-card">
                        <!-- Top Category & Status Badges + Action Buttons -->
                        <div class="task-detail-header-row">
                            <div class="task-detail-tags">
                                <span class="badge-subject-math-detail" id="lblSubjectBadge"
                                    runat="server">MATHEMATICS</span>
                                <span class="badge-status-overdue-detail" id="lblStatusBadge" runat="server">
                                    <span class="badge-dot-overdue"></span>
                                    <span>OVERDUE</span>
                                </span>
                            </div>
                            <div class="task-detail-top-actions">
                                <button type="button" class="btn-circle-action" title="Edit Task"
                                    onclick="openEditTaskModal()">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
                                        stroke-width="2.2">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </button>
                                <button type="button" class="btn-circle-action" title="Add Subtask / Note"
                                    onclick="openAddSubtaskModal()">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
                                        stroke-width="2.5">
                                        <line x1="12" y1="5" x2="12" y2="19"></line>
                                        <line x1="5" y1="12" x2="19" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="btn-circle-action" id="btnToggleCollapse"
                                    title="Collapse / Expand" onclick="toggleTaskContent()">
                                    <svg id="iconCollapse" viewBox="0 0 24 24" width="16" height="16" fill="none"
                                        stroke="currentColor" stroke-width="2.5">
                                        <polyline points="18 15 12 9 6 15"></polyline>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <!-- Task Big Heading -->
                        <h1 class="task-detail-title" id="lblTaskTitle" runat="server">Advanced Calculus - Problem Set 4
                        </h1>

                        <!-- Task Metadata Row: Due Date | Priority | Potential XP -->
                        <div class="task-detail-meta-row">
                            <div class="task-meta-col">
                                <div class="meta-label">DUE DATE</div>
                                <div class="meta-value-group">
                                    <svg class="meta-calendar-icon" viewBox="0 0 24 24" width="16" height="16"
                                        fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                    <span id="lblDueDate" runat="server">May 12, 2024</span>
                                </div>
                            </div>

                            <div class="task-meta-col">
                                <div class="meta-label">PRIORITY</div>
                                <div class="meta-value-priority" id="lblPriority" runat="server">High Priority</div>
                            </div>

                            <div class="task-meta-col">
                                <div class="meta-label">POTENTIAL XP</div>
                                <div class="meta-value-xp">
                                    <span id="lblPotentialXP" runat="server">250</span>
                                    <span class="xp-unit">XP</span>
                                </div>
                            </div>
                        </div>

                        <!-- Subtle Horizontal Divider -->
                        <div class="task-detail-divider"></div>

                        <!-- Collapsible Body Content -->
                        <div id="taskBodyContent">
                            <!-- Task Description -->
                            <div class="task-desc-section">
                                <div class="section-micro-label">TASK DESCRIPTION</div>
                                <p class="task-detail-description" id="lblTaskDesc" runat="server">
                                    Complete exercises 15 through 32 from Chapter 4 on Derivatives. This set focuses on
                                    the application of the Chain Rule and implicit differentiation. Please ensure all
                                    steps are shown for exercise 24 and 28 as they will be weighted more heavily in the
                                    grading rubric.
                                </p>
                            </div>

                            <!-- Linked Goal Glassmorphic Box -->
                            <div class="linked-goal-box">
                                <div class="goal-box-left">
                                    <div class="goal-target-icon">
                                        <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="#DF6A74"
                                            stroke-width="2">
                                            <circle cx="12" cy="12" r="10"></circle>
                                            <circle cx="12" cy="6" r="6"></circle>
                                            <circle cx="12" cy="2" r="2"></circle>
                                        </svg>
                                    </div>
                                    <div class="goal-box-info">
                                        <span class="goal-micro-label">LINKED GOAL</span>
                                        <span class="goal-box-title" id="lblLinkedGoalTitle" runat="server">Ace Term 2
                                            Finals</span>
                                    </div>
                                </div>
                                <div class="goal-box-right">
                                    <div class="goal-progress-track">
                                        <div class="goal-progress-fill" id="goalProgressFill" runat="server"
                                            style="width: 65%;"></div>
                                    </div>
                                    <span class="goal-progress-pct" id="lblGoalPct" runat="server">65%</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bottom Action Bar Card -->
                    <div class="task-detail-actions-card">
                        <div class="actions-left-group">
                            <button type="button" class="btn-mark-complete" id="btnMarkComplete"
                                onclick="handleMarkComplete()">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
                                    stroke-width="2.5">
                                    <line x1="12" y1="5" x2="12" y2="19"></line>
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                </svg>
                                <span id="txtMarkComplete">Mark as Complete</span>
                            </button>
                            <button type="button" class="btn-edit-task" onclick="openEditTaskModal()">
                                <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <path d="M12 20h9"></path>
                                    <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                                </svg>
                                <span>Edit Task</span>
                            </button>
                        </div>
                        <button type="button" class="btn-archive-task" onclick="handleArchiveTask()">
                            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
                                stroke-width="2">
                                <polyline points="3 6 5 6 21 6"></polyline>
                                <path
                                    d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                </path>
                            </svg>
                            <span>Archive Task</span>
                        </button>
                    </div>

                </div>

                <!-- Right Column: Task States Visualization, Insights & Impact -->
                <div class="task-detail-sidebar">

                    <!-- 1. Task States Visualization Widget -->
                    <div class="task-detail-widget-card">
                        <h2 class="widget-header-title">Task States Visualization</h2>
                        <div class="states-list" id="statesContainer">
                            <!-- Pending Row -->
                            <div class="state-row" id="stateRowPending">
                                <span class="state-name">
                                    <span class="state-bullet bullet-gray"></span>
                                    <span>Pending</span>
                                </span>
                                <span class="state-reward-label">Normal Reward</span>
                            </div>

                            <!-- In Progress Row -->
                            <div class="state-row" id="stateRowProgress">
                                <span class="state-name">
                                    <span class="state-bullet bullet-gray"></span>
                                    <span>In Progress</span>
                                </span>
                                <span class="state-reward-label">Full Reward</span>
                            </div>

                            <!-- Overdue Row (Active highlighted with red border) -->
                            <div class="state-row active-state-box" id="stateRowOverdue">
                                <span class="state-name">
                                    <span class="state-bullet bullet-red"></span>
                                    <span>Overdue</span>
                                </span>
                                <span class="state-reward-red">Reduced XP</span>
                            </div>
                        </div>
                    </div>

                    <!-- 2. Task Insights Widget -->
                    <div class="task-detail-widget-card">
                        <h2 class="widget-header-title">Task Insights</h2>
                        <div class="insights-stack">
                            <!-- Duration -->
                            <div class="insight-detail-item">
                                <div class="insight-detail-icon-circle">
                                    <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"
                                        stroke-width="2">
                                        <circle cx="12" cy="8" r="7"></circle>
                                        <polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline>
                                    </svg>
                                </div>
                                <div class="insight-detail-text">
                                    <span class="insight-detail-title">Typical Duration</span>
                                    <span class="insight-detail-desc">Average 2.5 hours to finish</span>
                                </div>
                            </div>

                            <!-- Study Streak -->
                            <div class="insight-detail-item">
                                <div class="insight-detail-icon-circle">
                                    <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"
                                        stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                </div>
                                <div class="insight-detail-text">
                                    <span class="insight-detail-title">Study Streak</span>
                                    <span class="insight-detail-desc">5 days in a row</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 3. Impact Card: Finals Warrior -->
                    <div class="task-detail-impact-card">
                        <span class="impact-micro-label">IMPACT</span>
                        <h3 class="impact-title">Finals Warrior</h3>
                        <p class="impact-desc">
                            Completing this task today will keep your streak alive and earn you 20% bonus progress
                            toward the badge.
                        </p>
                        <div class="impact-social-row">
                            <div class="impact-avatar-stack">
                                <div class="impact-avatar-circle" title="Liam Chen">LC</div>
                                <div class="impact-avatar-circle" style="background-color: #10B981;"
                                    title="Sarah Jenkins">SJ</div>
                                <div class="impact-avatar-more">+16</div>
                            </div>
                            <span class="impact-social-text">10 classmates recently completed this</span>
                        </div>

                        <!-- Background Watermark Gear -->
                        <svg class="impact-watermark" viewBox="0 0 24 24" fill="currentColor">
                            <path
                                d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
                        </svg>
                    </div>

                </div>

            </div>
        </div>

        <!-- Embedded Fail-Safe Styles for Edit Task Modal -->
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
            .modal-edit-header-title {
                display: flex !important;
                align-items: center !important;
                gap: 12px !important;
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
            .edit-form-label {
                font-size: 0.72rem !important;
                font-weight: 800 !important;
                color: #18181B !important;
                letter-spacing: 0.06em !important;
                text-transform: uppercase !important;
                display: block !important;
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
            .field-error-text {
                display: flex !important;
                align-items: center !important;
                gap: 6px !important;
                font-size: 0.78rem !important;
                font-weight: 700 !important;
                color: #DC2626 !important;
                margin-top: 2px !important;
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
            .form-input-clean {
                border: none !important;
                outline: none !important;
                background: transparent !important;
                font-family: inherit !important;
                font-size: 0.9rem !important;
                font-weight: 500 !important;
                color: #18181B !important;
                width: 100% !important;
            }
            .form-select-spec {
                width: 100% !important;
                box-sizing: border-box !important;
                padding: 11px 16px !important;
                border-radius: 12px !important;
                border: 1px solid #DDD6CB !important;
                background-color: #FFFFFF !important;
                font-family: inherit !important;
                font-size: 0.9rem !important;
                font-weight: 600 !important;
                color: #18181B !important;
                outline: none !important;
                cursor: pointer !important;
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
        </style>

        <!-- Edit Task Modal (Matching Image 2) -->
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
                    <div class="modal-spec-body">
                        <!-- Task Title Input with Validation -->
                        <div class="form-group-spec">
                            <label class="edit-form-label" for="txtEditTitle">TASK TITLE</label>
                            <div class="input-error-wrapper">
                                <input type="text" id="txtEditTitle" class="form-input-spec has-error" placeholder="e.g. Physics Lab Report" oninput="validateEditTitle()" />
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
                            <label class="edit-form-label" for="txtEditDesc">DESCRIPTION</label>
                            <textarea id="txtEditDesc" class="edit-form-textarea" placeholder="Add some details about this task..."></textarea>
                        </div>

                        <!-- Due Date & Priority Grid -->
                        <div class="form-row">
                            <div class="form-group-spec">
                                <label class="edit-form-label" for="txtEditDueDate">DUE DATE</label>
                                <div class="datetime-box">
                                    <input type="text" id="txtEditDueDate" class="form-input-clean" placeholder="mm/dd/yyyy" />
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                </div>
                            </div>

                            <div class="form-group-spec">
                                <label class="edit-form-label" for="ddlEditPriority">PRIORITY</label>
                                <select id="ddlEditPriority" class="form-select-spec">
                                    <option value="Low Priority">Low Priority</option>
                                    <option value="Medium Priority">Medium Priority</option>
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
                            <label class="edit-form-label" for="txtEditGoal">LINK TO GOAL (OPTIONAL)</label>
                            <div class="goal-input-box-wrap">
                                <input type="text" id="txtEditGoal" class="form-input-spec" placeholder="e.g. Pass Semester Finals" />
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

        <!-- Add Subtask / Note Modal -->
        <div class="modal-overlay" id="addSubtaskModal">
            <div class="modal-card">
                <div class="modal-header">
                    <h3 class="modal-title">Add Task Note / Checklist Item</h3>
                    <button type="button" class="modal-close-btn" onclick="closeAddSubtaskModal()" title="Close">
                        <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor"
                            stroke-width="2">
                            <line x1="18" y1="6" x2="6" y2="18"></line>
                            <line x1="6" y1="6" x2="18" y2="18"></line>
                        </svg>
                    </button>
                </div>

                <form id="addSubtaskForm" onsubmit="handleAddSubtaskSubmit(event)">
                    <div class="form-group">
                        <label class="form-label" for="txtSubtaskNote">Note or Checklist Step</label>
                        <input type="text" id="txtSubtaskNote" class="form-input"
                            placeholder="e.g. Double check problem 28 implicit derivative" required />
                    </div>
                    <div class="modal-actions">
                        <button type="button" class="btn-secondary" onclick="closeAddSubtaskModal()">Cancel</button>
                        <button type="submit" class="btn-primary">Add Item</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Toast Notification -->
        <div class="toast-notice" id="toastNotice">
            <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#10B981" stroke-width="2.5">
                <polyline points="20 6 9 17 4 12"></polyline>
            </svg>
            <span id="toastMessage">Action completed successfully</span>
        </div>
    </asp:Content>

    <asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
        <script type="text/javascript">
            // @ts-nocheck
            let isTaskCompleted = false;
            let isContentCollapsed = false;

            // 1. Mark as Complete
            function handleMarkComplete() {
                const btn = document.getElementById('btnMarkComplete');
                const txt = document.getElementById('txtMarkComplete');
                const stateOverdue = document.getElementById('stateRowOverdue');

                if (!isTaskCompleted) {
                    isTaskCompleted = true;
                    btn.style.backgroundColor = '#10B981';
                    txt.textContent = 'Completed ✓';

                    // Update states visualization
                    if (stateOverdue) {
                        stateOverdue.classList.remove('active-state-box');
                    }

                    showToast("🎉 Task marked as complete! +250 XP recorded.");
                } else {
                    isTaskCompleted = false;
                    btn.style.backgroundColor = '#DF6A74';
                    txt.textContent = 'Mark as Complete';
                    if (stateOverdue) {
                        stateOverdue.classList.add('active-state-box');
                    }
                    showToast("Task status reverted to Overdue.");
                }
            }

            // 2. Collapse / Expand Description
            function toggleTaskContent() {
                const body = document.getElementById('taskBodyContent');
                const icon = document.getElementById('iconCollapse');
                if (!body) return;

                if (isContentCollapsed) {
                    body.style.display = 'block';
                    isContentCollapsed = false;
                    icon.innerHTML = '<polyline points="18 15 12 9 6 15"></polyline>';
                } else {
                    body.style.display = 'none';
                    isContentCollapsed = true;
                    icon.innerHTML = '<polyline points="6 9 12 15 18 9"></polyline>';
                }
            }

            // 3. Edit Task Modal (Image 2)
            function openEditTaskModal() {
                const titleEl = document.getElementById('<%= lblTaskTitle.ClientID %>');
                const descEl = document.getElementById('<%= lblTaskDesc.ClientID %>');
                const dueDateEl = document.getElementById('<%= lblDueDate.ClientID %>');
                const priorityEl = document.getElementById('<%= lblPriority.ClientID %>');
                const badgeEl = document.getElementById('<%= lblSubjectBadge.ClientID %>');

                const titleInput = document.getElementById('txtEditTitle');
                titleInput.value = titleEl ? titleEl.textContent.trim() : '';
                document.getElementById('txtEditDesc').value = descEl ? descEl.textContent.trim() : '';
                document.getElementById('txtEditDueDate').value = dueDateEl ? dueDateEl.textContent.trim() : '10/28/2026';
                if (priorityEl) {
                    const pVal = priorityEl.textContent.trim();
                    const ddl = document.getElementById('ddlEditPriority');
                    if (pVal.includes('High')) ddl.value = 'High Priority';
                    else if (pVal.includes('Low')) ddl.value = 'Low Priority';
                    else ddl.value = 'Medium Priority';
                }

                // Match Category Pill
                const subject = badgeEl ? badgeEl.textContent.trim().toLowerCase() : 'mathematics';
                let matched = false;
                document.querySelectorAll('#editCategoryPills .category-tag-btn').forEach(pill => {
                    pill.classList.remove('selected');
                    if (pill.textContent.trim().toLowerCase() === subject) {
                        pill.classList.add('selected');
                        matched = true;
                    }
                });
                if (!matched) {
                    const firstPill = document.querySelector('#editCategoryPills .tag-math');
                    if (firstPill) firstPill.classList.add('selected');
                }

                validateEditTitle();
                document.getElementById('editTaskModal').classList.add('open');
                titleInput.focus();
            }

            function closeEditTaskModal() {
                document.getElementById('editTaskModal').classList.remove('open');
            }

            function validateEditTitle() {
                const input = document.getElementById('txtEditTitle');
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
                const titleInput = document.getElementById('txtEditTitle');
                const newTitle = titleInput.value.trim();

                if (!newTitle) {
                    validateEditTitle();
                    titleInput.focus();
                    return;
                }

                const newDesc = document.getElementById('txtEditDesc').value.trim();
                const newDueDate = document.getElementById('txtEditDueDate').value.trim();
                const newPriority = document.getElementById('ddlEditPriority').value;
                const newCat = document.getElementById('editSelectedCategory').value;

                const titleEl = document.getElementById('<%= lblTaskTitle.ClientID %>');
                const breadcrumbTitle = document.getElementById('<%= lblBreadcrumbTitle.ClientID %>');
                if (titleEl) titleEl.textContent = newTitle;
                if (breadcrumbTitle) breadcrumbTitle.textContent = newTitle;

                if (newDesc) {
                    const descEl = document.getElementById('<%= lblTaskDesc.ClientID %>');
                    if (descEl) descEl.textContent = newDesc;
                }
                if (newDueDate) {
                    const dueDateEl = document.getElementById('<%= lblDueDate.ClientID %>');
                    if (dueDateEl) dueDateEl.textContent = newDueDate;
                }
                if (newPriority) {
                    const priorityEl = document.getElementById('<%= lblPriority.ClientID %>');
                    if (priorityEl) priorityEl.textContent = newPriority;
                }
                if (newCat) {
                    const badgeEl = document.getElementById('<%= lblSubjectBadge.ClientID %>');
                    if (badgeEl) badgeEl.textContent = newCat.toUpperCase();
                }

                closeEditTaskModal();
                showToast("Task updated successfully!");
            }

            // 4. Add Subtask / Note
            function openAddSubtaskModal() {
                document.getElementById('addSubtaskModal').classList.add('open');
                document.getElementById('txtSubtaskNote').focus();
            }

            function closeAddSubtaskModal() {
                document.getElementById('addSubtaskModal').classList.remove('open');
            }

            function handleAddSubtaskSubmit(e) {
                e.preventDefault();
                const note = document.getElementById('txtSubtaskNote').value.trim();
                if (note) {
                    closeAddSubtaskModal();
                    document.getElementById('addSubtaskForm').reset();
                    showToast(`Checklist step "${note}" saved to task!`);
                }
            }

            // 5. Archive Task
            function handleArchiveTask() {
                if (confirm("Are you sure you want to archive this task?")) {
                    showToast("Task archived. Redirecting to Tasks list...");
                    setTimeout(() => {
                        window.location.href = 'Tasks.aspx';
                    }, 1200);
                }
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

            // Close modals on backdrop click
            window.addEventListener('click', function (e) {
                const editModal = document.getElementById('editTaskModal');
                const noteModal = document.getElementById('addSubtaskModal');
                if (e.target === editModal) closeEditTaskModal();
                if (e.target === noteModal) closeAddSubtaskModal();
            });
        </script>
    </asp:Content>