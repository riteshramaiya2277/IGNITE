<%@ Page Title="Quest Details — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="QuestDetails.aspx.cs" Inherits="IGNITE.Admin.QuestDetails" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-topbar-header {
            display: none !important;
        }

        .admin-page-canvas {
            padding-top: 24px !important;
        }

        .quest-details-container {
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
        .details-header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .details-header-left {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .btn-back-square {
            width: 34px;
            height: 34px;
            background: #FFFFFF;
            border: 1px solid #E5E0D8;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #44403C;
            text-decoration: none;
            transition: all 0.15s ease;
        }

        .btn-back-square:hover {
            background: #F5F2EB;
            color: #1C1917;
            border-color: #D1CDC7;
        }

        .btn-back-square svg {
            width: 16px;
            height: 16px;
        }

        .title-id-stack {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .details-main-title {
            font-size: 20px;
            font-weight: 800;
            color: #1C1917;
            margin: 0;
            letter-spacing: -0.2px;
        }

        .details-sub-id {
            font-size: 11px;
            font-weight: 700;
            color: #78716C;
            letter-spacing: 0.5px;
        }

        .details-header-actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .btn-action-delete {
            background: #FFFFFF;
            border: 1px solid #E5E0D8;
            border-radius: 8px;
            padding: 8px 16px;
            font-size: 12px;
            font-weight: 700;
            color: #DC2626;
            cursor: pointer;
            font-family: inherit;
            transition: all 0.15s ease;
        }

        .btn-action-delete:hover {
            background: #FEE2E2;
            border-color: #FCA5A5;
        }

        .btn-action-unpublish {
            background: #FFFFFF;
            border: 1px solid #E5E0D8;
            border-radius: 8px;
            padding: 8px 16px;
            font-size: 12px;
            font-weight: 700;
            color: #44403C;
            cursor: pointer;
            font-family: inherit;
            transition: all 0.15s ease;
        }

        .btn-action-unpublish:hover {
            background: #F5F2EB;
            color: #1C1917;
        }

        .btn-action-edit {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #D96A77;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            padding: 8px 18px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
            box-shadow: 0 2px 6px rgba(217, 106, 119, 0.28);
            transition: background 0.15s ease;
            text-decoration: none;
        }

        .btn-action-edit:hover {
            background: #C45A66;
            color: #FFFFFF;
        }

        .btn-action-edit svg {
            width: 14px;
            height: 14px;
        }

        /* Hero Card */
        .quest-hero-card {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 26px 30px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 22px;
        }

        .hero-top-row {
            display: flex;
            align-items: flex-start;
            gap: 18px;
        }

        .hero-icon-box {
            width: 54px;
            height: 54px;
            background: #FFF7ED;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #EA580C;
            flex-shrink: 0;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.04);
        }

        .hero-icon-box svg {
            width: 28px;
            height: 28px;
        }

        .hero-info-column {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .hero-title-badge-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .hero-title-group {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .hero-quest-title {
            font-size: 22px;
            font-weight: 800;
            color: #1C1917;
            margin: 0;
            letter-spacing: -0.3px;
        }

        .badge-status-published {
            background: #DCFCE7;
            color: #16A34A;
            font-size: 10px;
            font-weight: 800;
            padding: 3px 8px;
            border-radius: 6px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .badge-trending-quest {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background: #FFF7ED;
            border: 1px solid #FDBA74;
            color: #C2410C;
            font-size: 11px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 8px;
        }

        .badge-trending-quest svg {
            width: 13px;
            height: 13px;
            fill: #EA580C;
        }

        .hero-desc-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .hero-desc-text {
            font-size: 13px;
            color: #57534E;
            margin: 0;
        }

        .hero-last-updated {
            font-size: 11px;
            color: #78716C;
            font-weight: 500;
            white-space: nowrap;
        }

        .hero-stats-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            padding-top: 18px;
            border-top: 1px solid rgba(0, 0, 0, 0.06);
        }

        .hero-stat-block {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .stat-block-label {
            font-size: 10px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }

        .stat-block-value {
            font-size: 16px;
            font-weight: 800;
            color: #1C1917;
        }

        .stat-block-value.xp-val {
            display: flex;
            align-items: center;
            gap: 4px;
            color: #D97706;
        }

        .stat-block-value.xp-val svg {
            width: 14px;
            height: 14px;
            fill: #D97706;
        }

        .stat-block-value.rate-green {
            color: #16A34A;
        }

        /* 2-Column Details Grid */
        .details-two-col-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .details-col {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .detail-card {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 22px 26px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .detail-card-header {
            font-size: 10px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .detail-card-header svg {
            width: 13px;
            height: 13px;
            color: #78716C;
        }

        .detail-card-inner-box {
            background: #F5F2EB;
            border-radius: 12px;
            padding: 16px 18px;
            box-sizing: border-box;
        }

        .requirements-text {
            font-size: 13px;
            line-height: 1.6;
            color: #44403C;
            margin: 0;
        }

        .highlight-text {
            color: #D96A77;
            font-weight: 700;
        }

        /* Active Availability Card */
        .dates-split-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .date-tile-box {
            background: #F5F2EB;
            border-radius: 12px;
            padding: 14px 16px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .date-tile-icon-circle {
            width: 36px;
            height: 36px;
            background: #FFFFFF;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #D96A77;
            flex-shrink: 0;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
        }

        .date-tile-icon-circle svg {
            width: 16px;
            height: 16px;
        }

        .date-tile-text-wrap {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .date-tile-label {
            font-size: 9px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }

        .date-tile-value {
            font-size: 13px;
            font-weight: 800;
            color: #1C1917;
        }

        .date-tile-sub {
            font-size: 10px;
            color: #78716C;
            font-weight: 600;
        }

        /* Ownership Card */
        .owner-profile-row {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 6px;
        }

        .owner-avatar-circle {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            overflow: hidden;
            background: #2563EB;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            color: #FFFFFF;
            font-size: 14px;
            border: 2px solid #FFFFFF;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .owner-avatar-circle img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .owner-info-text {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .owner-name {
            font-size: 13px;
            font-weight: 800;
            color: #1C1917;
        }

        .owner-role {
            font-size: 11px;
            color: #78716C;
            font-weight: 600;
        }

        .owner-meta-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 12px;
            padding-top: 8px;
        }

        .owner-meta-label {
            color: #78716C;
            font-weight: 600;
        }

        .owner-meta-val {
            color: #1C1917;
            font-weight: 700;
        }

        /* Global Progress Card */
        .progress-completions-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .progress-stat-label {
            font-size: 12px;
            color: #78716C;
            font-weight: 600;
        }

        .progress-stat-count {
            font-size: 14px;
            font-weight: 800;
            color: #D96A77;
        }

        .global-progress-track {
            width: 100%;
            height: 5px;
            background: #D1CDC7;
            border-radius: 3px;
            overflow: hidden;
            position: relative;
        }

        .global-progress-fill {
            width: 78%;
            height: 100%;
            background: #D96A77;
            border-radius: 3px;
        }

        .recent-completion-section {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .recent-completion-label {
            font-size: 10px;
            font-weight: 700;
            color: #78716C;
        }

        .avatars-overlap-row {
            display: flex;
            align-items: center;
        }

        .avatar-overlap-item {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            border: 2px solid #EAE6DF;
            margin-left: -8px;
            background: #CBD5E1;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 9px;
            font-weight: 800;
            color: #334155;
            overflow: hidden;
        }

        .avatar-overlap-item:first-child {
            margin-left: 0;
        }

        .avatar-overlap-item.badge-count {
            background: #1C1917;
            color: #FFFFFF;
            font-size: 9px;
            font-weight: 800;
        }

        /* Modal Overlay & Card (Image 3) */
        .modal-backdrop {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.45);
            z-index: 1000;
            align-items: center;
            justify-content: center;
            backdrop-filter: blur(2px);
        }

        .modal-backdrop.show {
            display: flex;
        }

        .modal-card {
            background: #F5F2EB;
            border-radius: 20px;
            width: 90%;
            max-width: 440px;
            padding: 32px 28px 24px 28px;
            box-sizing: border-box;
            position: relative;
            box-shadow: 0 12px 36px rgba(0, 0, 0, 0.18);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            animation: modalFadeIn 0.2s ease-out;
        }

        @keyframes modalFadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .modal-btn-close {
            position: absolute;
            top: 20px;
            right: 20px;
            background: transparent;
            border: none;
            color: #78716C;
            cursor: pointer;
            padding: 4px;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-btn-close:hover {
            color: #1C1917;
        }

        .modal-icon-badge {
            width: 56px;
            height: 56px;
            background: #FEF3C7;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #D97706;
            margin-bottom: 18px;
        }

        .modal-icon-badge svg {
            width: 28px;
            height: 28px;
            fill: #D97706;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 800;
            color: #1C1917;
            margin: 0 0 10px 0;
            letter-spacing: -0.2px;
        }

        .modal-body-text {
            font-size: 13px;
            color: #57534E;
            line-height: 1.5;
            margin: 0 0 20px 0;
            padding: 0 10px;
        }

        .modal-body-text strong {
            color: #1C1917;
        }

        .modal-preview-box {
            width: 100%;
            background: #EAE6DF;
            border-radius: 12px;
            padding: 14px 16px;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            text-align: left;
        }

        .modal-preview-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .modal-preview-left svg {
            width: 20px;
            height: 20px;
            color: #1C1917;
        }

        .modal-preview-details {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .modal-preview-tag {
            font-size: 9px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }

        .modal-preview-name {
            font-size: 13px;
            font-weight: 800;
            color: #1C1917;
        }

        .modal-preview-right {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 2px;
        }

        .modal-preview-xp {
            font-size: 12px;
            font-weight: 800;
            color: #D97706;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .modal-preview-xp svg {
            width: 12px;
            height: 12px;
            fill: #D97706;
        }

        .modal-preview-freq {
            font-size: 9px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }

        .modal-actions-row {
            display: grid;
            grid-template-columns: 1fr 1.3fr;
            gap: 12px;
            width: 100%;
        }

        .btn-modal-cancel {
            background: #FFFFFF;
            border: 1px solid #D1CDC7;
            border-radius: 8px;
            padding: 10px 18px;
            font-size: 13px;
            font-weight: 700;
            color: #1C1917;
            cursor: pointer;
            font-family: inherit;
            transition: all 0.15s ease;
        }

        .btn-modal-cancel:hover {
            background: #EAE6DF;
        }

        .btn-modal-confirm {
            background: #D96A77;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
            box-shadow: 0 2px 6px rgba(217, 106, 119, 0.28);
            transition: background 0.15s ease;
        }

        .btn-modal-confirm:hover {
            background: #C45A66;
        }

        @media (max-width: 900px) {
            .details-two-col-grid {
                grid-template-columns: 1fr;
            }

            .hero-stats-row {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <div class="quest-details-container">

        <!-- Header Row with Back Button and Actions -->
        <div class="details-header-row">
            <div class="details-header-left">
                <a href="Quests.aspx" class="btn-back-square" title="Back to Quests">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="15 18 9 12 15 6"></polyline>
                    </svg>
                </a>
                <div class="title-id-stack">
                    <h1 class="details-main-title">Quest Details</h1>
                    <span class="details-sub-id">ID: QST-8842</span>
                </div>
            </div>

            <div class="details-header-actions">
                <button type="button" class="btn-action-delete" onclick="openArchiveModal()">Delete</button>
                <asp:Button ID="btnUnpublish" runat="server" CssClass="btn-action-unpublish" Text="Unpublish" OnClick="btnUnpublish_Click" />
                <asp:LinkButton ID="btnEditQuest" runat="server" CssClass="btn-action-edit" OnClick="btnEditQuest_Click">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                    </svg>
                    Edit Quest
                </asp:LinkButton>
            </div>
        </div>

        <!-- Hero Card -->
        <div class="quest-hero-card">
            <div class="hero-top-row">
                <div class="hero-icon-box">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                        <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                    </svg>
                </div>

                <div class="hero-info-column">
                    <div class="hero-title-badge-row">
                        <div class="hero-title-group">
                            <h2 class="hero-quest-title">Deep Focus Master</h2>
                            <span class="badge-status-published">PUBLISHED</span>
                        </div>
                        <div class="badge-trending-quest">
                            <svg viewBox="0 0 24 24">
                                <path d="M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 3.5z"></path>
                            </svg>
                            <span>Trending Quest</span>
                        </div>
                    </div>

                    <div class="hero-desc-row">
                        <p class="hero-desc-text">A daily ritual designed to build cognitive endurance and focused execution.</p>
                        <span class="hero-last-updated">Last updated Oct 14, 2023</span>
                    </div>
                </div>
            </div>

            <!-- Stats Row -->
            <div class="hero-stats-row">
                <div class="hero-stat-block">
                    <span class="stat-block-label">QUEST TYPE</span>
                    <span class="stat-block-value">Daily Recurring</span>
                </div>
                <div class="hero-stat-block">
                    <span class="stat-block-label">XP REWARD</span>
                    <span class="stat-block-value xp-val">
                        <svg viewBox="0 0 24 24">
                            <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                        </svg>
                        500 XP
                    </span>
                </div>
                <div class="hero-stat-block">
                    <span class="stat-block-label">ACTIVE STUDENTS</span>
                    <span class="stat-block-value">1,248</span>
                </div>
                <div class="hero-stat-block">
                    <span class="stat-block-label">SUCCESS RATE</span>
                    <span class="stat-block-value rate-green">84%</span>
                </div>
            </div>
        </div>

        <!-- 2-Column Bottom Grid -->
        <div class="details-two-col-grid">

            <!-- Left Column -->
            <div class="details-col">

                <!-- Completion Requirements -->
                <div class="detail-card">
                    <div class="detail-card-header">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                        COMPLETION REQUIREMENTS
                    </div>
                    <div class="detail-card-inner-box">
                        <p class="requirements-text">
                            Complete at least <span class="highlight-text">2 hours</span> of uninterrupted 'Deep Focus' session within the application. The session must be logged via the Pomodoro timer and tagged with a project category.
                        </p>
                    </div>
                </div>

                <!-- Active Availability -->
                <div class="detail-card">
                    <div class="detail-card-header">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                        ACTIVE AVAILABILITY
                    </div>

                    <div class="dates-split-grid">
                        <!-- Start Date -->
                        <div class="date-tile-box">
                            <div class="date-tile-icon-circle">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                                    <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                                    <path d="M4 22h16"></path>
                                    <path d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34"></path>
                                    <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                                </svg>
                            </div>
                            <div class="date-tile-text-wrap">
                                <span class="date-tile-label">START DATE</span>
                                <span class="date-tile-value">Oct 01, 2023</span>
                                <span class="date-tile-sub">00:00 AM UTC</span>
                            </div>
                        </div>

                        <!-- End Date -->
                        <div class="date-tile-box">
                            <div class="date-tile-icon-circle">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M22 10v6M2 10l10-5 10 5-10 5z"></path>
                                    <path d="M6 12v5c3 3 9 3 12 0v-5"></path>
                                </svg>
                            </div>
                            <div class="date-tile-text-wrap">
                                <span class="date-tile-label">END DATE</span>
                                <span class="date-tile-value">Dec 31, 2023</span>
                                <span class="date-tile-sub">11:59 PM UTC</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Right Column -->
            <div class="details-col">

                <!-- Ownership -->
                <div class="detail-card">
                    <div class="detail-card-header">
                        OWNERSHIP
                    </div>

                    <div class="owner-profile-row">
                        <div class="owner-avatar-circle">
                            <svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="#FFF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                        </div>
                        <div class="owner-info-text">
                            <span class="owner-name">Alex Mercer</span>
                            <span class="owner-role">Primary Admin • Level 12</span>
                        </div>
                    </div>

                    <div class="owner-meta-row">
                        <span class="owner-meta-label">Created on</span>
                        <span class="owner-meta-val">Sep 28, 2023</span>
                    </div>

                    <div class="owner-meta-row">
                        <span class="owner-meta-label">Visibility</span>
                        <span class="owner-meta-val">Public (All Students)</span>
                    </div>
                </div>

                <!-- Global Progress -->
                <div class="detail-card">
                    <div class="detail-card-header">
                        GLOBAL PROGRESS
                    </div>

                    <div class="progress-completions-row">
                        <span class="progress-stat-label">Total Completions</span>
                        <span class="progress-stat-count">14,202</span>
                    </div>

                    <div class="global-progress-track">
                        <div class="global-progress-fill"></div>
                    </div>

                    <div class="recent-completion-section">
                        <span class="recent-completion-label">Recent completion by:</span>
                        <div class="avatars-overlap-row">
                            <div class="avatar-overlap-item" style="background: #3B82F6; color:#FFF;">JD</div>
                            <div class="avatar-overlap-item" style="background: #10B981; color:#FFF;">ER</div>
                            <div class="avatar-overlap-item" style="background: #8B5CF6; color:#FFF;">SK</div>
                            <div class="avatar-overlap-item badge-count">+1.2k</div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Archive Modal (Image 3) -->
    <div id="archiveModal" class="modal-backdrop">
        <div class="modal-card">
            <button type="button" class="modal-btn-close" onclick="closeArchiveModal()">✕</button>

            <!-- Bonfire icon -->
            <div class="modal-icon-badge">
                <svg viewBox="0 0 24 24">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79.09-.39.43-.65.82-.65h.06c.39 0 .73.26.82.65.13.58.21 1.17.21 1.79 0 2.87 2.13 5.25 4.88 5.72v2.21zm4.79-3.72c-.09.39-.43.65-.82.65h-.06c-.39 0-.73-.26-.82-.65-.13-.58-.21-1.17-.21-1.79 0-2.87-2.13-5.25-4.88-5.72V7.47c3.95.49 7 3.85 7 7.93 0 .62-.08 1.21-.21 1.79z"></path>
                    <path d="M12 6c-1.1 0-2 .9-2 2 0 1.5 2 3.5 2 3.5s2-2 2-3.5c0-1.1-.9-2-2-2z" fill="#D97706"></path>
                </svg>
            </div>

            <h3 class="modal-title">Archive Quest?</h3>
            <p class="modal-body-text">
                Are you sure you want to archive <strong>"Morning Routine"</strong>? This will hide it from students and pause all active progress.
            </p>

            <!-- Quest Preview Block -->
            <div class="modal-preview-box">
                <div class="modal-preview-left">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                        <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                    </svg>
                    <div class="modal-preview-details">
                        <span class="modal-preview-tag">QUEST PREVIEW</span>
                        <span class="modal-preview-name">Morning Routine</span>
                    </div>
                </div>

                <div class="modal-preview-right">
                    <div class="modal-preview-xp">
                        <svg viewBox="0 0 24 24">
                            <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                        </svg>
                        <span>300 XP</span>
                    </div>
                    <span class="modal-preview-freq">DAILY</span>
                </div>
            </div>

            <!-- Footer Action Buttons -->
            <div class="modal-actions-row">
                <button type="button" class="btn-modal-cancel" onclick="closeArchiveModal()">Cancel</button>
                <asp:Button ID="btnConfirmArchive" runat="server" CssClass="btn-modal-confirm" Text="Archive Quest" OnClick="btnConfirmArchive_Click" />
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openArchiveModal() {
            var modal = document.getElementById('archiveModal');
            if (modal) {
                modal.classList.add('show');
            }
        }

        function closeArchiveModal() {
            var modal = document.getElementById('archiveModal');
            if (modal) {
                modal.classList.remove('show');
            }
        }

        // Close on escape key
        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') {
                closeArchiveModal();
            }
        });
    </script>
</asp:Content>
