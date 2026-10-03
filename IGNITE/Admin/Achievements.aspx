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

        .server-load-widget {
            display: flex;
            flex-direction: column;
            gap: 4px;
            width: 170px;
        }

        .server-load-labels {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 10px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.3px;
        }

        .server-progress-track {
            width: 100%;
            height: 6px;
            background: #E5E0D8;
            border-radius: 3px;
            overflow: hidden;
        }

        .server-progress-fill {
            width: 85%;
            height: 100%;
            background: #D96A77;
            border-radius: 3px;
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
            gap: 8px;
            background: #FFFFFF;
            border: 1px solid #D96A77;
            color: #D96A77;
            border-radius: 8px;
            padding: 7px 16px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.15s ease;
        }

        .filter-select-pill:hover {
            background: #FDF2F4;
        }

        .filter-sort-text {
            font-size: 12px;
            color: #78716C;
            font-weight: 600;
        }

        .filter-sort-text strong {
            color: #1a1a1a;
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
                <!-- Server Load Widget -->
                <div class="server-load-widget">
                    <div class="server-load-labels">
                        <span>SERVER LVL 4</span>
                        <span>85% LOAD</span>
                    </div>
                    <div class="server-progress-track">
                        <div class="server-progress-fill"></div>
                    </div>
                </div>

                <!-- Create Achievement Button -->
                <asp:LinkButton ID="btnCreateAchievement" runat="server" CssClass="btn-create-achievement" OnClick="btnCreateAchievement_Click">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="12" y1="5" x2="12" y2="19"></line>
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                    </svg>
                    <span>Create Achievement</span>
                </asp:LinkButton>
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
                    <input type="text" class="search-input-field" placeholder="Search achievements by name or condition..." />
                </div>

                <div class="filter-select-pill">
                    <span>All Types</span>
                </div>
            </div>

            <div class="filter-sort-text">
                Sort by: <strong>Date Created</strong>
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
                </thead>
                <tbody>

                    <!-- Row 1: Early Bird -->
                    <tr onclick="window.location.href='AchievementDetails.aspx';">
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
                                <button type="button" class="action-link-btn" title="Toggle Active">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Early Bird')">
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
                    <tr onclick="window.location.href='AchievementDetails.aspx';">
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
                                <button type="button" class="action-link-btn" title="Toggle Active">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Flame Master')">
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
                    <tr onclick="window.location.href='AchievementDetails.aspx';">
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
                                <button type="button" class="action-link-btn" title="Toggle Active">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Shadow Step')">
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
                    <tr onclick="window.location.href='AchievementDetails.aspx';">
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
                                <button type="button" class="action-link-btn" title="Toggle Active">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path>
                                        <line x1="12" y1="2" x2="12" y2="12"></line>
                                    </svg>
                                </button>
                                <button type="button" class="action-link-btn" title="Archive" onclick="openArchiveModal('Productivity Wizard')">
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
                <span class="pagination-info-text">Showing 4 of 32 achievements</span>
                <div class="pagination-btns-wrap">
                    <button type="button" class="page-num-btn">Previous</button>
                    <button type="button" class="page-num-btn active">1</button>
                    <button type="button" class="page-num-btn">2</button>
                    <button type="button" class="page-num-btn">3</button>
                    <button type="button" class="page-num-btn">Next</button>
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
                    <button type="button" onclick="closeArchiveModal()" style="background:#D96A77; border:none; border-radius:12px; padding:12px 20px; font-size:14px; font-weight:700; color:#FFFFFF; cursor:pointer; box-shadow:0 2px 6px rgba(217,106,119,0.3); font-family:inherit;">Archive</button>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function openArchiveModal(title) {
                var modal = document.getElementById('archiveAchievementModal');
                if (modal) {
                    if (title) document.getElementById('lblArchiveModalTitle').innerText = title;
                    modal.style.display = 'flex';
                }
            }

            function closeArchiveModal() {
                var modal = document.getElementById('archiveAchievementModal');
                if (modal) modal.style.display = 'none';
            }

            document.addEventListener('keydown', function(e) {
                if (e.key === 'Escape') closeArchiveModal();
            });
        </script>

    </div>
</asp:Content>
