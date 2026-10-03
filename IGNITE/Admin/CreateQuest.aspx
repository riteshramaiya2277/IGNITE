<%@ Page Title="Create New Quest — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="CreateQuest.aspx.cs" Inherits="IGNITE.Admin.CreateQuest" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/admin-create-quest.css" rel="stylesheet" type="text/css" />
    <style>
        .admin-topbar-header {
            display: none !important;
        }

        .admin-page-canvas {
            padding-top: 24px !important;
        }

        /* Fail-safe styling matching design specification */
        .create-quest-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 8px 32px 48px 32px;
            background-color: #F5F2EB;
            min-height: calc(100vh - 70px);
            box-sizing: border-box;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        .page-header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            margin-bottom: 4px;
        }

        .header-title-wrap {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-icon-box {
            width: 32px;
            height: 32px;
            background: #F8D7DA;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #D96A77;
        }

        .header-page-title {
            font-size: 20px;
            font-weight: 800;
            color: #1a1a1a;
            margin: 0;
            letter-spacing: -0.2px;
        }

        .header-search-wrap {
            display: flex;
            align-items: center;
            background: #FFFFFF;
            border: 1px solid #E5E0D8;
            border-radius: 8px;
            padding: 7px 14px;
            width: 240px;
            gap: 8px;
        }

        .header-search-wrap svg {
            width: 14px;
            height: 14px;
            color: #8C827A;
            flex-shrink: 0;
        }

        .header-search-input {
            border: none;
            outline: none;
            background: transparent;
            font-size: 13px;
            color: #1a1a1a;
            font-family: inherit;
            width: 100%;
        }

        .header-search-input::placeholder {
            color: #A8A29E;
        }

        .quest-form-grid {
            display: grid;
            grid-template-columns: 1.35fr 1fr;
            gap: 24px;
            align-items: start;
        }

        .quest-col-left, .quest-col-right {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .quest-card {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 24px 28px;
            box-sizing: border-box;
        }

        .quest-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .quest-card-title {
            font-size: 15px;
            font-weight: 800;
            color: #1C1917;
            margin: 0;
        }

        .req-fields-tag {
            font-size: 10px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .form-group-item {
            display: flex;
            flex-direction: column;
            margin-bottom: 16px;
        }

        .form-group-item:last-child {
            margin-bottom: 0;
        }

        .form-field-label {
            font-size: 12px;
            font-weight: 700;
            color: #292524;
            margin-bottom: 6px;
        }

        .star-required {
            color: #D96A77;
        }

        .field-input-box {
            width: 100%;
            padding: 11px 14px;
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

        .field-input-box:focus {
            background: #FFFFFF;
            border-color: #D96A77;
            box-shadow: 0 0 0 3px rgba(217, 106, 119, 0.15);
        }

        .field-input-box::placeholder {
            color: #A8A29E;
        }

        .validation-hint-error {
            display: flex;
            align-items: center;
            gap: 6px;
            color: #D96A77;
            font-size: 11px;
            font-weight: 600;
            margin-top: 6px;
        }

        .validation-hint-error svg {
            width: 12px;
            height: 12px;
            fill: #D96A77;
            flex-shrink: 0;
        }

        .field-textarea-box {
            width: 100%;
            height: 110px;
            padding: 12px 14px;
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

        .field-textarea-box:focus {
            background: #FFFFFF;
            border-color: #D96A77;
            box-shadow: 0 0 0 3px rgba(217, 106, 119, 0.15);
        }

        .field-textarea-box::placeholder {
            color: #A8A29E;
        }

        .two-cols-row {
            display: grid;
            grid-template-columns: 1.2fr 0.8fr;
            gap: 16px;
            align-items: start;
        }

        .timing-cols-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
            align-items: start;
        }

        /* Pill Segmented Controls */
        .frequency-pills-bar {
            display: flex;
            background: #E5E0D8;
            border-radius: 8px;
            padding: 3px;
            gap: 2px;
        }

        .freq-pill-item {
            flex: 1;
            text-align: center;
            padding: 8px 10px;
            font-size: 12px;
            font-weight: 700;
            color: #78716C;
            border-radius: 6px;
            cursor: pointer;
            border: none;
            background: transparent;
            font-family: inherit;
            transition: all 0.15s ease;
        }

        .freq-pill-item.active {
            background: #FFFFFF;
            color: #1C1917;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
        }

        .xp-input-wrap {
            position: relative;
            display: flex;
            align-items: center;
        }

        .xp-input-wrap input {
            padding-right: 42px;
            font-weight: 700;
        }

        .xp-suffix-badge {
            position: absolute;
            right: 12px;
            font-size: 11px;
            font-weight: 800;
            color: #D97706;
            pointer-events: none;
        }

        /* Visibility Box */
        .visibility-panel {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #F5F2EB;
            border-radius: 12px;
            padding: 12px 16px;
            margin-bottom: 18px;
        }

        .visibility-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .visibility-icon-round {
            width: 32px;
            height: 32px;
            background: #FBEAEB;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #D96A77;
        }

        .visibility-text-group {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .visibility-label-title {
            font-size: 13px;
            font-weight: 700;
            color: #1C1917;
        }

        .visibility-sub-text {
            font-size: 11px;
            color: #78716C;
            font-weight: 500;
        }

        /* Toggle switch */
        .switch-toggle-input {
            appearance: none;
            -webkit-appearance: none;
            width: 42px;
            height: 24px;
            background-color: #D1CDC7;
            border-radius: 12px;
            position: relative;
            cursor: pointer;
            outline: none;
            transition: background-color 0.2s ease;
        }

        .switch-toggle-input::after {
            content: '';
            position: absolute;
            top: 2px;
            left: 2px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background-color: #FFFFFF;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s ease;
        }

        .switch-toggle-input:checked {
            background-color: #D96A77;
        }

        .switch-toggle-input:checked::after {
            transform: translateX(18px);
        }

        /* Action Buttons Row */
        .publish-actions-row {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 16px;
            margin-top: 20px;
            margin-bottom: 12px;
        }

        .btn-draft-action {
            background: none;
            border: none;
            font-size: 13px;
            font-weight: 700;
            color: #292524;
            cursor: pointer;
            padding: 8px 12px;
            font-family: inherit;
            border-radius: 6px;
            transition: background 0.15s ease;
        }

        .btn-draft-action:hover {
            background: rgba(0, 0, 0, 0.04);
        }

        .btn-publish-action {
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
            transition: background 0.15s ease, transform 0.1s ease;
        }

        .btn-publish-action:hover {
            background: #C45A66;
            transform: translateY(-1px);
        }

        .cancel-link-wrap {
            display: block;
            text-align: center;
            font-size: 12px;
            font-weight: 600;
            color: #78716C;
            text-decoration: none;
            cursor: pointer;
            transition: color 0.15s ease;
        }

        .cancel-link-wrap:hover {
            color: #1C1917;
            text-decoration: underline;
        }

        /* Student Mobile Preview Card */
        .mobile-preview-box {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 22px 24px;
            box-sizing: border-box;
        }

        .mobile-preview-title {
            font-size: 10px;
            font-weight: 800;
            color: #78716C;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            display: flex;
            align-items: center;
            gap: 6px;
            margin-bottom: 14px;
        }

        .mobile-preview-title svg {
            width: 14px;
            height: 14px;
            color: #78716C;
        }

        .mobile-phone-card {
            background: #FFFFFF;
            border-radius: 14px;
            padding: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
        }

        .mobile-banner-img-container {
            width: 100%;
            height: 130px;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
            background: #333333;
        }

        .mobile-banner-img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .mobile-banner-text-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 10px 12px;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.8) 0%, rgba(0, 0, 0, 0) 100%);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .mobile-tag-daily {
            background: #D97706;
            color: #FFFFFF;
            font-size: 9px;
            font-weight: 800;
            padding: 2px 6px;
            border-radius: 4px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .mobile-title-overlay {
            color: #FFFFFF;
            font-size: 13px;
            font-weight: 800;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.7);
        }

        .mobile-card-description {
            font-size: 11px;
            color: #57534E;
            line-height: 1.45;
            margin: 10px 4px 12px 4px;
        }

        .mobile-card-bottom-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 4px;
        }

        .mobile-xp-indicator {
            font-size: 12px;
            font-weight: 800;
            color: #D97706;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .mobile-xp-indicator svg {
            width: 12px;
            height: 12px;
            fill: #D97706;
        }

        .mobile-progress-indicator {
            font-size: 11px;
            font-weight: 700;
            color: #D96A77;
        }

        .fullscreen-preview-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            color: #D96A77;
            font-size: 12px;
            font-weight: 700;
            margin-top: 14px;
            cursor: pointer;
            text-decoration: none;
        }

        .fullscreen-preview-btn:hover {
            text-decoration: underline;
        }

        .fullscreen-preview-btn svg {
            width: 14px;
            height: 14px;
            color: #D96A77;
        }

        @media (max-width: 1024px) {
            .quest-form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <div class="create-quest-container">

        <!-- Top Header Row -->
        <div class="page-header-row">
            <div class="header-title-wrap">
                <div class="header-icon-box">
                    <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:18px;height:18px;">
                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                        <polyline points="14 2 14 8 20 8"></polyline>
                        <line x1="9" y1="13" x2="15" y2="13"></line>
                        <line x1="9" y1="17" x2="15" y2="17"></line>
                    </svg>
                </div>
                <h1 class="header-page-title"><asp:Literal ID="litPageTitle" runat="server" Text="Create New Quest" /></h1>
            </div>

            <!-- Search Field -->
            <div class="header-search-wrap">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
                <input type="text" class="header-search-input" placeholder="Search quests..." />
            </div>
        </div>

        <!-- Two Column Main Grid -->
        <div class="quest-form-grid">

            <!-- Left Column: General Information & Timing -->
            <div class="quest-col-left">

                <!-- Card 1: General Information -->
                <div class="quest-card">
                    <div class="quest-card-header">
                        <h2 class="quest-card-title">General Information</h2>
                        <span class="req-fields-tag">REQUIRED FIELDS *</span>
                    </div>

                    <!-- Quest Name -->
                    <div class="form-group-item">
                        <label class="form-field-label">Quest Name <span class="star-required">*</span></label>
                        <asp:TextBox ID="txtQuestName" runat="server" CssClass="field-input-box" placeholder="e.g., Master of Ancient History" Text="e.g., Master of Ancient History" />
                        <div class="validation-hint-error">
                            <svg viewBox="0 0 24 24">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="8" x2="12" y2="12" stroke="#FFF" stroke-width="2"></line>
                                <line x1="12" y1="16" x2="12.01" y2="16" stroke="#FFF" stroke-width="2"></line>
                            </svg>
                            <span>Quest name is required</span>
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="form-group-item">
                        <label class="form-field-label">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="field-textarea-box" placeholder="Briefly describe the objective and lore of this quest..." />
                    </div>

                    <!-- Requirement Type & Target Amount -->
                    <div class="two-cols-row">
                        <div class="form-group-item">
                            <label class="form-field-label">Requirement Type</label>
                            <asp:TextBox ID="txtReqType" runat="server" CssClass="field-input-box" Text="Complete Challenges" />
                        </div>
                        <div class="form-group-item">
                            <label class="form-field-label">Target Amount</label>
                            <asp:TextBox ID="txtTargetAmount" runat="server" CssClass="field-input-box" Text="5" />
                        </div>
                    </div>
                </div>

                <!-- Card 2: Timing & Rewards -->
                <div class="quest-card">
                    <div class="quest-card-header">
                        <h2 class="quest-card-title">Timing & Rewards</h2>
                    </div>

                    <div class="timing-cols-row">
                        <!-- Frequency Tabs -->
                        <div class="form-group-item">
                            <label class="form-field-label">Quest Frequency</label>
                            <div class="frequency-pills-bar">
                                <button type="button" class="freq-pill-item active" onclick="setFrequency(this, 'Daily')">Daily</button>
                                <button type="button" class="freq-pill-item" onclick="setFrequency(this, 'Weekly')">Weekly</button>
                                <button type="button" class="freq-pill-item" onclick="setFrequency(this, 'Special')">Special</button>
                            </div>
                            <asp:HiddenField ID="hfFrequency" runat="server" Value="Daily" />
                        </div>

                        <!-- XP Reward -->
                        <div class="form-group-item">
                            <label class="form-field-label">XP Reward</label>
                            <div class="xp-input-wrap">
                                <asp:TextBox ID="txtXpReward" runat="server" CssClass="field-input-box" Text="250" />
                                <span class="xp-suffix-badge">XP</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Right Column: Publishing & Student Mobile Preview -->
            <div class="quest-col-right">

                <!-- Card 3: Publishing -->
                <div class="quest-card">
                    <div class="quest-card-header">
                        <h2 class="quest-card-title">Publishing</h2>
                    </div>

                    <!-- Visibility Toggle Panel -->
                    <div class="visibility-panel">
                        <div class="visibility-left">
                            <div class="visibility-icon-round">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;">
                                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                    <circle cx="12" cy="12" r="3"></circle>
                                </svg>
                            </div>
                            <div class="visibility-text-group">
                                <span class="visibility-label-title">Visibility</span>
                                <span class="visibility-sub-text">Public to all students</span>
                            </div>
                        </div>
                        <input type="checkbox" id="chkVisibility" runat="server" class="switch-toggle-input" checked="checked" />
                    </div>

                    <!-- Category -->
                    <div class="form-group-item">
                        <label class="form-field-label">Category</label>
                        <asp:TextBox ID="txtCategory" runat="server" CssClass="field-input-box" Text="History & Arts" />
                    </div>

                    <!-- Action Buttons -->
                    <div class="publish-actions-row">
                        <asp:Button ID="btnSaveDraft" runat="server" CssClass="btn-draft-action" Text="Save Draft" OnClick="btnDraft_Click" CausesValidation="false" />
                        <asp:Button ID="btnPublishQuest" runat="server" CssClass="btn-publish-action" Text="Publish Quest" OnClick="btnPublish_Click" />
                    </div>

                    <!-- Cancel Link -->
                    <a href="Quests.aspx" class="cancel-link-wrap">Cancel Changes</a>
                </div>

                <!-- Card 4: Student Mobile Preview -->
                <div class="mobile-preview-box">
                    <div class="mobile-preview-title">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="5" y="2" width="14" height="20" rx="2" ry="2"></rect>
                            <line x1="12" y1="18" x2="12.01" y2="18"></line>
                        </svg>
                        STUDENT MOBILE PREVIEW
                    </div>

                    <div class="mobile-phone-card">
                        <!-- Banner Image -->
                        <div class="mobile-banner-img-container">
                            <img src="<%= ResolveUrl("~/assets/ancient_temple_banner.jpg") %>" alt="Ancient Temple" onerror="this.src='https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=500&auto=format&fit=crop&q=80';" />
                            <div class="mobile-banner-text-overlay">
                                <span class="mobile-tag-daily">DAILY</span>
                                <span class="mobile-title-overlay">Ancient Explorer</span>
                            </div>
                        </div>

                        <!-- Description text -->
                        <p class="mobile-card-description">
                            Master the secrets of the ancient library by completing 5 history challenges today.
                        </p>

                        <!-- Footer -->
                        <div class="mobile-card-bottom-row">
                            <div class="mobile-xp-indicator">
                                <svg viewBox="0 0 24 24">
                                    <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                </svg>
                                <span>250 XP</span>
                            </div>
                            <span class="mobile-progress-indicator">0/5 Progress</span>
                        </div>
                    </div>

                    <a href="javascript:void(0);" class="fullscreen-preview-btn">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="15 3 21 3 21 9"></polyline>
                            <polyline points="9 21 3 21 3 15"></polyline>
                            <line x1="21" y1="3" x2="14" y2="10"></line>
                            <line x1="3" y1="21" x2="10" y2="14"></line>
                        </svg>
                        Full Screen Preview
                    </a>
                </div>

            </div>

        </div>

    </div>

    <script type="text/javascript">
        function setFrequency(btn, val) {
            document.querySelectorAll('.freq-pill-item').forEach(function (el) {
                el.classList.remove('active');
            });
            btn.classList.add('active');
            var hf = document.getElementById('<%= hfFrequency.ClientID %>');
            if (hf) hf.value = val;
        }
    </script>
</asp:Content>
