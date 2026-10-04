<%@ Page Title="Students — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="IGNITE.Admin.Students" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .admin-topbar-header { display: none !important; }
        .admin-page-canvas { padding-top: 40px !important; }

        .students-container {
            display: flex;
            flex-direction: column;
            gap: 24px;
            padding: 24px 32px;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            color: #1a1a1a;
            box-sizing: border-box;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 4px;
            flex-wrap: wrap;
            gap: 16px;
        }

        .page-title {
            font-size: 24px;
            font-weight: 800;
            color: #1a1a1a;
            margin: 0;
            line-height: 1.2;
        }

        .page-subtitle {
            font-size: 13px;
            color: #888;
            margin-top: 3px;
            font-weight: 500;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .search-wrapper-local {
            position: relative;
            display: flex;
            align-items: center;
        }

        .search-wrapper-local svg {
            position: absolute;
            left: 12px;
            width: 16px !important;
            height: 16px !important;
            max-width: 16px;
            max-height: 16px;
            color: #888;
            stroke: #888;
            pointer-events: none;
            flex-shrink: 0;
        }

        .search-input-local {
            padding: 10px 10px 10px 36px;
            border: 1px solid #E0DCD3;
            border-radius: 8px;
            background: #fff;
            font-size: 13px;
            width: 250px;
            outline: none;
            font-family: inherit;
            color: #1a1a1a;
            transition: border-color 0.2s;
            box-sizing: border-box;
        }

        .search-input-local:focus {
            border-color: #D96A77;
        }

        .btn-primary {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #D96A77;
            color: #ffffff;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.2s;
            font-family: inherit;
            box-sizing: border-box;
        }

        .btn-primary:hover {
            background: #C45A66;
        }

        .btn-primary svg {
            width: 16px !important;
            height: 16px !important;
            flex-shrink: 0;
        }

        .filter-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
        }

        .filter-left, .filter-right {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
        }

        .select-box {
            padding: 8px 32px 8px 12px;
            background: #fff;
            border: 1px solid #E0DCD3;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            color: #1a1a1a;
            appearance: none;
            -webkit-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23666' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 8px center;
            cursor: pointer;
            font-family: inherit;
            outline: none;
            box-sizing: border-box;
        }

        .select-box:focus {
            border-color: #D96A77;
        }

        .btn-clear-filters {
            background: transparent;
            border: none;
            color: #D96A77;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            padding: 4px 8px;
            border-radius: 4px;
            font-family: inherit;
        }

        .btn-clear-filters:hover {
            color: #C45A66;
            text-decoration: underline;
        }

        .sort-label {
            font-size: 13px;
            color: #666;
            font-weight: 500;
        }

        .table-container {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 24px;
            overflow-x: auto;
            box-sizing: border-box;
        }

        .students-table {
            width: 100%;
            border-collapse: collapse;
            white-space: nowrap;
        }

        .students-table th {
            text-align: left;
            font-size: 11px;
            font-weight: 800;
            color: #888;
            text-transform: uppercase;
            padding-bottom: 16px;
            border-bottom: 1px solid #D8D4CC;
            letter-spacing: 0.5px;
            user-select: none;
        }

        .students-table td {
            padding: 18px 0;
            border-bottom: 1px solid #D8D4CC;
            vertical-align: middle;
            font-size: 13px;
            font-weight: 500;
            color: #4A4540;
        }

        .students-table tr:last-child td {
            border-bottom: none;
        }

        .students-table tbody tr {
            transition: background-color 0.15s ease;
        }

        .students-table tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.45);
        }

        .student-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 13px;
            color: #FFFFFF;
        }

        .avatar-red { background-color: #D96A77; }
        .avatar-pink { background-color: #E288A5; }
        .avatar-rose { background-color: #D96A77; }
        .avatar-purple { background-color: #A855F7; }

        .student-name {
            font-size: 14px;
            font-weight: 700;
            color: #1a1a1a;
            margin-bottom: 2px;
            line-height: 1.2;
        }

        .student-id {
            font-size: 11px;
            color: #888;
            font-weight: 600;
        }

        .course-name {
            color: #1a1a1a;
            font-weight: 600;
            font-size: 13px;
            margin-bottom: 2px;
            line-height: 1.2;
        }

        .course-dept {
            font-size: 11px;
            color: #888;
            font-weight: 500;
        }

        .xp-reward {
            font-size: 13px;
            font-weight: 700;
            color: #D96A77;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .xp-dot {
            width: 6px;
            height: 6px;
            background: #D96A77;
            border-radius: 50%;
        }

        .streak-val {
            font-size: 13px;
            font-weight: 700;
            color: #D97706;
        }

        .streak-val.inactive {
            color: #888;
            font-weight: 500;
        }

        .status {
            font-size: 12px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .status.active { color: #10B981; }
        .status.inactive { color: #D97706; }
        .status.suspended { color: #E24A4A; }

        .status-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
        }

        .status.active .status-dot { background: #10B981; }
        .status.inactive .status-dot { background: #D97706; }
        .status.suspended .status-dot { background: #E24A4A; }

        .action-btns {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #888;
        }

        .action-btns svg {
            width: 16px !important;
            height: 16px !important;
            max-width: 16px !important;
            max-height: 16px !important;
            cursor: pointer;
            transition: color 0.2s;
            stroke: currentColor;
            flex-shrink: 0;
        }

        .action-btns svg:hover {
            color: #1a1a1a;
        }

        .action-btns a {
            color: inherit;
            display: inline-flex;
            align-items: center;
        }

        .pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 24px;
            padding-top: 24px;
            border-top: 1px solid #D8D4CC;
            flex-wrap: wrap;
            gap: 12px;
        }

        .pagination-text {
            font-size: 13px;
            color: #666;
        }

        .pagination-controls {
            display: flex;
            gap: 6px;
            align-items: center;
        }

        .page-btn {
            width: 32px;
            height: 32px;
            border-radius: 6px;
            border: none;
            background: #fff;
            color: #1a1a1a;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: inherit;
            transition: background 0.15s;
        }

        .page-btn.active {
            background: #D96A77;
            color: #fff;
        }

        .page-btn:hover:not(.active) {
            background: #F4F1EC;
        }

        .stats-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
        }

        .stat-card {
            background: #EAE6DF;
            border-radius: 12px;
            padding: 24px;
            display: flex;
            flex-direction: column;
            box-sizing: border-box;
        }

        .stat-card-title {
            font-size: 11px;
            font-weight: 800;
            color: #888;
            text-transform: uppercase;
            margin-bottom: 8px;
            letter-spacing: 0.5px;
        }

        .stat-card-value {
            font-size: 28px;
            font-weight: 800;
            color: #1a1a1a;
            margin-bottom: 8px;
            line-height: 1;
        }

        .stat-card-sub {
            font-size: 12px;
            color: #666;
        }

        .stat-card-sub.highlight {
            color: #D96A77;
            font-weight: 600;
        }

        .progress-bar {
            height: 4px;
            background: #D8D4CC;
            border-radius: 2px;
            margin-top: 12px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: #D96A77;
        }

        @media (max-width: 900px) {
            .stats-row {
                grid-template-columns: repeat(2, 1fr);
            }
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
            .header-actions {
                width: 100%;
                justify-content: space-between;
            }
            .search-input-local {
                width: 100%;
            }
        }

        @media (max-width: 600px) {
            .stats-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="TopbarContent" ContentPlaceHolderID="TopbarContent" runat="server">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="students-container">
        
        <!-- Page Header (Matching Challenges Header Pattern) -->
        <div class="page-header">
            <div>
                <h1 class="page-title">Students</h1>
                <div class="page-subtitle">Monitor and manage student accounts</div>
            </div>
            <div class="header-actions">
                <div class="search-wrapper-local">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" width="16" height="16" style="width:16px;height:16px;flex-shrink:0;">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    <input type="text" class="search-input-local" placeholder="Search students..." id="txtStudentSearch" onkeyup="filterStudentsTable()" />
                </div>
                <a href='<%= ResolveUrl("~/Admin/StudentProfile.aspx") %>' class="btn-primary" style="text-decoration:none;">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                        <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                        <circle cx="8.5" cy="7" r="4"></circle>
                        <line x1="20" y1="8" x2="20" y2="14"></line>
                        <line x1="23" y1="11" x2="17" y2="11"></line>
                    </svg>
                    Add Student
                </a>
            </div>
        </div>

        <!-- Filter Bar -->
        <div class="filter-bar">
            <div class="filter-left">
                <select class="select-box" id="ddlCourse" onchange="filterStudentsTable()">
                    <option value="">Category: All</option>
                    <option value="Engineering">Engineering</option>
                    <option value="Design">Design</option>
                    <option value="Business">Business</option>
                    <option value="Sciences">Sciences</option>
                </select>

                <select class="select-box" id="ddlYear" onchange="filterStudentsTable()">
                    <option value="">Year: All</option>
                    <option value="1st Year">1st Year</option>
                    <option value="2nd Year">2nd Year</option>
                    <option value="3rd Year">3rd Year</option>
                    <option value="4th Year">4th Year</option>
                </select>

                <select class="select-box" id="ddlStatus" onchange="filterStudentsTable()">
                    <option value="">Status: All</option>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                    <option value="Suspended">Suspended</option>
                </select>

                <select class="select-box" id="ddlLevel" onchange="filterStudentsTable()">
                    <option value="">Difficulty: All</option>
                    <option value="1-5">Level 1 - 5</option>
                    <option value="6-10">Level 6 - 10</option>
                    <option value="11-15">Level 11 - 15</option>
                    <option value="16+">Level 16+</option>
                </select>

                <button type="button" class="btn-clear-filters" onclick="clearAllFilters()">Clear filters</button>
            </div>

            <div class="filter-right">
                <span class="sort-label">Sort by:</span>
                <select class="select-box" style="border:none; background-color:transparent;" id="ddlSort" onchange="sortStudentsTable()">
                    <option value="last_active">Latest Added</option>
                    <option value="xp">XP: High to Low</option>
                    <option value="streak">Streak: High to Low</option>
                    <option value="name">Name (A-Z)</option>
                </select>
            </div>
        </div>

        <!-- Results count -->
        <div class="results-count">
            <strong><asp:Literal ID="litTotalCount" runat="server" Text="0"></asp:Literal></strong> students found
        </div>

        <!-- Students Table -->
        <div class="table-container">
            <table class="students-table" id="studentsTable">
                <thead>
                    <tr>
                        <th style="width: 25%;">STUDENT NAME</th>
                        <th style="width: 15%;">CATEGORY</th>
                        <th style="width: 12%;">YEAR / SEM</th>
                        <th style="width: 8%;">LEVEL</th>
                        <th style="width: 12%;">XP REWARD</th>
                        <th style="width: 8%;">STREAK</th>
                        <th style="width: 8%;">ACTIVE CH.</th>
                        <th style="width: 8%;">STATUS</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Row 1: Elena Rodriguez -->
                    <tr onclick="window.location='StudentProfile.aspx';" style="cursor:pointer;" data-name="Elena Rodriguez" data-id="#STU-2401" data-course="Engineering" data-dept="Computer Science" data-year="3rd Year" data-level="12" data-xp="1250" data-streak="8" data-status="Active">
                        <td>
                            <div class="student-info">
                                <div class="avatar avatar-red">ER</div>
                                <div>
                                    <div class="student-name">Elena Rodriguez</div>
                                    <div class="student-id">Ref: #STU-2401</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="course-name">Engineering</div>
                            <div class="course-dept">Computer Science</div>
                        </td>
                        <td>3rd Year / 1st</td>
                        <td>12</td>
                        <td>
                            <div class="xp-reward"><div class="xp-dot"></div>1,250 XP</div>
                        </td>
                        <td>
                            <span class="streak-val">🔥 8</span>
                        </td>
                        <td>3</td>
                        <td>
                            <div class="status active"><div class="status-dot"></div>Active</div>
                        </td>
                        <td>
                            <div class="action-btns" onclick="event.stopPropagation();">
                                <a href='<%= ResolveUrl("~/Admin/StudentProfile.aspx") %>' title="View Profile">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href='<%= ResolveUrl("~/Admin/StudentProfile.aspx") %>' title="Edit Student">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;flex-shrink:0;" onclick="alert('Student: Elena Rodriguez (ID: #STU-2401)');">
                                    <circle cx="12" cy="12" r="1"></circle>
                                    <circle cx="12" cy="5" r="1"></circle>
                                    <circle cx="12" cy="19" r="1"></circle>
                                </svg>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 2: Marcus Chen -->
                    <tr onclick="window.location='StudentProfile.aspx';" style="cursor:pointer;" data-name="Marcus Chen" data-id="#STU-2405" data-course="Design" data-dept="Visual Arts" data-year="2nd Year" data-level="8" data-xp="890" data-streak="0" data-status="Inactive">
                        <td>
                            <div class="student-info">
                                <div class="avatar avatar-pink">MC</div>
                                <div>
                                    <div class="student-name">Marcus Chen</div>
                                    <div class="student-id">Ref: #STU-2405</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="course-name">Design</div>
                            <div class="course-dept">Visual Arts</div>
                        </td>
                        <td>2nd Year / 2nd</td>
                        <td>8</td>
                        <td>
                            <div class="xp-reward"><div class="xp-dot"></div>890 XP</div>
                        </td>
                        <td>
                            <span class="streak-val inactive">🔥 0</span>
                        </td>
                        <td>1</td>
                        <td>
                            <div class="status inactive"><div class="status-dot"></div>Inactive</div>
                        </td>
                        <td>
                            <div class="action-btns" onclick="event.stopPropagation();">
                                <a href='<%= ResolveUrl("~/Admin/StudentProfile.aspx") %>' title="View Profile">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href='<%= ResolveUrl("~/Admin/StudentProfile.aspx") %>' title="Edit Student">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;flex-shrink:0;" onclick="alert('Student: Marcus Chen (ID: #STU-2405)');">
                                    <circle cx="12" cy="12" r="1"></circle>
                                    <circle cx="12" cy="5" r="1"></circle>
                                    <circle cx="12" cy="19" r="1"></circle>
                                </svg>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 3: Sarah Jenkins -->
                    <tr onclick="window.location='StudentProfile.aspx';" style="cursor:pointer;" data-name="Sarah Jenkins" data-id="#STU-2410" data-course="Business" data-dept="Marketing" data-year="4th Year" data-level="18" data-xp="2400" data-streak="24" data-status="Suspended">
                        <td>
                            <div class="student-info">
                                <div class="avatar avatar-rose">SJ</div>
                                <div>
                                    <div class="student-name">Sarah Jenkins</div>
                                    <div class="student-id">Ref: #STU-2410</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="course-name">Business</div>
                            <div class="course-dept">Marketing</div>
                        </td>
                        <td>4th Year / 1st</td>
                        <td>18</td>
                        <td>
                            <div class="xp-reward"><div class="xp-dot"></div>2,400 XP</div>
                        </td>
                        <td>
                            <span class="streak-val">🔥 24</span>
                        </td>
                        <td>5</td>
                        <td>
                            <div class="status suspended"><div class="status-dot"></div>Suspended</div>
                        </td>
                        <td>
                            <div class="action-btns" onclick="event.stopPropagation();">
                                <a href='<%= ResolveUrl("~/Admin/StudentProfile.aspx") %>' title="View Profile">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href='<%= ResolveUrl("~/Admin/StudentProfile.aspx") %>' title="Edit Student">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;flex-shrink:0;" onclick="alert('Student: Sarah Jenkins (ID: #STU-2410)');">
                                    <circle cx="12" cy="12" r="1"></circle>
                                    <circle cx="12" cy="5" r="1"></circle>
                                    <circle cx="12" cy="19" r="1"></circle>
                                </svg>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 4: Alex Thompson -->
                    <tr onclick="window.location='StudentProfile.aspx';" style="cursor:pointer;" data-name="Alex Thompson" data-id="#STU-2415" data-course="Sciences" data-dept="Bio-Chemistry" data-year="1st Year" data-level="4" data-xp="450" data-streak="2" data-status="Active">
                        <td>
                            <div class="student-info">
                                <div class="avatar avatar-purple">AT</div>
                                <div>
                                    <div class="student-name">Alex Thompson</div>
                                    <div class="student-id">Ref: #STU-2415</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="course-name">Sciences</div>
                            <div class="course-dept">Bio-Chemistry</div>
                        </td>
                        <td>1st Year / 2nd</td>
                        <td>4</td>
                        <td>
                            <div class="xp-reward"><div class="xp-dot"></div>450 XP</div>
                        </td>
                        <td>
                            <span class="streak-val">🔥 2</span>
                        </td>
                        <td>2</td>
                        <td>
                            <div class="status active"><div class="status-dot"></div>Active</div>
                        </td>
                        <td>
                            <div class="action-btns" onclick="event.stopPropagation();">
                                <a href='<%= ResolveUrl("~/Admin/StudentProfile.aspx") %>' title="View Profile">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </a>
                                <a href='<%= ResolveUrl("~/Admin/StudentProfile.aspx") %>' title="Edit Student">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;flex-shrink:0;">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                </a>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;flex-shrink:0;" onclick="alert('Student: Alex Thompson (ID: #STU-2415)');">
                                    <circle cx="12" cy="12" r="1"></circle>
                                    <circle cx="12" cy="5" r="1"></circle>
                                    <circle cx="12" cy="19" r="1"></circle>
                                </svg>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- Pagination (Matching Challenges) -->
            <div class="pagination">
                <div class="pagination-text" id="paginationSummary">Showing 1 to 4 of 1,240 students</div>
                <div class="pagination-controls">
                    <button type="button" class="page-btn" aria-label="Previous">&lt;</button>
                    <button type="button" class="page-btn active">1</button>
                    <button type="button" class="page-btn">2</button>
                    <button type="button" class="page-btn">3</button>
                    <button type="button" class="page-btn">&gt;</button>
                </div>
            </div>
        </div>

        <!-- 4 Stat Cards Row (Exact Match to Challenges.aspx) -->
        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-card-title">TOTAL REGISTERED STUDENTS</div>
                <div class="stat-card-value">1,240</div>
                <div class="stat-card-sub highlight">↑ +12% this month</div>
            </div>

            <div class="stat-card">
                <div class="stat-card-title">ACTIVE TODAY</div>
                <div class="stat-card-value">452</div>
                <div class="stat-card-sub highlight">● Live in platform</div>
            </div>

            <div class="stat-card">
                <div class="stat-card-title">AVG. LEVEL COMPLETION</div>
                <div class="stat-card-value">64%</div>
                <div class="progress-bar">
                    <div class="progress-fill" style="width: 64%;"></div>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-card-title">XP DISTRIBUTED</div>
                <div class="stat-card-value">42.5k</div>
                <div class="stat-card-sub">Lifetime student rewards</div>
            </div>
        </div>

    </div>
</asp:Content>

<asp:Content ID="ScriptsContent" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        function filterStudentsTable() {
            var searchTxt = (document.getElementById('txtStudentSearch').value || '').toLowerCase().trim();
            var course = document.getElementById('ddlCourse').value;
            var year = document.getElementById('ddlYear').value;
            var status = document.getElementById('ddlStatus').value;
            var level = document.getElementById('ddlLevel').value;

            var rows = document.querySelectorAll('#studentsTable tbody tr');
            var visibleCount = 0;

            rows.forEach(function (row) {
                var name = (row.getAttribute('data-name') || '').toLowerCase();
                var id = (row.getAttribute('data-id') || '').toLowerCase();
                var rCourse = row.getAttribute('data-course') || '';
                var rYear = row.getAttribute('data-year') || '';
                var rStatus = row.getAttribute('data-status') || '';
                var rLevel = parseInt(row.getAttribute('data-level') || '0', 10);

                var matchSearch = !searchTxt || name.indexOf(searchTxt) !== -1 || id.indexOf(searchTxt) !== -1;
                var matchCourse = !course || rCourse === course;
                var matchYear = !year || rYear.indexOf(year) !== -1;
                var matchStatus = !status || rStatus === status;

                var matchLevel = true;
                if (level === '1-5') matchLevel = (rLevel >= 1 && rLevel <= 5);
                else if (level === '6-10') matchLevel = (rLevel >= 6 && rLevel <= 10);
                else if (level === '11-15') matchLevel = (rLevel >= 11 && rLevel <= 15);
                else if (level === '16+') matchLevel = (rLevel >= 16);

                if (matchSearch && matchCourse && matchYear && matchStatus && matchLevel) {
                    row.style.display = '';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            });

            var summary = document.getElementById('paginationSummary');
            if (summary) {
                summary.textContent = "Showing " + visibleCount + " of " + (searchTxt || course || year || status || level ? visibleCount : "1,240") + " students";
            }
        }

        function clearAllFilters() {
            document.getElementById('txtStudentSearch').value = '';
            document.getElementById('ddlCourse').value = '';
            document.getElementById('ddlYear').value = '';
            document.getElementById('ddlStatus').value = '';
            document.getElementById('ddlLevel').value = '';
            filterStudentsTable();
        }

        function sortStudentsTable() {
            var sortVal = document.getElementById('ddlSort').value;
            var tbody = document.querySelector('#studentsTable tbody');
            var rows = Array.from(tbody.querySelectorAll('tr'));

            rows.sort(function (a, b) {
                if (sortVal === 'xp') {
                    return parseInt(b.getAttribute('data-xp') || '0', 10) - parseInt(a.getAttribute('data-xp') || '0', 10);
                } else if (sortVal === 'streak') {
                    return parseInt(b.getAttribute('data-streak') || '0', 10) - parseInt(a.getAttribute('data-streak') || '0', 10);
                } else if (sortVal === 'name') {
                    return (a.getAttribute('data-name') || '').localeCompare(b.getAttribute('data-name') || '');
                }
                return 0;
            });

            rows.forEach(function (row) {
                tbody.appendChild(row);
            });
        }
    </script>
</asp:Content>
