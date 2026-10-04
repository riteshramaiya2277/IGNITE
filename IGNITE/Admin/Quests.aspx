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
                transition: background 0.15s ease;
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
                transition: border-color 0.15s ease, box-shadow 0.15s ease;
            }

            .search-box-wrap:focus-within {
                border-color: #D96A77;
                box-shadow: 0 0 0 2px rgba(217, 106, 119, 0.15);
            }

            .search-input-field {
                border: none;
                outline: none;
                background: transparent;
                font-family: inherit;
                font-size: 13px;
                color: #1C1917;
                width: 100%;
                margin-left: 8px;
            }

            .filter-select-dropdown {
                display: inline-flex;
                align-items: center;
                background: #FFF;
                border: 1px solid #E0DCD3;
                border-radius: 8px;
                padding: 8px 32px 8px 14px;
                font-size: 13px;
                font-weight: 600;
                color: #333;
                cursor: pointer;
                font-family: inherit;
                appearance: none;
                -webkit-appearance: none;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='14' height='14' viewBox='0 0 24 24' fill='none' stroke='%23333' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
                background-repeat: no-repeat;
                background-position: right 10px center;
                outline: none;
                transition: border-color 0.15s ease, box-shadow 0.15s ease;
            }

            .filter-select-dropdown:focus {
                border-color: #D96A77;
                box-shadow: 0 0 0 2px rgba(217, 106, 119, 0.15);
            }

            .filter-date-wrap {
                position: relative;
                display: inline-flex;
                align-items: center;
            }

            .filter-date-wrap svg {
                position: absolute;
                left: 12px;
                pointer-events: none;
                color: #555;
            }

            .filter-date-select {
                padding-left: 34px !important;
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
                transition: opacity 0.15s ease;
            }

            .btn-clear-filters:hover {
                text-decoration: underline;
                opacity: 0.85;
            }

            .sort-dropdown-wrap {
                position: relative;
                display: inline-flex;
                align-items: center;
            }

            .sort-dropdown-wrap svg {
                position: absolute;
                left: 12px;
                pointer-events: none;
                color: #1a1a1a;
            }

            .sort-dropdown-select {
                background: #EAE6DF;
                border: 1px solid #D8D4CC;
                border-radius: 8px;
                padding: 8px 30px 8px 34px;
                font-size: 12px;
                font-weight: 700;
                color: #1a1a1a;
                cursor: pointer;
                font-family: inherit;
                appearance: none;
                -webkit-appearance: none;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='14' height='14' viewBox='0 0 24 24' fill='none' stroke='%231a1a1a' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
                background-repeat: no-repeat;
                background-position: right 10px center;
                outline: none;
                transition: border-color 0.15s ease;
            }

            .sort-dropdown-select:focus {
                border-color: #D96A77;
            }

            /* Toast Notification */
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
                    <!-- Create Quest Button -->
                    <a href="CreateQuest.aspx" class="btn-create-quest" id="btnCreateQuest">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor"
                            stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"
                            style="width:15px;height:15px;">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                        <span>Create Quest</span>
                    </a>
                </div>
            </div>

            <!-- Filter & Search Toolbar -->
            <div class="quests-filter-bar">
                <div class="filter-left-controls">
                    <!-- Search Input -->
                    <div class="search-box-wrap">
                        <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="#888" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round" style="width:15px;height:15px;flex-shrink:0;">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                        <input type="text" id="questSearchInput" class="search-input-field" placeholder="Search quests...." oninput="filterQuestsTable()" />
                    </div>

                    <!-- Type Dropdown -->
                    <select id="ddlQuestType" class="filter-select-dropdown" onchange="filterQuestsTable()">
                        <option value="">Type: All</option>
                        <option value="Daily">Type: Daily</option>
                        <option value="Weekly">Type: Weekly</option>
                        <option value="One-time">Type: One-time</option>
                    </select>

                    <!-- Status Dropdown -->
                    <select id="ddlQuestStatus" class="filter-select-dropdown" onchange="filterQuestsTable()">
                        <option value="">Status: All</option>
                        <option value="Published">Status: Published</option>
                        <option value="Draft">Status: Draft</option>
                        <option value="Archived">Status: Archived</option>
                    </select>

                    <!-- Date Range Dropdown -->
                    <div class="filter-date-wrap">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2" style="width:14px;height:14px;">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                        <select id="ddlDateRange" class="filter-select-dropdown filter-date-select" onchange="filterQuestsTable()">
                            <option value="">Date range: All</option>
                            <option value="ongoing">Ongoing</option>
                            <option value="standard">Standard</option>
                            <option value="expired">Expired</option>
                        </select>
                    </div>

                    <!-- Clear Filters -->
                    <button type="button" class="btn-clear-filters" onclick="clearAllFilters()">CLEAR FILTERS</button>
                </div>

                <div class="filter-right-controls">
                    <!-- Sort Dropdown -->
                    <div class="sort-dropdown-wrap">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2" style="width:14px;height:14px;">
                            <line x1="4" y1="6" x2="20" y2="6"></line>
                            <line x1="7" y1="12" x2="17" y2="12"></line>
                            <line x1="10" y1="18" x2="14" y2="18"></line>
                        </svg>
                        <select id="ddlSortQuests" class="sort-dropdown-select" onchange="sortQuestsTable()">
                            <option value="xp-desc">Sort: XP Reward (High to Low)</option>
                            <option value="xp-asc">Sort: XP Reward (Low to High)</option>
                            <option value="name-asc">Sort: Quest Name (A-Z)</option>
                            <option value="name-desc">Sort: Quest Name (Z-A)</option>
                            <option value="created-desc">Sort: Newest Created</option>
                        </select>
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
                    <tbody id="tblQuestsBody">
                        <!-- Page 1 Rows -->
                        <!-- Row 1: Deep Focus Session -->
                        <tr data-name="Deep Focus Session" data-type="Daily" data-status="Published" data-xp="450" data-date="Ongoing" data-created="2024-05-01" data-page="1" onclick="window.location.href='QuestDetails.aspx';">
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
                                    <button type="button" class="btn-row-archive" onclick="openArchiveModal('Deep Focus Session', '450 XP', 'DAILY', this)">Archive</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 2: Consistency Master -->
                        <tr data-name="Consistency Master" data-type="Weekly" data-status="Draft" data-xp="1200" data-date="Not set" data-created="2024-05-05" data-page="1" onclick="window.location.href='QuestDetails.aspx';">
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
                                    <button type="button" class="btn-row-publish" onclick="publishQuest(this, 'Consistency Master')">Publish</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 3: Skill Unleashed -->
                        <tr data-name="Skill Unleashed" data-type="One-time" data-status="Published" data-xp="3000" data-date="Standard" data-created="2024-04-20" data-page="1" onclick="window.location.href='QuestDetails.aspx';">
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
                                    <button type="button" class="btn-row-archive" onclick="openArchiveModal('Skill Unleashed', '3000 XP', 'ONE-TIME', this)">Archive</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 4: Early Bird -->
                        <tr data-name="Early Bird" data-type="Daily" data-status="Archived" data-xp="200" data-date="Expired" data-created="2024-01-15" data-page="1" onclick="window.location.href='QuestDetails.aspx';">
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
                                    <button type="button" class="btn-row-restore" onclick="restoreQuest(this, 'Early Bird')">Restore</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Page 2 Rows -->
                        <!-- Row 5: Weekend Sprint -->
                        <tr data-name="Weekend Sprint" data-type="Weekly" data-status="Published" data-xp="800" data-date="Ongoing" data-created="2024-04-10" data-page="2" style="display:none;" onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:18px;height:18px;">
                                            <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Weekend Sprint</a>
                                </div>
                            </td>
                            <td><span class="quest-type-text">Weekly</span></td>
                            <td><span class="quest-req-text">Complete 5 tasks during weekend</span></td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>800 XP</span>
                                </div>
                            </td>
                            <td><span class="status-pill status-published">Published</span></td>
                            <td><div class="dates-stack"><span class="dates-primary">Apr 10 - Jun 30</span><span class="dates-sub">Ongoing</span></div></td>
                            <td><span class="created-date-text">Apr 10, 2024</span></td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-archive" onclick="openArchiveModal('Weekend Sprint', '800 XP', 'WEEKLY', this)">Archive</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 6: Bug Hunter -->
                        <tr data-name="Bug Hunter" data-type="One-time" data-status="Draft" data-xp="500" data-date="Not set" data-created="2024-04-05" data-page="2" style="display:none;" onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:18px;height:18px;">
                                            <circle cx="12" cy="12" r="6"></circle>
                                            <line x1="12" y1="2" x2="12" y2="6"></line>
                                            <line x1="12" y1="18" x2="12" y2="22"></line>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Bug Hunter</a>
                                </div>
                            </td>
                            <td><span class="quest-type-text">One-time</span></td>
                            <td><span class="quest-req-text">Report 3 platform bugs</span></td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>500 XP</span>
                                </div>
                            </td>
                            <td><span class="status-pill status-draft">Draft</span></td>
                            <td><span class="dates-sub">Not set</span></td>
                            <td><span class="created-date-text">Apr 05, 2024</span></td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-publish" onclick="publishQuest(this, 'Bug Hunter')">Publish</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 7: Reading Marathon -->
                        <tr data-name="Reading Marathon" data-type="Daily" data-status="Published" data-xp="350" data-date="Ongoing" data-created="2024-04-02" data-page="2" style="display:none;" onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:18px;height:18px;">
                                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Reading Marathon</a>
                                </div>
                            </td>
                            <td><span class="quest-type-text">Daily</span></td>
                            <td><span class="quest-req-text">Read documentation for 45 mins</span></td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>350 XP</span>
                                </div>
                            </td>
                            <td><span class="status-pill status-published">Published</span></td>
                            <td><div class="dates-stack"><span class="dates-primary">Apr 02 - May 30</span><span class="dates-sub">Ongoing</span></div></td>
                            <td><span class="created-date-text">Apr 02, 2024</span></td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-archive" onclick="openArchiveModal('Reading Marathon', '350 XP', 'DAILY', this)">Archive</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 8: Speed Demon -->
                        <tr data-name="Speed Demon" data-type="Daily" data-status="Archived" data-xp="250" data-date="Expired" data-created="2024-03-20" data-page="2" style="display:none;" onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:18px;height:18px;">
                                            <circle cx="12" cy="12" r="7"></circle>
                                            <polyline points="12 9 12 12 13.5 13.5"></polyline>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Speed Demon</a>
                                </div>
                            </td>
                            <td><span class="quest-type-text">Daily</span></td>
                            <td><span class="quest-req-text">Finish quiz in under 5 minutes</span></td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>250 XP</span>
                                </div>
                            </td>
                            <td><span class="status-pill status-archived">Archived</span></td>
                            <td><div class="dates-stack"><span class="dates-sub">Expired</span><span class="dates-sub">Apr 01</span></div></td>
                            <td><span class="created-date-text">Mar 20, 2024</span></td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-restore" onclick="restoreQuest(this, 'Speed Demon')">Restore</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Page 3 Rows -->
                        <!-- Row 9: Community Helper -->
                        <tr data-name="Community Helper" data-type="Weekly" data-status="Published" data-xp="600" data-date="Ongoing" data-created="2024-03-15" data-page="3" style="display:none;" onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:18px;height:18px;">
                                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="9" cy="7" r="4"></circle>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Community Helper</a>
                                </div>
                            </td>
                            <td><span class="quest-type-text">Weekly</span></td>
                            <td><span class="quest-req-text">Answer 5 forum questions</span></td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>600 XP</span>
                                </div>
                            </td>
                            <td><span class="status-pill status-published">Published</span></td>
                            <td><div class="dates-stack"><span class="dates-primary">Mar 15 - May 15</span><span class="dates-sub">Ongoing</span></div></td>
                            <td><span class="created-date-text">Mar 15, 2024</span></td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-archive" onclick="openArchiveModal('Community Helper', '600 XP', 'WEEKLY', this)">Archive</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 10: Code Reviewer -->
                        <tr data-name="Code Reviewer" data-type="Weekly" data-status="Published" data-xp="750" data-date="Ongoing" data-created="2024-03-10" data-page="3" style="display:none;" onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:18px;height:18px;">
                                            <polyline points="16 18 22 12 16 6"></polyline>
                                            <polyline points="8 6 2 12 8 18"></polyline>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Code Reviewer</a>
                                </div>
                            </td>
                            <td><span class="quest-type-text">Weekly</span></td>
                            <td><span class="quest-req-text">Review 2 peer submissions</span></td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>750 XP</span>
                                </div>
                            </td>
                            <td><span class="status-pill status-published">Published</span></td>
                            <td><div class="dates-stack"><span class="dates-primary">Mar 10 - Apr 30</span><span class="dates-sub">Ongoing</span></div></td>
                            <td><span class="created-date-text">Mar 10, 2024</span></td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-archive" onclick="openArchiveModal('Code Reviewer', '750 XP', 'WEEKLY', this)">Archive</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 11: First Contribution -->
                        <tr data-name="First Contribution" data-type="One-time" data-status="Published" data-xp="1500" data-date="Standard" data-created="2024-02-28" data-page="3" style="display:none;" onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:18px;height:18px;">
                                            <circle cx="12" cy="8" r="7"></circle>
                                            <polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">First Contribution</a>
                                </div>
                            </td>
                            <td><span class="quest-type-text">One-time</span></td>
                            <td><span class="quest-req-text">Submit your first open project</span></td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>1500 XP</span>
                                </div>
                            </td>
                            <td><span class="status-pill status-published">Published</span></td>
                            <td><div class="dates-stack"><span class="dates-primary">Feb 28 - Dec 31</span><span class="dates-sub">Standard</span></div></td>
                            <td><span class="created-date-text">Feb 28, 2024</span></td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-archive" onclick="openArchiveModal('First Contribution', '1500 XP', 'ONE-TIME', this)">Archive</button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 12: Night Owl -->
                        <tr data-name="Night Owl" data-type="Daily" data-status="Archived" data-xp="150" data-date="Expired" data-created="2024-02-14" data-page="3" style="display:none;" onclick="window.location.href='QuestDetails.aspx';">
                            <td>
                                <div class="quest-name-col">
                                    <div class="quest-icon-badge">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#D96A77" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:18px;height:18px;">
                                            <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
                                        </svg>
                                    </div>
                                    <a href="QuestDetails.aspx" class="quest-title-text" onclick="event.stopPropagation();">Night Owl</a>
                                </div>
                            </td>
                            <td><span class="quest-type-text">Daily</span></td>
                            <td><span class="quest-req-text">Submit task after 9:00 PM</span></td>
                            <td>
                                <div class="quest-xp-badge">
                                    <svg viewBox="0 0 24 24" width="12" height="12" style="width:12px;height:12px;">
                                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                    </svg>
                                    <span>150 XP</span>
                                </div>
                            </td>
                            <td><span class="status-pill status-archived">Archived</span></td>
                            <td><div class="dates-stack"><span class="dates-sub">Expired</span><span class="dates-sub">Feb 20</span></div></td>
                            <td><span class="created-date-text">Feb 14, 2024</span></td>
                            <td onclick="event.stopPropagation();">
                                <div class="actions-cell-wrap">
                                    <a href="QuestDetails.aspx" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="CreateQuest.aspx" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-restore" onclick="restoreQuest(this, 'Night Owl')">Restore</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- Pagination Row -->
                <div class="quests-pagination-row">
                    <span class="pagination-info-text" id="paginationInfo">Showing 4 of 24 quests</span>
                    <div class="pagination-btns-wrap" id="paginationBtns">
                        <button type="button" class="page-num-btn" onclick="goToPage(currentPage - 1)">&lt;</button>
                        <button type="button" class="page-num-btn active" id="btnPage1" onclick="goToPage(1)">1</button>
                        <button type="button" class="page-num-btn" id="btnPage2" onclick="goToPage(2)">2</button>
                        <button type="button" class="page-num-btn" id="btnPage3" onclick="goToPage(3)">3</button>
                        <button type="button" class="page-num-btn" onclick="goToPage(currentPage + 1)">&gt;</button>
                    </div>
                </div>
            </div>

            <!-- Archive Modal -->
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
                        <button type="button" onclick="confirmArchiveQuest()" style="background:#D96A77; color:#FFFFFF; border:none; border-radius:8px; padding:10px 20px; font-size:13px; font-weight:700; cursor:pointer; box-shadow:0 2px 6px rgba(217, 106, 119, 0.28);">Archive Quest</button>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                var currentArchiveTarget = null;
                var currentPage = 1;
                var totalPages = 3;

                function openArchiveModal(title, xp, freq, btn) {
                    currentArchiveTarget = btn ? btn.closest('tr') : null;
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
                    currentArchiveTarget = null;
                }

                function confirmArchiveQuest() {
                    if (currentArchiveTarget) {
                        currentArchiveTarget.setAttribute('data-status', 'Archived');
                        var statusSpan = currentArchiveTarget.querySelector('.status-pill');
                        if (statusSpan) {
                            statusSpan.className = 'status-pill status-archived';
                            statusSpan.innerText = 'Archived';
                        }
                        var btn = currentArchiveTarget.querySelector('.btn-row-archive');
                        var title = currentArchiveTarget.getAttribute('data-name') || 'Quest';
                        if (btn) {
                            btn.outerHTML = '<button type="button" class="btn-row-restore" onclick="restoreQuest(this, \'' + title.replace(/'/g, "\\'") + '\')">Restore</button>';
                        }
                        showToast('Quest "' + title + '" archived successfully.');
                    }
                    closeArchiveModal();
                    filterQuestsTable();
                }

                function publishQuest(btn, title) {
                    var tr = btn.closest('tr');
                    tr.setAttribute('data-status', 'Published');
                    var statusSpan = tr.querySelector('.status-pill');
                    if (statusSpan) {
                        statusSpan.className = 'status-pill status-published';
                        statusSpan.innerText = 'Published';
                    }
                    var xp = (tr.getAttribute('data-xp') || '500') + ' XP';
                    var freq = (tr.getAttribute('data-type') || 'DAILY').toUpperCase();
                    btn.outerHTML = '<button type="button" class="btn-row-archive" onclick="openArchiveModal(\'' + title.replace(/'/g, "\\'") + '\', \'' + xp + '\', \'' + freq + '\', this)">Archive</button>';
                    showToast('Quest "' + title + '" published successfully!');
                    filterQuestsTable();
                }

                function restoreQuest(btn, title) {
                    var tr = btn.closest('tr');
                    tr.setAttribute('data-status', 'Published');
                    var statusSpan = tr.querySelector('.status-pill');
                    if (statusSpan) {
                        statusSpan.className = 'status-pill status-published';
                        statusSpan.innerText = 'Published';
                    }
                    var xp = (tr.getAttribute('data-xp') || '500') + ' XP';
                    var freq = (tr.getAttribute('data-type') || 'DAILY').toUpperCase();
                    btn.outerHTML = '<button type="button" class="btn-row-archive" onclick="openArchiveModal(\'' + title.replace(/'/g, "\\'") + '\', \'' + xp + '\', \'' + freq + '\', this)">Archive</button>';
                    showToast('Quest "' + title + '" restored to Published!');
                    filterQuestsTable();
                }

                function filterQuestsTable() {
                    var search = (document.getElementById('questSearchInput').value || '').trim().toLowerCase();
                    var type = (document.getElementById('ddlQuestType').value || '').trim().toLowerCase();
                    var status = (document.getElementById('ddlQuestStatus').value || '').trim().toLowerCase();
                    var dateRange = (document.getElementById('ddlDateRange').value || '').trim().toLowerCase();

                    var rows = document.querySelectorAll('#tblQuestsBody tr');
                    var isFiltering = (search !== '' || type !== '' || status !== '' || dateRange !== '');
                    var visibleCount = 0;

                    rows.forEach(function(row) {
                        var rName = (row.getAttribute('data-name') || '').toLowerCase();
                        var rType = (row.getAttribute('data-type') || '').toLowerCase();
                        var rStatus = (row.getAttribute('data-status') || '').toLowerCase();
                        var rDate = (row.getAttribute('data-date') || '').toLowerCase();
                        var rPage = parseInt(row.getAttribute('data-page') || '1');

                        var matchSearch = !search || rName.indexOf(search) > -1 || (row.innerText || '').toLowerCase().indexOf(search) > -1;
                        var matchType = !type || rType === type;
                        var matchStatus = !status || rStatus === status;
                        var matchDate = !dateRange || rDate.indexOf(dateRange) > -1;

                        if (matchSearch && matchType && matchStatus && matchDate) {
                            if (isFiltering) {
                                row.style.display = '';
                                visibleCount++;
                            } else {
                                if (rPage === currentPage) {
                                    row.style.display = '';
                                    visibleCount++;
                                } else {
                                    row.style.display = 'none';
                                }
                            }
                        } else {
                            row.style.display = 'none';
                        }
                    });

                    var paginationInfo = document.getElementById('paginationInfo');
                    if (paginationInfo) {
                        if (isFiltering) {
                            paginationInfo.innerText = 'Showing ' + visibleCount + ' matching quest' + (visibleCount === 1 ? '' : 's');
                        } else {
                            paginationInfo.innerText = 'Showing ' + visibleCount + ' of 24 quests';
                        }
                    }
                }

                function clearAllFilters() {
                    document.getElementById('questSearchInput').value = '';
                    document.getElementById('ddlQuestType').value = '';
                    document.getElementById('ddlQuestStatus').value = '';
                    document.getElementById('ddlDateRange').value = '';
                    document.getElementById('ddlSortQuests').value = 'xp-desc';
                    currentPage = 1;
                    updatePaginationUI();
                    filterQuestsTable();
                    showToast('All filters cleared');
                }

                function sortQuestsTable() {
                    var sortVal = document.getElementById('ddlSortQuests').value;
                    var tbody = document.getElementById('tblQuestsBody');
                    var rows = Array.from(tbody.querySelectorAll('tr'));

                    rows.sort(function(a, b) {
                        if (sortVal === 'xp-desc') {
                            return parseInt(b.getAttribute('data-xp') || 0) - parseInt(a.getAttribute('data-xp') || 0);
                        } else if (sortVal === 'xp-asc') {
                            return parseInt(a.getAttribute('data-xp') || 0) - parseInt(b.getAttribute('data-xp') || 0);
                        } else if (sortVal === 'name-asc') {
                            return (a.getAttribute('data-name') || '').localeCompare(b.getAttribute('data-name') || '');
                        } else if (sortVal === 'name-desc') {
                            return (b.getAttribute('data-name') || '').localeCompare(a.getAttribute('data-name') || '');
                        } else if (sortVal === 'created-desc') {
                            return (b.getAttribute('data-created') || '').localeCompare(a.getAttribute('data-created') || '');
                        }
                        return 0;
                    });

                    rows.forEach(function(row) {
                        tbody.appendChild(row);
                    });

                    filterQuestsTable();
                }

                function goToPage(page) {
                    if (page < 1 || page > totalPages) return;
                    currentPage = page;
                    updatePaginationUI();
                    filterQuestsTable();
                }

                function updatePaginationUI() {
                    var btns = document.querySelectorAll('.pagination-btns-wrap .page-num-btn');
                    btns.forEach(function(btn) {
                        var num = parseInt(btn.innerText);
                        if (!isNaN(num)) {
                            if (num === currentPage) {
                                btn.classList.add('active');
                            } else {
                                btn.classList.remove('active');
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
                    filterQuestsTable();
                });
            </script>

        </div>
    </asp:Content>