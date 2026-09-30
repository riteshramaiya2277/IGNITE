<%@ Page Title="Tasks" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="IGNITE.Student.Tasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/tasks.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="tasks-canvas">
        <!-- 1. Breadcrumb Navigation -->
        <nav class="tasks-breadcrumb" aria-label="Breadcrumb">
            <a href="<%= ResolveUrl("~/Student/Dashboard.aspx") %>" class="breadcrumb-link">Dashboard</a>
            <span class="breadcrumb-sep">&gt;</span>
            <a href="<%= ResolveUrl("~/Student/Tasks.aspx") %>" class="breadcrumb-link">Tasks</a>
            <span class="breadcrumb-sep">&gt;</span>
            <span class="breadcrumb-current" id="breadcrumbTaskName">Advanced Calculus - Problem Set 4</span>
        </nav>

        <!-- 2. Two-Column Workspace Layout -->
        <div class="task-detail-grid">
            
            <!-- ================= LEFT COLUMN ================= -->
            <div class="task-main-col">
                
                <!-- Main Task Detail Hero Card -->
                <div class="task-hero-card" id="taskHeroCard">
                    <!-- Top Row: Subject/Status Badges & Top-Right Actions -->
                    <div class="task-hero-header">
                        <div class="hero-badges-group">
                            <span class="badge-subject badge-subject-math" id="taskSubjectBadge">MATHEMATICS</span>
                            <span class="badge-status-pill badge-status-overdue" id="taskStatusBadge">
                                <span class="status-dot-circle"></span>
                                <span id="taskStatusBadgeText">OVERDUE</span>
                            </span>
                        </div>

                        <div class="hero-controls-group">
                            <button type="button" class="btn-hero-icon" title="Add Note / Subtask" onclick="toggleNotesBox()">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <line x1="12" y1="5" x2="12" y2="19"></line>
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                </svg>
                            </button>
                            <button type="button" class="btn-hero-icon" id="btnToggleDetails" title="Collapse / Expand Details" onclick="toggleDetailsBody(this)">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2">
                                    <polyline points="18 15 12 9 6 15"></polyline>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <!-- Main Task Heading -->
                    <h1 class="task-hero-title" id="taskHeroTitle">Advanced Calculus - Problem Set 4</h1>

                    <!-- 3-Column Metadata Row -->
                    <div class="task-stats-row">
                        <!-- Due Date -->
                        <div class="task-stat-col">
                            <span class="stat-label">DUE DATE</span>
                            <div class="stat-value">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                                <span id="taskDueDateVal">May 12, 2024</span>
                            </div>
                        </div>

                        <!-- Priority -->
                        <div class="task-stat-col">
                            <span class="stat-label">PRIORITY</span>
                            <div class="stat-value priority-high" id="taskPriorityVal">High Priority</div>
                        </div>

                        <!-- Potential XP -->
                        <div class="task-stat-col">
                            <span class="stat-label">POTENTIAL XP</span>
                            <div class="stat-value stat-xp-group">
                                <span class="stat-xp-num" id="taskXPVal">250</span>
                                <span class="stat-xp-unit">XP</span>
                            </div>
                        </div>
                    </div>

                    <!-- Thin Divider -->
                    <hr class="task-hero-divider" />

                    <!-- Task Description Section -->
                    <div class="task-desc-section" id="taskDescSection">
                        <div class="desc-label">TASK DESCRIPTION</div>
                        <p class="desc-body" id="taskDescBody">
                            Complete exercises 15 through 32 from Chapter 4 on Derivatives. This set focuses on the application of the Chain Rule and implicit differentiation. Please ensure all steps are shown for exercise 24 and 28 as they will be weighted more heavily in the grading rubric.
                        </p>

                        <!-- Extra student note toggled via plus button -->
                        <div class="task-notes-extra" id="taskNotesExtra">
                            <strong>Note:</strong> Double-check trigonometric identities on page 214 before submitting solutions for problem 28.
                        </div>
                    </div>

                    <!-- Linked Goal Card -->
                    <div class="linked-goal-box">
                        <div class="goal-left-group">
                            <div class="goal-icon-box" title="Goal Target">
                                <svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <circle cx="12" cy="12" r="6"></circle>
                                    <circle cx="12" cy="12" r="2"></circle>
                                </svg>
                            </div>
                            <div class="goal-text-group">
                                <span class="goal-label-sub">LINKED GOAL</span>
                                <span class="goal-title-text" id="goalTitleText">Ace Term 2 Finals</span>
                            </div>
                        </div>

                        <div class="goal-progress-group">
                            <div class="goal-progress-track">
                                <div class="goal-progress-fill" id="goalProgressFill" style="width: 65%;"></div>
                            </div>
                            <span class="goal-progress-percent" id="goalProgressPercent">65%</span>
                        </div>
                    </div>
                </div>

                <!-- Bottom Action Bar (Mark Complete, Edit, Archive) -->
                <div class="task-bottom-bar">
                    <div class="bottom-bar-left">
                        <button type="button" class="btn-mark-complete" id="btnMarkComplete" onclick="handleMarkComplete()">
                            <svg id="btnCompleteIcon" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5">
                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                            </svg>
                            <span id="btnCompleteText">Mark as Complete</span>
                        </button>

                        <button type="button" class="btn-edit-task" onclick="openEditTaskModal()">
                            <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M12 20h9"></path>
                                <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                            </svg>
                            <span>Edit Task</span>
                        </button>
                    </div>

                    <button type="button" class="btn-archive-task" onclick="handleArchiveTask()">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                            <line x1="10" y1="11" x2="10" y2="17"></line>
                            <line x1="14" y1="11" x2="14" y2="17"></line>
                        </svg>
                        <span>Archive Task</span>
                    </button>
                </div>

            </div>

            <!-- ================= RIGHT COLUMN ================= -->
            <div class="task-widgets-col">

                <!-- 1. Task States Visualization -->
                <div class="side-widget-card">
                    <h2 class="widget-card-title">Task States Visualization</h2>
                    <div class="task-states-list">
                        <!-- Pending State -->
                        <div class="state-row" id="stateRowPending" onclick="setTaskState('pending')">
                            <span class="state-row-left">
                                <span class="state-dot"></span>
                                <span>Pending</span>
                            </span>
                            <span class="state-row-right">Normal Reward</span>
                        </div>

                        <!-- In Progress State -->
                        <div class="state-row" id="stateRowProgress" onclick="setTaskState('progress')">
                            <span class="state-row-left">
                                <span class="state-dot"></span>
                                <span>In Progress</span>
                            </span>
                            <span class="state-row-right">Full Reward</span>
                        </div>

                        <!-- Overdue State (Active Highlight matching Figma) -->
                        <div class="state-row active" id="stateRowOverdue" onclick="setTaskState('overdue')">
                            <span class="state-row-left">
                                <span class="state-dot"></span>
                                <span>Overdue</span>
                            </span>
                            <span class="state-row-right">Reduced XP</span>
                        </div>
                    </div>
                </div>

                <!-- 2. Task Insights Widget -->
                <div class="side-widget-card">
                    <h2 class="widget-card-title">Task Insights</h2>
                    <div class="insights-items-list">
                        <!-- Typical Duration -->
                        <div class="insight-item-row">
                            <div class="insight-icon-bubble">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                                    <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                                    <path d="M4 22h16"></path>
                                    <path d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34"></path>
                                    <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                                </svg>
                            </div>
                            <div class="insight-text-group">
                                <span class="insight-name-title">Typical Duration</span>
                                <span class="insight-value-desc">Average 2.5 hours to finish</span>
                            </div>
                        </div>

                        <!-- Study Streak -->
                        <div class="insight-item-row">
                            <div class="insight-icon-bubble">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                            </div>
                            <div class="insight-text-group">
                                <span class="insight-name-title">Study Streak</span>
                                <span class="insight-value-desc">5 days in a row</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 3. Impact Finals Warrior Card -->
                <div class="side-widget-card impact-banner-card">
                    <!-- Subtle gear watermark in background -->
                    <svg class="impact-bg-watermark" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                    </svg>

                    <div class="impact-sublabel">IMPACT</div>
                    <h2 class="impact-title">Finals Warrior</h2>
                    <p class="impact-desc-text">Completing this task today will keep your streak alive and earn you 20% bonus progress toward the badge.</p>
                    
                    <div class="impact-social-row">
                        <div class="avatar-stack-wrap">
                            <img class="classmate-avatar" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Ccircle cx='16' cy='16' r='16' fill='%23E07A5F'/%3E%3Ccircle cx='16' cy='13' r='6' fill='%23FFFFFF'/%3E%3Cpath d='M8 26c0-4.4 3.6-8 8-8s8 3.6 8 8' fill='%23FFFFFF'/%3E%3C/svg%3E" alt="Liam" />
                            <img class="classmate-avatar" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Ccircle cx='16' cy='16' r='16' fill='%233D405B'/%3E%3Ccircle cx='16' cy='13' r='6' fill='%23FFFFFF'/%3E%3Cpath d='M8 26c0-4.4 3.6-8 8-8s8 3.6 8 8' fill='%23FFFFFF'/%3E%3C/svg%3E" alt="Sarah" />
                            <span class="classmate-avatar-extra">+14</span>
                        </div>
                        <span class="impact-social-count">10 classmates recently completed this</span>
                    </div>
                </div>

            </div>

        </div>
    </div>

    <!-- Edit Task Modal -->
    <div class="modal-overlay" id="editTaskModal">
        <div class="modal-card">
            <div class="modal-header">
                <h3 class="modal-title">Edit Task Details</h3>
                <button type="button" class="modal-close-btn" onclick="closeEditTaskModal()" title="Close">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
            </div>

            <form id="editTaskForm" onsubmit="handleEditTaskSubmit(event)">
                <div class="form-group">
                    <label class="form-label" for="inputTaskTitle">Task Title</label>
                    <input type="text" id="inputTaskTitle" class="form-input" value="Advanced Calculus - Problem Set 4" required />
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="selectTaskSubject">Subject</label>
                        <select id="selectTaskSubject" class="form-select">
                            <option value="MATHEMATICS" selected>Mathematics</option>
                            <option value="HISTORY">History</option>
                            <option value="PHYSICS">Physics</option>
                            <option value="SOCIOLOGY">Sociology</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="selectTaskPriority">Priority</label>
                        <select id="selectTaskPriority" class="form-select">
                            <option value="High" selected>High Priority</option>
                            <option value="Medium">Medium Priority</option>
                            <option value="Low">Low Priority</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="inputTaskDueDate">Due Date</label>
                        <input type="text" id="inputTaskDueDate" class="form-input" value="May 12, 2024" required />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="inputTaskXP">Potential XP</label>
                        <input type="number" id="inputTaskXP" class="form-input" value="250" min="50" max="1000" step="50" required />
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="textareaTaskDesc">Description</label>
                    <textarea id="textareaTaskDesc" class="form-textarea" rows="4">Complete exercises 15 through 32 from Chapter 4 on Derivatives. This set focuses on the application of the Chain Rule and implicit differentiation. Please ensure all steps are shown for exercise 24 and 28 as they will be weighted more heavily in the grading rubric.</textarea>
                </div>

                <div class="modal-actions">
                    <button type="button" class="btn-secondary" onclick="closeEditTaskModal()">Cancel</button>
                    <button type="submit" class="btn-primary">Save Changes</button>
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
        // @ts-nocheck
        let isTaskCompleted = false;
        let currentState = 'overdue';

        // 1. Handle Mark as Complete
        function handleMarkComplete() {
            const btn = document.getElementById('btnMarkComplete');
            const btnText = document.getElementById('btnCompleteText');
            const btnIcon = document.getElementById('btnCompleteIcon');
            const badge = document.getElementById('taskStatusBadge');
            const badgeText = document.getElementById('taskStatusBadgeText');

            isTaskCompleted = !isTaskCompleted;

            if (isTaskCompleted) {
                btn.classList.add('is-done');
                btnText.textContent = 'Completed';
                btnIcon.innerHTML = '<polyline points="20 6 9 17 4 12"></polyline>';
                
                badge.className = 'badge-status-pill badge-status-completed';
                badgeText.textContent = 'COMPLETED';
                
                showToast("🎉 Great job! You earned 250 XP towards your Level 12 goals!");
            } else {
                btn.classList.remove('is-done');
                btnText.textContent = 'Mark as Complete';
                btnIcon.innerHTML = '<line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line>';
                
                setTaskState(currentState);
                showToast("Task marked as incomplete.");
            }
        }

        // 2. Set Task State (Interactive with Right Column Visualization)
        function setTaskState(stateKey) {
            currentState = stateKey;
            
            // Update state rows active class
            document.querySelectorAll('.state-row').forEach(row => row.classList.remove('active'));
            
            const badge = document.getElementById('taskStatusBadge');
            const badgeText = document.getElementById('taskStatusBadgeText');

            if (stateKey === 'pending') {
                const targetRow = document.getElementById('stateRowPending');
                if (targetRow) targetRow.classList.add('active');
                badge.className = 'badge-status-pill badge-status-pending';
                badgeText.textContent = 'PENDING';
                showToast("Task status updated to Pending.");
            } else if (stateKey === 'progress') {
                const targetRow = document.getElementById('stateRowProgress');
                if (targetRow) targetRow.classList.add('active');
                badge.className = 'badge-status-pill badge-status-progress';
                badgeText.textContent = 'IN PROGRESS';
                showToast("Task status updated to In Progress.");
            } else if (stateKey === 'overdue') {
                const targetRow = document.getElementById('stateRowOverdue');
                if (targetRow) targetRow.classList.add('active');
                badge.className = 'badge-status-pill badge-status-overdue';
                badgeText.textContent = 'OVERDUE';
                showToast("Task status updated to Overdue (Reduced XP).");
            }
        }

        // 3. Edit Task Modal Handling
        function openEditTaskModal() {
            const modal = document.getElementById('editTaskModal');
            if (modal) {
                modal.classList.add('open');
            }
        }

        function closeEditTaskModal() {
            const modal = document.getElementById('editTaskModal');
            if (modal) {
                modal.classList.remove('open');
            }
        }

        function handleEditTaskSubmit(e) {
            e.preventDefault();

            const title = document.getElementById('inputTaskTitle').value.trim();
            const subject = document.getElementById('selectTaskSubject').value;
            const priority = document.getElementById('selectTaskPriority').value;
            const dueDate = document.getElementById('inputTaskDueDate').value.trim();
            const xp = document.getElementById('inputTaskXP').value.trim();
            const desc = document.getElementById('textareaTaskDesc').value.trim();

            if (!title) return;

            // Update UI elements
            document.getElementById('taskHeroTitle').textContent = title;
            document.getElementById('breadcrumbTaskName').textContent = title;
            document.getElementById('taskDueDateVal').textContent = dueDate;
            document.getElementById('taskXPVal').textContent = xp;
            document.getElementById('taskDescBody').textContent = desc;

            // Subject badge
            const subjectBadge = document.getElementById('taskSubjectBadge');
            subjectBadge.textContent = subject;
            subjectBadge.className = 'badge-subject badge-subject-' + subject.toLowerCase();

            // Priority
            const priorityEl = document.getElementById('taskPriorityVal');
            priorityEl.textContent = priority + ' Priority';
            priorityEl.className = 'stat-value priority-' + priority.toLowerCase();

            closeEditTaskModal();
            showToast("Task updated successfully!");
        }

        // 4. Archive Task
        function handleArchiveTask() {
            if (confirm("Are you sure you want to archive this task?")) {
                showToast("Task has been archived.");
            }
        }

        // 5. Toggle Notes Extra Box
        function toggleNotesBox() {
            const notes = document.getElementById('taskNotesExtra');
            if (notes) {
                notes.classList.toggle('open');
            }
        }

        // 6. Toggle Details Collapse/Expand
        function toggleDetailsBody(btn) {
            const descSection = document.getElementById('taskDescSection');
            if (!descSection) return;

            if (descSection.style.display === 'none') {
                descSection.style.display = 'block';
                btn.innerHTML = '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2"><polyline points="18 15 12 9 6 15"></polyline></svg>';
            } else {
                descSection.style.display = 'none';
                btn.innerHTML = '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"></polyline></svg>';
            }
        }

        // 7. Toast helper
        function showToast(message) {
            const toast = document.getElementById('toastNotice');
            const msgSpan = document.getElementById('toastMessage');
            if (toast && msgSpan) {
                msgSpan.textContent = message;
                toast.classList.add('show');
                setTimeout(() => {
                    toast.classList.remove('show');
                }, 3000);
            }
        }

        // Close modal on click outside
        window.addEventListener('click', function (e) {
            const modal = document.getElementById('editTaskModal');
            if (e.target === modal) {
                closeEditTaskModal();
            }
        });
    </script>
</asp:Content>
