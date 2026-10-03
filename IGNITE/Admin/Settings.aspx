<%@ Page Title="Settings — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master"
    AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="IGNITE.Admin.Settings" %>

    <asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
        <link href="../Content/admin-settings.css" rel="stylesheet" type="text/css" />
        <style>
            .admin-topbar-header {
                display: none !important;
            }

            .admin-page-canvas {
                padding-top: 24px !important;
            }

            /* Fail-safe embedded styles matching visual prototype */
            .settings-container {
                display: flex;
                flex-direction: column;
                gap: 22px;
                padding: 8px 36px 60px 36px;
                background-color: #F5F2EB;
                min-height: calc(100vh - 70px);
                box-sizing: border-box;
                font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                color: #1a1a1a;
            }

            .settings-header-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
            }

            .settings-title-group {
                display: flex;
                align-items: center;
                gap: 16px;
            }

            .settings-dashboard-title {
                font-size: 22px;
                font-weight: 800;
                color: #1a1a1a;
                margin: 0;
                letter-spacing: -0.3px;
            }

            .streak-pill-badge {
                display: inline-flex;
                align-items: center;
                gap: 6px;
                padding: 6px 14px;
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
                gap: 24px;
            }

            .level-xp-widget {
                display: flex;
                flex-direction: column;
                gap: 5px;
                width: 180px;
            }

            .level-xp-labels {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 10px;
                font-weight: 800;
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

            .top-search-wrap {
                position: relative;
                display: flex;
                align-items: center;
            }

            .top-search-wrap svg {
                position: absolute;
                left: 14px;
                width: 15px;
                height: 15px;
                stroke: #8C857D;
                pointer-events: none;
            }

            .top-search-input {
                width: 200px;
                padding: 9px 16px 9px 38px;
                background-color: #FFFFFF;
                border: 1px solid #DDD6CB;
                border-radius: 20px;
                font-size: 13px;
                font-family: inherit;
                color: #1a1a1a;
                outline: none;
                transition: all 0.2s ease;
            }

            .top-search-input:focus {
                width: 230px;
                border-color: #D96A77;
                box-shadow: 0 0 0 3px rgba(217, 106, 119, 0.15);
            }

            .settings-heading-block {
                display: flex;
                flex-direction: column;
                gap: 5px;
                margin-top: 2px;
            }

            .settings-main-title {
                font-size: 32px;
                font-weight: 800;
                color: #1a1a1a;
                margin: 0;
                letter-spacing: -0.5px;
            }

            .settings-subtitle {
                font-size: 14px;
                color: #78716C;
                margin: 0;
                font-weight: 500;
            }

            .settings-grid {
                display: grid;
                grid-template-columns: 1.12fr 0.88fr;
                gap: 24px;
                align-items: start;
                width: 100%;
                margin-top: 4px;
            }

            .settings-col {
                display: flex;
                flex-direction: column;
                gap: 24px;
            }

            .settings-card {
                background-color: #EAE6DF;
                border-radius: 16px;
                padding: 24px 26px;
                display: flex;
                flex-direction: column;
                gap: 18px;
                box-sizing: border-box;
                border: 1px solid rgba(221, 214, 203, 0.6);
            }

            .card-header-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .card-title-group {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .card-title-icon {
                width: 18px;
                height: 18px;
                stroke: #D96A77;
                flex-shrink: 0;
            }

            .card-title {
                font-size: 15px;
                font-weight: 800;
                color: #1a1a1a;
                margin: 0;
                letter-spacing: -0.2px;
            }

            .form-row-2col {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 16px;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                gap: 6px;
            }

            .form-label {
                font-size: 11.5px;
                font-weight: 700;
                color: #78716C;
                letter-spacing: 0.1px;
            }

            .form-input,
            .form-select,
            .form-textarea {
                width: 100%;
                background-color: #F5F2EB;
                border: 1px solid #DDD6CB;
                border-radius: 10px;
                padding: 11px 14px;
                font-size: 13px;
                font-family: inherit;
                color: #1a1a1a;
                font-weight: 600;
                outline: none;
                box-sizing: border-box;
                transition: all 0.2s ease;
            }

            .form-input:focus,
            .form-select:focus,
            .form-textarea:focus {
                background-color: #FFFFFF;
                border-color: #D96A77;
                box-shadow: 0 0 0 3px rgba(217, 106, 119, 0.12);
            }

            .form-textarea {
                min-height: 76px;
                resize: vertical;
                line-height: 1.5;
            }

            .btn-upload-logo-box {
                display: inline-flex;
                align-items: center;
                gap: 10px;
                background-color: #F5F2EB;
                border: 1px solid #DDD6CB;
                border-radius: 10px;
                padding: 10px 16px;
                font-size: 12.5px;
                font-weight: 700;
                color: #1a1a1a;
                cursor: pointer;
                transition: all 0.2s ease;
                width: fit-content;
            }

            .btn-upload-logo-box:hover {
                background-color: #FFFFFF;
                border-color: #D96A77;
                color: #D96A77;
            }

            .btn-upload-logo-box svg {
                width: 16px;
                height: 16px;
                stroke: #78716C;
            }

            .btn-upload-logo-box:hover svg {
                stroke: #D96A77;
            }

            .card-actions-right {
                display: flex;
                justify-content: flex-end;
                margin-top: 6px;
            }

            .btn-save-platform {
                background-color: #D96A77;
                color: #FFFFFF;
                border: none;
                border-radius: 10px;
                padding: 11px 22px;
                font-size: 13px;
                font-weight: 700;
                cursor: pointer;
                font-family: inherit;
                transition: all 0.2s ease;
            }

            .btn-save-platform:hover {
                background-color: #C85966;
                box-shadow: 0 4px 12px rgba(217, 106, 119, 0.25);
            }

            .btn-add-category {
                background-color: #1C1917;
                color: #FFFFFF;
                border: none;
                border-radius: 8px;
                padding: 7px 14px;
                font-size: 12px;
                font-weight: 700;
                cursor: pointer;
                font-family: inherit;
                transition: background-color 0.2s ease;
            }

            .btn-add-category:hover {
                background-color: #383431;
            }

            .categories-table {
                width: 100%;
                border-collapse: collapse;
            }

            .categories-table th {
                text-align: left;
                padding: 6px 12px 12px 12px;
                font-size: 10px;
                font-weight: 800;
                color: #78716C;
                letter-spacing: 0.6px;
                text-transform: uppercase;
                border-bottom: 1px solid rgba(221, 214, 203, 0.7);
            }

            .categories-table th.th-status {
                text-align: right;
                padding-right: 16px;
            }

            .categories-table td {
                padding: 14px 12px;
                border-bottom: 1px solid rgba(221, 214, 203, 0.4);
                color: #1a1a1a;
                font-weight: 500;
                vertical-align: middle;
            }

            .categories-table tr:last-child td {
                border-bottom: none;
            }

            .category-desc {
                font-size: 13px;
                color: #373330;
                font-weight: 500;
            }

            .status-badge-active {
                color: #10B981;
                font-weight: 800;
                font-size: 11px;
                letter-spacing: 0.6px;
                text-transform: uppercase;
                text-align: right;
                display: block;
            }

            .status-badge-inactive {
                color: #9CA3AF;
                font-weight: 800;
                font-size: 11px;
                letter-spacing: 0.6px;
                text-transform: uppercase;
                text-align: right;
                display: block;
            }

            /* Toggle Switches */
            .toggle-setting-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 16px;
            }

            .toggle-info {
                display: flex;
                flex-direction: column;
                gap: 3px;
            }

            .toggle-title {
                font-size: 13.5px;
                font-weight: 700;
                color: #1a1a1a;
                margin: 0;
            }

            .toggle-subtitle {
                font-size: 11.5px;
                color: #78716C;
                margin: 0;
            }

            .switch-control {
                position: relative;
                display: inline-block;
                width: 44px;
                height: 24px;
                flex-shrink: 0;
            }

            .switch-control input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .switch-slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #D1D5DB;
                transition: 0.25s cubic-bezier(0.4, 0, 0.2, 1);
                border-radius: 24px;
            }

            .switch-slider:before {
                position: absolute;
                content: "";
                height: 18px;
                width: 18px;
                left: 3px;
                bottom: 3px;
                background-color: white;
                transition: 0.25s cubic-bezier(0.4, 0, 0.2, 1);
                border-radius: 50%;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            }

            .switch-control input:checked+.switch-slider {
                background-color: #D96A77;
            }

            .switch-control input:checked+.switch-slider:before {
                transform: translateX(20px);
            }

            .xp-reward-config-row {
                display: flex;
                align-items: center;
                gap: 12px;
            }

            .xp-input-box {
                width: 80px;
                background-color: #F5F2EB;
                border: 1px solid #DDD6CB;
                border-radius: 10px;
                padding: 9px 12px;
                font-size: 13.5px;
                font-weight: 700;
                color: #1a1a1a;
                text-align: center;
                outline: none;
                font-family: inherit;
            }

            .xp-input-box:focus {
                background-color: #FFFFFF;
                border-color: #D96A77;
            }

            .xp-reward-label {
                font-size: 12.5px;
                color: #78716C;
                font-weight: 500;
            }

            .settings-footer-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding-top: 24px;
                border-top: 1px solid #DDD6CB;
                margin-top: 8px;
                width: 100%;
            }

            .btn-logout {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                background-color: #FFFFFF;
                border: 1px solid #DDD6CB;
                border-radius: 10px;
                padding: 10px 18px;
                font-size: 13px;
                font-weight: 700;
                color: #DC2626;
                cursor: pointer;
                font-family: inherit;
                transition: all 0.2s ease;
            }

            .btn-logout svg {
                width: 16px;
                height: 16px;
                stroke: #DC2626;
            }

            .btn-logout:hover {
                background-color: #FEF2F2;
                border-color: #FCA5A5;
            }

            .footer-right {
                display: flex;
                align-items: center;
                gap: 16px;
            }

            .btn-cancel-changes {
                background: transparent;
                border: none;
                font-size: 13px;
                font-weight: 700;
                color: #1a1a1a;
                cursor: pointer;
                padding: 11px 18px;
                border-radius: 10px;
                font-family: inherit;
                transition: background-color 0.2s;
            }

            .btn-cancel-changes:hover {
                background-color: rgba(0, 0, 0, 0.05);
            }

            .btn-save-all {
                background-color: #D96A77;
                color: #FFFFFF;
                border: none;
                border-radius: 10px;
                padding: 11px 26px;
                font-size: 13px;
                font-weight: 700;
                cursor: pointer;
                font-family: inherit;
                transition: all 0.2s ease;
            }

            .btn-save-all:hover {
                background-color: #C85966;
                box-shadow: 0 4px 14px rgba(217, 106, 119, 0.25);
            }
        </style>
    </asp:Content>

    <asp:Content ID="MainContentArea" ContentPlaceHolderID="MainContent" runat="server">
        <div class="settings-container">

            <!-- Top Header Row -->
            <div class="settings-header-row">
                <div class="settings-title-group">
                    <h1 class="settings-dashboard-title">Dashboard</h1>
                    <div class="streak-pill-badge" title="Current Active Streak">
                        <svg viewBox="0 0 24 24" width="14" height="14">
                            <path d="M12 2c1.5 3 4 5.5 4 9a6 6 0 1 1-12 0c0-3.5 2.5-6 4-9 1 2 2 3 4 3s1.5-1 0-3z" />
                        </svg>
                        <span>15 DAY STREAK</span>
                    </div>
                </div>

                <div class="header-right-group">
                    <!-- Level / XP Progress Widget -->
                    <div class="level-xp-widget" title="Global Platform XP Progress">
                        <div class="level-xp-labels">
                            <span class="lvl-tag">LVL 12</span>
                            <span class="xp-ratio">4,500 / 6,000 XP</span>
                        </div>
                        <div class="xp-progress-track">
                            <div class="xp-progress-fill"></div>
                        </div>
                    </div>

                    <!-- Search Input Pill -->
                    <div class="top-search-wrap">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                        <input type="text" class="top-search-input" placeholder="Search..." />
                    </div>
                </div>
            </div>

            <!-- Settings Heading & Subtitle -->
            <div class="settings-heading-block">
                <h1 class="settings-main-title">Settings</h1>
                <p class="settings-subtitle">Manage platform-wide configuration and system preferences</p>
            </div>

            <!-- Settings Two-Column Layout Grid -->
            <div class="settings-grid">

                <!-- LEFT COLUMN: Platform Settings & Categories -->
                <div class="settings-col">

                    <!-- Card 1: Platform Settings -->
                    <div class="settings-card">
                        <div class="card-header-row">
                            <div class="card-title-group">
                                <!-- Sliders / Controls Icon -->
                                <svg class="card-title-icon" viewBox="0 0 24 24" fill="none" stroke-width="2.2"
                                    stroke-linecap="round" stroke-linejoin="round">
                                    <line x1="4" y1="21" x2="4" y2="14"></line>
                                    <line x1="4" y1="10" x2="4" y2="3"></line>
                                    <line x1="12" y1="21" x2="12" y2="12"></line>
                                    <line x1="12" y1="8" x2="12" y2="3"></line>
                                    <line x1="20" y1="21" x2="20" y2="16"></line>
                                    <line x1="20" y1="12" x2="20" y2="3"></line>
                                    <line x1="1" y1="14" x2="7" y2="14"></line>
                                    <line x1="9" y1="8" x2="15" y2="8"></line>
                                    <line x1="17" y1="16" x2="23" y2="16"></line>
                                </svg>
                                <h2 class="card-title">Platform Settings</h2>
                            </div>
                        </div>

                        <!-- Platform Name & Default Language -->
                        <div class="form-row-2col">
                            <div class="form-group">
                                <label class="form-label" for="<%= txtPlatformName.ClientID %>">Platform Name</label>
                                <asp:TextBox ID="txtPlatformName" runat="server" CssClass="form-input"
                                    Text="Ignite Achievement System"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="<%= ddlLanguage.ClientID %>">Default Language</label>
                                <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="English (US)" Value="en-US" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="English (UK)" Value="en-GB"></asp:ListItem>
                                    <asp:ListItem Text="Spanish (ES)" Value="es-ES"></asp:ListItem>
                                    <asp:ListItem Text="French (FR)" Value="fr-FR"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Description -->
                        <div class="form-group">
                            <label class="form-label" for="<%= txtDescription.ClientID %>">Description</label>
                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3"
                                CssClass="form-textarea"
                                Text="Elevating student performance through gamified habits and milestone tracking.">
                            </asp:TextBox>
                        </div>

                        <!-- Default Timezone & Logo / Branding -->
                        <div class="form-row-2col">
                            <div class="form-group">
                                <label class="form-label" for="<%= ddlTimezone.ClientID %>">Default Timezone</label>
                                <asp:DropDownList ID="ddlTimezone" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="(GMT-08:00) Pacific Time (US & Canada)" Value="GMT-8"
                                        Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="(GMT-05:00) Eastern Time (US & Canada)" Value="GMT-5">
                                    </asp:ListItem>
                                    <asp:ListItem Text="(GMT+00:00) UTC / London" Value="GMT0"></asp:ListItem>
                                    <asp:ListItem Text="(GMT+05:30) India Standard Time" Value="GMT+5:30">
                                    </asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Logo / Branding</label>
                                <div class="logo-upload-wrap">
                                    <input type="file" id="fileLogoUpload" style="display:none;"
                                        onchange="handleLogoChange(this)" />
                                    <div class="btn-upload-logo-box"
                                        onclick="document.getElementById('fileLogoUpload').click();"
                                        title="Upload new brand logo">
                                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round">
                                            <path d="M17.5 19H9a7 7 0 1 1 6.71-9h1.79a4.5 4.5 0 1 1 0 9Z"></path>
                                            <polyline points="12 12 12 16"></polyline>
                                            <polyline points="9 13 12 10 15 13"></polyline>
                                        </svg>
                                        <span id="lblUploadLogo">Upload New Logo</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Card 1 Save Button -->
                        <div class="card-actions-right">
                            <asp:Button ID="btnSavePlatform" runat="server" Text="Save Platform Changes"
                                CssClass="btn-save-platform" OnClick="btnSavePlatform_Click" />
                        </div>
                    </div>

                    <!-- Card 2: Categories -->
                    <div class="settings-card">
                        <div class="card-header-row">
                            <div class="card-title-group">
                                <!-- Tag Icon -->
                                <svg class="card-title-icon" viewBox="0 0 24 24" fill="none" stroke-width="2.2"
                                    stroke-linecap="round" stroke-linejoin="round">
                                    <path
                                        d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z">
                                    </path>
                                    <line x1="7" y1="7" x2="7.01" y2="7"></line>
                                </svg>
                                <h2 class="card-title">Categories</h2>
                            </div>
                            <button type="button" class="btn-add-category" onclick="openAddCategoryModal()">+ Add
                                Category</button>
                        </div>

                        <!-- Categories Table -->
                        <div class="categories-table-wrap">
                            <table class="categories-table">
                                <thead>
                                    <tr>
                                        <th>DESCRIPTION</th>
                                        <th class="th-status">STATUS</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptCategories" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <span class="category-desc">
                                                        <%# Eval("Description") %>
                                                    </span>
                                                </td>
                                                <td style="text-align: right;">
                                                    <span
                                                        class='<%# Eval("Status").ToString() == "ACTIVE" ? "status-badge-active" : "status-badge-inactive" %>'>
                                                        <%# Eval("Status") %>
                                                    </span>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

                <!-- RIGHT COLUMN: Challenges & Quests, Achievement Settings, Student Accounts -->
                <div class="settings-col">

                    <!-- Card 3: Challenges & Quests -->
                    <div class="settings-card">
                        <div class="card-header-row">
                            <div class="card-title-group">
                                <!-- Trophy Icon -->
                                <svg class="card-title-icon" viewBox="0 0 24 24" fill="none" stroke-width="2.2"
                                    stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                                    <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                                    <path d="M4 22h16"></path>
                                    <path
                                        d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34">
                                    </path>
                                    <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                                </svg>
                                <h2 class="card-title">Challenges & Quests</h2>
                            </div>
                        </div>

                        <!-- Toggle: Enable System Challenges -->
                        <div class="toggle-setting-row">
                            <div class="toggle-info">
                                <h3 class="toggle-title">Enable System Challenges</h3>
                                <p class="toggle-subtitle">Allow students to join global challenges.</p>
                            </div>
                            <label class="switch-control" title="Toggle System Challenges">
                                <asp:CheckBox ID="chkSystemChallenges" runat="server" Checked="true" />
                                <span class="switch-slider"></span>
                            </label>
                        </div>

                        <!-- Toggle: Participation Limit Rules -->
                        <div class="toggle-setting-row">
                            <div class="toggle-info">
                                <h3 class="toggle-title">Participation Limit Rules</h3>
                                <p class="toggle-subtitle">Strict adherence to streak requirements.</p>
                            </div>
                            <label class="switch-control" title="Toggle Participation Limit Rules">
                                <asp:CheckBox ID="chkParticipationRules" runat="server" Checked="false" />
                                <span class="switch-slider"></span>
                            </label>
                        </div>

                        <!-- Base XP Reward Configuration -->
                        <div class="form-group" style="margin-top: 4px;">
                            <label class="form-label" for="<%= txtBaseXp.ClientID %>">Base XP Reward
                                Configuration</label>
                            <div class="xp-reward-config-row">
                                <asp:TextBox ID="txtBaseXp" runat="server" CssClass="xp-input-box" Text="500">
                                </asp:TextBox>
                                <span class="xp-reward-label">XP per completed quest stage</span>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4: Achievement Settings -->
                    <div class="settings-card">
                        <div class="card-header-row">
                            <div class="card-title-group">
                                <!-- Medal / Award Icon -->
                                <svg class="card-title-icon" viewBox="0 0 24 24" fill="none" stroke-width="2.2"
                                    stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="12" cy="8" r="6"></circle>
                                    <polyline points="8.21 13.89 7 22 12 18 17 22 15.79 13.88"></polyline>
                                </svg>
                                <h2 class="card-title">Achievement Settings</h2>
                            </div>
                        </div>

                        <!-- Toggle: Achievement System -->
                        <div class="toggle-setting-row">
                            <div class="toggle-info">
                                <h3 class="toggle-title">Achievement System</h3>
                                <p class="toggle-subtitle">Enable badge rewards and popups.</p>
                            </div>
                            <label class="switch-control" title="Toggle Achievement System">
                                <asp:CheckBox ID="chkAchievementSystem" runat="server" Checked="true" />
                                <span class="switch-slider"></span>
                            </label>
                        </div>

                        <!-- Default UI Behavior -->
                        <div class="form-group">
                            <label class="form-label" for="<%= ddlUiBehavior.ClientID %>">Default UI Behavior</label>
                            <asp:DropDownList ID="ddlUiBehavior" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Full-screen Modal Popup" Value="Modal" Selected="True">
                                </asp:ListItem>
                                <asp:ListItem Text="Compact Toast Notification" Value="Toast"></asp:ListItem>
                                <asp:ListItem Text="Top Banner Notification" Value="Banner"></asp:ListItem>
                                <asp:ListItem Text="Subtle Sound & In-feed Badge" Value="InFeed"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Toggle: Hidden Achievement Support -->
                        <div class="toggle-setting-row">
                            <div class="toggle-info">
                                <h3 class="toggle-title">Hidden Achievement Support</h3>
                                <p class="toggle-subtitle">Allow secret rewards until unlocked.</p>
                            </div>
                            <label class="switch-control" title="Toggle Hidden Achievement Support">
                                <asp:CheckBox ID="chkHiddenAchievements" runat="server" Checked="true" />
                                <span class="switch-slider"></span>
                            </label>
                        </div>
                    </div>

                    <!-- Card 5: Student Accounts -->
                    <div class="settings-card">
                        <div class="card-header-row">
                            <div class="card-title-group">
                                <!-- Users Icon -->
                                <svg class="card-title-icon" viewBox="0 0 24 24" fill="none" stroke-width="2.2"
                                    stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                </svg>
                                <h2 class="card-title">Student Accounts</h2>
                            </div>
                        </div>

                        <!-- Toggle: Self-Account Deactivation -->
                        <div class="toggle-setting-row">
                            <div class="toggle-info">
                                <h3 class="toggle-title">Self-Account Deactivation</h3>
                                <p class="toggle-subtitle">Allow students to pause their accounts.</p>
                            </div>
                            <label class="switch-control" title="Toggle Self-Account Deactivation">
                                <asp:CheckBox ID="chkSelfDeactivation" runat="server" Checked="true" />
                                <span class="switch-slider"></span>
                            </label>
                        </div>

                        <!-- Password Complexity Policy -->
                        <div class="form-group">
                            <label class="form-label" for="<%= ddlPasswordPolicy.ClientID %>">Password Complexity
                                Policy</label>
                            <asp:DropDownList ID="ddlPasswordPolicy" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Advanced (Alphanumeric + Symbol)" Value="Advanced" Selected="True">
                                </asp:ListItem>
                                <asp:ListItem Text="Standard (8+ Characters, Numbers)" Value="Standard"></asp:ListItem>
                                <asp:ListItem Text="Basic (6+ Characters)" Value="Basic"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Data Retention Policy -->
                        <div class="form-group">
                            <label class="form-label" for="<%= ddlDataRetention.ClientID %>">Data Retention
                                Policy</label>
                            <asp:DropDownList ID="ddlDataRetention" runat="server" CssClass="form-select">
                                <asp:ListItem Text="24 Months (Standard)" Value="24m" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="12 Months (Strict Privacy)" Value="12m"></asp:ListItem>
                                <asp:ListItem Text="36 Months" Value="36m"></asp:ListItem>
                                <asp:ListItem Text="Indefinite / Permanent" Value="Indefinite"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Bottom Action Bar (Divider + Actions) -->
            <div class="settings-footer-bar">
                <div class="footer-left">
                    <!-- Logout Button -->
                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="btn-logout" OnClick="btnLogout_Click"
                        CausesValidation="false" title="Sign out of Admin Portal">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round">
                            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                            <polyline points="16 17 21 12 16 7"></polyline>
                            <line x1="21" y1="12" x2="9" y2="12"></line>
                        </svg>
                        <span>Logout</span>
                    </asp:LinkButton>
                </div>

                <div class="footer-right">
                    <!-- Cancel Changes Button -->
                    <button type="button" class="btn-cancel-changes" onclick="handleCancelChanges()">Cancel
                        Changes</button>

                    <!-- Save All Settings Button -->
                    <asp:Button ID="btnSaveAll" runat="server" Text="Save All Settings" CssClass="btn-save-all"
                        OnClick="btnSaveAll_Click" />
                </div>
            </div>

        </div>

        <!-- Modal Popup: Add Category -->
        <div id="addCategoryModal" class="modal-backdrop" onclick="closeAddCategoryModalOnBackdrop(event)">
            <div class="modal-card" onclick="event.stopPropagation();">
                <div class="modal-header">
                    <div class="modal-title-group">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2.2" stroke-linecap="round"
                            stroke-linejoin="round">
                            <path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z">
                            </path>
                            <line x1="7" y1="7" x2="7.01" y2="7"></line>
                        </svg>
                        <h3 class="modal-title">Add Category</h3>
                    </div>
                    <button type="button" class="modal-close-btn" onclick="closeAddCategoryModal()" aria-label="Close">
                        &times;
                    </button>
                </div>

                <div class="form-group">
                    <label class="form-label" for="<%= txtNewCategoryDesc.ClientID %>">Category Description</label>
                    <asp:TextBox ID="txtNewCategoryDesc" runat="server" CssClass="form-input"
                        placeholder="e.g. Special weekend tournament challenges"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label" for="<%= ddlNewCategoryStatus.ClientID %>">Status</label>
                    <asp:DropDownList ID="ddlNewCategoryStatus" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Active" Value="ACTIVE" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Inactive" Value="INACTIVE"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn-modal-cancel" onclick="closeAddCategoryModal()">Cancel</button>
                    <asp:Button ID="btnAddCategorySubmit" runat="server" Text="Add Category" CssClass="btn-modal-submit"
                        OnClick="btnAddCategorySubmit_Click" />
                </div>
            </div>
        </div>

        <!-- Toast Notification Element -->
        <div id="toastNotice" class="toast-notice">
            <svg class="toast-icon" viewBox="0 0 24 24" fill="none" stroke-width="2.5" stroke-linecap="round"
                stroke-linejoin="round">
                <polyline points="20 6 9 17 4 12"></polyline>
            </svg>
            <span id="toastNoticeText">Settings saved successfully!</span>
        </div>
    </asp:Content>

    <asp:Content ID="ScriptsContentArea" ContentPlaceHolderID="ScriptsContent" runat="server">
        <script type="text/javascript">
            // Modal handlers
            function openAddCategoryModal() {
                var modal = document.getElementById('addCategoryModal');
                if (modal) {
                    modal.classList.add('open');
                    var input = document.getElementById('<%= txtNewCategoryDesc.ClientID %>');
                    if (input) {
                        setTimeout(function () { input.focus(); }, 100);
                    }
                }
            }

            function closeAddCategoryModal() {
                var modal = document.getElementById('addCategoryModal');
                if (modal) {
                    modal.classList.remove('open');
                }
            }

            function closeAddCategoryModalOnBackdrop(e) {
                if (e.target === document.getElementById('addCategoryModal')) {
                    closeAddCategoryModal();
                }
            }

            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') {
                    closeAddCategoryModal();
                }
            });

            // Logo Upload Handler
            function handleLogoChange(input) {
                if (input.files && input.files[0]) {
                    var fileName = input.files[0].name;
                    var lbl = document.getElementById('lblUploadLogo');
                    if (lbl) {
                        lbl.textContent = fileName.length > 18 ? fileName.substring(0, 15) + '...' : fileName;
                    }
                    showToastNotice('Logo file selected: ' + fileName);
                }
            }

            // Cancel Changes Handler
            function handleCancelChanges() {
                if (confirm('Discard changes and restore current settings?')) {
                    window.location.reload();
                }
            }

            // Toast Notification System
            var toastTimeout = null;
            function showToastNotice(msg) {
                var toast = document.getElementById('toastNotice');
                var toastText = document.getElementById('toastNoticeText');
                if (!toast) return;

                if (toastText) {
                    toastText.textContent = msg || 'Settings updated successfully!';
                }

                toast.classList.add('show');

                if (toastTimeout) {
                    clearTimeout(toastTimeout);
                }

                toastTimeout = setTimeout(function () {
                    toast.classList.remove('show');
                }, 3200);
            }

            window.showToastNotice = showToastNotice;
        </script>
    </asp:Content>