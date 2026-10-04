<%@ Page Title="Create Achievement — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="CreateAchievement.aspx.cs" Inherits="IGNITE.Admin.CreateAchievement" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-topbar-header {
            display: none !important;
        }

        .admin-page-canvas {
            padding-top: 24px !important;
        }

        .create-achievement-container {
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

        /* Subheader with Page Title & Actions */
        .subheader-action-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            width: 100%;
        }

        .subheader-text-stack {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .form-main-heading {
            font-size: 22px;
            font-weight: 800;
            color: #1a1a1a;
            margin: 0;
        }

        .form-sub-heading {
            font-size: 13px;
            color: #78716C;
            margin: 0;
        }

        .top-action-buttons {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .btn-action-cancel {
            background: #FFFFFF;
            border: 1px solid #D1CDC7;
            border-radius: 8px;
            padding: 9px 18px;
            font-size: 13px;
            font-weight: 700;
            color: #44403C;
            cursor: pointer;
            text-decoration: none;
            font-family: inherit;
            transition: all 0.15s ease;
        }

        .btn-action-cancel:hover {
            background: #F5F2EB;
            color: #1a1a1a;
        }

        .btn-action-draft {
            background: #FFFFFF;
            border: 1px solid #D1CDC7;
            border-radius: 8px;
            padding: 9px 18px;
            font-size: 13px;
            font-weight: 700;
            color: #44403C;
            cursor: pointer;
            font-family: inherit;
            transition: all 0.15s ease;
        }

        .btn-action-draft:hover {
            background: #F5F2EB;
            color: #1a1a1a;
        }

        .btn-action-publish {
            background: #D96A77;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            padding: 9px 20px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
            box-shadow: 0 2px 6px rgba(217, 106, 119, 0.28);
            transition: background 0.15s ease;
        }

        .btn-action-publish:hover {
            background: #C45A66;
        }

        /* 3-Column Layout */
        .create-form-3col-grid {
            display: grid;
            grid-template-columns: 1.4fr 1fr 1fr;
            gap: 20px;
            align-items: start;
        }

        .form-col {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-panel-card {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 22px 24px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .card-inner-title {
            font-size: 13px;
            font-weight: 800;
            color: #1C1917;
            margin: 0;
        }

        .form-item-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-item-label {
            font-size: 11px;
            font-weight: 700;
            color: #44403C;
        }

        .form-text-input {
            width: 100%;
            padding: 10px 14px;
            background: #F5F2EB;
            border: 1px solid transparent;
            border-radius: 8px;
            font-size: 13px;
            color: #1a1a1a;
            font-family: inherit;
            outline: none;
            box-sizing: border-box;
            transition: all 0.2s ease;
        }

        .form-text-input:focus {
            background: #FFFFFF;
            border-color: #D96A77;
            box-shadow: 0 0 0 3px rgba(217, 106, 119, 0.15);
        }

        .form-textarea-input {
            width: 100%;
            height: 90px;
            padding: 10px 14px;
            background: #F5F2EB;
            border: 1px solid transparent;
            border-radius: 8px;
            font-size: 13px;
            color: #1a1a1a;
            font-family: inherit;
            outline: none;
            box-sizing: border-box;
            resize: vertical;
            transition: all 0.2s ease;
        }

        .form-textarea-input:focus {
            background: #FFFFFF;
            border-color: #D96A77;
            box-shadow: 0 0 0 3px rgba(217, 106, 119, 0.15);
        }

        .two-inputs-row {
            display: grid;
            grid-template-columns: 1fr 1.3fr;
            gap: 14px;
        }

        .input-with-suffix {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-with-suffix input {
            padding-right: 36px;
        }

        .input-suffix-tag {
            position: absolute;
            right: 12px;
            font-size: 11px;
            font-weight: 800;
            color: #78716C;
            pointer-events: none;
        }

        /* Trigger builder inside card 2 */
        .trigger-tag-label {
            font-size: 9px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }

        .trigger-inputs-row {
            display: grid;
            grid-template-columns: 1.5fr 1fr 0.6fr;
            gap: 8px;
        }

        .btn-add-subcondition {
            color: #D96A77;
            font-size: 11px;
            font-weight: 700;
            background: none;
            border: none;
            cursor: pointer;
            padding: 0;
            text-align: left;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .btn-add-subcondition:hover {
            text-decoration: underline;
        }

        /* Center Column: Achievement Type Radio Options */
        .type-radio-item {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            padding: 10px 0;
            cursor: pointer;
        }

        .radio-dot-circle {
            width: 18px;
            height: 18px;
            border-radius: 50%;
            border: 2px solid #D1CDC7;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            margin-top: 2px;
            background: #FFFFFF;
        }

        .radio-dot-circle.selected {
            border-color: #D96A77;
        }

        .radio-dot-inner {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #D96A77;
        }

        .radio-text-stack {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .radio-title-bold {
            font-size: 13px;
            font-weight: 800;
            color: #1C1917;
        }

        .radio-desc-muted {
            font-size: 11px;
            color: #78716C;
            line-height: 1.4;
        }

        /* Stealth Mode Toggle */
        .stealth-mode-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 14px;
            border-top: 1px solid rgba(0, 0, 0, 0.06);
            margin-top: 6px;
        }

        .stealth-text-stack {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .stealth-title {
            font-size: 12px;
            font-weight: 800;
            color: #1C1917;
        }

        .stealth-desc {
            font-size: 10px;
            color: #78716C;
        }

        .switch-toggle-btn {
            appearance: none;
            -webkit-appearance: none;
            width: 38px;
            height: 22px;
            background-color: #D1CDC7;
            border-radius: 11px;
            position: relative;
            cursor: pointer;
            outline: none;
            transition: background-color 0.2s ease;
        }

        .switch-toggle-btn::after {
            content: '';
            position: absolute;
            top: 2px;
            left: 2px;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            background-color: #FFFFFF;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s ease;
        }

        .switch-toggle-btn:checked {
            background-color: #D96A77;
        }

        .switch-toggle-btn:checked::after {
            transform: translateX(16px);
        }

        /* Right Column: Icon Selection Grid */
        .badge-icons-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }

        .badge-select-tile {
            width: 100%;
            aspect-ratio: 1;
            background: #F5F2EB;
            border: 2px solid transparent;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #78716C;
            transition: all 0.15s ease;
        }

        .badge-select-tile:hover {
            background: #FFFFFF;
            color: #1C1917;
        }

        .badge-select-tile.active {
            background: #FFF7ED;
            border-color: #F97316;
            color: #EA580C;
        }

        .badge-select-tile svg {
            width: 20px;
            height: 20px;
        }

        .btn-upload-svg {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            border: 1.5px dashed #D1CDC7;
            border-radius: 8px;
            padding: 10px;
            background: transparent;
            color: #44403C;
            font-size: 11px;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
            transition: all 0.15s ease;
        }

        .btn-upload-svg:hover {
            border-color: #D96A77;
            color: #D96A77;
            background: #FFF;
        }

        .btn-upload-svg svg {
            width: 14px;
            height: 14px;
        }

        /* Live Preview Card */
        .preview-mini-card {
            background: #F5F2EB;
            border-radius: 12px;
            padding: 14px;
            display: flex;
            align-items: center;
            gap: 12px;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.04);
        }

        .preview-mini-icon {
            width: 38px;
            height: 38px;
            background: #FFF7ED;
            border: 1px solid #FDBA74;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #EA580C;
            flex-shrink: 0;
        }

        .preview-mini-icon svg {
            width: 20px;
            height: 20px;
        }

        .preview-mini-stack {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .preview-mini-title {
            font-size: 12px;
            font-weight: 800;
            color: #1C1917;
        }

        .preview-mini-req {
            font-size: 10px;
            color: #78716C;
        }

        .preview-mini-xp {
            font-size: 10px;
            font-weight: 800;
            color: #D97706;
            margin-top: 2px;
        }

        @media (max-width: 1100px) {
            .create-form-3col-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <div class="create-achievement-container">

        <!-- Top Header Row -->
        <div class="page-header-row">
            <div class="header-title-left">
                <h1 class="page-main-title">Achievements</h1>
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

        <!-- Subheader: Page Title & Top Action Buttons -->
        <div class="subheader-action-row">
            <div class="subheader-text-stack">
                <h2 class="form-main-heading">Create Achievement</h2>
                <p class="form-sub-heading">Design a new milestone for your students to unlock.</p>
            </div>

            <div class="top-action-buttons">
                <a href="Achievements.aspx" class="btn-action-cancel">Cancel</a>
                <asp:Button ID="btnSaveDraft" runat="server" CssClass="btn-action-draft" Text="Save Draft" OnClick="btnDraft_Click" CausesValidation="false" />
                <asp:Button ID="btnPublishAchievement" runat="server" CssClass="btn-action-publish" Text="Publish Achievement" OnClick="btnPublish_Click" />
            </div>
        </div>

        <!-- 3-Column Form Grid -->
        <div class="create-form-3col-grid">

            <!-- Column 1: Info & Condition Builder -->
            <div class="form-col">

                <!-- Card 1: Details -->
                <div class="form-panel-card">
                    <div class="form-item-group">
                        <label class="form-item-label">Achievement Title</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-text-input" placeholder="e.g. Master of Consistency" Text="e.g. Master of Consistency" />
                    </div>

                    <div class="form-item-group">
                        <label class="form-item-label">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-textarea-input" placeholder="Describe what this achievement represents and why it matters..." />
                    </div>

                    <div class="two-inputs-row">
                        <div class="form-item-group">
                            <label class="form-item-label">XP Reward</label>
                            <div class="input-with-suffix">
                                <asp:TextBox ID="txtXpReward" runat="server" CssClass="form-text-input" Text="500" />
                                <span class="input-suffix-tag">XP</span>
                            </div>
                        </div>

                        <div class="form-item-group">
                            <label class="form-item-label">Category</label>
                            <asp:TextBox ID="txtCategory" runat="server" CssClass="form-text-input" Text="Academic Growth" />
                        </div>
                    </div>
                </div>

                <!-- Card 2: Unlock Condition Builder -->
                <div class="form-panel-card">
                    <h3 class="card-inner-title">Unlock Condition Builder</h3>

                    <div class="trigger-tag-label">TRIGGER</div>

                    <div class="trigger-inputs-row">
                        <input type="text" class="form-text-input" value="Complete Task" />
                        <input type="text" class="form-text-input" value="5 times" />
                        <input type="text" class="form-text-input" style="text-align:center;" value="5" />
                    </div>

                    <button type="button" class="btn-add-subcondition">+ Add Sub-Condition</button>
                </div>

            </div>

            <!-- Column 2: Achievement Type & Stealth Mode -->
            <div class="form-col">
                <div class="form-panel-card">
                    <h3 class="card-inner-title">Achievement Type</h3>

                    <!-- Radio 1: Milestone -->
                    <div class="type-radio-item" onclick="selectType(1)">
                        <div class="radio-dot-circle selected" id="dot1">
                            <div class="radio-dot-inner"></div>
                        </div>
                        <div class="radio-text-stack">
                            <span class="radio-title-bold">Milestone</span>
                            <span class="radio-desc-muted">Standard visible achievement for key steps.</span>
                        </div>
                    </div>

                    <!-- Radio 2: Challenge -->
                    <div class="type-radio-item" onclick="selectType(2)">
                        <div class="radio-dot-circle" id="dot2"></div>
                        <div class="radio-text-stack">
                            <span class="radio-title-bold">Challenge</span>
                            <span class="radio-desc-muted">Time-limited or difficult special task.</span>
                        </div>
                    </div>

                    <!-- Radio 3: Hidden -->
                    <div class="type-radio-item" onclick="selectType(3)">
                        <div class="radio-dot-circle" id="dot3"></div>
                        <div class="radio-text-stack">
                            <span class="radio-title-bold">Hidden</span>
                            <span class="radio-desc-muted">Secret achievement discovered upon completion.</span>
                        </div>
                    </div>

                    <!-- Stealth Mode -->
                    <div class="stealth-mode-box">
                        <div class="stealth-text-stack">
                            <span class="stealth-title">Stealth Mode</span>
                            <span class="stealth-desc">Hide conditions from students</span>
                        </div>
                        <input type="checkbox" id="chkStealth" class="switch-toggle-btn" checked="checked" />
                    </div>
                </div>
            </div>

            <!-- Column 3: Badge Selection & Live Preview -->
            <div class="form-col">

                <!-- Card 4: Badge / Icon Selection -->
                <div class="form-panel-card">
                    <h3 class="card-inner-title">Badge / Icon Selection</h3>

                    <div class="badge-icons-grid">
                        <!-- Trophy (Active) -->
                        <div class="badge-select-tile active" onclick="selectIcon(this)">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                                <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                                <path d="M4 22h16"></path>
                                <path d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34"></path>
                                <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                            </svg>
                        </div>

                        <!-- Star -->
                        <div class="badge-select-tile" onclick="selectIcon(this)">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                            </svg>
                        </div>

                        <!-- Lightning -->
                        <div class="badge-select-tile" onclick="selectIcon(this)">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                            </svg>
                        </div>

                        <!-- Flame -->
                        <div class="badge-select-tile" onclick="selectIcon(this)">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 3.5z"></path>
                            </svg>
                        </div>

                        <!-- Shield -->
                        <div class="badge-select-tile" onclick="selectIcon(this)">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                            </svg>
                        </div>

                        <!-- Medal -->
                        <div class="badge-select-tile" onclick="selectIcon(this)">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="8" r="7"></circle>
                                <polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline>
                            </svg>
                        </div>

                        <!-- Crown -->
                        <div class="badge-select-tile" onclick="selectIcon(this)">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M2 4l3 12h14l3-12-6 7-4-7-4 7-6-7zm3 16h14v2H5v-2z"></path>
                            </svg>
                        </div>

                        <!-- Diamond -->
                        <div class="badge-select-tile" onclick="selectIcon(this)">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polygon points="6 3 18 3 22 9 12 22 2 9"></polygon>
                            </svg>
                        </div>
                    </div>

                    <button type="button" class="btn-upload-svg">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                            <polyline points="17 8 12 3 7 8"></polyline>
                            <line x1="12" y1="3" x2="12" y2="15"></line>
                        </svg>
                        Upload Custom SVG
                    </button>
                </div>

                <!-- Card 5: LIVE PREVIEW -->
                <div class="form-panel-card">
                    <h3 class="card-inner-title">LIVE PREVIEW</h3>

                    <div class="preview-mini-card">
                        <div class="preview-mini-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                                <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                                <path d="M4 22h16"></path>
                                <path d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34"></path>
                                <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                            </svg>
                        </div>
                        <div class="preview-mini-stack">
                            <span class="preview-mini-title">Master of Consistency</span>
                            <span class="preview-mini-req">Complete 5 tasks in a row</span>
                            <span class="preview-mini-xp">● +500 XP</span>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <script type="text/javascript">
        function selectType(idx) {
            for (var i = 1; i <= 3; i++) {
                var el = document.getElementById('dot' + i);
                if (el) {
                    el.classList.remove('selected');
                    el.innerHTML = '';
                }
            }
            var selected = document.getElementById('dot' + idx);
            if (selected) {
                selected.classList.add('selected');
                selected.innerHTML = '<div class="radio-dot-inner"></div>';
            }
        }

        function selectIcon(el) {
            document.querySelectorAll('.badge-select-tile').forEach(function(tile) {
                tile.classList.remove('active');
            });
            el.classList.add('active');
        }
    </script>
</asp:Content>
