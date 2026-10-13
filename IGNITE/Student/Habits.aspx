<%@ Page Title="Habits" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Habits.aspx.cs" Inherits="IGNITE.Student.Habits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/habits.css") %>" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .filter-dropdown-wrapper {
            position: relative;
            display: inline-block;
        }

        .filter-dropdown-menu {
            display: none;
            position: absolute;
            top: calc(100% + 6px);
            right: 0;
            background-color: #FFFFFF;
            border: 1px solid #DDD6CA;
            border-radius: 14px;
            box-shadow: 0 10px 28px rgba(0, 0, 0, 0.12);
            min-width: 210px;
            padding: 6px;
            z-index: 1000;
            flex-direction: column;
            gap: 2px;
        }

        .filter-dropdown-menu.show {
            display: flex !important;
            animation: dropdownFade 0.15s ease-out;
        }

        @keyframes dropdownFade {
            from {
                opacity: 0;
                transform: translateY(-4px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .filter-dropdown-item {
            padding: 9px 14px;
            font-size: 0.84rem;
            font-weight: 600;
            color: #57534E;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.12s, color 0.12s;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border: none;
            background: none;
            text-align: left;
            width: 100%;
        }

        .filter-dropdown-item:hover {
            background-color: #FAF8F5;
            color: #DF6A74;
        }

        .filter-dropdown-item.active {
            background-color: #F8DFE1;
            color: #C74856;
            font-weight: 700;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Fail-safe stylesheet link -->
    <link href="../Content/habits.css" rel="stylesheet" type="text/css" />

    <div class="habits-canvas">
        <!-- 1. Header with Title & Create Habit Button -->
        <div class="habits-header">
            <div class="habits-header-text">
                <h1 class="habits-title">Habits</h1>
                <p class="habits-subtitle">Small actions lead to big achievements. Keep it up, Alex!</p>
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
                <input type="text" id="habitSearchInput" class="input-search-habits" placeholder="Search your habits..." oninput="applyFilters()" />
            </div>

            <div class="filter-actions">
                <!-- Category Filter Dropdown -->
                <div class="filter-dropdown-wrapper">
                    <button type="button" class="filter-pill-btn" id="btnCategoryFilter" onclick="toggleCategoryDropdown(event)">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                            <polygon points="12 2 2 7 12 12 22 7 12 2"></polygon>
                            <polyline points="2 17 12 22 22 17"></polyline>
                            <polyline points="2 12 12 17 22 12"></polyline>
                        </svg>
                        <span id="txtCategoryFilter">Category</span>
                        <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2" style="margin-left: 2px;">
                            <polyline points="6 9 12 15 18 9"></polyline>
                        </svg>
                    </button>
                    <div class="filter-dropdown-menu" id="categoryDropdownMenu" style="display: none;">
                        <button type="button" class="filter-dropdown-item active" onclick="selectCategory('All', event)">All Categories</button>
                        <button type="button" class="filter-dropdown-item" onclick="selectCategory('Mental Well-Being', event)">Mental Well-Being</button>
                        <button type="button" class="filter-dropdown-item" onclick="selectCategory('Academic Excellence', event)">Academic Excellence</button>
                        <button type="button" class="filter-dropdown-item" onclick="selectCategory('Physical Health', event)">Physical Health</button>
                        <button type="button" class="filter-dropdown-item" onclick="selectCategory('Personal Growth', event)">Personal Growth</button>
                    </div>
                </div>

                <!-- Frequency Filter Dropdown -->
                <div class="filter-dropdown-wrapper">
                    <button type="button" class="filter-pill-btn active-frequency" id="btnFrequencyFilter" onclick="toggleFrequencyDropdown(event)">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                        <span id="txtFrequencyFilter">Frequency: All</span>
                        <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2" style="margin-left: 2px;">
                            <polyline points="6 9 12 15 18 9"></polyline>
                        </svg>
                    </button>
                    <div class="filter-dropdown-menu" id="frequencyDropdownMenu" style="display: none;">
                        <button type="button" class="filter-dropdown-item active" onclick="selectFrequency('All', event)">All Frequencies</button>
                        <button type="button" class="filter-dropdown-item" onclick="selectFrequency('Daily', event)">Frequency: Daily</button>
                        <button type="button" class="filter-dropdown-item" onclick="selectFrequency('5 days/week', event)">Frequency: 5 days/week</button>
                        <button type="button" class="filter-dropdown-item" onclick="selectFrequency('Weekly', event)">Frequency: Weekly</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3. Stat Cards Row (4 Cards) -->
        <div class="habits-stats-grid">
            <!-- Card 1: Today's Completion -->
            <div class="stat-card" id="cardTodayCompletion" title="Today's habit completion status">
                <div class="stat-ring-wrap">
                    <svg class="stat-ring-svg" viewBox="0 0 56 56">
                        <circle class="stat-ring-bg" cx="28" cy="28" r="23"></circle>
                        <circle class="stat-ring-progress" id="completionRingProgress" cx="28" cy="28" r="23" stroke-dasharray="144.5" stroke-dashoffset="36.1"></circle>
                    </svg>
                    <span class="stat-ring-text" id="completionRingText">75%</span>
                </div>
                <div class="stat-card-details">
                    <span class="stat-card-label">TODAY'S COMPLETION</span>
                    <span class="stat-card-value" id="completionCardValue">3 of 4 Tasks</span>
                    <span class="stat-card-delta" id="completionDelta">&#9650; +12% vs Yesterday</span>
                </div>
            </div>

            <!-- Card 2: Active Habits -->
            <div class="stat-card" style="cursor: pointer;" onclick="switchHabitTab(document.querySelector('.habit-tab'), 'active')" title="View Active Habits">
                <div class="stat-card-icon-box">
                    <svg viewBox="0 0 24 24" width="24" height="24" stroke-width="2">
                        <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                        <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                    </svg>
                </div>
                <div class="stat-card-details">
                    <span class="stat-card-label">ACTIVE HABITS</span>
                    <span class="stat-card-value" id="activeHabitsCardValue">4</span>
                    <span class="stat-card-subtext" id="activeHabitsCatCount">Tracking 4 categories</span>
                </div>
            </div>

            <!-- Card 3: Best Streak -->
            <div class="stat-card" style="cursor: pointer;" onclick="showToast('Milestone achieved: 15-Day active streak!')" title="Best Streak Milestone">
                <div class="stat-card-icon-box">
                    <svg viewBox="0 0 24 24" width="24" height="24" stroke-width="2">
                        <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                    </svg>
                </div>
                <div class="stat-card-details">
                    <span class="stat-card-label">BEST STREAK</span>
                    <span class="stat-card-value">15 Days</span>
                    <span class="stat-badge-milestone">MILESTONE REACHED</span>
                </div>
            </div>

            <!-- Card 4: Active Quest -> Links to Quests.aspx -->
            <div class="stat-card" style="cursor: pointer;" onclick="window.location.href='Quests.aspx';" title="View Active Quests (+850 XP Potential)">
                <div class="stat-card-icon-box">
                    <svg viewBox="0 0 24 24" width="24" height="24" stroke-width="2">
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

        <!-- 4. Tab Navigation Bar -->
        <div class="habits-tabs-bar">
            <button type="button" class="habit-tab active" onclick="switchHabitTab(this, 'active')">Active Habits</button>
            <button type="button" class="habit-tab" onclick="switchHabitTab(this, 'archived')">Archived</button>
            <button type="button" class="habit-tab" onclick="switchHabitTab(this, 'history')">History</button>
        </div>

        <!-- 5. Active Habits List Container -->
        <div class="habits-cards-list" id="habitsListContainer">
            
            <!-- Habit Item 1: Morning Meditation (Completed Highlighted) -> Links to HabitDetailBinary.aspx -->
            <div class="habit-card-item habit-card-highlight" id="habit_h1" data-id="h1" data-title="Morning Meditation" data-category="Mental Well-Being" data-frequency="Daily" data-type="binary" data-target="1" data-unit="" data-status="active" onclick="openHabitDetail('HabitDetailBinary.aspx', event)" title="View Morning Meditation details">
                <div class="habit-card-left">
                    <button type="button" class="btn-habit-action-circle btn-habit-check" title="Toggle status" onclick="toggleHabitCompleted(this, 'h1', event)">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3">
                            <polyline points="20 6 9 17 4 12"></polyline>
                        </svg>
                    </button>
                    <div class="habit-card-info">
                        <div class="habit-info-top">
                            <span class="habit-card-title">Morning Meditation</span>
                            <span class="badge-category badge-cat-mental">MENTAL WELL-BEING</span>
                            <span class="badge-paused" style="display: none;">PAUSED</span>
                        </div>
                        <div class="habit-info-meta">
                            <span class="meta-frequency-text">Binary &bull; Daily</span>
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
                        <button type="button" class="btn-tool-icon" title="Edit Habit" onclick="openEditHabitModal('h1', event)">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="3"></circle>
                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Pause Habit" onclick="togglePauseHabit('h1', event)">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Habit Calendar" onclick="openHabitCalendar('HabitDetailBinary.aspx', event)">
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

            <!-- Habit Item 2: Deep Work: Algorithm Study -> Links to HabitDetailMeasurable.aspx -->
            <div class="habit-card-item" id="habit_h2" data-id="h2" data-title="Deep Work: Algorithm Study" data-category="Academic Excellence" data-frequency="5 days/week" data-type="measurable" data-target="120" data-unit="mins" data-status="active" onclick="openHabitDetail('HabitDetailMeasurable.aspx', event)" title="View Deep Work details">
                <div class="habit-card-left">
                    <button type="button" class="btn-habit-action-circle btn-habit-plus-circle" id="h2ActionBtn" title="Add progress" onclick="addHabitProgress('h2', 15, 120, 'mins', event)">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                    </button>
                    <div class="habit-card-info">
                        <div class="habit-info-top">
                            <span class="habit-card-title">Deep Work: Algorithm Study</span>
                            <span class="badge-category badge-cat-academic">ACADEMIC EXCELLENCE</span>
                            <span class="badge-paused" style="display: none;">PAUSED</span>
                        </div>
                        <div class="habit-info-meta">
                            <span class="meta-frequency-text">Measurable &bull; 5 days/week</span>
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
                        <button type="button" class="btn-tool-icon" title="Edit Habit" onclick="openEditHabitModal('h2', event)">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="3"></circle>
                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Pause Habit" onclick="togglePauseHabit('h2', event)">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Habit Calendar" onclick="openHabitCalendar('HabitDetailMeasurable.aspx', event)">
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
            <div class="habit-card-item" id="habit_h3" data-id="h3" data-title="Hydration: 8oz Glasses" data-category="Physical Health" data-frequency="Daily" data-type="measurable" data-target="8" data-unit="glasses" data-status="active" onclick="openHabitDetail('HabitDetailMeasurable.aspx', event)" title="View Hydration details">
                <div class="habit-card-left">
                    <button type="button" class="btn-habit-action-circle btn-habit-plus-circle" id="h3ActionBtn" title="Add progress" onclick="addHabitProgress('h3', 1, 8, 'glasses', event)">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                    </button>
                    <div class="habit-card-info">
                        <div class="habit-info-top">
                            <span class="habit-card-title">Hydration: 8oz Glasses</span>
                            <span class="badge-category badge-cat-physical">PHYSICAL HEALTH</span>
                            <span class="badge-paused" style="display: none;">PAUSED</span>
                        </div>
                        <div class="habit-info-meta">
                            <span class="meta-frequency-text">Measurable &bull; Daily</span>
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
                        <button type="button" class="btn-tool-icon" title="Edit Habit" onclick="openEditHabitModal('h3', event)">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="3"></circle>
                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Pause Habit" onclick="togglePauseHabit('h3', event)">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Habit Calendar" onclick="openHabitCalendar('HabitDetailMeasurable.aspx', event)">
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
            <div class="habit-card-item" id="habit_h4" data-id="h4" data-title="Nightly Reading" data-category="Personal Growth" data-frequency="Daily" data-type="measurable" data-target="20" data-unit="mins" data-status="active" onclick="openHabitDetail('HabitDetailMeasurable.aspx', event)" title="View Nightly Reading details">
                <div class="habit-card-left">
                    <button type="button" class="btn-habit-action-circle btn-habit-plus-circle" id="h4ActionBtn" title="Add progress" onclick="addHabitProgress('h4', 5, 20, 'mins', event)">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                    </button>
                    <div class="habit-card-info">
                        <div class="habit-info-top">
                            <span class="habit-card-title">Nightly Reading</span>
                            <span class="badge-category badge-cat-personal">PERSONAL GROWTH</span>
                            <span class="badge-paused" style="display: none;">PAUSED</span>
                        </div>
                        <div class="habit-info-meta">
                            <span class="meta-frequency-text">Measurable &bull; Daily</span>
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
                        <button type="button" class="btn-tool-icon" title="Edit Habit" onclick="openEditHabitModal('h4', event)">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="3"></circle>
                                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Pause Habit" onclick="togglePauseHabit('h4', event)">
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn-tool-icon" title="Habit Calendar" onclick="openHabitCalendar('HabitDetailMeasurable.aspx', event)">
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

        <!-- 5b. Archived Habits List Container -->
        <div class="habits-cards-list" id="archivedListContainer" style="display: none;">
            <div class="habits-empty-state" id="archivedEmptyState">
                <div class="habits-empty-icon">
                    <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                        <rect x="1" y="3" width="22" height="5"></rect>
                        <line x1="10" y1="12" x2="14" y2="12"></line>
                    </svg>
                </div>
                <h4 class="habits-empty-title">No Archived Habits</h4>
                <p class="habits-empty-desc">Habits you pause or archive will be stored here so you can reactivate them anytime without losing your past records.</p>
            </div>
        </div>

        <!-- 5c. History Tab Container -->
        <div class="history-list" id="historyListContainer" style="display: none;">
            <div class="history-item">
                <div class="history-item-left">
                    <div class="history-status-icon">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3">
                            <polyline points="20 6 9 17 4 12"></polyline>
                        </svg>
                    </div>
                    <div class="history-item-info">
                        <span class="history-habit-title">Morning Meditation</span>
                        <span class="history-habit-time">Completed today at 07:30 AM &bull; 12 Day Streak</span>
                    </div>
                </div>
                <div class="history-item-right">
                    <span class="history-xp-pill">+15 XP EARNED</span>
                </div>
            </div>

            <div class="history-item">
                <div class="history-item-left">
                    <div class="history-status-icon">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3">
                            <polyline points="20 6 9 17 4 12"></polyline>
                        </svg>
                    </div>
                    <div class="history-item-info">
                        <span class="history-habit-title">Hydration: 8oz Glasses</span>
                        <span class="history-habit-time">Completed yesterday at 08:45 PM &bull; 21 Day Streak</span>
                    </div>
                </div>
                <div class="history-item-right">
                    <span class="history-xp-pill">+25 XP EARNED</span>
                </div>
            </div>

            <div class="history-item">
                <div class="history-item-left">
                    <div class="history-status-icon">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3">
                            <polyline points="20 6 9 17 4 12"></polyline>
                        </svg>
                    </div>
                    <div class="history-item-info">
                        <span class="history-habit-title">Deep Work: Algorithm Study</span>
                        <span class="history-habit-time">Completed 2 days ago (120 mins) &bull; 5 Day Streak</span>
                    </div>
                </div>
                <div class="history-item-right">
                    <span class="history-xp-pill">+50 XP EARNED</span>
                </div>
            </div>

            <div class="history-item">
                <div class="history-item-left">
                    <div class="history-status-icon">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3">
                            <polyline points="20 6 9 17 4 12"></polyline>
                        </svg>
                    </div>
                    <div class="history-item-info">
                        <span class="history-habit-title">Nightly Reading</span>
                        <span class="history-habit-time">Completed 3 days ago (20 mins) &bull; 8 Day Streak</span>
                    </div>
                </div>
                <div class="history-item-right">
                    <span class="history-xp-pill">+20 XP EARNED</span>
                </div>
            </div>
        </div>

        <!-- 6. View All Habits Bottom Button -> Flows to the Categorized Hub Page -->
        <div class="habits-bottom-action">
            <button type="button" class="btn-view-all-habits" onclick="window.location.href='HabitHub.aspx';">
                <span>View All Habits in Hub</span>
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </button>
        </div>
    </div>

    <!-- Create Habit Modal Dialog -->
    <div class="modal-overlay" id="modalCreateHabit" onclick="handleModalOverlayClick(event, 'modalCreateHabit')">
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
                <select id="newHabitType" class="modal-select" onchange="toggleHabitTypeFields()">
                    <option value="Binary">Binary (Yes / No)</option>
                    <option value="Measurable">Measurable (Target Value &amp; Unit)</option>
                </select>
            </div>
            <div class="modal-form-group" id="groupMeasurableFields" style="display: none;">
                <label class="modal-label">Target &amp; Unit</label>
                <div class="modal-form-row">
                    <input type="number" id="newHabitTarget" class="modal-input" placeholder="Target e.g., 60" value="30" min="1" />
                    <input type="text" id="newHabitUnit" class="modal-input" placeholder="Unit e.g., mins, pages" value="mins" />
                </div>
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

    <!-- Edit Habit Modal Dialog -->
    <div class="modal-overlay" id="modalEditHabit" onclick="handleModalOverlayClick(event, 'modalEditHabit')">
        <div class="modal-container">
            <div class="modal-header">
                <h3 class="modal-title">Edit Habit</h3>
                <button type="button" class="btn-close-modal" onclick="closeEditHabitModal()">&times;</button>
            </div>
            <input type="hidden" id="editHabitId" value="" />
            <div class="modal-form-group">
                <label class="modal-label">Habit Name</label>
                <input type="text" id="editHabitName" class="modal-input" />
            </div>
            <div class="modal-form-group">
                <label class="modal-label">Category</label>
                <select id="editHabitCategory" class="modal-select">
                    <option value="Mental Well-Being">Mental Well-Being</option>
                    <option value="Academic Excellence">Academic Excellence</option>
                    <option value="Physical Health">Physical Health</option>
                    <option value="Personal Growth">Personal Growth</option>
                </select>
            </div>
            <div class="modal-form-group" id="editGroupMeasurableFields" style="display: none;">
                <label class="modal-label">Target &amp; Unit</label>
                <div class="modal-form-row">
                    <input type="number" id="editHabitTarget" class="modal-input" placeholder="Target" min="1" />
                    <input type="text" id="editHabitUnit" class="modal-input" placeholder="Unit" />
                </div>
            </div>
            <div class="modal-form-group">
                <label class="modal-label">Frequency</label>
                <select id="editHabitFrequency" class="modal-select">
                    <option value="Daily">Daily</option>
                    <option value="5 days/week">5 days/week</option>
                    <option value="Weekly">Weekly</option>
                </select>
            </div>
            <div class="modal-actions">
                <button type="button" class="btn-modal-cancel" onclick="closeEditHabitModal()">Cancel</button>
                <button type="button" class="btn-modal-submit" onclick="submitEditHabit()">Save Changes</button>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        // Global state for filters & habits
        var activeTab = 'active'; // 'active' | 'archived' | 'history'
        var activeCategory = 'All';
        var activeFrequency = 'All';
        var habitIdCounter = 5;

        var habitProgressState = {
            'h1': { current: 1, max: 1, unit: '', type: 'binary' },
            'h2': { current: 45, max: 120, unit: ' mins', type: 'measurable' },
            'h3': { current: 5, max: 8, unit: ' glasses', type: 'measurable' },
            'h4': { current: 0, max: 20, unit: ' mins', type: 'measurable' }
        };

        // Navigate to Habit Detail on card click (ignoring inner buttons)
        function openHabitDetail(url, event) {
            if (event && event.target && (event.target.tagName === 'BUTTON' || event.target.closest('button'))) {
                return;
            }
            window.location.href = url;
        }

        // Calendar icon button navigation
        function openHabitCalendar(url, event) {
            if (event) event.stopPropagation();
            window.location.href = url;
        }

        // Dropdown toggle handlers
        function toggleCategoryDropdown(e) {
            if (e) e.stopPropagation();
            var menu = document.getElementById('categoryDropdownMenu');
            var isCurrentlyOpen = menu && (menu.classList.contains('show') || menu.style.display === 'flex');
            closeAllDropdowns();
            if (menu && !isCurrentlyOpen) {
                menu.classList.add('show');
                menu.style.display = 'flex';
            }
        }

        function toggleFrequencyDropdown(e) {
            if (e) e.stopPropagation();
            var menu = document.getElementById('frequencyDropdownMenu');
            var isCurrentlyOpen = menu && (menu.classList.contains('show') || menu.style.display === 'flex');
            closeAllDropdowns();
            if (menu && !isCurrentlyOpen) {
                menu.classList.add('show');
                menu.style.display = 'flex';
            }
        }

        function closeAllDropdowns(exceptId) {
            var menus = document.querySelectorAll('.filter-dropdown-menu');
            menus.forEach(function (m) {
                if (!exceptId || m.id !== exceptId) {
                    m.classList.remove('show');
                    m.style.display = 'none';
                }
            });
        }

        document.addEventListener('click', function () {
            closeAllDropdowns();
        });

        function selectCategory(category, e) {
            if (e) e.stopPropagation();
            activeCategory = category;
            var label = document.getElementById('txtCategoryFilter');
            if (label) label.innerText = category === 'All' ? 'Category' : category;

            // Highlight active item
            var items = document.querySelectorAll('#categoryDropdownMenu .filter-dropdown-item');
            items.forEach(function (btn) {
                if (btn.innerText.trim() === (category === 'All' ? 'All Categories' : category)) {
                    btn.classList.add('active');
                } else {
                    btn.classList.remove('active');
                }
            });

            closeAllDropdowns();
            applyFilters();
        }

        function selectFrequency(freq, e) {
            if (e) e.stopPropagation();
            activeFrequency = freq;
            var label = document.getElementById('txtFrequencyFilter');
            if (label) label.innerText = freq === 'All' ? 'Frequency: All' : 'Frequency: ' + freq;

            var items = document.querySelectorAll('#frequencyDropdownMenu .filter-dropdown-item');
            items.forEach(function (btn) {
                if (btn.innerText.indexOf(freq) > -1) {
                    btn.classList.add('active');
                } else {
                    btn.classList.remove('active');
                }
            });

            closeAllDropdowns();
            applyFilters();
        }

        // Unified multi-criteria filter
        function applyFilters() {
            var searchInput = document.getElementById('habitSearchInput');
            var query = searchInput ? searchInput.value.toLowerCase().trim() : '';

            var container = activeTab === 'archived' ? document.getElementById('archivedListContainer') : document.getElementById('habitsListContainer');
            if (!container) return;

            var items = container.getElementsByClassName('habit-card-item');
            var visibleCount = 0;

            for (var i = 0; i < items.length; i++) {
                var title = (items[i].getAttribute('data-title') || '').toLowerCase();
                var category = items[i].getAttribute('data-category') || '';
                var frequency = items[i].getAttribute('data-frequency') || '';

                var matchesSearch = !query || title.indexOf(query) > -1 || category.toLowerCase().indexOf(query) > -1;
                var matchesCat = activeCategory === 'All' || category === activeCategory;
                var matchesFreq = activeFrequency === 'All' || frequency.toLowerCase().indexOf(activeFrequency.toLowerCase()) > -1;

                if (matchesSearch && matchesCat && matchesFreq) {
                    items[i].style.display = 'flex';
                    visibleCount++;
                } else {
                    items[i].style.display = 'none';
                }
            }

            // Handle archived empty state
            var emptyState = document.getElementById('archivedEmptyState');
            if (emptyState && activeTab === 'archived') {
                emptyState.style.display = (visibleCount === 0) ? 'flex' : 'none';
            }
        }

        // Tab switching
        function switchHabitTab(btn, tabName) {
            activeTab = tabName;
            var tabs = document.querySelectorAll('.habit-tab');
            tabs.forEach(function (t) { t.classList.remove('active'); });
            if (btn) btn.classList.add('active');

            var listActive = document.getElementById('habitsListContainer');
            var listArchived = document.getElementById('archivedListContainer');
            var listHistory = document.getElementById('historyListContainer');

            if (tabName === 'active') {
                if (listActive) listActive.style.display = 'flex';
                if (listArchived) listArchived.style.display = 'none';
                if (listHistory) listHistory.style.display = 'none';
            } else if (tabName === 'archived') {
                if (listActive) listActive.style.display = 'none';
                if (listArchived) listArchived.style.display = 'flex';
                if (listHistory) listHistory.style.display = 'none';
            } else if (tabName === 'history') {
                if (listActive) listActive.style.display = 'none';
                if (listArchived) listArchived.style.display = 'none';
                if (listHistory) listHistory.style.display = 'flex';
            }
            applyFilters();
        }

        // Toggle Binary Habit Completed
        function toggleHabitCompleted(btn, id, e) {
            if (e) e.stopPropagation();
            var card = document.getElementById('habit_' + id) || btn.closest('.habit-card-item');
            var frac = document.getElementById(id + 'Fraction');
            var bar = document.getElementById(id + 'Bar');

            if (!card) return;

            if (card.classList.contains('habit-card-highlight')) {
                card.classList.remove('habit-card-highlight');
                btn.className = 'btn-habit-action-circle btn-habit-plus-circle';
                btn.innerHTML = '<svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>';
                if (frac) frac.innerText = '0/1';
                if (bar) bar.style.width = '0%';
                if (habitProgressState[id]) habitProgressState[id].current = 0;
                showToast("Habit marked as incomplete.");
            } else {
                card.classList.add('habit-card-highlight');
                btn.className = 'btn-habit-action-circle btn-habit-check';
                btn.innerHTML = '<svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>';
                if (frac) frac.innerText = '1/1';
                if (bar) bar.style.width = '100%';
                if (habitProgressState[id]) habitProgressState[id].current = 1;
                showToast("Morning Meditation completed! +15 XP earned!");
            }
            updateStats();
        }

        // Add Measurable Progress
        function addHabitProgress(id, step, max, unit, e) {
            if (e) e.stopPropagation();
            if (!habitProgressState[id]) {
                habitProgressState[id] = { current: 0, max: max, unit: ' ' + unit, type: 'measurable' };
            }
            var h = habitProgressState[id];
            var card = document.getElementById('habit_' + id);
            var actionBtn = document.getElementById(id + 'ActionBtn') || (card ? card.querySelector('.btn-habit-action-circle') : null);

            // If already at max, clicking resets or allows redo
            if (h.current >= h.max) {
                h.current = 0;
                if (card) card.classList.remove('habit-card-highlight');
                if (actionBtn) {
                    actionBtn.className = 'btn-habit-action-circle btn-habit-plus-circle';
                    actionBtn.innerHTML = '<svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>';
                }
                showToast("Progress reset for today.");
            } else {
                h.current = Math.min(h.max, h.current + step);
                if (h.current >= h.max) {
                    if (card) card.classList.add('habit-card-highlight');
                    if (actionBtn) {
                        actionBtn.className = 'btn-habit-action-circle btn-habit-check';
                        actionBtn.innerHTML = '<svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>';
                    }
                    showToast("Goal reached! +50 XP earned!");
                } else {
                    showToast("Added progress: " + h.current + "/" + h.max + h.unit);
                }
            }

            var pct = Math.min(100, (h.current / h.max) * 100);
            var frac = document.getElementById(id + 'Fraction');
            var bar = document.getElementById(id + 'Bar');

            if (frac) frac.innerText = h.current + '/' + h.max + h.unit;
            if (bar) bar.style.width = pct + '%';

            updateStats();
        }

        // Toggle Pause Habit
        function togglePauseHabit(id, e) {
            if (e) e.stopPropagation();
            var card = document.getElementById('habit_' + id);
            if (!card) return;

            var title = card.getAttribute('data-title') || 'Habit';
            var pausedBadge = card.querySelector('.badge-paused');
            var pauseBtn = card.querySelector('button[title="Pause Habit"], button[title="Resume Habit"]');
            var isPaused = card.classList.contains('habit-paused');

            if (isPaused) {
                card.classList.remove('habit-paused');
                card.setAttribute('data-status', 'active');
                if (pausedBadge) pausedBadge.style.display = 'none';
                if (pauseBtn) {
                    pauseBtn.title = 'Pause Habit';
                    pauseBtn.classList.remove('btn-paused');
                }
                // If it was in archived container, move back to active
                var activeList = document.getElementById('habitsListContainer');
                if (card.parentElement.id === 'archivedListContainer') {
                    activeList.appendChild(card);
                }
                showToast('Resumed habit: "' + title + '"');
            } else {
                card.classList.add('habit-paused');
                card.setAttribute('data-status', 'paused');
                if (pausedBadge) pausedBadge.style.display = 'inline-block';
                if (pauseBtn) {
                    pauseBtn.title = 'Resume Habit';
                    pauseBtn.classList.add('btn-paused');
                }
                showToast('Paused habit: "' + title + '"');
            }

            updateStats();
            applyFilters();
        }

        // Edit Habit Modal
        function openEditHabitModal(id, e) {
            if (e) e.stopPropagation();
            var card = document.getElementById('habit_' + id);
            if (!card) return;

            document.getElementById('editHabitId').value = id;
            document.getElementById('editHabitName').value = card.getAttribute('data-title') || '';
            document.getElementById('editHabitCategory').value = card.getAttribute('data-category') || 'Mental Well-Being';
            document.getElementById('editHabitFrequency').value = card.getAttribute('data-frequency') || 'Daily';

            var type = card.getAttribute('data-type') || 'binary';
            var groupMeasurable = document.getElementById('editGroupMeasurableFields');
            if (type === 'measurable') {
                groupMeasurable.style.display = 'block';
                document.getElementById('editHabitTarget').value = card.getAttribute('data-target') || '30';
                document.getElementById('editHabitUnit').value = card.getAttribute('data-unit') || 'mins';
            } else {
                groupMeasurable.style.display = 'none';
            }

            document.getElementById('modalEditHabit').classList.add('open');
        }

        function closeEditHabitModal() {
            document.getElementById('modalEditHabit').classList.remove('open');
        }

        function submitEditHabit() {
            var id = document.getElementById('editHabitId').value;
            var name = document.getElementById('editHabitName').value.trim();
            var category = document.getElementById('editHabitCategory').value;
            var frequency = document.getElementById('editHabitFrequency').value;

            if (!name) {
                alert('Please enter a habit name.');
                return;
            }

            var card = document.getElementById('habit_' + id);
            if (!card) return;

            card.setAttribute('data-title', name);
            card.setAttribute('data-category', category);
            card.setAttribute('data-frequency', frequency);

            var titleEl = card.querySelector('.habit-card-title');
            if (titleEl) titleEl.innerText = name;

            var catEl = card.querySelector('.badge-category');
            if (catEl) {
                catEl.innerText = category.toUpperCase();
                catEl.className = 'badge-category ' + getCategoryBadgeClass(category);
            }

            var type = card.getAttribute('data-type');
            var metaFreq = card.querySelector('.meta-frequency-text');
            if (metaFreq) {
                metaFreq.innerHTML = (type === 'binary' ? 'Binary' : 'Measurable') + ' &bull; ' + frequency;
            }

            if (type === 'measurable') {
                var target = parseInt(document.getElementById('editHabitTarget').value, 10) || 30;
                var unit = document.getElementById('editHabitUnit').value.trim() || 'mins';
                card.setAttribute('data-target', target);
                card.setAttribute('data-unit', unit);
                if (habitProgressState[id]) {
                    habitProgressState[id].max = target;
                    habitProgressState[id].unit = ' ' + unit;
                }
                var frac = document.getElementById(id + 'Fraction');
                if (frac) {
                    var cur = habitProgressState[id] ? habitProgressState[id].current : 0;
                    frac.innerText = cur + '/' + target + ' ' + unit;
                }
            }

            closeEditHabitModal();
            showToast('Habit "' + name + '" updated successfully!');
            applyFilters();
        }

        function getCategoryBadgeClass(cat) {
            switch (cat) {
                case 'Mental Well-Being': return 'badge-cat-mental';
                case 'Academic Excellence': return 'badge-cat-academic';
                case 'Physical Health': return 'badge-cat-physical';
                case 'Personal Growth': return 'badge-cat-personal';
                default: return 'badge-cat-mental';
            }
        }

        // Create Habit Modal
        function openCreateHabitModal() {
            document.getElementById('newHabitName').value = '';
            document.getElementById('newHabitCategory').selectedIndex = 0;
            document.getElementById('newHabitType').selectedIndex = 0;
            document.getElementById('newHabitFrequency').selectedIndex = 0;
            toggleHabitTypeFields();
            document.getElementById('modalCreateHabit').classList.add('open');
            setTimeout(function () {
                document.getElementById('newHabitName').focus();
            }, 100);
        }

        function closeCreateHabitModal() {
            document.getElementById('modalCreateHabit').classList.remove('open');
        }

        function toggleHabitTypeFields() {
            var type = document.getElementById('newHabitType').value;
            var group = document.getElementById('groupMeasurableFields');
            if (type === 'Measurable') {
                group.style.display = 'block';
            } else {
                group.style.display = 'none';
            }
        }

        function submitNewHabit() {
            var name = document.getElementById('newHabitName').value.trim();
            if (!name) {
                alert('Please enter a habit name.');
                return;
            }
            var category = document.getElementById('newHabitCategory').value;
            var type = document.getElementById('newHabitType').value.toLowerCase();
            var freq = document.getElementById('newHabitFrequency').value;
            var target = 1;
            var unit = '';

            if (type === 'measurable') {
                target = parseInt(document.getElementById('newHabitTarget').value, 10) || 30;
                unit = document.getElementById('newHabitUnit').value.trim() || 'mins';
            }

            var newId = 'h' + (habitIdCounter++);
            habitProgressState[newId] = {
                current: 0,
                max: target,
                unit: unit ? (' ' + unit) : '',
                type: type
            };

            var detailUrl = type === 'binary' ? 'HabitDetailBinary.aspx' : 'HabitDetailMeasurable.aspx';
            var badgeClass = getCategoryBadgeClass(category);

            var newCard = document.createElement('div');
            newCard.className = 'habit-card-item';
            newCard.id = 'habit_' + newId;
            newCard.setAttribute('data-id', newId);
            newCard.setAttribute('data-title', name);
            newCard.setAttribute('data-category', category);
            newCard.setAttribute('data-frequency', freq);
            newCard.setAttribute('data-type', type);
            newCard.setAttribute('data-target', target);
            newCard.setAttribute('data-unit', unit);
            newCard.setAttribute('data-status', 'active');
            newCard.onclick = function (e) { openHabitDetail(detailUrl, e); };
            newCard.title = 'View ' + name + ' details';

            var actionBtnHtml = '';
            if (type === 'binary') {
                actionBtnHtml = '<button type="button" class="btn-habit-action-circle btn-habit-plus-circle" id="' + newId + 'ActionBtn" title="Toggle status" onclick="toggleHabitCompleted(this, \'' + newId + '\', event)">' +
                    '<svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>' +
                    '</button>';
            } else {
                actionBtnHtml = '<button type="button" class="btn-habit-action-circle btn-habit-plus-circle" id="' + newId + 'ActionBtn" title="Add progress" onclick="addHabitProgress(\'' + newId + '\', 5, ' + target + ', \'' + unit + '\', event)">' +
                    '<svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>' +
                    '</button>';
            }

            var fracText = type === 'binary' ? '0/1' : ('0/' + target + (unit ? ' ' + unit : ''));

            newCard.innerHTML =
                '<div class="habit-card-left">' +
                    actionBtnHtml +
                    '<div class="habit-card-info">' +
                        '<div class="habit-info-top">' +
                            '<span class="habit-card-title">' + escapeHtml(name) + '</span>' +
                            '<span class="badge-category ' + badgeClass + '">' + escapeHtml(category.toUpperCase()) + '</span>' +
                            '<span class="badge-paused" style="display: none;">PAUSED</span>' +
                        '</div>' +
                        '<div class="habit-info-meta">' +
                            '<span class="meta-frequency-text">' + (type === 'binary' ? 'Binary' : 'Measurable') + ' &bull; ' + escapeHtml(freq) + '</span>' +
                            '<span class="habit-meta-streak">' +
                                '<svg viewBox="0 0 24 24" width="12" height="12"><path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z"/></svg>' +
                                '1 Day Streak' +
                            '</span>' +
                        '</div>' +
                    '</div>' +
                '</div>' +
                '<div class="habit-card-right">' +
                    '<div class="habit-progress-column">' +
                        '<div class="habit-progress-header">' +
                            '<span class="habit-progress-label">TODAY\'S PROGRESS</span>' +
                            '<span class="habit-progress-fraction" id="' + newId + 'Fraction">' + fracText + '</span>' +
                        '</div>' +
                        '<div class="habit-progress-track">' +
                            '<div class="habit-progress-fill" id="' + newId + 'Bar" style="width: 0%;"></div>' +
                        '</div>' +
                    '</div>' +
                    '<div class="habit-action-tools">' +
                        '<button type="button" class="btn-tool-icon" title="Edit Habit" onclick="openEditHabitModal(\'' + newId + '\', event)">' +
                            '<svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>' +
                        '</button>' +
                        '<button type="button" class="btn-tool-icon" title="Pause Habit" onclick="togglePauseHabit(\'' + newId + '\', event)">' +
                            '<svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>' +
                        '</button>' +
                        '<button type="button" class="btn-tool-icon" title="Habit Calendar" onclick="openHabitCalendar(\'' + detailUrl + '\', event)">' +
                            '<svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>' +
                        '</button>' +
                    '</div>' +
                '</div>';

            var list = document.getElementById('habitsListContainer');
            if (list) list.prepend(newCard);

            closeCreateHabitModal();
            showToast('Habit "' + name + '" created successfully!');
            updateStats();
            applyFilters();
        }

        function escapeHtml(text) {
            var div = document.createElement('div');
            div.textContent = text;
            return div.innerHTML;
        }

        function handleModalOverlayClick(e, modalId) {
            if (e.target && e.target.id === modalId) {
                document.getElementById(modalId).classList.remove('open');
            }
        }

        // Close on Escape key
        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') {
                closeCreateHabitModal();
                closeEditHabitModal();
                closeAllDropdowns();
            }
        });

        // Dynamic Statistics Updating
        function updateStats() {
            var activeItems = document.querySelectorAll('#habitsListContainer .habit-card-item:not(.habit-paused)');
            var totalActive = activeItems.length;
            var completedCount = 0;

            activeItems.forEach(function (item) {
                if (item.classList.contains('habit-card-highlight')) {
                    completedCount++;
                }
            });

            // Update Active Habits stat card
            var activeCardVal = document.getElementById('activeHabitsCardValue');
            if (activeCardVal) {
                activeCardVal.innerText = totalActive;
            }

            // Update Today's Completion text & ring
            var pct = totalActive > 0 ? Math.round((completedCount / totalActive) * 100) : 0;
            var ringText = document.getElementById('completionRingText');
            if (ringText) ringText.innerText = pct + '%';

            var compVal = document.getElementById('completionCardValue');
            if (compVal) compVal.innerText = completedCount + ' of ' + totalActive + ' Tasks';

            var ringProgress = document.getElementById('completionRingProgress');
            if (ringProgress) {
                var circumference = 144.5; // 2 * PI * 23
                var offset = circumference - (circumference * (pct / 100));
                ringProgress.style.strokeDashoffset = offset;
            }
        }

        // Toast Helper
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
            clearTimeout(toast._timeout);
            toast._timeout = setTimeout(function() {
                toast.classList.remove('show');
            }, 3000);
        }

        // Initial setup on page load
        document.addEventListener('DOMContentLoaded', function () {
            updateStats();
        });
    </script>
</asp:Content>
