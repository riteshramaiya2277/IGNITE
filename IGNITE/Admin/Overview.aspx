<%@ Page Title="Overview — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master"
    AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="IGNITE.Admin.Overview" %>

    <asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
        <link href="../Content/admin-overview.css" rel="stylesheet" type="text/css" />
        <link href='<%= ResolveUrl("~/Content/admin-overview.css") %>' rel="stylesheet" type="text/css" />
    </asp:Content>

    <asp:Content ID="TopContent" ContentPlaceHolderID="TopbarContent" runat="server">
        <!-- Topbar Left: Page Title -->
        <div class="admin-topbar-left">
            <h1 class="admin-page-title">Overview</h1>
        </div>

        <!-- Topbar Right: Status Badge & Search Input -->
        <div class="admin-topbar-right">
            <!-- Status Indicator Pill -->
            <div class="admin-status-badge" title="System Status: Operational">
                <span class="status-dot"></span>
                <span class="status-label">SYSTEM OPERATIONAL</span>
            </div>

            <!-- Global Search Bar -->
            <div class="admin-search-wrapper">
                <svg class="admin-search-icon" width="16" height="16" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                    style="width:16px;height:16px;flex-shrink:0;">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
                <input type="text" class="admin-search-input" placeholder="Search students, quests..." />
            </div>
        </div>
    </asp:Content>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="overview-container">

            <!-- Action Toolbar -->
            <div class="overview-action-bar">
                <div class="action-buttons-group">
                    <a href='<%= ResolveUrl("~/Admin/CreateChallenge.aspx") %>' class="btn btn-primary"
                        title="Create a new student challenge">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"
                            style="width:16px;height:16px;flex-shrink:0;">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                        <span>Create Challenge</span>
                    </a>

                    <a href='<%= ResolveUrl("~/Admin/Quests.aspx") %>' class="btn btn-secondary"
                        title="Create a new quest">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"
                            style="width:16px;height:16px;flex-shrink:0;">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                        <span>Create Quest</span>
                    </a>

                    <a href='<%= ResolveUrl("~/Admin/Achievements.aspx") %>' class="btn btn-secondary"
                        title="Create a new achievement badge">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"
                            style="width:16px;height:16px;flex-shrink:0;">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                        <span>Create Achievement</span>
                    </a>
                </div>

                <a href='<%= ResolveUrl("~/Admin/Students.aspx") %>' class="btn btn-outline-white"
                    title="Browse all registered students">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                        <circle cx="9" cy="7" r="4"></circle>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                        <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                    </svg>
                    <span>View All Students</span>
                </a>
            </div>

            <!-- 6 Metrics / Stat Cards -->
            <div class="stats-grid">
                <div class="stat-card">
                    <span class="stat-title">TOTAL STUDENTS</span>
                    <span class="stat-value">1,284</span>
                    <span class="stat-subtext text-green">↑ 12% inc</span>
                </div>

                <div class="stat-card">
                    <span class="stat-title">ACTIVE TODAY</span>
                    <span class="stat-value">452</span>
                    <span class="stat-subtext text-green"><span class="live-dot"></span> Live now</span>
                </div>

                <div class="stat-card">
                    <span class="stat-title">ACTIVE CHALLENGES</span>
                    <span class="stat-value highlight">18</span>
                    <span class="stat-subtext text-grey">3 ending soon</span>
                </div>

                <div class="stat-card">
                    <span class="stat-title">DAILY QUESTS</span>
                    <span class="stat-value">42</span>
                    <span class="stat-subtext text-grey">95% completion</span>
                </div>

                <div class="stat-card">
                    <span class="stat-title">ACHIEVEMENTS</span>
                    <span class="stat-value">156</span>
                    <span class="stat-subtext text-grey">4 new this week</span>
                </div>

                <div class="stat-card">
                    <span class="stat-title">AVG STREAK</span>
                    <span class="stat-value">5.4</span>
                    <span class="stat-subtext text-orange">🔥 Days avg.</span>
                </div>
            </div>

            <!-- Main 2-Column Section -->
            <div class="main-grid">

                <!-- Left Column: Student Activity & Active Challenges -->
                <div class="left-col">

                    <!-- Panel 1: Recent Student Activity -->
                    <div class="panel">
                        <div class="panel-header">
                            <h2 class="panel-title">RECENT STUDENT ACTIVITY</h2>
                            <a href='<%= ResolveUrl("~/Admin/Students.aspx") %>' class="panel-action">View All</a>
                        </div>

                        <div class="activity-table-wrapper">
                            <table class="activity-table">
                                <thead>
                                    <tr>
                                        <th>STUDENT</th>
                                        <th>COURSE / YEAR</th>
                                        <th>LEVEL / XP</th>
                                        <th>STREAK</th>
                                        <th>STATUS</th>
                                        <th>ACTION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="student-info">
                                                <div class="avatar-circle"></div>
                                                <div>
                                                    <div class="student-name">Sarah Jenkins</div>
                                                    <div class="student-email">sarah.j@edu.com</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="course-name">Computer Science</div>
                                            <div class="course-year">Year 3</div>
                                        </td>
                                        <td>
                                            <span class="level-badge">Lvl 24</span>
                                            <span class="xp-text">12.4k XP</span>
                                        </td>
                                        <td>
                                            <span class="streak-text">🔥 12</span>
                                        </td>
                                        <td>
                                            <span class="status-badge active">ACTIVE</span>
                                        </td>
                                        <td>
                                            <a href='<%= ResolveUrl("~/Admin/Students.aspx") %>'
                                                class="action-link">Profile</a>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="student-info">
                                                <div class="avatar-circle"></div>
                                                <div>
                                                    <div class="student-name">Marcus Thorne</div>
                                                    <div class="student-email">m.thorne@edu.com</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="course-name">Digital Arts</div>
                                            <div class="course-year">Year 1</div>
                                        </td>
                                        <td>
                                            <span class="level-badge">Lvl 8</span>
                                            <span class="xp-text">3.2k XP</span>
                                        </td>
                                        <td>
                                            <span class="streak-text zero">🔥 0</span>
                                        </td>
                                        <td>
                                            <span class="status-badge inactive">INACTIVE</span>
                                        </td>
                                        <td>
                                            <a href='<%= ResolveUrl("~/Admin/Students.aspx") %>'
                                                class="action-link">Profile</a>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="student-info">
                                                <div class="avatar-circle"></div>
                                                <div>
                                                    <div class="student-name">Elena Rodriguez</div>
                                                    <div class="student-email">elena.r@edu.com</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="course-name">Biolology</div>
                                            <div class="course-year">Year 2</div>
                                        </td>
                                        <td>
                                            <span class="level-badge">Lvl 19</span>
                                            <span class="xp-text">2.8k XP</span>
                                        </td>
                                        <td>
                                            <span class="streak-text">🔥 42</span>
                                        </td>
                                        <td>
                                            <span class="status-badge active">ACTIVE</span>
                                        </td>
                                        <td>
                                            <a href='<%= ResolveUrl("~/Admin/Students.aspx") %>'
                                                class="action-link">Profile</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination Controls -->
                        <div class="pagination">
                            <span class="pagination-text">Showing 1-3 of 1,284 students</span>
                            <div class="pagination-controls">
                                <button type="button" class="page-btn" aria-label="Previous page">&lt;</button>
                                <button type="button" class="page-btn active">1</button>
                                <button type="button" class="page-btn">2</button>
                                <button type="button" class="page-btn">3</button>
                                <button type="button" class="page-btn" aria-label="Next page">&gt;</button>
                            </div>
                        </div>
                    </div>

                    <!-- Panel 2: Active Challenges -->
                    <div class="panel">
                        <div class="panel-header">
                            <h2 class="panel-title">ACTIVE CHALLENGES</h2>
                            <a href='<%= ResolveUrl("~/Admin/CreateChallenge.aspx") %>' class="panel-action">Create
                                Challenge</a>
                        </div>

                        <div class="challenge-list">
                            <!-- Daily Algorithm Sprint -->
                            <div class="challenge-card">
                                <div class="challenge-info">
                                    <div class="challenge-icon code">
                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
                                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" style="width:20px;height:20px;flex-shrink:0;">
                                            <polyline points="16 18 22 12 16 6"></polyline>
                                            <polyline points="8 6 2 12 8 18"></polyline>
                                        </svg>
                                    </div>
                                    <div>
                                        <div class="challenge-title">Daily Algorithm Sprint</div>
                                        <div class="challenge-meta">ACADEMIC &nbsp;•&nbsp; <span>Intermediate</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="challenge-stats">
                                    <div>
                                        <div class="participants">248 Participants</div>
                                        <div class="ends-in">Ends in 3 days</div>
                                    </div>
                                    <span class="status-badge active">ACTIVE</span>
                                </div>
                            </div>

                            <!-- Portfolio Revision 2024 -->
                            <div class="challenge-card">
                                <div class="challenge-info">
                                    <div class="challenge-icon creative">
                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
                                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" style="width:20px;height:20px;flex-shrink:0;">
                                            <path d="M12 2a10 10 0 1 0 10 10 4 4 0 0 1-5-5 4 4 0 0 1-5-5"></path>
                                            <path d="M8.5 8.5v.01"></path>
                                            <path d="M16 12.5v.01"></path>
                                            <path d="M12 16v.01"></path>
                                            <path d="M11 7.5v.01"></path>
                                        </svg>
                                    </div>
                                    <div>
                                        <div class="challenge-title">Portfolio Revision 2024</div>
                                        <div class="challenge-meta">CREATIVE &nbsp;•&nbsp; <span
                                                class="purple">Advanced</span></div>
                                    </div>
                                </div>
                                <div class="challenge-stats">
                                    <div>
                                        <div class="participants">112 Participants</div>
                                        <div class="ends-in">Ends in 12 days</div>
                                    </div>
                                    <span class="status-badge active">ACTIVE</span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Right Column: Achievements & Recurring Quests -->
                <div class="right-col">

                    <!-- Panel 1: Achievements -->
                    <div class="panel">
                        <div class="panel-header">
                            <h2 class="panel-title">ACHIEVEMENTS</h2>
                            <a href='<%= ResolveUrl("~/Admin/Achievements.aspx") %>' class="panel-action">Manage</a>
                        </div>

                        <div class="stats-list">
                            <div class="stat-row">
                                <span class="stat-label">Total Published</span>
                                <span class="stat-val">156</span>
                            </div>
                            <div class="stat-row">
                                <span class="stat-label">Active Global</span>
                                <span class="stat-val">42</span>
                            </div>
                            <div class="stat-row">
                                <span class="stat-label">Recently Added</span>
                                <span class="stat-val green">+4</span>
                            </div>
                            <div class="stat-row">
                                <span class="stat-label">Hidden/Draft</span>
                                <span class="stat-val" style="color: var(--admin-text-muted, #8C857D);">12</span>
                            </div>
                        </div>

                        <div class="recent-ach-section-title">RECENT ACHIEVEMENT</div>

                        <div class="recent-achievement">
                            <div class="ach-icon">🏆</div>
                            <div>
                                <div class="ach-title">Early Bird Streak</div>
                                <div class="ach-date">Created 2 days ago</div>
                            </div>
                        </div>
                    </div>

                    <!-- Panel 2: Recurring Quests -->
                    <div class="panel">
                        <div class="panel-header">
                            <h2 class="panel-title">RECURRING QUESTS</h2>
                            <a href='<%= ResolveUrl("~/Admin/Quests.aspx") %>' class="panel-action">Manage Quests</a>
                        </div>

                        <div class="quest-list">
                            <!-- Quest 1 -->
                            <div class="quest-item">
                                <div class="quest-info">
                                    <div class="quest-icon">☀️</div>
                                    <div>
                                        <div class="quest-title">The Early Riser</div>
                                        <div class="quest-desc">Daily • Login before 8:00 AM</div>
                                    </div>
                                </div>
                                <div class="quest-stats">
                                    <div>
                                        <div class="quest-participants">382 Students</div>
                                        <div class="quest-trend stable">Stable</div>
                                    </div>
                                    <button type="button" class="quest-menu-btn" title="Options">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"
                                            style="width:16px;height:16px;">
                                            <circle cx="12" cy="5" r="1.5"></circle>
                                            <circle cx="12" cy="12" r="1.5"></circle>
                                            <circle cx="12" cy="19" r="1.5"></circle>
                                        </svg>
                                    </button>
                                </div>
                            </div>

                            <!-- Quest 2 -->
                            <div class="quest-item">
                                <div class="quest-info">
                                    <div class="quest-icon">📚</div>
                                    <div>
                                        <div class="quest-title">Research Weekend</div>
                                        <div class="quest-desc">Weekly • Library log-ins</div>
                                    </div>
                                </div>
                                <div class="quest-stats">
                                    <div>
                                        <div class="quest-participants">94 Students</div>
                                        <div class="quest-trend dropping">Dropping</div>
                                    </div>
                                    <button type="button" class="quest-menu-btn" title="Options">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"
                                            style="width:16px;height:16px;">
                                            <circle cx="12" cy="5" r="1.5"></circle>
                                            <circle cx="12" cy="12" r="1.5"></circle>
                                            <circle cx="12" cy="19" r="1.5"></circle>
                                        </svg>
                                    </button>
                                </div>
                            </div>

                            <!-- Quest 3 -->
                            <div class="quest-item">
                                <div class="quest-info">
                                    <div class="quest-icon">💬</div>
                                    <div>
                                        <div class="quest-title">Community Pillar</div>
                                        <div class="quest-desc">Weekly • Help 5 peers in forum</div>
                                    </div>
                                </div>
                                <div class="quest-stats">
                                    <div>
                                        <div class="quest-participants">156 Students</div>
                                        <div class="quest-trend rising">Rising</div>
                                    </div>
                                    <button type="button" class="quest-menu-btn" title="Options">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"
                                            style="width:16px;height:16px;">
                                            <circle cx="12" cy="5" r="1.5"></circle>
                                            <circle cx="12" cy="12" r="1.5"></circle>
                                            <circle cx="12" cy="19" r="1.5"></circle>
                                        </svg>
                                    </button>
                                </div>
                            </div>

                            <!-- Quest 4 -->
                            <div class="quest-item">
                                <div class="quest-info">
                                    <div class="quest-icon">🔒</div>
                                    <div>
                                        <div class="quest-title" style="color: var(--admin-text-muted, #8C857D);">Final
                                            Exams Grind</div>
                                        <div class="quest-desc">Event • Scheduled for Dec 1st</div>
                                    </div>
                                </div>
                                <div class="quest-stats">
                                    <div>
                                        <div class="quest-trend queued">Queued</div>
                                    </div>
                                    <button type="button" class="quest-menu-btn" title="Options">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"
                                            style="width:16px;height:16px;">
                                            <circle cx="12" cy="5" r="1.5"></circle>
                                            <circle cx="12" cy="12" r="1.5"></circle>
                                            <circle cx="12" cy="19" r="1.5"></circle>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </asp:Content>