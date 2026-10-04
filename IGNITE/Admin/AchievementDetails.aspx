<%@ Page Title="Achievement Details — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AchievementDetails.aspx.cs" Inherits="IGNITE.Admin.AchievementDetails" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-topbar-header {
            display: none !important;
        }

        .admin-page-canvas {
            padding-top: 24px !important;
        }

        .details-container {
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
            gap: 12px;
        }

        .btn-back-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #1a1a1a;
            text-decoration: none;
            cursor: pointer;
            padding: 4px;
        }

        .btn-back-link svg {
            width: 18px;
            height: 18px;
        }

        .page-main-title {
            font-size: 20px;
            font-weight: 800;
            color: #1a1a1a;
            margin: 0;
            letter-spacing: -0.2px;
        }

        .streak-pill-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 10px;
            border: 1.5px solid #F59E0B;
            background: #FFFBEB;
            border-radius: 8px;
            font-size: 10px;
            font-weight: 800;
            color: #D97706;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .streak-pill-badge svg {
            width: 12px;
            height: 12px;
            fill: #D97706;
        }

        .header-right-group {
            display: flex;
            align-items: center;
            gap: 20px;
        }


        .header-search-wrap {
            display: flex;
            align-items: center;
            background: #FFFFFF;
            border: 1px solid #E5E0D8;
            border-radius: 8px;
            padding: 7px 12px;
            width: 160px;
            gap: 8px;
        }

        .header-search-wrap svg {
            width: 13px;
            height: 13px;
            color: #8C827A;
            flex-shrink: 0;
        }

        .header-search-input {
            border: none;
            outline: none;
            background: transparent;
            font-size: 12px;
            color: #1a1a1a;
            font-family: inherit;
            width: 100%;
        }

        /* Hero Card */
        .achievement-hero-card {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 24px 28px;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .hero-left-col {
            display: flex;
            align-items: flex-start;
            gap: 18px;
        }

        .hero-badge-box {
            width: 56px;
            height: 56px;
            background: #FFF7ED;
            border: 1.5px solid #FDBA74;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #EA580C;
            flex-shrink: 0;
        }

        .hero-badge-box svg {
            width: 30px;
            height: 30px;
        }

        .hero-text-stack {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .hero-title-row {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .hero-main-title {
            font-size: 20px;
            font-weight: 800;
            color: #1a1a1a;
            margin: 0;
            letter-spacing: -0.2px;
        }

        .tag-pill-milestone {
            background: #FEF3C7;
            color: #B45309;
            font-size: 9px;
            font-weight: 800;
            padding: 3px 7px;
            border-radius: 5px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .tag-pill-active {
            background: #DCFCE7;
            color: #15803D;
            font-size: 9px;
            font-weight: 800;
            padding: 3px 7px;
            border-radius: 5px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .hero-description-text {
            font-size: 13px;
            color: #57534E;
            margin: 0;
            max-width: 650px;
            line-height: 1.5;
        }

        .hero-action-buttons {
            display: flex;
            align-items: center;
            gap: 12px;
            flex-shrink: 0;
        }

        .btn-archive-white {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #FFFFFF;
            border: 1px solid #D1CDC7;
            border-radius: 8px;
            padding: 9px 16px;
            font-size: 12px;
            font-weight: 700;
            color: #44403C;
            cursor: pointer;
            font-family: inherit;
            transition: all 0.15s ease;
        }

        .btn-archive-white:hover {
            background: #F5F2EB;
            color: #1a1a1a;
        }

        .btn-archive-white svg {
            width: 14px;
            height: 14px;
        }

        .btn-edit-pink {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #D96A77;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            padding: 9px 18px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
            box-shadow: 0 2px 6px rgba(217, 106, 119, 0.28);
            transition: background 0.15s ease;
            text-decoration: none;
        }

        .btn-edit-pink:hover {
            background: #C45A66;
            color: #FFFFFF;
        }

        .btn-edit-pink svg {
            width: 14px;
            height: 14px;
        }

        /* 4 Stats Cards in Row */
        .stats-grid-four {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
        }

        .stat-card-box {
            background: #EAE6DF;
            border-radius: 14px;
            padding: 18px 22px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .stat-card-title {
            font-size: 11px;
            font-weight: 700;
            color: #78716C;
        }

        .stat-card-value {
            font-size: 18px;
            font-weight: 800;
            color: #1C1917;
            display: flex;
            align-items: baseline;
            gap: 8px;
        }

        .stat-card-value.xp-gold {
            color: #D97706;
        }

        .stat-card-sub-green {
            font-size: 11px;
            font-weight: 700;
            color: #D96A77;
        }

        /* 2-Column Main Section */
        .details-split-grid {
            display: grid;
            grid-template-columns: 1fr 1.3fr;
            gap: 20px;
            align-items: start;
        }

        .details-col-left, .details-col-right {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .detail-panel-card {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 22px 26px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .panel-heading-title {
            font-size: 14px;
            font-weight: 800;
            color: #1C1917;
            margin: 0;
        }

        .condition-trigger-label {
            font-size: 9px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }

        .condition-row-inputs {
            display: grid;
            grid-template-columns: 1.2fr 1fr;
            gap: 10px;
        }

        .condition-tile-input {
            background: #F5F2EB;
            border: 1px solid transparent;
            border-radius: 8px;
            padding: 10px 14px;
            font-size: 12px;
            font-weight: 600;
            color: #1C1917;
        }

        .condition-and-btn {
            align-self: flex-start;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            background: transparent;
            border: 1px dashed #D96A77;
            color: #D96A77;
            border-radius: 6px;
            padding: 4px 10px;
            font-size: 10px;
            font-weight: 800;
            cursor: pointer;
        }

        .condition-consecutive-row {
            display: grid;
            grid-template-columns: 2fr 0.6fr;
            gap: 10px;
        }

        .difficulty-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 10px;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
        }

        .difficulty-label {
            font-size: 10px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .difficulty-meter-bars {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .diff-bar {
            width: 14px;
            height: 4px;
            border-radius: 2px;
            background: #D1CDC7;
        }

        .diff-bar.fill-orange {
            background: #EA580C;
        }

        /* Student View Preview Banner Card */
        .preview-banner-card {
            background: #EAE6DF;
            border-radius: 14px;
            padding: 16px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }

        .preview-banner-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .preview-banner-icon {
            width: 32px;
            height: 32px;
            background: #FFF7ED;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #EA580C;
        }

        .preview-banner-icon svg {
            width: 16px;
            height: 16px;
        }

        .preview-banner-text-group {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .preview-banner-sub {
            font-size: 9px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }

        .preview-banner-title {
            font-size: 12px;
            font-weight: 800;
            color: #1C1917;
        }

        .preview-banner-expand {
            color: #D96A77;
            font-size: 16px;
            font-weight: 700;
        }

        /* Unlock History Card (Right Column) */
        .history-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .history-pill-btn {
            background: #FFFFFF;
            border: 1px solid #D1CDC7;
            border-radius: 6px;
            padding: 4px 10px;
            font-size: 11px;
            font-weight: 700;
            color: #44403C;
        }

        .unlock-history-table {
            width: 100%;
            border-collapse: collapse;
        }

        .unlock-history-table th {
            text-align: left;
            font-size: 9px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.6px;
            text-transform: uppercase;
            padding: 8px 10px;
            border-bottom: 1px solid #D8D4CC;
        }

        .unlock-history-table td {
            padding: 12px 10px;
            border-bottom: 1px solid #D8D4CC;
            vertical-align: middle;
            font-size: 12px;
        }

        .unlock-history-table tr:last-child td {
            border-bottom: none;
        }

        .student-avatar-cell {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .student-avatar-circle {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 10px;
            color: #FFFFFF;
            flex-shrink: 0;
        }

        .student-name-stack {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .student-name-text {
            font-size: 12px;
            font-weight: 800;
            color: #1C1917;
        }

        .student-level-sub {
            font-size: 10px;
            color: #78716C;
        }

        .time-ago-text {
            font-size: 11px;
            color: #57534E;
            white-space: nowrap;
        }

        .context-streak-text {
            font-size: 11px;
            color: #44403C;
        }

        .context-streak-text strong {
            color: #1C1917;
        }

        .action-menu-dots {
            color: #78716C;
            font-size: 16px;
            cursor: pointer;
            text-align: right;
        }

        .view-all-unlocks-link {
            text-align: center;
            display: block;
            color: #D96A77;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 0.6px;
            text-transform: uppercase;
            text-decoration: none;
            padding-top: 8px;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
        }

        .view-all-unlocks-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 1080px) {
            .details-split-grid {
                grid-template-columns: 1fr;
            }

            .stats-grid-four {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <div class="details-container">

        <!-- Top Header Row -->
        <div class="page-header-row">
            <div class="header-title-left">
                <a href="Achievements.aspx" class="btn-back-link" title="Back to Achievements">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="19" y1="12" x2="5" y2="12"></line>
                        <polyline points="12 19 5 12 12 5"></polyline>
                    </svg>
                </a>
                <h1 class="page-main-title">Achievement Details</h1>
                <div class="streak-pill-badge">
                    <svg viewBox="0 0 24 24">
                        <path d="M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 3.5z"></path>
                    </svg>
                    <span>15 DAY STREAK</span>
                </div>
            </div>

            <div class="header-right-group">

                <div class="header-search-wrap">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    <input type="text" class="header-search-input" placeholder="Search..." />
                </div>
            </div>
        </div>

        <!-- Hero Card -->
        <div class="achievement-hero-card">
            <div class="hero-left-col">
                <div class="hero-badge-box">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                        <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                        <path d="M4 22h16"></path>
                        <path d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34"></path>
                        <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                    </svg>
                </div>
                <div class="hero-text-stack">
                    <div class="hero-title-row">
                        <h2 class="hero-main-title">Master of Consistency</h2>
                        <span class="tag-pill-milestone">MILESTONE</span>
                        <span class="tag-pill-active">ACTIVE</span>
                    </div>
                    <p class="hero-description-text">
                        Reward students who demonstrate persistence in their academic habits over a sustained period.
                    </p>
                </div>
            </div>

            <div class="hero-action-buttons">
                <button type="button" class="btn-archive-white" onclick="openArchiveModal('Master of Consistency')">Archive</button>
                <asp:LinkButton ID="btnEditAchievement" runat="server" CssClass="btn-edit-pink" OnClick="btnEditAchievement_Click">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                    </svg>
                    <span>Edit Achievement</span>
                </asp:LinkButton>
            </div>
        </div>

        <!-- 4 Stats Cards in Row -->
        <div class="stats-grid-four">
            <div class="stat-card-box">
                <span class="stat-card-title">XP Reward</span>
                <span class="stat-card-value xp-gold">● 500 XP</span>
            </div>

            <div class="stat-card-box">
                <span class="stat-card-title">Total Students Unlocked</span>
                <span class="stat-card-value">
                    1,240
                    <span class="stat-card-sub-green">+14% vs last mo.</span>
                </span>
            </div>

            <div class="stat-card-box">
                <span class="stat-card-title">Created Date</span>
                <span class="stat-card-value">Oct 12, 2023</span>
            </div>

            <div class="stat-card-box">
                <span class="stat-card-title">Last Updated</span>
                <span class="stat-card-value">2 days ago</span>
            </div>
        </div>

        <!-- Split Grid: Unlock Condition Builder + Unlock History -->
        <div class="details-split-grid">

            <!-- Left Column -->
            <div class="details-col-left">

                <!-- Unlock Condition Builder -->
                <div class="detail-panel-card">
                    <h3 class="panel-heading-title">Unlock Condition Builder</h3>

                    <div class="condition-trigger-label">TRIGGER</div>

                    <div class="condition-row-inputs">
                        <div class="condition-tile-input">Complete Task</div>
                        <div class="condition-tile-input">5 times in a row</div>
                    </div>

                    <button type="button" class="condition-and-btn">+ AND</button>

                    <div class="condition-consecutive-row">
                        <div class="condition-tile-input">For 7 consecutive days</div>
                        <div class="condition-tile-input" style="text-align:center;">7</div>
                    </div>

                    <div class="difficulty-row">
                        <span class="difficulty-label">ESTIMATED DIFFICULTY</span>
                        <div class="difficulty-meter-bars">
                            <div class="diff-bar fill-orange"></div>
                            <div class="diff-bar fill-orange"></div>
                            <div class="diff-bar fill-orange"></div>
                            <div class="diff-bar"></div>
                        </div>
                    </div>
                </div>

                <!-- Student View Preview Banner -->
                <div class="preview-banner-card">
                    <div class="preview-banner-left">
                        <div class="preview-banner-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                                <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                                <path d="M4 22h16"></path>
                                <path d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34"></path>
                                <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                            </svg>
                        </div>
                        <div class="preview-banner-text-group">
                            <span class="preview-banner-sub">STUDENT VIEW PREVIEW</span>
                            <span class="preview-banner-title">Achievement Unlocked! Master of Consistency</span>
                        </div>
                    </div>
                    <span class="preview-banner-expand">+</span>
                </div>

            </div>

            <!-- Right Column: Unlock History -->
            <div class="details-col-right">
                <div class="detail-panel-card">
                    <div class="history-card-header">
                        <h3 class="panel-heading-title">Unlock History</h3>
                        <div style="display:flex; align-items:center; gap:8px;">
                            <span style="font-size:9px; font-weight:800; color:#78716C; text-transform:uppercase;">RECENTLY UNLOCKED</span>
                            <span class="history-pill-btn">Last 30 Days</span>
                        </div>
                    </div>

                    <table class="unlock-history-table">
                        <thead>
                            <tr>
                                <th style="width:36%;">STUDENT NAME</th>
                                <th style="width:22%;">UNLOCK DATE</th>
                                <th style="width:34%;">CONTEXT / PROGRESS</th>
                                <th style="width:8%; text-align:right;">ACTION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Row 1 -->
                            <tr>
                                <td>
                                    <div class="student-avatar-cell">
                                        <div class="student-avatar-circle" style="background:#2563EB;">LR</div>
                                        <div class="student-name-stack">
                                            <span class="student-name-text">Leo Richardson</span>
                                            <span class="student-level-sub">LVL 14 Advanced</span>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="time-ago-text">Just now</span></td>
                                <td><span class="context-streak-text">Completed <strong>35 tasks</strong> streak</span></td>
                                <td class="action-menu-dots">⋮</td>
                            </tr>

                            <!-- Row 2 -->
                            <tr>
                                <td>
                                    <div class="student-avatar-cell">
                                        <div class="student-avatar-circle" style="background:#10B981;">SJ</div>
                                        <div class="student-name-stack">
                                            <span class="student-name-text">Sarah Jenkins</span>
                                            <span class="student-level-sub">LVL 9 Rising Star</span>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="time-ago-text">2 hours ago</span></td>
                                <td><span class="context-streak-text">Consistent for <strong>12 days</strong></span></td>
                                <td class="action-menu-dots">⋮</td>
                            </tr>

                            <!-- Row 3 -->
                            <tr>
                                <td>
                                    <div class="student-avatar-cell">
                                        <div class="student-avatar-circle" style="background:#8B5CF6;">MT</div>
                                        <div class="student-name-stack">
                                            <span class="student-name-text">Marcus Thorne</span>
                                            <span class="student-level-sub">LVL 21 Elite</span>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="time-ago-text">Oct 24, 2023</span></td>
                                <td><span class="context-streak-text">Completed <strong>Weekly Quests</strong></span></td>
                                <td class="action-menu-dots">⋮</td>
                            </tr>

                            <!-- Row 4 -->
                            <tr>
                                <td>
                                    <div class="student-avatar-cell">
                                        <div class="student-avatar-circle" style="background:#F59E0B;">EV</div>
                                        <div class="student-name-stack">
                                            <span class="student-name-text">Elena Vance</span>
                                            <span class="student-level-sub">LVL 12 Scholar</span>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="time-ago-text">Oct 23, 2023</span></td>
                                <td><span class="context-streak-text">Maintained <strong>Daily Streak</strong></span></td>
                                <td class="action-menu-dots">⋮</td>
                            </tr>
                        </tbody>
                    </table>

                    <a href="javascript:void(0);" class="view-all-unlocks-link">VIEW ALL 1,240 UNLOCKS</a>
                </div>
            </div>

        </div>

        <!-- Archive Achievement Modal -->
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
                    Are you sure you want to archive "<strong id="lblArchiveModalTitle" style="color:#1C1917;">Master of Consistency</strong>"?<br />
                    This action can be undone later from the archive settings.
                </p>

                <div style="display:grid; grid-template-columns:1fr 1fr; gap:14px; width:100%;">
                    <button type="button" onclick="closeArchiveModal()" style="background:#FFFFFF; border:none; border-radius:12px; padding:12px 20px; font-size:14px; font-weight:700; color:#44403C; cursor:pointer; box-shadow:0 1px 3px rgba(0,0,0,0.06); font-family:inherit;">Cancel</button>
                    <button type="button" onclick="window.location.href='Achievements.aspx';" style="background:#D96A77; border:none; border-radius:12px; padding:12px 20px; font-size:14px; font-weight:700; color:#FFFFFF; cursor:pointer; box-shadow:0 2px 6px rgba(217,106,119,0.3); font-family:inherit;">Archive</button>
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
