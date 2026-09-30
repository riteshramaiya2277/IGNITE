<%@ Page Title="Habits" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Habits.aspx.cs" Inherits="IGNITE.Student.Habits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/habits.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="habits-canvas">
        <!-- 1. Header with Title & Create Habit Button -->
        <div class="habits-header">
            <div class="habits-header-text">
                <h1 class="habits-title">Habits</h1>
                <p class="habits-subtitle">Small actions lead to big achievements. Keep it up, <asp:Literal ID="litStudentFirstName" runat="server">Alex</asp:Literal>!</p>
            </div>
            <button type="button" class="btn-create-habit" onclick="openCreateHabitModal()">
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5">
                    <line x1="12" y1="5" x2="12" y2="19"></line>
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                <span>Create Habit</span>
            </button>
        </div>

        <!-- 2. Search & Filter Bar -->
        <div class="habits-filter-bar">
            <div class="search-habits-box">
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
                <input type="text" id="habitSearchInput" class="input-search-habits" placeholder="Search your habits..." onkeyup="filterHabits()" />
            </div>

            <div class="filter-actions">
                <button type="button" class="filter-pill-btn" id="btnCategoryFilter" onclick="toggleCategoryFilter()">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="12 2 2 7 12 12 22 7 12 2"></polygon>
                        <polyline points="2 17 12 22 22 17"></polyline>
                        <polyline points="2 12 12 17 22 12"></polyline>
                    </svg>
                    <span>Category</span>
                </button>

                <button type="button" class="filter-pill-btn active-frequency" id="btnFrequencyFilter">
                    <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    <span>Frequency: Daily</span>
                </button>
            </div>
        </div>

        <!-- 3. Stat Cards Row (4 Cards) -->
        <div class="habits-stats-grid">
            <!-- Card 1: Today's Completion -->
            <div class="stat-card">
                <div class="stat-ring-wrap">
                    <svg class="stat-ring-svg" viewBox="0 0 56 56">
                        <circle class="stat-ring-bg" cx="28" cy="28" r="23"></circle>
                        <circle class="stat-ring-progress" cx="28" cy="28" r="23" stroke-dasharray="144.5" stroke-dashoffset="36.1"></circle>
                    </svg>
                    <span class="stat-ring-text">75%</span>
                </div>
                <div class="stat-card-details">
                    <span class="stat-card-label">TODAY'S COMPLETION</span>
                    <span class="stat-card-value">6 of 8 Tasks</span>
                    <span class="stat-card-delta">&#9650; +12% vs Yesterday</span>
                </div>
            </div>

            <!-- Card 2: Active Habits -->
            <div class="stat-card">
                <div class="stat-card-icon-box">
                    <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                        <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                    </svg>
                </div>
                <div class="stat-card-details">
                    <span class="stat-card-label">ACTIVE HABITS</span>
                    <span class="stat-card-value">12</span>
                    <span class="stat-card-subtext">Tracking 4 categories</span>
                </div>
            </div>

            <!-- Card 3: Best Streak -->
            <div class="stat-card">
                <div class="stat-card-icon-box">
                    <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                    </svg>
                </div>
                <div class="stat-card-details">
                    <span class="stat-card-label">BEST STREAK</span>
                    <span class="stat-card-value">15 Days</span>
                    <span class="stat-badge-milestone">MILESTONE REACHED</span>
                </div>
            </div>

            <!-- Card 4: Active Quest -->
            <div class="stat-card">
                <div class="stat-card-icon-box">
                    <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                    </svg>
                </div>
                <div class="stat-card-details">
                    <span class="stat-card-label">ACTIVE QUEST</span>
                    <span class="stat-card-value">+850 XP</span>
                    <span class="stat-card-delta-gold">TODAY'S POTENTIAL</span>
                </div>
            </div>
        </div>

        <!-- 4. Tab Navigation -->
        <div class="habits-tabs-bar">
            <button type="button" class="habit-tab active" onclick="switchHabitTab(this, 'active')">Active Habits</button>
            <button type="button" class="habit-tab" onclick="switchHabitTab(this, 'archived')">Archived</button>
            <button type="button" class="habit-tab" onclick="switchHabitTab(this, 'history')">History</button>
        </div>

        <!-- 5. Habits List -->
        <div class="habits-cards-list" id="habitsListContainer">
            
            <!-- Habit Item 1: Morning Meditation (Completed) -->
            <div class="habit-card-item habit-card-highlight" data-title="Morning Meditation" data-category="Mental Well-Being">
                <div class="habit-card-left">
                    <button type="button" class="btn-habit-action-circle btn-habit-check" title="Toggle status" onclick="toggleHabitCompleted(this, 'h1')">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3">
                            <polyline points="20 6 9 17 4 12"></polyline>
                        </svg>
                    </button>
                    <div class="habit-card-info">
                        <div class="habit-info-top">
                            <span class="habit-card-title">Morning Meditation</span>
                            <span class="badge-category badge-cat-mental">MENTAL WELL-BEING</span>
                        </div>
                        <div class="habit-info-meta">
                            <span>Binary &bull; Daily</span>
                            <span class="habit-meta-streak">
                                <svg viewBox="0 0 24 24" width="12" height="12">
                                    <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                                </svg>
                                12 Day Streak
                            </span>
                        </div>
                    </div>
                </div>
                <div class="habit-card-right">
                    <div class="habit-progress-column">
                        <div class="habit-progress-header">
                            <span class="habit-progress-label">TODAY'S PROGRESS</span>
                            <span class="habit-progress-fraction" id="h1Fraction">1/1</span>
                        </div>
                        <div class="habit-progress-track">
                            <div class="habit-progress-fill" id="h1Bar" style="width: 100%;"></div>
                        </div>
                    </div>
                    <div class="habit-action-tools">
                        <button type="button" class="btn-tool-icon" title="Edit Habit">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="3"></circle>
                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Pause Habit">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Habit Calendar">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Habit Item 2: Deep Work: Algorithm Study -->
            <div class="habit-card-item" data-title="Deep Work: Algorithm Study" data-category="Academic Excellence">
                <div class="habit-card-left">
                    <button type="button" class="btn-habit-action-circle btn-habit-plus-circle" title="Add progress" onclick="addHabitProgress('h2', 15, 120)">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                    </button>
                    <div class="habit-card-info">
                        <div class="habit-info-top">
                            <span class="habit-card-title">Deep Work: Algorithm Study</span>
                            <span class="badge-category badge-cat-academic">ACADEMIC EXCELLENCE</span>
                        </div>
                        <div class="habit-info-meta">
                            <span>Measurable &bull; 5 days/week</span>
                            <span class="habit-meta-streak">
                                <svg viewBox="0 0 24 24" width="12" height="12">
                                    <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                                </svg>
                                5 Day Streak
                            </span>
                        </div>
                    </div>
                </div>
                <div class="habit-card-right">
                    <div class="habit-progress-column">
                        <div class="habit-progress-header">
                            <span class="habit-progress-label">TODAY'S PROGRESS</span>
                            <span class="habit-progress-fraction" id="h2Fraction">45/120 mins</span>
                        </div>
                        <div class="habit-progress-track">
                            <div class="habit-progress-fill" id="h2Bar" style="width: 37.5%;"></div>
                        </div>
                    </div>
                    <div class="habit-action-tools">
                        <button type="button" class="btn-tool-icon" title="Edit Habit">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="3"></circle>
                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Pause Habit">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Habit Calendar">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Habit Item 3: Hydration: 8oz Glasses -->
            <div class="habit-card-item" data-title="Hydration: 8oz Glasses" data-category="Physical Health">
                <div class="habit-card-left">
                    <button type="button" class="btn-habit-action-circle btn-habit-plus-circle" title="Add 1 glass" onclick="addHabitProgress('h3', 1, 8)">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                    </button>
                    <div class="habit-card-info">
                        <div class="habit-info-top">
                            <span class="habit-card-title">Hydration: 8oz Glasses</span>
                            <span class="badge-category badge-cat-physical">PHYSICAL HEALTH</span>
                        </div>
                        <div class="habit-info-meta">
                            <span>Measurable &bull; Daily</span>
                            <span class="habit-meta-streak">
                                <svg viewBox="0 0 24 24" width="12" height="12">
                                    <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                                </svg>
                                21 Day Streak
                            </span>
                        </div>
                    </div>
                </div>
                <div class="habit-card-right">
                    <div class="habit-progress-column">
                        <div class="habit-progress-header">
                            <span class="habit-progress-label">TODAY'S PROGRESS</span>
                            <span class="habit-progress-fraction" id="h3Fraction">5/8 glasses</span>
                        </div>
                        <div class="habit-progress-track">
                            <div class="habit-progress-fill" id="h3Bar" style="width: 62.5%;"></div>
                        </div>
                    </div>
                    <div class="habit-action-tools">
                        <button type="button" class="btn-tool-icon" title="Edit Habit">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="3"></circle>
                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Pause Habit">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Habit Calendar">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Habit Item 4: Nightly Reading -->
            <div class="habit-card-item" data-title="Nightly Reading" data-category="Personal Growth">
                <div class="habit-card-left">
                    <button type="button" class="btn-habit-action-circle btn-habit-plus-circle" title="Add reading mins" onclick="addHabitProgress('h4', 5, 20)">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                    </button>
                    <div class="habit-card-info">
                        <div class="habit-info-top">
                            <span class="habit-card-title">Nightly Reading</span>
                            <span class="badge-category badge-cat-personal">PERSONAL GROWTH</span>
                        </div>
                        <div class="habit-info-meta">
                            <span>Measurable &bull; Daily</span>
                            <span class="habit-meta-streak">
                                <svg viewBox="0 0 24 24" width="12" height="12">
                                    <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                                </svg>
                                8 Day Streak
                            </span>
                        </div>
                    </div>
                </div>
                <div class="habit-card-right">
                    <div class="habit-progress-column">
                        <div class="habit-progress-header">
                            <span class="habit-progress-label">TODAY'S PROGRESS</span>
                            <span class="habit-progress-fraction" id="h4Fraction">0/20 mins</span>
                        </div>
                        <div class="habit-progress-track">
                            <div class="habit-progress-fill" id="h4Bar" style="width: 0%;"></div>
                        </div>
                    </div>
                    <div class="habit-action-tools">
                        <button type="button" class="btn-tool-icon" title="Edit Habit">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="3"></circle>
                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Pause Habit">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Habit Calendar">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

        </div>

        <!-- 6. View All Habits Bottom Button -->
        <div class="habits-bottom-action">
            <button type="button" class="btn-view-all-habits" onclick="toggleExpandAllHabits(this)">
                <span>View All Habits</span>
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </button>
        </div>
    </div>

    <!-- Create Habit Modal Dialog -->
    <div class="modal-overlay" id="modalCreateHabit">
        <div class="modal-container">
            <div class="modal-header">
                <h3 class="modal-title">Create New Habit</h3>
                <button type="button" class="btn-close-modal" onclick="closeCreateHabitModal()">&times;</button>
            </div>
            <div class="modal-form-group">
                <label class="modal-label">Habit Name</label>
                <input type="text" id="newHabitName" class="modal-input" placeholder="e.g., Morning Run, Daily Journaling" />
            </div>
            <div class="modal-form-group">
                <label class="modal-label">Category</label>
                <select id="newHabitCategory" class="modal-select">
                    <option value="Mental Well-Being">Mental Well-Being</option>
                    <option value="Academic Excellence">Academic Excellence</option>
                    <option value="Physical Health">Physical Health</option>
                    <option value="Personal Growth">Personal Growth</option>
                </select>
            </div>
            <div class="modal-form-group">
                <label class="modal-label">Habit Type</label>
                <select id="newHabitType" class="modal-select">
                    <option value="Binary">Binary (Yes / No)</option>
                    <option value="Measurable">Measurable (Target Value &amp; Unit)</option>
                </select>
            </div>
            <div class="modal-form-group">
                <label class="modal-label">Frequency</label>
                <select id="newHabitFrequency" class="modal-select">
                    <option value="Daily">Daily</option>
                    <option value="5 days/week">5 days/week</option>
                    <option value="Weekly">Weekly</option>
                </select>
            </div>
            <div class="modal-actions">
                <button type="button" class="btn-modal-cancel" onclick="closeCreateHabitModal()">Cancel</button>
                <button type="button" class="btn-modal-submit" onclick="submitNewHabit()">Save Habit</button>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        // @ts-nocheck
        // Real-time habit title and category search filtering
        function filterHabits() {
            var input = document.getElementById('habitSearchInput');
            var filter = input.value.toLowerCase().trim();
            var list = document.getElementById('habitsListContainer');
            var items = list.getElementsByClassName('habit-card-item');

            for (var i = 0; i < items.length; i++) {
                var title = items[i].getAttribute('data-title') || '';
                var category = items[i].getAttribute('data-category') || '';
                if (title.toLowerCase().indexOf(filter) > -1 || category.toLowerCase().indexOf(filter) > -1) {
                    items[i].style.display = 'flex';
                } else {
                    items[i].style.display = 'none';
                }
            }
        }

        // Toggle category filter cycling
        var categories = ['All', 'Mental Well-Being', 'Academic Excellence', 'Physical Health', 'Personal Growth'];
        var currentCatIndex = 0;

        function toggleCategoryFilter() {
            currentCatIndex = (currentCatIndex + 1) % categories.length;
            var selectedCat = categories[currentCatIndex];
            var btn = document.getElementById('btnCategoryFilter');
            btn.querySelector('span').innerText = selectedCat === 'All' ? 'Category' : selectedCat;

            var list = document.getElementById('habitsListContainer');
            var items = list.getElementsByClassName('habit-card-item');

            for (var i = 0; i < items.length; i++) {
                var cat = items[i].getAttribute('data-category') || '';
                if (selectedCat === 'All' || cat === selectedCat) {
                    items[i].style.display = 'flex';
                } else {
                    items[i].style.display = 'none';
                }
            }
        }

        // Tab switching
        function switchHabitTab(btn, tabName) {
            var tabs = document.querySelectorAll('.habit-tab');
            tabs.forEach(function (t) { t.classList.remove('active'); });
            btn.classList.add('active');
        }

        // Habit state toggling
        function toggleHabitCompleted(btn, id) {
            var card = btn.closest('.habit-card-item');
            var frac = document.getElementById(id + 'Fraction');
            var bar = document.getElementById(id + 'Bar');

            if (card.classList.contains('habit-card-highlight')) {
                card.classList.remove('habit-card-highlight');
                btn.className = 'btn-habit-action-circle btn-habit-plus-circle';
                btn.innerHTML = '<svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>';
                if (frac) frac.innerText = '0/1';
                if (bar) bar.style.width = '0%';
            } else {
                card.classList.add('habit-card-highlight');
                btn.className = 'btn-habit-action-circle btn-habit-check';
                btn.innerHTML = '<svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>';
                if (frac) frac.innerText = '1/1';
                if (bar) bar.style.width = '100%';
            }
        }

        // Measurable progress increment
        var habitProgressState = {
            'h2': { current: 45, max: 120, unit: ' mins' },
            'h3': { current: 5, max: 8, unit: ' glasses' },
            'h4': { current: 0, max: 20, unit: ' mins' }
        };

        function addHabitProgress(id, step, max) {
            if (!habitProgressState[id]) {
                habitProgressState[id] = { current: 0, max: max, unit: '' };
            }
            var h = habitProgressState[id];
            h.current = Math.min(h.max, h.current + step);
            if (h.current >= h.max) {
                h.current = 0; // cycle back for demo
            }

            var pct = (h.current / h.max) * 100;
            var frac = document.getElementById(id + 'Fraction');
            var bar = document.getElementById(id + 'Bar');

            if (frac) frac.innerText = h.current + '/' + h.max + h.unit;
            if (bar) bar.style.width = pct + '%';
        }

        // Modal open/close
        function openCreateHabitModal() {
            document.getElementById('modalCreateHabit').classList.add('open');
        }

        function closeCreateHabitModal() {
            document.getElementById('modalCreateHabit').classList.remove('open');
        }

        function submitNewHabit() {
            var name = document.getElementById('newHabitName').value.trim();
            if (!name) {
                alert('Please enter a habit name.');
                return;
            }
            alert('Habit "' + name + '" created successfully!');
            closeCreateHabitModal();
        }

        function toggleExpandAllHabits(btn) {
            alert('Displaying all 12 tracked habits.');
        }
    </script>
</asp:Content>
