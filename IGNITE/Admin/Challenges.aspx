<%@ Page Title="Challenges — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master"
    AutoEventWireup="true" CodeFile="Challenges.aspx.cs" Inherits="IGNITE.Admin.Challenges" %>

    <asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
        <!-- External stylesheet link -->
        <link href="../Content/admin-challenges.css" rel="stylesheet" type="text/css" />

        <!-- Embedded fail-safe styles to guarantee exact rendering in any environment without caching delays -->
        <style type="text/css">
            .challenges-container {
                display: flex;
                flex-direction: column;
                gap: 20px;
                width: 100%;
                box-sizing: border-box;
                font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                color: #1a1a1a;
            }

            /* Topbar Controls */
            .search-wrapper-local {
                position: relative;
                display: flex;
                align-items: center;
            }

            .search-wrapper-local svg {
                position: absolute;
                left: 14px;
                width: 16px !important;
                height: 16px !important;
                max-width: 16px;
                max-height: 16px;
                color: #8C857D;
                stroke: #8C857D;
                pointer-events: none;
                flex-shrink: 0;
            }

            .search-input-local {
                padding: 10px 14px 10px 38px;
                border: 1px solid #DDD6CB;
                border-radius: 8px;
                background: #FFFFFF;
                font-size: 13.5px;
                width: 250px;
                outline: none;
                font-family: inherit;
                color: #1a1a1a;
                transition: border-color 0.2s, box-shadow 0.2s;
                box-sizing: border-box;
            }

            .search-input-local:focus {
                border-color: #D96A77;
                box-shadow: 0 0 0 3px rgba(217, 106, 119, 0.15);
            }

            .search-input-local::placeholder {
                color: #A8A29E;
            }

            .btn-primary {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                background: #D96A77;
                color: #FFFFFF !important;
                border: none;
                padding: 10px 18px;
                border-radius: 8px;
                font-size: 13.5px;
                font-weight: 600;
                cursor: pointer;
                text-decoration: none !important;
                transition: background-color 0.2s, transform 0.1s;
                font-family: inherit;
                box-sizing: border-box;
                white-space: nowrap;
                box-shadow: 0 2px 6px rgba(217, 106, 119, 0.25);
            }

            .btn-primary:hover {
                background: #C45A66;
            }

            .btn-primary svg {
                width: 16px !important;
                height: 16px !important;
                stroke: #FFFFFF;
                flex-shrink: 0;
            }

            /* Filter Bar */
            .filter-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                gap: 12px;
                padding: 2px 0;
            }

            .filter-left,
            .filter-right {
                display: flex;
                align-items: center;
                flex-wrap: wrap;
                gap: 12px;
            }

            .select-box {
                padding: 8px 32px 8px 14px;
                background: #FFFFFF;
                border: 1px solid #DDD6CB;
                border-radius: 8px;
                font-size: 13px;
                font-weight: 600;
                color: #1a1a1a;
                appearance: none;
                -webkit-appearance: none;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23666' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
                background-repeat: no-repeat;
                background-position: right 10px center;
                cursor: pointer;
                outline: none;
                font-family: inherit;
                transition: border-color 0.2s;
            }

            .select-box:focus {
                border-color: #D96A77;
            }

            .sort-label {
                font-size: 13px;
                color: #666;
                font-weight: 500;
            }

            .select-box.sort-select {
                border: none;
                background-color: transparent;
                padding: 6px 26px 6px 4px;
                font-weight: 700;
                color: #1a1a1a;
                background-position: right 6px center;
            }

            .select-box.sort-select:focus {
                outline: none;
            }

            /* Table Container Card */
            .table-container {
                background: #EAE6DF;
                border-radius: 16px;
                padding: 24px;
                overflow-x: auto;
                box-sizing: border-box;
            }

            .challenges-table {
                width: 100%;
                border-collapse: collapse;
                font-size: 13px;
            }

            .challenges-table th {
                text-align: left;
                font-size: 11px;
                font-weight: 800;
                color: #8C857D;
                letter-spacing: 0.06em;
                text-transform: uppercase;
                padding-bottom: 16px;
                border-bottom: 1px solid #D8D4CC;
                white-space: nowrap;
            }

            .challenges-table td {
                padding: 18px 8px;
                border-bottom: 1px solid #D8D4CC;
                vertical-align: middle;
            }

            .challenges-table tbody tr {
                transition: background-color 0.15s ease;
            }

            .challenges-table tbody tr:hover {
                background-color: rgba(255, 255, 255, 0.45);
            }

            .challenges-table tbody tr:last-child td {
                border-bottom: none;
            }

            .chal-title-group {
                display: flex;
                flex-direction: column;
                gap: 3px;
            }

            .chal-title {
                font-size: 14px;
                font-weight: 700;
                color: #18181B;
                text-decoration: none;
                display: inline-block;
                cursor: pointer;
                transition: color 0.15s ease;
                line-height: 1.25;
            }

            .chal-title:hover {
                color: #D96A77;
                text-decoration: underline;
            }

            .chal-ref {
                font-size: 11px;
                color: #8C857D;
                font-weight: 500;
            }

            .chal-category {
                font-size: 13px;
                color: #4A4540;
                font-weight: 500;
            }

            .chal-req {
                font-size: 13px;
                color: #4A4540;
                font-weight: 500;
            }

            .chal-timeline {
                font-size: 11.5px;
                color: #666;
                line-height: 1.5;
                font-weight: 500;
            }

            /* Difficulty Badges */
            .badge-diff {
                font-size: 10px;
                font-weight: 800;
                padding: 3px 9px;
                border-radius: 12px;
                text-transform: uppercase;
                display: inline-block;
                letter-spacing: 0.5px;
            }

            .badge-hard {
                border: 1px solid #FCA5A5;
                color: #DC2626;
                background: #FEE2E2;
            }

            .badge-medium {
                border: 1px solid #FCD34D;
                color: #D97706;
                background: #FEF3C7;
            }

            .badge-easy {
                border: 1px solid #86EFAC;
                color: #16A34A;
                background: #DCFCE7;
            }

            /* XP Reward */
            .xp-reward {
                font-size: 13px;
                font-weight: 700;
                color: #18181B;
                display: inline-flex;
                align-items: center;
                gap: 6px;
                white-space: nowrap;
            }

            .xp-dot {
                width: 6px;
                height: 6px;
                background: #F59E0B;
                border-radius: 50%;
                display: inline-block;
            }

            /* Status Indicators */
            .status {
                font-size: 12.5px;
                font-weight: 600;
                display: inline-flex;
                align-items: center;
                gap: 6px;
                white-space: nowrap;
            }

            .status.published {
                color: #16A34A;
            }

            .status.draft {
                color: #8C857D;
            }

            .status.archived {
                color: #DE6B7A;
            }

            .status-dot {
                width: 6px;
                height: 6px;
                border-radius: 50%;
                display: inline-block;
            }

            .published .status-dot {
                background: #16A34A;
            }

            .draft .status-dot {
                background: #8C857D;
            }

            .archived .status-dot {
                background: #DE6B7A;
            }

            /* Action Buttons */
            .action-btns {
                display: flex;
                align-items: center;
                gap: 12px;
                color: #8C857D;
            }

            .action-btns a,
            .action-btns button {
                background: transparent;
                border: none;
                color: inherit;
                padding: 0;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: color 0.15s ease, transform 0.1s ease;
            }

            .action-btns a:hover,
            .action-btns button:hover {
                color: #18181B;
                transform: scale(1.1);
            }

            .action-btns svg {
                width: 16px !important;
                height: 16px !important;
                stroke: currentColor;
                flex-shrink: 0;
            }

            /* Action Dropdown Popup Menu */
            .action-menu-wrapper {
                position: relative;
                display: inline-flex;
            }

            .action-menu-dropdown {
                display: none;
                position: absolute;
                right: 0;
                top: 24px;
                background: #FFFFFF;
                border: 1px solid #DDD6CB;
                border-radius: 8px;
                box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
                min-width: 140px;
                z-index: 100;
                padding: 4px 0;
            }

            .action-menu-dropdown.show {
                display: block;
            }

            .action-menu-item {
                display: block;
                padding: 8px 14px;
                font-size: 12px;
                font-weight: 600;
                color: #18181B;
                text-decoration: none;
                cursor: pointer;
                transition: background 0.12s;
            }

            .action-menu-item:hover {
                background: #F4F1EC;
                color: #D96A77;
            }

            .action-menu-item.danger:hover {
                color: #DC2626;
            }

            /* Pagination Bar */
            .pagination {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 24px;
                padding-top: 20px;
                border-top: 1px solid #D8D4CC;
                flex-wrap: wrap;
                gap: 12px;
            }

            .pagination-text {
                font-size: 12.5px;
                color: #666;
                font-weight: 500;
            }

            .pagination-controls {
                display: flex;
                align-items: center;
                gap: 6px;
            }

            .page-btn {
                width: 32px;
                height: 32px;
                border-radius: 6px;
                border: none;
                background: #FFFFFF;
                color: #18181B;
                font-size: 13px;
                font-weight: 700;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: background 0.15s, color 0.15s;
                font-family: inherit;
            }

            .page-btn.active {
                background: #D96A77;
                color: #FFFFFF;
            }

            .page-btn:hover:not(.active) {
                background: #F4F1EC;
            }

            /* Bottom Stats Row */
            .stats-row {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 16px;
                width: 100%;
            }

            .stat-card {
                background: #EAE6DF;
                border-radius: 12px;
                padding: 22px 24px;
                display: flex;
                flex-direction: column;
                box-sizing: border-box;
            }

            .stat-card-title {
                font-size: 11px;
                font-weight: 800;
                color: #8C857D;
                text-transform: uppercase;
                margin-bottom: 8px;
                letter-spacing: 0.06em;
            }

            .stat-card-value {
                font-size: 28px;
                font-weight: 800;
                color: #18181B;
                margin-bottom: 8px;
                line-height: 1.1;
            }

            .stat-card-sub {
                font-size: 12px;
                color: #666;
                font-weight: 500;
            }

            .stat-card-sub.highlight {
                color: #D96A77;
                font-weight: 600;
            }

            .progress-bar {
                height: 4px;
                background: #D8D4CC;
                border-radius: 2px;
                margin-top: 10px;
                overflow: hidden;
                width: 100%;
            }

            .progress-fill {
                height: 100%;
                background: #D96A77;
                border-radius: 2px;
                transition: width 0.3s ease;
            }

            /* Responsive Adjustments */
            @media (max-width: 1024px) {
                .stats-row {
                    grid-template-columns: repeat(2, 1fr);
                }
            }

            @media (max-width: 680px) {
                .stats-row {
                    grid-template-columns: 1fr;
                }

                .filter-bar {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .filter-left,
                .filter-right {
                    width: 100%;
                    justify-content: space-between;
                }

                .search-input-local {
                    width: 180px;
                }
            }
        </style>
    </asp:Content>

    <asp:Content ID="TopbarContent" ContentPlaceHolderID="TopbarContent" runat="server">
        <!-- Topbar Left: Page Title (Formatted according to AdminMaster) -->
        <div class="admin-topbar-left">
            <h1 class="admin-page-title">Challenges</h1>
        </div>

        <!-- Topbar Right: Search Input & Action Button -->
        <div class="admin-topbar-right">
            <div class="search-wrapper-local">
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"
                    stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
                <input type="text" class="search-input-local" placeholder="Search challenges..." id="txtChallengeSearch"
                    onkeyup="filterChallengesTable()" />
            </div>
            <a href="EditChallenge.aspx" class="btn-primary" title="Edit or Create Challenge">
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"
                    stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                </svg>
                <span>Edit Challenge</span>
            </a>
        </div>
    </asp:Content>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="challenges-container">

            <!-- Filter Bar -->
            <div class="filter-bar">
                <div class="filter-left">
                    <select class="select-box" id="ddlCategory" onchange="filterChallengesTable()">
                        <option value="">Category: All</option>
                        <option value="Programming">Programming</option>
                        <option value="Design">Design</option>
                        <option value="Mathematics">Mathematics</option>
                    </select>
                    <select class="select-box" id="ddlStatus" onchange="filterChallengesTable()">
                        <option value="">Status: All</option>
                        <option value="Published">Published</option>
                        <option value="Draft">Draft</option>
                        <option value="Archived">Archived</option>
                    </select>
                </div>
                <div class="filter-right">
                    <span class="sort-label">Sort by:</span>
                    <select class="select-box sort-select" id="ddlSort" onchange="sortChallengesTable()">
                        <option value="latest">Latest Added</option>
                        <option value="xp-desc">Highest XP</option>
                        <option value="title-asc">Title (A-Z)</option>
                        <option value="difficulty">Difficulty</option>
                    </select>
                </div>
            </div>

            <!-- Table Container Card -->
            <div class="table-container">
                <table class="challenges-table" id="tblChallenges">
                    <thead>
                        <tr>
                            <th style="width: 25%;">CHALLENGE TITLE</th>
                            <th style="width: 14%;">CATEGORY</th>
                            <th style="width: 11%;">DIFFICULTY</th>
                            <th style="width: 15%;">REQUIREMENT</th>
                            <th style="width: 13%;">TIMELINE</th>
                            <th style="width: 11%;">XP REWARD</th>
                            <th style="width: 10%;">STATUS</th>
                            <th style="text-align: right; padding-right: 12px;">ACTIONS</th>
                        </tr>
                    </thead>
                    <tbody id="tblChallengesBody">
                        <!-- Row 1: Advanced Python Patterns -->
                        <tr data-category="Programming" data-status="Published" data-diff="Hard" data-xp="2500"
                            data-order="1" onclick="window.location='ChallengeDetails.aspx';" style="cursor:pointer;">
                            <td>
                                <div class="chal-title-group">
                                    <a href="ChallengeDetails.aspx" class="chal-title"
                                        onclick="event.stopPropagation();">Advanced Python Patterns</a>
                                    <div class="chal-ref">Ref: #CHL-9021</div>
                                </div>
                            </td>
                            <td class="chal-category">Programming</td>
                            <td><span class="badge-diff badge-hard">HARD</span></td>
                            <td class="chal-req">Project Submission</td>
                            <td>
                                <div class="chal-timeline">
                                    Oct 12, 2023<br />
                                    Oct 26, 2023
                                </div>
                            </td>
                            <td>
                                <div class="xp-reward"><span class="xp-dot"></span>2,500 XP</div>
                            </td>
                            <td>
                                <div class="status published"><span class="status-dot"></span>Published</div>
                            </td>
                            <td style="text-align: right; padding-right: 12px;">
                                <div class="action-btns" style="justify-content: flex-end;"
                                    onclick="event.stopPropagation();">
                                    <a href="ChallengeDetails.aspx" title="View Details">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="EditChallenge.aspx" title="Edit Challenge">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <div class="action-menu-wrapper">
                                        <button type="button" title="More Options"
                                            onclick="toggleActionMenu(event, 'menu1')">
                                            <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                                stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                                <circle cx="12" cy="12" r="1"></circle>
                                                <circle cx="12" cy="5" r="1"></circle>
                                                <circle cx="12" cy="19" r="1"></circle>
                                            </svg>
                                        </button>
                                        <div class="action-menu-dropdown" id="menu1">
                                            <a href="ChallengeDetails.aspx" class="action-menu-item">View Details</a>
                                            <a href="EditChallenge.aspx" class="action-menu-item">Edit Challenge</a>
                                            <a href="javascript:void(0);" onclick="alert('Challenge cloned!');"
                                                class="action-menu-item">Duplicate</a>
                                            <a href="javascript:void(0);" onclick="alert('Challenge archived.');"
                                                class="action-menu-item danger">Archive</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 2: UI Typography Basics -->
                        <tr data-category="Design" data-status="Draft" data-diff="Easy" data-xp="500" data-order="2"
                            onclick="window.location='ChallengeDetails.aspx';" style="cursor:pointer;">
                            <td>
                                <div class="chal-title-group">
                                    <a href="ChallengeDetails.aspx" class="chal-title"
                                        onclick="event.stopPropagation();">UI Typography Basics</a>
                                    <div class="chal-ref">Ref: #CHL-8842</div>
                                </div>
                            </td>
                            <td class="chal-category">Design</td>
                            <td><span class="badge-diff badge-easy">EASY</span></td>
                            <td class="chal-req">Quiz</td>
                            <td>
                                <div class="chal-timeline">
                                    Nov 01, 2023<br />
                                    Nov 05, 2023
                                </div>
                            </td>
                            <td>
                                <div class="xp-reward"><span class="xp-dot"></span>500 XP</div>
                            </td>
                            <td>
                                <div class="status draft"><span class="status-dot"></span>Draft</div>
                            </td>
                            <td style="text-align: right; padding-right: 12px;">
                                <div class="action-btns" style="justify-content: flex-end;"
                                    onclick="event.stopPropagation();">
                                    <a href="ChallengeDetails.aspx" title="View Details">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="EditChallenge.aspx" title="Edit Challenge">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <div class="action-menu-wrapper">
                                        <button type="button" title="More Options"
                                            onclick="toggleActionMenu(event, 'menu2')">
                                            <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                                stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                                <circle cx="12" cy="12" r="1"></circle>
                                                <circle cx="12" cy="5" r="1"></circle>
                                                <circle cx="12" cy="19" r="1"></circle>
                                            </svg>
                                        </button>
                                        <div class="action-menu-dropdown" id="menu2">
                                            <a href="ChallengeDetails.aspx" class="action-menu-item">View Details</a>
                                            <a href="EditChallenge.aspx" class="action-menu-item">Edit Challenge</a>
                                            <a href="javascript:void(0);" onclick="alert('Challenge cloned!');"
                                                class="action-menu-item">Duplicate</a>
                                            <a href="javascript:void(0);" onclick="alert('Challenge archived.');"
                                                class="action-menu-item danger">Archive</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 3: Data Analysis Challenge -->
                        <tr data-category="Mathematics" data-status="Archived" data-diff="Medium" data-xp="1200"
                            data-order="3" onclick="window.location='ChallengeDetails.aspx';" style="cursor:pointer;">
                            <td>
                                <div class="chal-title-group">
                                    <a href="ChallengeDetails.aspx" class="chal-title"
                                        onclick="event.stopPropagation();">Data Analysis Challenge</a>
                                    <div class="chal-ref">Ref: #CHL-7761</div>
                                </div>
                            </td>
                            <td class="chal-category">Mathematics</td>
                            <td><span class="badge-diff badge-medium">MEDIUM</span></td>
                            <td class="chal-req">File Upload</td>
                            <td>
                                <div class="chal-timeline">
                                    Sep 15, 2023<br />
                                    Sep 30, 2023
                                </div>
                            </td>
                            <td>
                                <div class="xp-reward"><span class="xp-dot"></span>1,200 XP</div>
                            </td>
                            <td>
                                <div class="status archived"><span class="status-dot"></span>Archived</div>
                            </td>
                            <td style="text-align: right; padding-right: 12px;">
                                <div class="action-btns" style="justify-content: flex-end;"
                                    onclick="event.stopPropagation();">
                                    <a href="ChallengeDetails.aspx" title="View Details">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="EditChallenge.aspx" title="Edit Challenge">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <div class="action-menu-wrapper">
                                        <button type="button" title="More Options"
                                            onclick="toggleActionMenu(event, 'menu3')">
                                            <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                                stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                                <circle cx="12" cy="12" r="1"></circle>
                                                <circle cx="12" cy="5" r="1"></circle>
                                                <circle cx="12" cy="19" r="1"></circle>
                                            </svg>
                                        </button>
                                        <div class="action-menu-dropdown" id="menu3">
                                            <a href="ChallengeDetails.aspx" class="action-menu-item">View Details</a>
                                            <a href="EditChallenge.aspx" class="action-menu-item">Edit Challenge</a>
                                            <a href="javascript:void(0);" onclick="alert('Challenge cloned!');"
                                                class="action-menu-item">Duplicate</a>
                                            <a href="javascript:void(0);" onclick="alert('Challenge archived.');"
                                                class="action-menu-item danger">Archive</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 4: Responsive Web Layouts -->
                        <tr data-category="Programming" data-status="Published" data-diff="Medium" data-xp="1800"
                            data-order="4" onclick="window.location='ChallengeDetails.aspx';" style="cursor:pointer;">
                            <td>
                                <div class="chal-title-group">
                                    <a href="ChallengeDetails.aspx" class="chal-title"
                                        onclick="event.stopPropagation();">Responsive Web Layouts</a>
                                    <div class="chal-ref">Ref: #CHL-9110</div>
                                </div>
                            </td>
                            <td class="chal-category">Programming</td>
                            <td><span class="badge-diff badge-medium">MEDIUM</span></td>
                            <td class="chal-req">GitHub URL</td>
                            <td>
                                <div class="chal-timeline">
                                    Nov 10, 2023<br />
                                    Nov 20, 2023
                                </div>
                            </td>
                            <td>
                                <div class="xp-reward"><span class="xp-dot"></span>1,800 XP</div>
                            </td>
                            <td>
                                <div class="status published"><span class="status-dot"></span>Published</div>
                            </td>
                            <td style="text-align: right; padding-right: 12px;">
                                <div class="action-btns" style="justify-content: flex-end;"
                                    onclick="event.stopPropagation();">
                                    <a href="ChallengeDetails.aspx" title="View Details">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </a>
                                    <a href="EditChallenge.aspx" title="Edit Challenge">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </a>
                                    <div class="action-menu-wrapper">
                                        <button type="button" title="More Options"
                                            onclick="toggleActionMenu(event, 'menu4')">
                                            <svg viewBox="0 0 24 24" width="16" height="16" fill="none"
                                                stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                                <circle cx="12" cy="12" r="1"></circle>
                                                <circle cx="12" cy="5" r="1"></circle>
                                                <circle cx="12" cy="19" r="1"></circle>
                                            </svg>
                                        </button>
                                        <div class="action-menu-dropdown" id="menu4">
                                            <a href="ChallengeDetails.aspx" class="action-menu-item">View Details</a>
                                            <a href="EditChallenge.aspx" class="action-menu-item">Edit Challenge</a>
                                            <a href="javascript:void(0);" onclick="alert('Challenge cloned!');"
                                                class="action-menu-item">Duplicate</a>
                                            <a href="javascript:void(0);" onclick="alert('Challenge archived.');"
                                                class="action-menu-item danger">Archive</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- Pagination Bar -->
                <div class="pagination">
                    <span class="pagination-text" id="lblPaginationCount">Showing 1 to 4 of 24 challenges</span>
                    <div class="pagination-controls">
                        <button type="button" class="page-btn" onclick="prevPage()">&lt;</button>
                        <button type="button" class="page-btn active" onclick="goToPage(1)">1</button>
                        <button type="button" class="page-btn" onclick="goToPage(2)">2</button>
                        <button type="button" class="page-btn" onclick="goToPage(3)">3</button>
                        <button type="button" class="page-btn" onclick="nextPage()">&gt;</button>
                    </div>
                </div>
            </div>

            <!-- Bottom Stats Row (4 Metric Cards) -->
            <div class="stats-row">
                <div class="stat-card">
                    <div class="stat-card-title">ACTIVE CHALLENGES</div>
                    <div class="stat-card-value">18</div>
                    <div class="stat-card-sub highlight">&uarr; +2 this month</div>
                </div>
                <div class="stat-card">
                    <div class="stat-card-title">TOTAL SUBMISSIONS</div>
                    <div class="stat-card-value">1,248</div>
                    <div class="stat-card-sub highlight">&uarr; 12% growth</div>
                </div>
                <div class="stat-card">
                    <div class="stat-card-title">AVG. COMPLETION</div>
                    <div class="stat-card-value">64%</div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 64%;"></div>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-card-title">XP DISTRIBUTED</div>
                    <div class="stat-card-value">42.5k</div>
                    <div class="stat-card-sub">Lifetime rewards</div>
                </div>
            </div>

        </div>
    </asp:Content>

    <asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
        <script type="text/javascript">
            // Real-time table filter logic
            function filterChallengesTable() {
                var searchInput = document.getElementById("txtChallengeSearch");
                var filterText = searchInput ? searchInput.value.toLowerCase().trim() : "";
                var categoryVal = document.getElementById("ddlCategory") ? document.getElementById("ddlCategory").value : "";
                var statusVal = document.getElementById("ddlStatus") ? document.getElementById("ddlStatus").value : "";

                var table = document.getElementById("tblChallengesBody");
                if (!table) return;

                var rows = table.getElementsByTagName("tr");
                var visibleCount = 0;

                for (var i = 0; i < rows.length; i++) {
                    var row = rows[i];
                    var rowText = row.innerText.toLowerCase();
                    var rowCategory = row.getAttribute("data-category") || "";
                    var rowStatus = row.getAttribute("data-status") || "";

                    var matchesSearch = (filterText === "" || rowText.indexOf(filterText) > -1);
                    var matchesCategory = (categoryVal === "" || rowCategory.toLowerCase() === categoryVal.toLowerCase());
                    var matchesStatus = (statusVal === "" || rowStatus.toLowerCase() === statusVal.toLowerCase());

                    if (matchesSearch && matchesCategory && matchesStatus) {
                        row.style.display = "";
                        visibleCount++;
                    } else {
                        row.style.display = "none";
                    }
                }

                var countLabel = document.getElementById("lblPaginationCount");
                if (countLabel) {
                    countLabel.innerText = "Showing " + visibleCount + " of " + rows.length + " challenges";
                }
            }

            // Table sorting logic
            function sortChallengesTable() {
                var sortVal = document.getElementById("ddlSort") ? document.getElementById("ddlSort").value : "latest";
                var tbody = document.getElementById("tblChallengesBody");
                if (!tbody) return;

                var rows = Array.from(tbody.querySelectorAll("tr"));

                rows.sort(function (a, b) {
                    if (sortVal === "latest") {
                        return parseInt(a.getAttribute("data-order") || 0) - parseInt(b.getAttribute("data-order") || 0);
                    } else if (sortVal === "xp-desc") {
                        return parseInt(b.getAttribute("data-xp") || 0) - parseInt(a.getAttribute("data-xp") || 0);
                    } else if (sortVal === "title-asc") {
                        var titleA = a.querySelector(".chal-title") ? a.querySelector(".chal-title").innerText.trim().toLowerCase() : "";
                        var titleB = b.querySelector(".chal-title") ? b.querySelector(".chal-title").innerText.trim().toLowerCase() : "";
                        return titleA.localeCompare(titleB);
                    } else if (sortVal === "difficulty") {
                        var diffRank = { "easy": 1, "medium": 2, "hard": 3 };
                        var diffA = (a.getAttribute("data-diff") || "").toLowerCase();
                        var diffB = (b.getAttribute("data-diff") || "").toLowerCase();
                        return (diffRank[diffB] || 0) - (diffRank[diffA] || 0);
                    }
                    return 0;
                });

                rows.forEach(function (row) {
                    tbody.appendChild(row);
                });
            }

            // More options dropdown toggle
            function toggleActionMenu(event, menuId) {
                event.stopPropagation();
                var allMenus = document.querySelectorAll(".action-menu-dropdown");
                allMenus.forEach(function (m) {
                    if (m.id !== menuId) m.classList.remove("show");
                });

                var menu = document.getElementById(menuId);
                if (menu) {
                    menu.classList.toggle("show");
                }
            }

            // Close action menu on external click
            document.addEventListener("click", function () {
                var allMenus = document.querySelectorAll(".action-menu-dropdown");
                allMenus.forEach(function (m) {
                    m.classList.remove("show");
                });
            });

            // Pagination dummy handler
            var currentPage = 1;
            function goToPage(pageNum) {
                currentPage = pageNum;
                var buttons = document.querySelectorAll(".pagination-controls .page-btn");
                buttons.forEach(function (btn) {
                    btn.classList.remove("active");
                    if (btn.innerText.trim() === String(pageNum)) {
                        btn.classList.add("active");
                    }
                });
            }

            function prevPage() {
                if (currentPage > 1) goToPage(currentPage - 1);
            }

            function nextPage() {
                if (currentPage < 3) goToPage(currentPage + 1);
            }
        </script>
    </asp:Content>