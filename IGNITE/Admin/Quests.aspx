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

            .quests-table tbody tr:hover {
                background: rgba(255, 255, 255, 0.45);
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
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input-field" placeholder="Search quests..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                    </div>

                    <!-- Type Dropdown -->
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="filter-select-btn" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                        <asp:ListItem Text="Type: All" Value=""></asp:ListItem>
                        <asp:ListItem Text="Automatic" Value="Automatic"></asp:ListItem>
                        <asp:ListItem Text="Management" Value="Management"></asp:ListItem>
                    </asp:DropDownList>

                    <!-- Status Dropdown -->
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="filter-select-btn" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                        <asp:ListItem Text="Status: All" Value=""></asp:ListItem>
                        <asp:ListItem Text="Published" Value="Published"></asp:ListItem>
                        <asp:ListItem Text="Draft" Value="Draft"></asp:ListItem>
                        <asp:ListItem Text="Archived" Value="Archived"></asp:ListItem>
                    </asp:DropDownList>

                    <!-- Clear Filters -->
                    <asp:LinkButton ID="btnClearFilters" runat="server" CssClass="btn-clear-filters" OnClick="btnClearFilters_Click">CLEAR FILTERS</asp:LinkButton>
                </div>

                <div class="filter-right-controls">
                    <!-- Sort Dropdown -->
                    <asp:DropDownList ID="ddlSort" runat="server" CssClass="sort-dropdown-btn" AutoPostBack="true" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                        <asp:ListItem Text="Sort: Latest" Value="Latest"></asp:ListItem>
                        <asp:ListItem Text="Sort: XP Reward" Value="XPReward"></asp:ListItem>
                        <asp:ListItem Text="Sort: Title" Value="Title"></asp:ListItem>
                    </asp:DropDownList>
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
                        <asp:PlaceHolder ID="phQuestsTable" runat="server"></asp:PlaceHolder>
                        <tr>
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
                                    <span class="quest-title-text">Deep Focus Session</span>
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
                            <td>
                                <div class="actions-cell-wrap">
                                    <a href="javascript:void(0);" class="action-icon-link" title="View Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="javascript:void(0);" class="action-icon-link" title="Edit Quest">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" style="width:16px;height:16px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <button type="button" class="btn-row-archive">Archive</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- Pagination Row -->
                <div class="quests-pagination-row">
                    <span class="pagination-info-text"><asp:Literal ID="litPaginationText" runat="server" Text="Showing 0-0 of 0 quests"></asp:Literal></span>
                    <div class="pagination-btns-wrap">
                        <asp:LinkButton ID="btnPrev" runat="server" CssClass="page-num-btn" OnClick="btnPrev_Click">&lt;</asp:LinkButton>
                        <asp:PlaceHolder ID="phPageNumbers" runat="server"></asp:PlaceHolder>
                        <asp:LinkButton ID="btnNext" runat="server" CssClass="page-num-btn" OnClick="btnNext_Click">&gt;</asp:LinkButton>
                    </div>
                </div>
            </div>

        </div>
    </asp:Content>