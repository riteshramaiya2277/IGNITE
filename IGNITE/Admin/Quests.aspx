<%@ Page Title="Quests — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Quests.aspx.cs" Inherits="IGNITE.Admin.Quests" %>

    <asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
        <link href="../Content/admin-quests.css" rel="stylesheet" type="text/css" />
        <style>
            .admin-topbar-header {
                display: none !important;
            }

            .admin-page-canvas {
                padding-top: 32px !important;
            }

            /* Embedded fail-safe styles */
            .quests-container {
                display: flex;
                flex-direction: column;
                gap: 20px;
                padding: 10px 32px 48px 32px;
                background-color: #F5F2EB;
                min-height: calc(100vh - 70px);
                box-sizing: border-box;
                font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            }

            .quests-header-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
            }

            .quests-title-group {
                display: flex;
                align-items: center;
                gap: 16px;
            }

            .quests-page-title {
                font-size: 24px;
                font-weight: 800;
                color: #1a1a1a;
                margin: 0;
                letter-spacing: -0.3px;
            }

            .streak-pill-badge {
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

            .header-right-group {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .level-xp-widget {
                display: flex;
                flex-direction: column;
                gap: 4px;
                width: 180px;
            }

            .level-xp-labels {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 10px;
                font-weight: 800;
                color: #78716C;
                letter-spacing: 0.3px;
            }

            .xp-progress-track {
                width: 100%;
                height: 6px;
                background: #E5E0D8;
                border-radius: 3px;
                overflow: hidden;
            }

            .xp-progress-fill {
                width: 75%;
                height: 100%;
                background: #D96A77;
                border-radius: 3px;
            }

            .btn-create-quest {
                background: #D96A77;
                color: #FFF;
                border: none;
                border-radius: 8px;
                padding: 10px 18px;
                font-size: 13px;
                font-weight: 700;
                cursor: pointer;
                display: inline-flex;
                align-items: center;
                gap: 6px;
                text-decoration: none;
                box-shadow: 0 2px 6px rgba(217, 106, 119, 0.25);
                font-family: inherit;
            }

            .btn-create-quest:hover {
                background: #C45A66;
            }

            .quests-filter-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 4px;
                gap: 16px;
                flex-wrap: wrap;
            }

            .filter-left-controls {
                display: flex;
                align-items: center;
                gap: 12px;
                flex-wrap: wrap;
            }

            .search-box-wrap {
                position: relative;
                display: flex;
                align-items: center;
                background: #FFF;
                border: 1px solid #E0DCD3;
                border-radius: 8px;
                padding: 8px 12px;
                width: 220px;
            }

            .filter-select-btn {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                background: #FFF;
                border: 1px solid #E0DCD3;
                border-radius: 8px;
                padding: 8px 14px;
                font-size: 13px;
                font-weight: 600;
                color: #333;
                cursor: pointer;
                font-family: inherit;
            }

            .btn-clear-filters {
                background: transparent;
                border: none;
                color: #D96A77;
                font-size: 11px;
                font-weight: 800;
                letter-spacing: 0.5px;
                text-transform: uppercase;
                cursor: pointer;
                padding: 8px 4px;
                font-family: inherit;
            }

            .btn-clear-filters:hover {
                text-decoration: underline;
            }

            .sort-dropdown-btn {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                background: #EAE6DF;
                border: 1px solid #D8D4CC;
                border-radius: 8px;
                padding: 8px 14px;
                font-size: 12px;
                font-weight: 700;
                color: #1a1a1a;
                cursor: pointer;
                font-family: inherit;
            }

            .quests-table-card {
                background: #EAE6DF;
                border-radius: 16px;
                padding: 8px 24px 20px 24px;
                box-sizing: border-box;
            }

            .quests-table {
                width: 100%;
                border-collapse: collapse;
            }

            .quests-table th {
                text-align: left;
                font-size: 11px;
                font-weight: 800;
                color: #78716C;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                padding: 18px 12px 14px 12px;
                border-bottom: 1px solid #D8D4CC;
            }

            .quests-table td {
                padding: 18px 12px;
                border-bottom: 1px solid #D8D4CC;
                vertical-align: middle;
                font-size: 13px;
            }

            .quests-table tbody tr {
                cursor: pointer;
                transition: background 0.15s ease;
            }

            .quests-table tbody tr:hover {
                background: rgba(255, 255, 255, 0.65);
            }

            .quest-title-text {
                font-size: 14px;
                font-weight: 700;
                color: #1a1a1a;
                text-decoration: none;
                transition: color 0.15s ease;
            }

            .quests-table tbody tr:hover .quest-title-text {
                color: #D96A77;
            }

            .quests-table tr:last-child td {
                border-bottom: none;
            }

            .quest-name-col {
                display: flex;
                align-items: center;
                gap: 14px;
            }

            .quest-icon-badge {
                width: 36px;
                height: 36px;
                background: #FFF;
                border-radius: 10px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
                flex-shrink: 0;
            }

            .quest-title-text {
                font-size: 14px;
                font-weight: 700;
                color: #1a1a1a;
            }

            .quest-type-text {
                font-size: 13px;
                font-weight: 600;
                color: #333;
            }

            .quest-req-text {
                font-size: 12px;
                color: #666;
                line-height: 1.4;
                max-width: 200px;
            }

            .quest-xp-badge {
                display: inline-flex;
                align-items: center;
                gap: 4px;
                font-size: 13px;
                font-weight: 800;
                color: #D97706;
            }

            .status-pill {
                display: inline-block;
                padding: 4px 10px;
                border-radius: 12px;
                font-size: 11px;
                font-weight: 700;
                text-align: center;
            }

            .status-published {
                background: #DCFCE7;
                color: #15803D;
            }

            .status-draft {
                background: #FEF9C3;
                color: #A16207;
            }

            .status-archived {
                background: #F1F5F9;
                color: #64748B;
            }

            .dates-stack {
                display: flex;
                flex-direction: column;
                gap: 2px;
            }

            .dates-primary {
                font-size: 12px;
                font-weight: 700;
                color: #1a1a1a;
            }

            .dates-sub {
                font-size: 11px;
                color: #888;
            }

            .created-date-text {
                font-size: 12px;
                color: #666;
            }

            .actions-cell-wrap {
                display: flex;
                align-items: center;
                gap: 12px;
            }

            .action-icon-link {
                color: #666;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                text-decoration: none;
            }

            .action-icon-link:hover {
                color: #1a1a1a;
            }

            .btn-row-archive {
                border: 1px solid #D96A77;
                background: transparent;
                color: #D96A77;
                padding: 4px 12px;
                border-radius: 6px;
                font-size: 11px;
                font-weight: 700;
                cursor: pointer;
                font-family: inherit;
            }

            .btn-row-archive:hover {
                background: #D96A77;
                color: #FFF;
            }

            .btn-row-publish {
                border: none;
                background: #D96A77;
                color: #FFF;
                padding: 5px 14px;
                border-radius: 6px;
                font-size: 11px;
                font-weight: 700;
                cursor: pointer;
                font-family: inherit;
            }

            .btn-row-publish:hover {
                background: #C45A66;
            }

            .btn-row-restore {
                border: none;
                background: transparent;
                color: #D96A77;
                padding: 4px 8px;
                font-size: 11px;
                font-weight: 700;
                cursor: pointer;
                font-family: inherit;
            }

            .btn-row-restore:hover {
                text-decoration: underline;
            }

            .quests-pagination-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 16px;
                padding: 0 4px;
            }

            .pagination-info-text {
                font-size: 12px;
                color: #78716C;
                font-weight: 500;
            }

            .pagination-btns-wrap {
                display: flex;
                align-items: center;
                gap: 6px;
            }

            .page-num-btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 30px;
                height: 30px;
                border-radius: 6px;
                border: 1px solid transparent;
                background: transparent;
                font-size: 12px;
                font-weight: 700;
                color: #666;
                cursor: pointer;
                font-family: inherit;
            }

            .page-num-btn:hover {
                background: rgba(0, 0, 0, 0.05);
                color: #1a1a1a;
            }

            .page-num-btn.active {
                background: #D96A77;
                color: #FFF;
                border-color: #D96A77;
            }

            /* SVG Safeguard */
            svg {
                max-width: 100%;
            }
        </style>
    </asp:Content>

    <asp:Content ID="TopbarContent" ContentPlaceHolderID="TopbarContent" runat="server">
    </asp:Content>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="quests-container">

            <!-- Page Header Row -->
            <div class="quests-header-row">
                <div class="quests-title-group">
                    <h1 class="quests-page-title">Quests</h1>
                    <div class="streak-pill-badge">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="#D97706" stroke="none"
                            style="width:14px;height:14px;">
                            <path d="M12 2c1.5 3 4 5.5 4 9a6 6 0 1 1-12 0c0-3.5 2.5-6 4-9 1 2 2 3 4 3s1.5-1 0-3z" />
                        </svg>
                        <span>15 DAY STREAK</span>
                    </div>
                </div>

                <div class="header-right-group">
                    <!-- Level / XP Progress Widget -->
                    <div class="level-xp-widget">
                        <div class="level-xp-labels">
                            <span>LVL 12</span>
                            <span>4,500 / 6,000 XP</span>
                        </div>
                        <div class="xp-progress-track">
                            <div class="xp-progress-fill"></div>
                        </div>
                    </div>

                    <!-- Create Quest Button -->
                    <asp:LinkButton ID="btnCreateQuest" runat="server" CssClass="btn-create-quest"
                        OnClick="btnCreateQuest_Click">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor"
                            stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"
                            style="width:15px;height:15px;">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                        Create Quest
                    </asp:LinkButton>
                </div>
            </div>

            <!-- Filter & Search Toolbar -->
            <div class="quests-filter-bar">
                <div class="filter-left-controls">
                    <!-- Search Input -->
                    <div class="search-box-wrap">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="#888" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round" style="width:15px;height:15px;">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                        <input type="text" class="search-input-field" placeholder="Search quests...." />
                    </div>

                    <!-- Type Dropdown -->
                    <div class="filter-select-btn">
                        <span>Type: Daily</span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2" style="width:14px;height:14px;">
                            <polyline points="6 9 12 15 18 9"></polyline>
                        </svg>
                    </div>

                    <!-- Status Dropdown -->
                    <div class="filter-select-btn">
                        <span>Status: Published</span>
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2" style="width:14px;height:14px;">
                            <polyline points="6 9 12 15 18 9"></polyline>
                        </svg>
                    </div>

                    <!-- Date Range Button -->
                    <div class="filter-select-btn">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2" style="width:14px;height:14px;">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                        <span>Date range</span>
                    </div>

                    <!-- Clear Filters -->
                    <button type="button" class="btn-clear-filters">CLEAR FILTERS</button>
                </div>

                <div class="filter-right-controls">
                    <!-- Sort Dropdown -->
                    <div class="sort-dropdown-btn">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2" style="width:14px;height:14px;">
                            <line x1="4" y1="6" x2="20" y2="6"></line>
                            <line x1="7" y1="12" x2="17" y2="12"></line>
                            <line x1="10" y1="18" x2="14" y2="18"></line>
                        </svg>
                        <span>Sort: XP Reward</span>
                    </div>
                </div>
            </div>

            <!-- Table Container Card -->
            <div class="quests-table-card">
                <table class="quests-table">
                    <thead>
                        <tr>
                            <th style="width: 24%;">QUEST NAME</th>
                            <th style="width: 10%;">TYPE</th>
                            <th style="width: 20%;">REQUIREMENT</th>
                            <th style="width: 10%;">XP REWARD</th>
                            <th style="width: 10%;">STATUS</th>
                            <th style="width: 12%;">DATES</th>
                            <th style="width: 10%;">CREATED</th>
                            <th style="width: 14%;">ACTIONS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Row 1: Deep Focus Session -->
                        <tr onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            style="width:18px;height:18px;">
                                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z">
                                            </path>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Deep Focus Session</a>
                                </div>
                            </td>
                            <td>
                                <span class="quest-type-text">Daily</span>
                            </td>
                            <td>
                                <span class="quest-req-text">Complete 2 hours of focused work sessions</span>
                            </td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>450 XP</span>
                                </div>
                            </td>
                            <td>
                                <span class="status-pill status-published">Published</span>
                            </td>
                            <td>
                                <div class="dates-stack">
                                    <span class="dates-primary">May 10 - Jun 10</span>
                                    <span class="dates-sub">Ongoing</span>
                                </div>
                            </td>
                            <td>
                                <span class="created-date-text">May 01, 2024</span>
                            </td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-archive" onclick="openArchiveModal('Deep Focus Session', '450 XP', 'DAILY')">Archive</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 2: Consistency Master -->
                        <tr onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            style="width:18px;height:18px;">
                                            <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                                            <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                                            <path d="M4 22h16"></path>
                                            <path
                                                d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34">
                                            </path>
                                            <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Consistency Master</a>
                                </div>
                            </td>
                            <td>
                                <span class="quest-type-text">Weekly</span>
                            </td>
                            <td>
                                <span class="quest-req-text">Maintain a 7-day task streak</span>
                            </td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>1200 XP</span>
                                </div>
                            </td>
                            <td>
                                <span class="status-pill status-draft">Draft</span>
                            </td>
                            <td>
                                <span class="dates-sub">Not set</span>
                            </td>
                            <td>
                                <span class="created-date-text">May 05, 2024</span>
                            </td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-publish">Publish</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 3: Skill Unleashed -->
                        <tr onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            style="width:18px;height:18px;">
                                            <path d="M22 10v6M2 10l10-5 10 5-10 5z"></path>
                                            <path d="M6 12v5c3 3 9 3 12 0v-5"></path>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Skill Unleashed</a>
                                </div>
                            </td>
                            <td>
                                <span class="quest-type-text">One-time</span>
                            </td>
                            <td>
                                <span class="quest-req-text">Complete any intermediate course</span>
                            </td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>3000 XP</span>
                                </div>
                            </td>
                            <td>
                                <span class="status-pill status-published">Published</span>
                            </td>
                            <td>
                                <div class="dates-stack">
                                    <span class="dates-primary">Jan 01 - Dec 31</span>
                                    <span class="dates-sub">Standard</span>
                                </div>
                            </td>
                            <td>
                                <span class="created-date-text">Apr 20, 2024</span>
                            </td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-archive" onclick="openArchiveModal('Skill Unleashed', '3000 XP', 'ONE-TIME')">Archive</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 4: Early Bird -->
                        <tr onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            style="width:18px;height:18px;">
                                            <circle cx="12" cy="12" r="7"></circle>
                                            <polyline points="12 9 12 12 13.5 13.5"></polyline>
                                            <path d="M16.5 4L19 6.5M7.5 4L5 6.5"></path>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Early Bird</a>
                                </div>
                            </td>
                            <td>
                                <span class="quest-type-text">Daily</span>
                            </td>
                            <td>
                                <span class="quest-req-text">Log in before 7:00 AM</span>
                            </td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>200 XP</span>
                                </div>
                            </td>
                            <td>
                                <span class="status-pill status-archived">Archived</span>
                            </td>
                            <td>
                                <div class="dates-stack">
                                    <span class="dates-sub">Expired</span>
                                    <span class="dates-sub">May 01</span>
                                </div>
                            </td>
                            <td>
                                <span class="created-date-text">Jan 15, 2024</span>
                            </td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-restore">Restore</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- Pagination Row -->
                <div class="quests-pagination-row">
                    <span class="pagination-info-text">Showing 4 of 24 quests</span>
                    <div class="pagination-btns-wrap">
                        <button type="button" class="page-num-btn">&lt;</button>
                        <button type="button" class="page-num-btn active">1</button>
                        <button type="button" class="page-num-btn">2</button>
                        <button type="button" class="page-num-btn">3</button>
                        <button type="button" class="page-num-btn">&gt;</button>
                    </div>
                </div>
            </div>

            <!-- Archive Modal (Image 3) -->
            <div id="archiveModal" class="modal-backdrop" style="display:none; position:fixed; top:0; left:0; right:0; bottom:0; background:rgba(0,0,0,0.45); z-index:1000; align-items:center; justify-content:center; backdrop-filter:blur(2px);">
                <div class="modal-card" style="background:#F5F2EB; border-radius:20px; width:90%; max-width:440px; padding:32px 28px 24px 28px; box-sizing:border-box; position:relative; box-shadow:0 12px 36px rgba(0,0,0,0.18); display:flex; flex-direction:column; align-items:center; text-align:center;">
                    <button type="button" onclick="closeArchiveModal()" style="position:absolute; top:20px; right:20px; background:transparent; border:none; color:#78716C; cursor:pointer; font-size:16px;">✕</button>

                    <div style="width:56px; height:56px; background:#FEF3C7; border-radius:16px; display:flex; align-items:center; justify-content:center; color:#D97706; margin-bottom:18px;">
                        <svg viewBox="0 0 24 24" width="28" height="28" fill="#D97706">
                            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79.09-.39.43-.65.82-.65h.06c.39 0 .73.26.82.65.13.58.21 1.17.21 1.79 0 2.87 2.13 5.25 4.88 5.72v2.21zm4.79-3.72c-.09.39-.43.65-.82.65h-.06c-.39 0-.73-.26-.82-.65-.13-.58-.21-1.17-.21-1.79 0-2.87-2.13-5.25-4.88-5.72V7.47c3.95.49 7 3.85 7 7.93 0 .62-.08 1.21-.21 1.79z"></path>
                            <path d="M12 6c-1.1 0-2 .9-2 2 0 1.5 2 3.5 2 3.5s2-2 2-3.5c0-1.1-.9-2-2-2z" fill="#D97706"></path>
                        </svg>
                    </div>

                    <h3 style="font-size:20px; font-weight:800; color:#1C1917; margin:0 0 10px 0;">Archive Quest?</h3>
                    <p style="font-size:13px; color:#57534E; line-height:1.5; margin:0 0 20px 0; padding:0 10px;">
                        Are you sure you want to archive <strong id="modalQuestTitle">"Morning Routine"</strong>? This will hide it from students and pause all active progress.
                    </p>

                    <div style="width:100%; background:#EAE6DF; border-radius:12px; padding:14px 16px; box-sizing:border-box; display:flex; justify-content:space-between; align-items:center; margin-bottom:24px; text-align:left;">
                        <div style="display:flex; align-items:center; gap:12px;">
                            <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                            <div style="display:flex; flex-direction:column; gap:2px;">
                                <span style="font-size:9px; font-weight:800; color:#78716C; letter-spacing:0.6px; text-transform:uppercase;">QUEST PREVIEW</span>
                                <span id="modalPreviewName" style="font-size:13px; font-weight:800; color:#1C1917;">Morning Routine</span>
                            </div>
                        </div>

                        <div style="display:flex; flex-direction:column; align-items:flex-end; gap:2px;">
                            <div style="font-size:12px; font-weight:800; color:#D97706; display:flex; align-items:center; gap:4px;">
                                <svg viewBox="0 0 24 24" width="12" height="12" fill="#D97706">
                                    <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                </svg>
                                <span id="modalPreviewXp">300 XP</span>
                            </div>
                            <span id="modalPreviewFreq" style="font-size:9px; font-weight:800; color:#78716C; letter-spacing:0.6px; text-transform:uppercase;">DAILY</span>
                        </div>
                    </div>

                    <div style="display:grid; grid-template-columns:1fr 1.3fr; gap:12px; width:100%;">
                        <button type="button" onclick="closeArchiveModal()" style="background:#FFFFFF; border:1px solid #D1CDC7; border-radius:8px; padding:10px 18px; font-size:13px; font-weight:700; color:#1C1917; cursor:pointer;">Cancel</button>
                        <button type="button" onclick="closeArchiveModal()" style="background:#D96A77; color:#FFFFFF; border:none; border-radius:8px; padding:10px 20px; font-size:13px; font-weight:700; cursor:pointer; box-shadow:0 2px 6px rgba(217, 106, 119, 0.28);">Archive Quest</button>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                function openArchiveModal(title, xp, freq) {
                    var modal = document.getElementById('archiveModal');
                    if (modal) {
                        if (title) {
                            document.getElementById('modalQuestTitle').innerText = '"' + title + '"';
                            document.getElementById('modalPreviewName').innerText = title;
                        }
                        if (xp) document.getElementById('modalPreviewXp').innerText = xp;
                        if (freq) document.getElementById('modalPreviewFreq').innerText = freq;
                        modal.style.display = 'flex';
                    }
                }

                function closeArchiveModal() {
                    var modal = document.getElementById('archiveModal');
                    if (modal) {
                        modal.style.display = 'none';
                    }
                }

                document.addEventListener('keydown', function(e) {
                    if (e.key === 'Escape') closeArchiveModal();
                });
            </script>

        </div>
    </asp:Content>