<%@ Page Title="Goals" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true"
    CodeBehind="Goals.aspx.cs" Inherits="IGNITE.Student.Goals" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="<%= ResolveUrl(" ~/Content/dashboard.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl(" ~/Content/goals.css") %>" rel="stylesheet" type="text/css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
        Dashboard
    </asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <div class="goals-canvas">
            <div class="goals-header-row">
                <div class="goals-title-area">
                    <h1 class="goals-main-title">Goals</h1>
                    <p class="goals-subtitle">You have 6 active academic and personal goals.</p>
                </div>
                <button class="btn-add-goal" type="button">+ Add Goal</button>
            </div>

            <div class="goals-filters-row">
                <div class="goals-tabs">
                    <a href="#" class="tab-item active">Active (6)</a>
                    <a href="#" class="tab-item">Completed (12)</a>
                    <a href="#" class="tab-item">Archived (2)</a>
                </div>
                <div class="goals-filter-dropdowns">
                    <button class="btn-filter" type="button">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="currentColor">
                            <path d="M10 18h4v-2h-4v2zM3 6v2h18V6H3zm3 7h12v-2H6v2z" />
                        </svg>
                        Category: All
                    </button>
                    <button class="btn-filter priority" type="button">Priority: High</button>
                </div>
            </div>

            <div class="goals-grid">
                <!-- Goal Card 1 -->
                <div class="goal-card">
                    <div class="goal-card-top">
                        <div class="goal-tags">
                            <span class="tag tag-academic">ACADEMIC</span>
                            <span class="tag tag-ontrack">ON TRACK</span>
                        </div>
                        <div class="goal-circle-progress" style="--pct: 75%;">
                            <span>75%</span>
                        </div>
                    </div>
                    <h3 class="goal-title">Master Calculus Fundamentals</h3>
                    <p class="goal-deadline">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2">
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
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                            8 Tasks
                        </span>
                        <span>
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
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
                <div class="goal-card warning">
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
                            <path
                                d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z" />
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
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                            2 Tasks
                        </span>
                        <span>
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
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
                <div class="goal-card">
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
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2">
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
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                            12 Tasks
                        </span>
                        <span>
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
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
                <div class="goal-card">
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
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2">
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
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                            15 Tasks
                        </span>
                        <span>
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
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
                <div class="goal-card">
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
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2">
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
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                            4 Tasks
                        </span>
                        <span>
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
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
                <div class="goal-card">
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
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2">
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
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                            3 Tasks
                        </span>
                        <span>
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                stroke-width="2">
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

            </div>

            <div class="goals-footer-action">
                <button class="btn-show-more" type="button">Show more goals <svg viewBox="0 0 24 24" width="14"
                        height="14" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="6 9 12 15 18 9"></polyline>
                    </svg></button>
            </div>
        </div>
    </asp:Content>

    <asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    </asp:Content>