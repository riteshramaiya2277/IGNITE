<%@ Page Title="Achievements — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Achievements.aspx.cs" Inherits="IGNITE.Admin.Achievements" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-topbar-header {
            display: none !important;
        }

        .admin-page-canvas {
            padding-top: 24px !important;
        }

        .achievements-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 8px 32px 48px 32px;
            background-color: #F5F2EB;
            min-height: calc(100vh - 70px);
            box-sizing: border-box;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        /* Top Header Row */
        .page-header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .header-title-left {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .page-main-title {
            font-size: 22px;
            font-weight: 800;
            color: #1a1a1a;
            margin: 0;
            letter-spacing: -0.3px;
        }

        .active-pill-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 5px 12px;
            border: 1.5px solid #F59E0B;
            background: #FFFBEB;
            border-radius: 8px;
            font-size: 11px;
            font-weight: 800;
            color: #D97706;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .active-pill-badge svg {
            width: 13px;
            height: 13px;
            fill: #D97706;
        }

        .header-right-group {
            display: flex;
            align-items: center;
            gap: 20px;
        }


        .btn-create-achievement {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #D96A77;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            padding: 9px 18px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
            box-shadow: 0 2px 6px rgba(217, 106, 119, 0.28);
            transition: background 0.15s ease, transform 0.1s ease;
            text-decoration: none;
        }

        .btn-create-achievement:hover {
            background: #C45A66;
            color: #FFFFFF;
            transform: translateY(-1px);
        }

        .btn-create-achievement svg {
            width: 14px;
            height: 14px;
        }

        /* Search & Filter Toolbar */
        .achievements-filter-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .filter-left-controls {
            display: flex;
            align-items: center;
            gap: 12px;
            flex: 1;
        }

        .search-box-wrap {
            display: flex;
            align-items: center;
            background: #FFFFFF;
            border: 1px solid #E5E0D8;
            border-radius: 8px;
            padding: 8px 14px;
            width: 320px;
            gap: 10px;
        }

        .search-box-wrap svg {
            width: 15px;
            height: 15px;
            color: #8C827A;
            flex-shrink: 0;
        }

        .search-input-field {
            border: none;
            outline: none;
            background: transparent;
            font-size: 13px;
            color: #1a1a1a;
            font-family: inherit;
            width: 100%;
        }

        .search-input-field::placeholder {
            color: #A8A29E;
        }

        .filter-select-pill {
            display: inline-flex;
            align-items: center;
            background: #FFFFFF;
            border: 1px solid #D96A77;
            color: #D96A77;
            border-radius: 8px;
            padding: 7px 28px 7px 16px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
            appearance: none;
            -webkit-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%23D96A77' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
            outline: none;
            transition: all 0.15s ease;
        }

        .filter-select-pill:focus {
            box-shadow: 0 0 0 2px rgba(217, 106, 119, 0.2);
        }

        .btn-clear-ach-filters {
            background: transparent;
            border: none;
            color: #D96A77;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            cursor: pointer;
            padding: 6px 4px;
            font-family: inherit;
            transition: opacity 0.15s ease;
        }

        .btn-clear-ach-filters:hover {
            text-decoration: underline;
        }

        .filter-sort-wrap {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 12px;
            color: #78716C;
            font-weight: 600;
        }

        .filter-sort-select {
            background: transparent;
            border: 1px solid #D8D4CC;
            border-radius: 6px;
            padding: 5px 24px 5px 8px;
            font-size: 12px;
            font-weight: 700;
            color: #1a1a1a;
            font-family: inherit;
            cursor: pointer;
            appearance: none;
            -webkit-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%231a1a1a' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 8px center;
            outline: none;
            transition: border-color 0.15s ease;
        }

        .filter-sort-select:focus {
            border-color: #D96A77;
        }

        /* Toast */
        .admin-toast {
            position: fixed;
            bottom: 24px;
            right: 24px;
            background: #1C1917;
            color: #FFF;
            padding: 12px 20px;
            border-radius: 10px;
            font-size: 13px;
            font-weight: 600;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            z-index: 2000;
            transform: translateY(20px);
            opacity: 0;
            transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
            pointer-events: none;
        }

        .admin-toast.show {
            transform: translateY(0);
            opacity: 1;
        }

        /* Achievements Table Card */
        .achievements-table-card {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 10px 20px 20px 20px;
            box-sizing: border-box;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .achievements-table {
            width: 100%;
            border-collapse: collapse;
        }

        .achievements-table th {
            text-align: left;
            font-size: 11px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.6px;
            text-transform: uppercase;
            padding: 18px 14px 14px 14px;
            border-bottom: 1px solid #D8D4CC;
        }

        .achievements-table td {
            padding: 18px 14px;
            border-bottom: 1px solid #D8D4CC;
            vertical-align: middle;
            font-size: 13px;
        }

        .achievements-table tbody tr {
            cursor: pointer;
            transition: background 0.15s ease;
        }

        .achievements-table tbody tr:hover {
            background: rgba(255, 255, 255, 0.65);
        }

        .achievements-table tr:last-child td {
            border-bottom: none;
        }

        /* Title Column */
        .title-cell-wrap {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .badge-icon-square {
            width: 38px;
            height: 38px;
            background: #FFFFFF;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .badge-icon-square.trophy-icon {
            color: #EA580C;
            background: #FFF7ED;
        }

        .badge-icon-square.flame-icon {
            color: #D96A77;
            background: #FDF2F4;
        }

        .badge-icon-square.ghost-icon {
            color: #64748B;
            background: #F1F5F9;
        }

        .badge-icon-square.wizard-icon {
            color: #D96A77;
            background: #FDF2F4;
        }

        .badge-icon-square svg {
            width: 20px;
            height: 20px;
        }

        .title-sub-stack {
            display: flex;
            flex-direction: column;
            gap: 3px;
        }

        .achievement-name-link {
            font-size: 14px;
            font-weight: 800;
            color: #1a1a1a;
            text-decoration: none;
            transition: color 0.15s ease;
        }

        .achievements-table tbody tr:hover .achievement-name-link {
            color: #D96A77;
        }

        .achievement-sub-text {
            font-size: 11px;
            color: #78716C;
            font-weight: 500;
        }

        /* Type Badges */
        .type-badge {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 6px;
            font-size: 10px;
            font-weight: 800;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .type-badge.type-milestone {
            background: #FCE7F3;
            color: #BE185D;
        }

        .type-badge.type-challenge {
            background: #FEF3C7;
            color: #B45309;
        }

        .type-badge.type-hidden {
            background: #E2E8F0;
            color: #475569;
        }

        .condition-text {
            font-size: 12px;
            color: #44403C;
            line-height: 1.45;
            max-width: 320px;
        }

        .reward-xp-text {
            font-size: 13px;
            font-weight: 800;
            color: #D97706;
        }

        /* Status Pills */
        .status-pill {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 3px 8px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 700;
        }

        .status-pill.status-active {
            background: #DCFCE7;
            color: #15803D;
        }

        .status-pill.status-inactive {
            background: #FEF9C3;
            color: #A16207;
        }

        /* Actions Cell */
        .actions-icons-wrap {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .action-link-btn {
            background: transparent;
            border: none;
            color: #78716C;
            cursor: pointer;
            padding: 2px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: color 0.15s ease;
            text-decoration: none;
        }

        .action-link-btn:hover {
            color: #D96A77;
        }

        .action-link-btn svg {
            width: 16px;
            height: 16px;
        }

        /* Pagination */
        .achievements-pagination-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 14px 4px 14px;
            border-top: 1px solid #D8D4CC;
            margin-top: 8px;
        }

        .pagination-info-text {
            font-size: 12px;
            font-weight: 600;
            color: #78716C;
        }

        .pagination-btns-wrap {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .page-num-btn {
            background: #FFFFFF;
            border: 1px solid #D8D4CC;
            border-radius: 6px;
            padding: 6px 12px;
            font-size: 12px;
            font-weight: 700;
            color: #44403C;
            cursor: pointer;
            font-family: inherit;
            transition: all 0.15s ease;
        }

        .page-num-btn:hover {
            background: #F5F2EB;
            color: #1a1a1a;
        }

        .page-num-btn.active {
            background: #D96A77;
            color: #FFFFFF;
            border-color: #D96A77;
        }
    </style>
</asp:Content>

<asp:Content ID="MainContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <div class="achievements-container">

        <!-- Top Header Row -->
        <div class="page-header-row">
            <div class="header-title-left">
                <h1 class="page-main-title">Achievements</h1>
                <div class="active-pill-badge">
                    <svg viewBox="0 0 24 24">
                        <path d="M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 3.5z"></path>
                    </svg>
                    <span>32 ACTIVE</span>
                </div>
            </div>

            <div class="header-right-group">

                <!-- Create Achievement Button -->
                <a href="CreateAchievement.aspx" class="btn-create-achievement">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                    </svg>
                    <span>Create Achievement</span>
                </a>
            </div>
        </div>

        <!-- Filter & Search Bar -->
        <div class="achievements-filter-bar">
            <div class="filter-left-controls">
                <div class="search-box-wrap">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    <input type="text" id="achievementSearchInput" class="search-input-field" placeholder="Search achievements by name or condition..." oninput="filterAchievementsTable()" />
                </div>

                <select id="ddlAchievementType" class="filter-select-pill" onchange="filterAchievementsTable()">
                    <option value="">All Types</option>
                    <option value="Milestone">Milestone</option>
                    <option value="Challenge">Challenge</option>
                    <option value="Hidden">Hidden</option>
                </select>

                <button type="button" class="btn-clear-ach-filters" onclick="clearAchievementFilters()">CLEAR</button>
            </div>

            <div class="filter-sort-wrap">
                <span style="color:#78716C; font-weight:600;">Sort by:</span>
                <select id="ddlSortAchievements" class="filter-sort-select" onchange="sortAchievementsTable()">
                    <option value="created-desc">Date Created</option>
                    <option value="xp-desc">Reward: High to Low</option>
                    <option value="xp-asc">Reward: Low to High</option>
                    <option value="name-asc">Title: A to Z</option>
                </select>
            </div>
        </div>

        <!-- Achievements Table Card -->
        <div class="achievements-table-card">
            <table class="achievements-table">
                <thead>
                    <tr>
                        <th style="width: 25%;">ACHIEVEMENT TITLE</th>
                        <th style="width: 12%;">TYPE</th>
                        <th style="width: 28%;">CONDITION</th>
                        <th style="width: 12%;">REWARD</th>
                        <th style="width: 10%;">STATUS</th>
                        <th style="width: 13%;">ACTIONS</th>
                    </tr>
                </thead>                <tbody id="tblAchievementsBody">

                    <!-- Row 1: Early Bird -->
                    <tr data-name="Early Bird" data-type="Milestone" data-condition="Complete profile setup and first daily quest within 24h" data-xp="500" data-status="Active" data-created="2024-05-10" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square trophy-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                                        <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                                        <path d="M4 22h16"></path>
                                        <path d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34"></path>
                                        <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Early Bird</a>
                                    <span class="achievement-sub-text">Initial on-boarding completion</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-milestone">Milestone</span>
                        </td>
                        <td>
                            <span class="condition-text">Complete profile setup and first daily quest within 24h</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">500 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-active">Active</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Early Bird', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 2: Flame Master -->
                    <tr data-name="Flame Master" data-type="Challenge" data-condition="Reach a 30-day streak of active habit completion" data-xp="1200" data-status="Active" data-created="2024-05-08" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square flame-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 3.5z"></path>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Flame Master</a>
                                    <span class="achievement-sub-text">Maintain consistent activity</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-challenge">Challenge</span>
                        </td>
                        <td>
                            <span class="condition-text">Reach a 30-day streak of active habit completion</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">1200 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-active">Active</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Flame Master', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 3: Shadow Step -->
                    <tr data-name="Shadow Step" data-type="Hidden" data-condition="Find and click the hidden developer's badge in credits" data-xp="2500" data-status="Inactive" data-created="2024-04-15" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square ghost-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M9 10h.01"></path>
                                        <path d="M15 10h.01"></path>
                                        <path d="M12 2a8 8 0 0 0-8 8v12l3-3 2.5 2.5L12 19l2.5 2.5L17 19l3 3V10a8 8 0 0 0-8-8z"></path>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Shadow Step</a>
                                    <span class="achievement-sub-text">Secret achievement discovery</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-hidden">Hidden</span>
                        </td>
                        <td>
                            <span class="condition-text">Find and click the hidden developer's badge in credits</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">2500 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-inactive">Inactive</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Shadow Step', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 4: Productivity Wizard -->
                    <tr data-name="Productivity Wizard" data-type="Milestone" data-condition="Complete 50 &quot;Critical&quot; priority tasks without missing deadlines" data-xp="3000" data-status="Active" data-created="2024-03-22" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square wizard-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"></path>
                                        <polyline points="14 2 14 8 20 8"></polyline>
                                        <line x1="9" y1="13" x2="15" y2="13"></line>
                                        <line x1="9" y1="17" x2="13" y2="17"></line>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Productivity Wizard</a>
                                    <span class="achievement-sub-text">Advanced task management</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-milestone">Milestone</span>
                        </td>
                        <td>
                            <span class="condition-text">Complete 50 "Critical" priority tasks without missing deadlines</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">3000 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-active">Active</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Productivity Wizard', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 5: Speed Demon -->
                    <tr data-name="Speed Demon" data-type="Challenge" data-condition="Submit 10 fast-track challenge solutions within 1 hour" data-xp="1500" data-status="Active" data-created="2024-02-14" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square flame-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Speed Demon</a>
                                    <span class="achievement-sub-text">Rapid problem solving</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-challenge">Challenge</span>
                        </td>
                        <td>
                            <span class="condition-text">Submit 10 fast-track challenge solutions within 1 hour</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">1500 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-active">Active</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Speed Demon', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 6: Night Owl -->
                    <tr data-name="Night Owl" data-type="Hidden" data-condition="Complete any quest between 2:00 AM and 4:00 AM" data-xp="2000" data-status="Inactive" data-created="2024-02-10" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square ghost-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Night Owl</a>
                                    <span class="achievement-sub-text">Late night productivity</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-hidden">Hidden</span>
                        </td>
                        <td>
                            <span class="condition-text">Complete any quest between 2:00 AM and 4:00 AM</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">2000 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-inactive">Inactive</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Night Owl', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 7: Quest Master -->
                    <tr data-name="Quest Master" data-type="Milestone" data-condition="Successfully finish 100 platform quests across all tracks" data-xp="4000" data-status="Active" data-created="2024-01-30" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square trophy-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Quest Master</a>
                                    <span class="achievement-sub-text">Century milestone unlocked</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-milestone">Milestone</span>
                        </td>
                        <td>
                            <span class="condition-text">Successfully finish 100 platform quests across all tracks</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">4000 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-active">Active</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Quest Master', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 8: Deep Focus -->
                    <tr data-name="Deep Focus" data-type="Challenge" data-condition="Maintain continuous focus timer for 4 consecutive hours" data-xp="800" data-status="Active" data-created="2024-01-18" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square flame-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <polyline points="12 6 12 12 16 14"></polyline>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Deep Focus</a>
                                    <span class="achievement-sub-text">Uninterrupted study session</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-challenge">Challenge</span>
                        </td>
                        <td>
                            <span class="condition-text">Maintain continuous focus timer for 4 consecutive hours</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">800 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-active">Active</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Deep Focus', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 9: Legendary Scholar -->
                    <tr data-name="Legendary Scholar" data-type="Milestone" data-condition="Earn a top 3 rank in monthly academic performance" data-xp="5000" data-status="Active" data-created="2024-01-05" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square wizard-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Legendary Scholar</a>
                                    <span class="achievement-sub-text">Top tier academic glory</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-milestone">Milestone</span>
                        </td>
                        <td>
                            <span class="condition-text">Earn a top 3 rank in monthly academic performance</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">5000 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-active">Active</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Legendary Scholar', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 10: Secret Pioneer -->
                    <tr data-name="Secret Pioneer" data-type="Hidden" data-condition="First student to complete the unlisted easter egg challenge" data-xp="3500" data-status="Inactive" data-created="2023-12-28" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square ghost-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M12 2a10 10 0 1 0 10 10A10 10 0 0 0 12 2zm1 15h-2v-6h2zm0-8h-2V7h2z"></path>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Secret Pioneer</a>
                                    <span class="achievement-sub-text">Uncharted territory explorer</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-hidden">Hidden</span>
                        </td>
                        <td>
                            <span class="condition-text">First student to complete the unlisted easter egg challenge</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">3500 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-inactive">Inactive</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Secret Pioneer', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 11: Team Catalyst -->
                    <tr data-name="Team Catalyst" data-type="Milestone" data-condition="Assist 25 fellow students in collaborative challenge threads" data-xp="1800" data-status="Active" data-created="2023-12-15" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square trophy-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                        <circle cx="9" cy="7" r="4"></circle>
                                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                        <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Team Catalyst</a>
                                    <span class="achievement-sub-text">Community collaboration</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-milestone">Milestone</span>
                        </td>
                        <td>
                            <span class="condition-text">Assist 25 fellow students in collaborative challenge threads</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">1800 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-active">Active</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Team Catalyst', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 12: Unstoppable Streak -->
                    <tr data-name="Unstoppable Streak" data-type="Challenge" data-condition="Reach a 60-day unbroken streak of daily logins" data-xp="2200" data-status="Active" data-created="2023-12-01" onclick="window.location.href='AchievementDetails.aspx';">
                        <td>
                            <div class="title-cell-wrap">
                                <div class="badge-icon-square flame-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 3.5z"></path>
                                    </svg>
                                </div>
                                <div class="title-sub-stack">
                                    <a href="AchievementDetails.aspx" class="achievement-name-link" onclick="event.stopPropagation();">Unstoppable Streak</a>
                                    <span class="achievement-sub-text">Legendary consistency badge</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge type-challenge">Challenge</span>
                        </td>
                        <td>
                            <span class="condition-text">Reach a 60-day unbroken streak of daily logins</span>
                        </td>
                        <td>
                            <span class="reward-xp-text">2200 XP</span>
                        </td>
                        <td>
                            <span class="status-pill status-active">Active</span>
                        </td>
                        <td onclick="event.stopPropagation();">
                            <div class="actions-icons-wrap">
                                <a href="AchievementDetails.aspx" class="action-link-btn" title="View Details">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href="EditAchievement.aspx" class="action-link-btn" title="Edit Achievement">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <button type="button" class="action-link-btn" title="Toggle Active" onclick="toggleAchievementStatus(this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Unstoppable Streak', this)">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="21 8 21 21 3 21 3 8"></polyline>
                                        <rect x="1" y="3" width="22" height="5"></rect>
                                        <line x1="10" y1="12" x2="14" y2="12"></line>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>

                </tbody>
            </table>

            <!-- Pagination Row -->
            <div class="achievements-pagination-row">
                <span id="achPaginationInfo" class="pagination-info-text">Showing 4 of 32 achievements</span>
                <div class="pagination-btns-wrap">
                    <button type="button" class="page-num-btn" onclick="goToAchievementPage(currentAchPage - 1)">Previous</button>
                    <button type="button" class="page-num-btn active" onclick="goToAchievementPage(1)">1</button>
                    <button type="button" class="page-num-btn" onclick="goToAchievementPage(2)">2</button>
                    <button type="button" class="page-num-btn" onclick="goToAchievementPage(3)">3</button>
                    <button type="button" class="page-num-btn" onclick="goToAchievementPage(currentAchPage + 1)">Next</button>
                </div>
            </div>
        </div>

        <!-- Archive Achievement Modal (Matching uploaded photo) -->
        <div id="archiveAchievementModal" style="display:none; position:fixed; top:0; left:0; right:0; bottom:0; background:rgba(0,0,0,0.4); backdrop-filter:blur(3px); z-index:1000; align-items:center; justify-content:center; padding:20px;">
            <div style="background:#F5F2EB; border-radius:24px; width:100%; max-width:420px; padding:36px 32px 32px 32px; box-sizing:border-box; display:flex; flex-direction:column; align-items:center; text-align:center; box-shadow:0 16px 40px rgba(0,0,0,0.14);">
                
                <div style="width:60px; height:60px; border-radius:50%; background:#FBEAEB; display:flex; align-items:center; justify-content:center; margin-bottom:20px;">
                    <svg viewBox="0 0 24 24" width="28" height="28" fill="#D96A77">
                        <path d="M3 6a1 1 0 0 1 1-1h16a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V6z" />
                        <path d="M4 10.5h16v7.5a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-7.5zm6 2.5a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2h-4z" />
                    </svg>
                </div>

                <h3 style="font-size:20px; font-weight:800; color:#1C1917; margin:0 0 10px 0; letter-spacing:-0.2px;">Archive Achievement?</h3>
                <p style="font-size:13px; color:#57534E; line-height:1.55; margin:0 0 28px 0; padding:0 8px;">
                    Are you sure you want to archive "<strong id="lblArchiveModalTitle" style="color:#1C1917;">Master of Habits</strong>"?<br />
                    This action can be undone later from the archive settings.
                </p>

                <div style="display:grid; grid-template-columns:1fr 1fr; gap:14px; width:100%;">
                    <button type="button" onclick="closeArchiveModal()" style="background:#FFFFFF; border:none; border-radius:12px; padding:12px 20px; font-size:14px; font-weight:700; color:#44403C; cursor:pointer; box-shadow:0 1px 3px rgba(0,0,0,0.06); font-family:inherit;">Cancel</button>
                    <button type="button" onclick="confirmArchiveAchievement()" style="background:#D96A77; border:none; border-radius:12px; padding:12px 20px; font-size:14px; font-weight:700; color:#FFFFFF; cursor:pointer; box-shadow:0 2px 6px rgba(217,106,119,0.3); font-family:inherit;">Archive</button>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            var currentAchPage = 1;
            var pageSize = 4;
            var targetArchiveRow = null;

            function openArchiveModal(title, btn) {
                var modal = document.getElementById('archiveAchievementModal');
                if (modal) {
                    if (title) document.getElementById('lblArchiveModalTitle').innerText = title;
                    if (btn) {
                        targetArchiveRow = btn.closest('tr');
                    } else {
                        targetArchiveRow = null;
                    }
                    modal.style.display = 'flex';
                }
            }

            function closeArchiveModal() {
                var modal = document.getElementById('archiveAchievementModal');
                if (modal) modal.style.display = 'none';
                targetArchiveRow = null;
            }

            function confirmArchiveAchievement() {
                var title = document.getElementById('lblArchiveModalTitle').innerText;
                if (targetArchiveRow) {
                    targetArchiveRow.setAttribute('data-status', 'Inactive');
                    var statusPill = targetArchiveRow.querySelector('.status-pill');
                    if (statusPill) {
                        statusPill.className = 'status-pill status-inactive';
                        statusPill.innerText = 'Archived';
                    }
                }
                closeArchiveModal();
                showToast('Achievement "' + title + '" archived');
            }

            function toggleAchievementStatus(btn) {
                var tr = btn.closest('tr');
                if (!tr) return;
                var currentStatus = tr.getAttribute('data-status');
                var statusPill = tr.querySelector('.status-pill');
                var name = tr.getAttribute('data-name') || 'Achievement';

                if (currentStatus === 'Active') {
                    tr.setAttribute('data-status', 'Inactive');
                    if (statusPill) {
                        statusPill.className = 'status-pill status-inactive';
                        statusPill.innerText = 'Inactive';
                    }
                    showToast('Achievement "' + name + '" set to Inactive');
                } else {
                    tr.setAttribute('data-status', 'Active');
                    if (statusPill) {
                        statusPill.className = 'status-pill status-active';
                        statusPill.innerText = 'Active';
                    }
                    showToast('Achievement "' + name + '" set to Active');
                }
            }

            function filterAchievementsTable() {
                var query = (document.getElementById('achievementSearchInput').value || '').trim().toLowerCase();
                var typeFilter = document.getElementById('ddlAchievementType').value;
                var tbody = document.getElementById('tblAchievementsBody');
                if (!tbody) return;

                var rows = Array.from(tbody.querySelectorAll('tr'));
                var matchedRows = [];

                rows.forEach(function(row) {
                    var name = (row.getAttribute('data-name') || '').toLowerCase();
                    var cond = (row.getAttribute('data-condition') || '').toLowerCase();
                    var type = row.getAttribute('data-type') || '';

                    var matchQuery = (!query || name.indexOf(query) !== -1 || cond.indexOf(query) !== -1);
                    var matchType = (!typeFilter || type === typeFilter);

                    if (matchQuery && matchType) {
                        matchedRows.push(row);
                    } else {
                        row.style.display = 'none';
                    }
                });

                var totalMatched = matchedRows.length;
                var totalPages = Math.ceil(totalMatched / pageSize) || 1;
                if (currentAchPage > totalPages) currentAchPage = 1;

                var startIndex = (currentAchPage - 1) * pageSize;
                var endIndex = startIndex + pageSize;

                matchedRows.forEach(function(row, idx) {
                    if (idx >= startIndex && idx < endIndex) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });

                var displayedCount = Math.min(totalMatched - startIndex, pageSize);
                if (displayedCount < 0) displayedCount = 0;
                var infoEl = document.getElementById('achPaginationInfo');
                if (infoEl) {
                    infoEl.innerText = 'Showing ' + displayedCount + ' of ' + totalMatched + ' achievements';
                }

                updateAchPaginationUI(totalPages);
            }

            function clearAchievementFilters() {
                document.getElementById('achievementSearchInput').value = '';
                document.getElementById('ddlAchievementType').value = '';
                document.getElementById('ddlSortAchievements').value = 'created-desc';
                currentAchPage = 1;
                filterAchievementsTable();
                showToast('All filters cleared');
            }

            function sortAchievementsTable() {
                var sortVal = document.getElementById('ddlSortAchievements').value;
                var tbody = document.getElementById('tblAchievementsBody');
                if (!tbody) return;
                var rows = Array.from(tbody.querySelectorAll('tr'));

                rows.sort(function(a, b) {
                    if (sortVal === 'xp-desc') {
                        return parseInt(b.getAttribute('data-xp') || 0) - parseInt(a.getAttribute('data-xp') || 0);
                    } else if (sortVal === 'xp-asc') {
                        return parseInt(a.getAttribute('data-xp') || 0) - parseInt(b.getAttribute('data-xp') || 0);
                    } else if (sortVal === 'name-asc') {
                        return (a.getAttribute('data-name') || '').localeCompare(b.getAttribute('data-name') || '');
                    } else if (sortVal === 'created-desc') {
                        return (b.getAttribute('data-created') || '').localeCompare(a.getAttribute('data-created') || '');
                    }
                    return 0;
                });

                rows.forEach(function(row) {
                    tbody.appendChild(row);
                });

                filterAchievementsTable();
            }

            function goToAchievementPage(page) {
                var query = (document.getElementById('achievementSearchInput').value || '').trim().toLowerCase();
                var typeFilter = document.getElementById('ddlAchievementType').value;
                var tbody = document.getElementById('tblAchievementsBody');
                if (!tbody) return;
                var rows = Array.from(tbody.querySelectorAll('tr'));
                var totalMatched = rows.filter(function(row) {
                    var name = (row.getAttribute('data-name') || '').toLowerCase();
                    var cond = (row.getAttribute('data-condition') || '').toLowerCase();
                    var type = row.getAttribute('data-type') || '';
                    return (!query || name.indexOf(query) !== -1 || cond.indexOf(query) !== -1) &&
                           (!typeFilter || type === typeFilter);
                }).length;
                var maxPages = Math.ceil(totalMatched / pageSize) || 1;

                if (page < 1 || page > maxPages) return;
                currentAchPage = page;
                filterAchievementsTable();
            }

            function updateAchPaginationUI(totalPages) {
                var btns = document.querySelectorAll('.achievements-pagination-row .pagination-btns-wrap .page-num-btn');
                btns.forEach(function(btn) {
                    var num = parseInt(btn.innerText);
                    if (!isNaN(num)) {
                        if (num === currentAchPage) {
                            btn.classList.add('active');
                        } else {
                            btn.classList.remove('active');
                        }
                        if (totalPages && num > totalPages) {
                            btn.style.opacity = '0.4';
                            btn.style.pointerEvents = 'none';
                        } else {
                            btn.style.opacity = '1';
                            btn.style.pointerEvents = 'auto';
                        }
                    }
                });
            }

            function showToast(message) {
                var existing = document.querySelector('.admin-toast');
                if (existing) existing.remove();
                var toast = document.createElement('div');
                toast.className = 'admin-toast';
                toast.innerText = message;
                document.body.appendChild(toast);
                setTimeout(function() {
                    toast.classList.add('show');
                }, 20);
                setTimeout(function() {
                    toast.classList.remove('show');
                    setTimeout(function() { if (toast.parentNode) toast.parentNode.removeChild(toast); }, 300);
                }, 3000);
            }

            document.addEventListener('keydown', function(e) {
                if (e.key === 'Escape') closeArchiveModal();
            });

            document.addEventListener('DOMContentLoaded', function() {
                filterAchievementsTable();
            });
        </script>

    </div>
</asp:Content>
