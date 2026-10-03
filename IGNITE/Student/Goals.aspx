<%@ Page Title="Goals" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true"
    CodeBehind="Goals.aspx.cs" Inherits="IGNITE.Student.Goals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/dashboard.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%= ResolveUrl("~/Content/goals.css?v=" + DateTime.Now.Ticks) %>" rel="stylesheet" type="text/css" />
    <style>
        .filter-dropdown-wrap {
            position: relative;
        }

        .filter-dropdown-menu {
            position: absolute;
            top: calc(100% + 8px);
            right: 0;
            min-width: 175px;
            background-color: #FFFFFF;
            border: 1px solid #E5DFD3;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            padding: 6px;
            z-index: 100;
            display: none;
            flex-direction: column;
            gap: 2px;
        }

        .filter-dropdown-menu.show {
            display: flex;
        }

        .filter-dropdown-item {
            background: none;
            border: none;
            text-align: left;
            padding: 8px 12px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 600;
            color: #4A4A4A;
            cursor: pointer;
            transition: all 0.15s ease;
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            box-sizing: border-box;
        }

        .filter-dropdown-item:hover {
            background-color: #F8F5EE;
            color: #DF6A74;
        }

        .filter-dropdown-item.active {
            background-color: #FEECEE;
            color: #DF6A74;
            font-weight: 700;
        }

        .goal-card {
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
        }

        .goal-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.06);
            border-color: rgba(223, 106, 116, 0.3);
        }

        .tag-completed {
            background-color: #D1FAE5;
            color: #059669;
        }

        .tag-archived {
            background-color: #F3F4F6;
            color: #6B7280;
        }

        .goals-empty-state {
            grid-column: 1 / -1;
            text-align: center;
            padding: 48px 24px;
            background-color: #f7f3ed;
            border-radius: 20px;
            border: 1px dashed #DDD6CB;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }

        .goals-empty-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background-color: #FEECEE;
            color: #DF6A74;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 6px;
        }

        .goals-empty-title {
            font-size: 1.1rem;
            font-weight: 800;
            color: #18181B;
            margin: 0;
        }

        .goals-empty-subtitle {
            font-size: 0.88rem;
            color: #78716C;
            margin: 0;
        }

        .btn-reset-filters {
            margin-top: 10px;
            background-color: #DF6A74;
            color: #FFFFFF;
            border: none;
            padding: 8px 18px;
            border-radius: 10px;
            font-size: 0.85rem;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.15s ease;
        }

        .btn-reset-filters:hover {
            background-color: #D45B65;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="goals-canvas">
        <div class="goals-header-row">
            <div class="goals-title-area">
                <h1 class="goals-main-title">Goals</h1>
                <p class="goals-subtitle" id="goalsSubtitle">You have 6 active academic and personal goals.</p>
            </div>
            <button class="btn-add-goal" type="button" onclick="window.location.href='CreateGoal.aspx'">+ Add Goal</button>
        </div>

        <div class="goals-filters-row">
            <div class="goals-tabs">
                <a href="javascript:void(0)" class="tab-item active" data-tab="active" onclick="switchGoalTab('active', this)">Active (<span id="activeCount">6</span>)</a>
                <a href="javascript:void(0)" class="tab-item" data-tab="completed" onclick="switchGoalTab('completed', this)">Completed (<span id="completedCount">4</span>)</a>
                <a href="javascript:void(0)" class="tab-item" data-tab="archived" onclick="switchGoalTab('archived', this)">Archived (<span id="archivedCount">2</span>)</a>
            </div>

            <div class="goals-filter-dropdowns">
                <!-- Category Filter -->
                <div class="filter-dropdown-wrap" id="categoryWrap">
                    <button class="btn-filter" id="btnCategoryFilter" type="button" onclick="toggleDropdown('categoryDropdown', event)">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="currentColor">
                            <path d="M10 18h4v-2h-4v2zM3 6v2h18V6H3zm3 7h12v-2H6v2z" />
                        </svg>
                        <span id="selectedCategoryLabel">Category: All</span>
                        <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2" style="margin-left: 2px;">
                            <polyline points="6 9 12 15 18 9"></polyline>
                        </svg>
                    </button>
                    <div class="filter-dropdown-menu" id="categoryDropdown">
                        <button type="button" class="filter-dropdown-item active" data-val="all" onclick="selectCategory('all', 'All')">All Categories</button>
                        <button type="button" class="filter-dropdown-item" data-val="academic" onclick="selectCategory('academic', 'Academic')">Academic</button>
                        <button type="button" class="filter-dropdown-item" data-val="personal" onclick="selectCategory('personal', 'Personal')">Personal</button>
                        <button type="button" class="filter-dropdown-item" data-val="career" onclick="selectCategory('career', 'Career')">Career</button>
                        <button type="button" class="filter-dropdown-item" data-val="health" onclick="selectCategory('health', 'Health')">Health</button>
                        <button type="button" class="filter-dropdown-item" data-val="finance" onclick="selectCategory('finance', 'Finance')">Finance</button>
                    </div>
                </div>

                <!-- Priority Filter -->
                <div class="filter-dropdown-wrap" id="priorityWrap">
                    <button class="btn-filter priority" id="btnPriorityFilter" type="button" onclick="toggleDropdown('priorityDropdown', event)">
                        <span id="selectedPriorityLabel">Priority: All</span>
                        <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2" style="margin-left: 2px;">
                            <polyline points="6 9 12 15 18 9"></polyline>
                        </svg>
                    </button>
                    <div class="filter-dropdown-menu" id="priorityDropdown">
                        <button type="button" class="filter-dropdown-item active" data-val="all" onclick="selectPriority('all', 'All')">All Priorities</button>
                        <button type="button" class="filter-dropdown-item" data-val="high" onclick="selectPriority('high', 'High')">High Priority</button>
                        <button type="button" class="filter-dropdown-item" data-val="medium" onclick="selectPriority('medium', 'Medium')">Medium Priority</button>
                        <button type="button" class="filter-dropdown-item" data-val="low" onclick="selectPriority('low', 'Low')">Low Priority</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="goals-grid" id="goalsGrid">
            <!-- ================= ACTIVE GOALS ================= -->
            <!-- Goal Card 1 -->
            <div class="goal-card" data-status="active" data-category="academic" data-priority="high" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-academic">ACADEMIC</span>
                        <span class="tag tag-ontrack">ON TRACK</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 65%;">
                        <span>65%</span>
                    </div>
                </div>
                <h3 class="goal-title">Master Advanced Calculus &#128208;</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    Deadline: Dec 15, 2023
                </p>

                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>3 of 4</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 75%;"></div>
                    </div>
                </div>

                <div class="goal-stats">
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        8 Tasks
                    </span>
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                            <path d="M9 16l2 2 4-4"></path>
                        </svg>
                        3 Habits
                    </span>
                </div>
            </div>

            <!-- Goal Card 2 -->
            <div class="goal-card warning" data-status="active" data-category="personal" data-priority="high" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-personal">PERSONAL</span>
                        <span class="tag tag-atrisk">AT RISK</span>
                    </div>
                    <div class="goal-circle-progress at-risk" style="--pct: 30%;">
                        <span>30%</span>
                    </div>
                </div>
                <h3 class="goal-title">Consistent Morning Routine</h3>
                <p class="goal-deadline overdue">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="currentColor">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z" />
                    </svg>
                    Overdue milestones
                </p>

                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>1 of 3</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill at-risk" style="width: 33%;"></div>
                    </div>
                </div>

                <div class="goal-stats">
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        2 Tasks
                    </span>
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                            <path d="M9 16l2 2 4-4"></path>
                        </svg>
                        5 Habits
                    </span>
                </div>
            </div>

            <!-- Goal Card 3 -->
            <div class="goal-card" data-status="active" data-category="career" data-priority="high" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-career">CAREER</span>
                        <span class="tag tag-juststarted">JUST STARTED</span>
                    </div>
                    <div class="goal-circle-progress just-started" style="--pct: 10%;">
                        <span>10%</span>
                    </div>
                </div>
                <h3 class="goal-title">Build UX Portfolio</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    Deadline: Jan 30, 2024
                </p>

                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>0 of 5</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill just-started" style="width: 10%;"></div>
                    </div>
                </div>

                <div class="goal-stats">
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        12 Tasks
                    </span>
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                            <path d="M9 16l2 2 4-4"></path>
                        </svg>
                        1 Habit
                    </span>
                </div>
            </div>

            <!-- Goal Card 4 -->
            <div class="goal-card" data-status="active" data-category="academic" data-priority="high" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-academic">ACADEMIC</span>
                        <span class="tag tag-ontrack">ON TRACK</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 50%;">
                        <span>50%</span>
                    </div>
                </div>
                <h3 class="goal-title">Research Paper Publication</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    Deadline: Nov 28, 2023
                </p>

                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>2 of 4</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 50%;"></div>
                    </div>
                </div>

                <div class="goal-stats">
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        15 Tasks
                    </span>
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                            <path d="M9 16l2 2 4-4"></path>
                        </svg>
                        0 Habits
                    </span>
                </div>
            </div>

            <!-- Goal Card 5 -->
            <div class="goal-card" data-status="active" data-category="health" data-priority="medium" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-health">HEALTH</span>
                        <span class="tag tag-ontrack">ON TRACK</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 60%;">
                        <span>60%</span>
                    </div>
                </div>
                <h3 class="goal-title">Run a Half Marathon</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    Deadline: Oct 20, 2023
                </p>

                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>6 of 10</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 60%;"></div>
                    </div>
                </div>

                <div class="goal-stats">
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        4 Tasks
                    </span>
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                            <path d="M9 16l2 2 4-4"></path>
                        </svg>
                        7 Habits
                    </span>
                </div>
            </div>

            <!-- Goal Card 6 -->
            <div class="goal-card" data-status="active" data-category="finance" data-priority="low" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-finance">FINANCE</span>
                        <span class="tag tag-ontrack">ON TRACK</span>
                    </div>
                    <div class="goal-circle-progress at-risk" style="--pct: 20%;">
                        <span>20%</span>
                    </div>
                </div>
                <h3 class="goal-title">Save $2,000 for Summer Trip</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    Deadline: May 15, 2024
                </p>

                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>1 of 5</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill at-risk" style="width: 20%;"></div>
                    </div>
                </div>

                <div class="goal-stats">
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        3 Tasks
                    </span>
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                            <path d="M9 16l2 2 4-4"></path>
                        </svg>
                        2 Habits
                    </span>
                </div>
            </div>

            <!-- Extra Active Goal 1 (Expandable) -->
            <div class="goal-card" data-status="active" data-extra="true" data-category="academic" data-priority="medium" style="display: none;" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-academic">ACADEMIC</span>
                        <span class="tag tag-ontrack">ON TRACK</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 45%;">
                        <span>45%</span>
                    </div>
                </div>
                <h3 class="goal-title">AI &amp; Machine Learning Foundations</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    Deadline: Mar 10, 2024
                </p>
                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>2 of 5</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 45%;"></div>
                    </div>
                </div>
                <div class="goal-stats">
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        9 Tasks
                    </span>
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                            <path d="M9 16l2 2 4-4"></path>
                        </svg>
                        4 Habits
                    </span>
                </div>
            </div>

            <!-- Extra Active Goal 2 (Expandable) -->
            <div class="goal-card" data-status="active" data-extra="true" data-category="personal" data-priority="low" style="display: none;" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-personal">PERSONAL</span>
                        <span class="tag tag-ontrack">ON TRACK</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 80%;">
                        <span>80%</span>
                    </div>
                </div>
                <h3 class="goal-title">Daily Mindfulness &amp; Journaling</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    Deadline: Dec 31, 2023
                </p>
                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>4 of 5</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 80%;"></div>
                    </div>
                </div>
                <div class="goal-stats">
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        5 Tasks
                    </span>
                    <span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                            <path d="M9 16l2 2 4-4"></path>
                        </svg>
                        6 Habits
                    </span>
                </div>
            </div>

            <!-- ================= COMPLETED GOALS ================= -->
            <div class="goal-card" data-status="completed" data-category="academic" data-priority="high" style="display: none;" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-academic">ACADEMIC</span>
                        <span class="tag tag-completed">COMPLETED</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 100%;">
                        <span>100%</span>
                    </div>
                </div>
                <h3 class="goal-title">Discrete Math &amp; Graph Theory</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="20 6 9 17 4 12"></polyline>
                    </svg>
                    Completed: Oct 15, 2023
                </p>
                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>5 of 5</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 100%; background-color: #10B981;"></div>
                    </div>
                </div>
                <div class="goal-stats">
                    <span>14 Tasks</span>
                    <span>4 Habits</span>
                </div>
            </div>

            <div class="goal-card" data-status="completed" data-category="career" data-priority="medium" style="display: none;" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-career">CAREER</span>
                        <span class="tag tag-completed">COMPLETED</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 100%;">
                        <span>100%</span>
                    </div>
                </div>
                <h3 class="goal-title">Frontend Developer Certification</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="20 6 9 17 4 12"></polyline>
                    </svg>
                    Completed: Sep 20, 2023
                </p>
                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>4 of 4</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 100%; background-color: #10B981;"></div>
                    </div>
                </div>
                <div class="goal-stats">
                    <span>10 Tasks</span>
                    <span>2 Habits</span>
                </div>
            </div>

            <div class="goal-card" data-status="completed" data-category="health" data-priority="high" style="display: none;" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-health">HEALTH</span>
                        <span class="tag tag-completed">COMPLETED</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 100%;">
                        <span>100%</span>
                    </div>
                </div>
                <h3 class="goal-title">30-Day Sleep Optimization Sprint</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="20 6 9 17 4 12"></polyline>
                    </svg>
                    Completed: Aug 31, 2023
                </p>
                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>3 of 3</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 100%; background-color: #10B981;"></div>
                    </div>
                </div>
                <div class="goal-stats">
                    <span>6 Tasks</span>
                    <span>8 Habits</span>
                </div>
            </div>

            <div class="goal-card" data-status="completed" data-category="finance" data-priority="low" style="display: none;" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-finance">FINANCE</span>
                        <span class="tag tag-completed">COMPLETED</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 100%;">
                        <span>100%</span>
                    </div>
                </div>
                <h3 class="goal-title">Emergency Fund Setup ($1,000)</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="20 6 9 17 4 12"></polyline>
                    </svg>
                    Completed: Jul 15, 2023
                </p>
                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>4 of 4</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 100%; background-color: #10B981;"></div>
                    </div>
                </div>
                <div class="goal-stats">
                    <span>4 Tasks</span>
                    <span>1 Habit</span>
                </div>
            </div>

            <!-- ================= ARCHIVED GOALS ================= -->
            <div class="goal-card" data-status="archived" data-category="academic" data-priority="medium" style="display: none;" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-academic">ACADEMIC</span>
                        <span class="tag tag-archived">ARCHIVED</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 70%;">
                        <span>70%</span>
                    </div>
                </div>
                <h3 class="goal-title">Fall Semester Robotics Challenge</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    Archived: Nov 2022
                </p>
                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>3 of 5</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 70%;"></div>
                    </div>
                </div>
                <div class="goal-stats">
                    <span>11 Tasks</span>
                    <span>0 Habits</span>
                </div>
            </div>

            <div class="goal-card" data-status="archived" data-category="personal" data-priority="low" style="display: none;" onclick="window.location.href='GoalDetail.aspx'">
                <div class="goal-card-top">
                    <div class="goal-tags">
                        <span class="tag tag-personal">PERSONAL</span>
                        <span class="tag tag-archived">ARCHIVED</span>
                    </div>
                    <div class="goal-circle-progress" style="--pct: 40%;">
                        <span>40%</span>
                    </div>
                </div>
                <h3 class="goal-title">Winter Guitar Practice Routine</h3>
                <p class="goal-deadline">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    Archived: Jan 2023
                </p>
                <div class="goal-milestones">
                    <div class="milestone-labels">
                        <span>Milestones</span>
                        <span>2 of 6</span>
                    </div>
                    <div class="milestone-track">
                        <div class="milestone-fill" style="width: 40%;"></div>
                    </div>
                </div>
                <div class="goal-stats">
                    <span>2 Tasks</span>
                    <span>3 Habits</span>
                </div>
            </div>

            <!-- Empty State Container -->
            <div class="goals-empty-state" id="goalsEmptyState" style="display: none;">
                <div class="goals-empty-icon">
                    <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="10"></circle>
                        <line x1="8" y1="12" x2="16" y2="12"></line>
                    </svg>
                </div>
                <h3 class="goals-empty-title">No goals found</h3>
                <p class="goals-empty-subtitle">No goals match your current filter settings. Try choosing another category or priority.</p>
                <button type="button" class="btn-reset-filters" onclick="resetFilters()">Reset Filters</button>
            </div>
        </div>

        <div class="goals-footer-action" id="goalsFooterAction">
            <button class="btn-show-more" id="btnShowMore" type="button" onclick="toggleShowMore()">
                <span id="showMoreText">Show more goals</span>
                <svg id="showMoreIcon" viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </button>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        var currentTab = 'active';
        var currentCategory = 'all';
        var currentPriority = 'all';
        var isShowingMore = false;

        function toggleDropdown(dropdownId, event) {
            if (event) event.stopPropagation();
            var target = document.getElementById(dropdownId);
            var isAlreadyOpen = target.classList.contains('show');

            // Close all dropdowns first
            closeAllDropdowns();

            // Toggle target
            if (!isAlreadyOpen) {
                target.classList.add('show');
            }
        }

        function closeAllDropdowns() {
            var menus = document.querySelectorAll('.filter-dropdown-menu');
            menus.forEach(function (menu) {
                menu.classList.remove('show');
            });
        }

        document.addEventListener('click', function (e) {
            if (!e.target.closest('.filter-dropdown-wrap')) {
                closeAllDropdowns();
            }
        });

        function switchGoalTab(tabName, tabElem) {
            currentTab = tabName;
            isShowingMore = false;

            // Update Tab Active Classes
            var tabs = document.querySelectorAll('.goals-tabs .tab-item');
            tabs.forEach(function (t) {
                t.classList.remove('active');
            });
            if (tabElem) {
                tabElem.classList.add('active');
            }

            // Update Subtitle
            var subtitle = document.getElementById('goalsSubtitle');
            if (tabName === 'active') {
                subtitle.innerText = 'You have 6 active academic and personal goals.';
            } else if (tabName === 'completed') {
                subtitle.innerText = 'You have completed 4 goals so far. Outstanding effort!';
            } else if (tabName === 'archived') {
                subtitle.innerText = 'You have 2 archived goals from previous study semesters.';
            }

            // Update Show More Button visibility
            var footerAction = document.getElementById('goalsFooterAction');
            if (footerAction) {
                footerAction.style.display = (tabName === 'active') ? 'block' : 'none';
            }
            updateShowMoreButtonText();

            applyFilters();
        }

        function selectCategory(catVal, catLabel) {
            currentCategory = catVal;
            document.getElementById('selectedCategoryLabel').innerText = 'Category: ' + catLabel;

            // Update active state in category menu
            var items = document.querySelectorAll('#categoryDropdown .filter-dropdown-item');
            items.forEach(function (btn) {
                if (btn.getAttribute('data-val') === catVal) {
                    btn.classList.add('active');
                } else {
                    btn.classList.remove('active');
                }
            });

            closeAllDropdowns();
            applyFilters();
        }

        function selectPriority(prioVal, prioLabel) {
            currentPriority = prioVal;
            document.getElementById('selectedPriorityLabel').innerText = 'Priority: ' + prioLabel;

            // Update active state in priority menu
            var items = document.querySelectorAll('#priorityDropdown .filter-dropdown-item');
            items.forEach(function (btn) {
                if (btn.getAttribute('data-val') === prioVal) {
                    btn.classList.add('active');
                } else {
                    btn.classList.remove('active');
                }
            });

            closeAllDropdowns();
            applyFilters();
        }

        function toggleShowMore() {
            isShowingMore = !isShowingMore;
            updateShowMoreButtonText();
            applyFilters();
        }

        function updateShowMoreButtonText() {
            var lbl = document.getElementById('showMoreText');
            var icon = document.getElementById('showMoreIcon');
            if (lbl && icon) {
                if (isShowingMore) {
                    lbl.innerText = 'Show less goals';
                    icon.innerHTML = '<polyline points="18 15 12 9 6 15"></polyline>';
                } else {
                    lbl.innerText = 'Show more goals';
                    icon.innerHTML = '<polyline points="6 9 12 15 18 9"></polyline>';
                }
            }
        }

        function resetFilters() {
            selectCategory('all', 'All');
            selectPriority('all', 'All');
        }

        function applyFilters() {
            var cards = document.querySelectorAll('.goals-grid .goal-card');
            var visibleCount = 0;

            cards.forEach(function (card) {
                var cardStatus = card.getAttribute('data-status') || 'active';
                var cardCategory = (card.getAttribute('data-category') || '').toLowerCase();
                var cardPriority = (card.getAttribute('data-priority') || '').toLowerCase();
                var isExtra = card.getAttribute('data-extra') === 'true';

                // Status Filter
                var matchesStatus = (cardStatus === currentTab);

                // Category Filter
                var matchesCategory = (currentCategory === 'all' || cardCategory === currentCategory);

                // Priority Filter
                var matchesPriority = (currentPriority === 'all' || cardPriority === currentPriority);

                // Show more logic for active tab extra items
                var matchesExtra = true;
                if (currentTab === 'active' && isExtra && !isShowingMore) {
                    // Only show extra cards if specifically filtered or if show more is active
                    if (currentCategory === 'all' && currentPriority === 'all') {
                        matchesExtra = false;
                    }
                }

                if (matchesStatus && matchesCategory && matchesPriority && matchesExtra) {
                    card.style.display = 'block';
                    visibleCount++;
                } else {
                    card.style.display = 'none';
                }
            });

            var emptyState = document.getElementById('goalsEmptyState');
            if (emptyState) {
                emptyState.style.display = (visibleCount === 0) ? 'flex' : 'none';
            }
        }

        // Initialize on load
        window.addEventListener('DOMContentLoaded', function () {
            applyFilters();
        });
    </script>
</asp:Content>