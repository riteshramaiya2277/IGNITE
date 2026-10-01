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
            <button type="button" class="btn-create-task" onclick="openCreateTaskModal()">
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
                <div class="task-card" data-status="overdue" onclick="openTaskDetail('1')">
                    <div class="task-card-header">
                        <div class="task-title-group">
                            <h2 class="task-title">Advanced Calculus - Problem Set 4</h2>
                            <span class="badge-subject badge-subject-math">MATH</span>
                        </div>
                        <span class="badge-status badge-status-overdue">OVERDUE</span>
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
                <div class="task-card" data-status="progress" onclick="openTaskDetail('2')">
                    <div class="task-card-header">
                        <div class="task-title-group">
                            <h2 class="task-title">Renaissance Art History Essay</h2>
                            <span class="badge-subject badge-subject-history">HISTORY</span>
                        </div>
                        <span class="badge-status badge-status-progress">IN PROGRESS</span>
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
                <div class="task-card" data-status="pending" onclick="openTaskDetail('3')">
                    <div class="task-card-header">
                        <div class="task-title-group">
                            <h2 class="task-title">Quantum Mechanics Quiz Prep</h2>
                            <span class="badge-subject badge-subject-physics">PHYSICS</span>
                        </div>
                        <span class="badge-status badge-status-pending">PENDING</span>
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
                <div class="task-card is-completed" data-status="completed" onclick="openTaskDetail('4')">
                    <div class="task-card-header">
                        <div class="task-title-group">
                            <h2 class="task-title">Sociology Case Study</h2>
                            <span class="badge-subject badge-subject-sociology">SOCIOLOGY</span>
                        </div>
                        <span class="badge-status badge-status-completed">COMPLETED</span>
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
                            <div class="avatar-bubble" title="Alex Mercer">AM</div>
                        </div>
                        <span class="milestone-social-text">14 classmates earned this</span>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Create Task Modal -->
    <div class="modal-overlay" id="createTaskModal">
        <div class="modal-card">
            <div class="modal-header">
                <h3 class="modal-title">Create New Task</h3>
                <button type="button" class="modal-close-btn" onclick="closeCreateTaskModal()" title="Close">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
            </div>

            <form id="createTaskForm" onsubmit="handleCreateTaskSubmit(event)">
                <div class="form-group">
                    <label class="form-label" for="taskTitleInput">Task Title</label>
                    <input type="text" id="taskTitleInput" class="form-input" placeholder="e.g. Modern Physics Problem Set #5" required />
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="taskSubjectSelect">Subject / Category</label>
                        <select id="taskSubjectSelect" class="form-select">
                            <option value="MATH">Mathematics (MATH)</option>
                            <option value="HISTORY">History (HISTORY)</option>
                            <option value="PHYSICS">Physics (PHYSICS)</option>
                            <option value="SOCIOLOGY">Sociology (SOCIOLOGY)</option>
                            <option value="BIOLOGY">Biology (BIOLOGY)</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="taskPrioritySelect">Priority</label>
                        <select id="taskPrioritySelect" class="form-select">
                            <option value="High">High Priority</option>
                            <option value="Medium" selected>Medium Priority</option>
                            <option value="Low">Low Priority</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="taskDueDateInput">Due Date &amp; Time</label>
                        <input type="text" id="taskDueDateInput" class="form-input" placeholder="e.g. Tomorrow, 6:00 PM" required />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="taskXPRewardInput">XP Reward</label>
                        <input type="number" id="taskXPRewardInput" class="form-input" value="350" min="50" max="1000" step="50" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="taskDescInput">Description / Notes</label>
                    <textarea id="taskDescInput" class="form-textarea" rows="3" placeholder="Brief details about what needs to be delivered..."></textarea>
                </div>

                <div class="modal-actions">
                    <button type="button" class="btn-secondary" onclick="closeCreateTaskModal()">Cancel</button>
                    <button type="submit" class="btn-primary">Add Task</button>
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
            // Update active pill tab
            document.querySelectorAll('.filter-tab-btn').forEach(btn => btn.classList.remove('active'));
            if (btnElement) {
                btnElement.classList.add('active');
            }

            // Filter task cards
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

        // 2. Modal Open / Close
        function openCreateTaskModal() {
            const modal = document.getElementById('createTaskModal');
            if (modal) {
                modal.classList.add('open');
                document.getElementById('taskTitleInput').focus();
            }
        }

        function closeCreateTaskModal() {
            const modal = document.getElementById('createTaskModal');
            if (modal) {
                modal.classList.remove('open');
            }
        }

        // 3. Handle Create Task Submit
        function handleCreateTaskSubmit(e) {
            e.preventDefault();

            const title = document.getElementById('taskTitleInput').value.trim();
            const subject = document.getElementById('taskSubjectSelect').value;
            const priority = document.getElementById('taskPrioritySelect').value;
            const dueDate = document.getElementById('taskDueDateInput').value.trim();
            const xp = document.getElementById('taskXPRewardInput').value || '350';
            const desc = document.getElementById('taskDescInput').value.trim() || 'No additional details provided.';

            if (!title || !dueDate) return;

            // Pick badge class based on subject
            let subjectClass = 'badge-subject-math';
            if (subject === 'HISTORY') subjectClass = 'badge-subject-history';
            else if (subject === 'PHYSICS') subjectClass = 'badge-subject-physics';
            else if (subject === 'SOCIOLOGY') subjectClass = 'badge-subject-sociology';

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
            } else if (priority === 'Medium') {
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

            // Create new card
            const newCard = document.createElement('div');
            newCard.className = 'task-card';
            newCard.setAttribute('data-status', 'pending');
            newCard.innerHTML = `
                <div class="task-card-header">
                    <div class="task-title-group">
                        <h2 class="task-title">${escapeHtml(title)}</h2>
                        <span class="badge-subject ${subjectClass}">${subject}</span>
                    </div>
                    <span class="badge-status badge-status-pending">PENDING</span>
                </div>
                <p class="task-description">${escapeHtml(desc)}</p>
                <div class="task-card-footer">
                    <div class="task-meta-left">
                        <span class="task-meta-item">
                            <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                            <span>${escapeHtml(dueDate)}</span>
                        </span>
                        ${priorityMarkup}
                    </div>
                    <span class="badge-xp-reward badge-xp-full">
                        +${escapeHtml(xp)} XP Full Reward
                    </span>
                </div>
            `;

            // Insert at top of task list
            const container = document.getElementById('taskListContainer');
            if (container) {
                container.prepend(newCard);
            }

            // Close modal & reset
            closeCreateTaskModal();
            document.getElementById('createTaskForm').reset();
            showToast(`Task "${title}" added successfully!`);
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

        // Close modal on click outside
        window.addEventListener('click', function (e) {
            const modal = document.getElementById('createTaskModal');
            if (e.target === modal) {
                closeCreateTaskModal();
            }
        });
    </script>
</asp:Content>
