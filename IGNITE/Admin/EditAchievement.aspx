<%@ Page Title="Edit Achievement — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="EditAchievement.aspx.cs" Inherits="IGNITE.Admin.EditAchievement" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-topbar-header {
            display: none !important;
        }

        .admin-page-canvas {
            padding-top: 24px !important;
        }

        .edit-achievement-container {
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

        .xp-level-widget {
            display: flex;
            flex-direction: column;
            gap: 4px;
            width: 180px;
        }

        .xp-level-labels {
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

        /* Subheader with Page Title, Error Warning & Actions */
        .subheader-action-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .subheader-title-warning {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-main-heading {
            font-size: 22px;
            font-weight: 800;
            color: #1a1a1a;
            margin: 0;
        }

        .error-warning-banner {
            display: flex;
            align-items: center;
            gap: 6px;
            color: #D96A77;
            font-size: 12px;
            font-weight: 700;
        }

        .error-warning-banner svg {
            width: 14px;
            height: 14px;
            fill: #D96A77;
            flex-shrink: 0;
        }

        .top-action-buttons {
            display: flex;
            align-items: center;
            gap: 12px;
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

        /* 2-Column Split: Form (Left) vs Student Preview (Right) */
        .edit-form-split-grid {
            display: grid;
            grid-template-columns: 1.35fr 1fr;
            gap: 24px;
            align-items: start;
        }

        .form-col-left, .form-col-right {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-panel-card {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 22px 26px;
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
            gap: 4px;
        }

        .label-with-validation-tag {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .form-item-label {
            font-size: 11px;
            font-weight: 700;
            color: #44403C;
        }

        .validation-tag-pill {
            font-size: 9px;
            font-weight: 800;
            color: #D96A77;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .form-text-input {
            width: 100%;
            padding: 10px 14px;
            background: #F5F2EB;
            border: 1.5px solid transparent;
            border-radius: 8px;
            font-size: 13px;
            color: #1a1a1a;
            font-family: inherit;
            outline: none;
            box-sizing: border-box;
            transition: all 0.2s ease;
        }

        .form-text-input.has-error {
            border-color: #D96A77;
            background: #FFF;
        }

        .field-error-hint {
            font-size: 11px;
            color: #D96A77;
            font-weight: 600;
            margin-top: 2px;
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

        /* Achievement Visibility Selection Cards */
        .visibility-options-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .vis-option-card {
            background: #F5F2EB;
            border: 1.5px solid transparent;
            border-radius: 12px;
            padding: 16px;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            gap: 8px;
            position: relative;
            transition: all 0.15s ease;
        }

        .vis-option-card.selected-danger {
            border-color: #D96A77;
            background: #FFFFFF;
        }

        .vis-header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .vis-title {
            font-size: 13px;
            font-weight: 800;
            color: #1C1917;
        }

        .vis-title.danger-text {
            color: #D96A77;
        }

        .vis-radio-indicator {
            width: 16px;
            height: 16px;
            border-radius: 50%;
            border: 1.5px solid #D1CDC7;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .vis-radio-indicator.selected {
            border-color: #D96A77;
        }

        .vis-radio-indicator svg {
            width: 10px;
            height: 10px;
            color: #D96A77;
        }

        .vis-description {
            font-size: 11px;
            color: #78716C;
            line-height: 1.4;
            margin: 0;
        }

        /* Student View Preview (Hidden State) */
        .preview-header-tag-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .preview-section-title {
            font-size: 10px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }

        .badge-hidden-state {
            background: #1C1917;
            color: #FFFFFF;
            font-size: 9px;
            font-weight: 800;
            padding: 3px 8px;
            border-radius: 4px;
            letter-spacing: 0.6px;
            text-transform: uppercase;
        }

        .mockup-phone-card {
            background: #1E293B;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }

        .mockup-user-bar {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px 16px;
            background: #0F172A;
        }

        .mockup-avatar {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background: #3B82F6;
            color: #FFF;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 10px;
            overflow: hidden;
        }

        .mockup-user-meta {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .mockup-catalog-label {
            font-size: 9px;
            color: #94A3B8;
            font-weight: 600;
        }

        .mockup-user-name {
            font-size: 11px;
            font-weight: 800;
            color: #FFFFFF;
        }

        .mockup-body-area {
            background: #F5F2EB;
            padding: 28px 20px 20px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .large-lock-circle {
            width: 72px;
            height: 72px;
            border-radius: 50%;
            border: 3px solid #F59E0B;
            background: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #D97706;
            margin-bottom: 16px;
            box-shadow: 0 0 16px rgba(245, 158, 11, 0.25);
        }

        .large-lock-circle svg {
            width: 32px;
            height: 32px;
        }

        .mystery-title {
            font-size: 20px;
            font-weight: 800;
            color: #1C1917;
            margin: 0 0 6px 0;
        }

        .mystery-desc {
            font-size: 11px;
            color: #78716C;
            max-width: 260px;
            line-height: 1.45;
            margin: 0 0 18px 0;
        }

        .mystery-specs-row {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 4px;
            font-size: 10px;
            font-weight: 800;
            color: #78716C;
            text-transform: uppercase;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
        }

        .mystery-specs-val {
            color: #D97706;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .mystery-lock-bar {
            width: 100%;
            height: 6px;
            background: #E5E0D8;
            border-radius: 3px;
            margin: 10px 0 6px 0;
        }

        .mystery-lock-label {
            font-size: 9px;
            font-weight: 800;
            color: #78716C;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-bottom: 16px;
        }

        .back-my-achievements-link {
            font-size: 11px;
            font-weight: 700;
            color: #44403C;
            text-decoration: none;
            cursor: pointer;
        }

        .back-my-achievements-link:hover {
            text-decoration: underline;
        }

        /* Pro-Tip Box */
        .pro-tip-box {
            background: #FEF9C3;
            border: 1px solid #FDE047;
            border-radius: 12px;
            padding: 14px 16px;
            font-size: 11px;
            color: #713F12;
            line-height: 1.5;
            display: flex;
            align-items: flex-start;
            gap: 10px;
        }

        .pro-tip-icon {
            font-size: 16px;
            flex-shrink: 0;
        }

        @media (max-width: 1000px) {
            .edit-form-split-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <div class="edit-achievement-container">

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
                <div class="xp-level-widget">
                    <div class="xp-level-labels">
                        <span>LVL 12</span>
                        <span>4,500 / 6,000 XP</span>
                    </div>
                    <div class="xp-progress-track">
                        <div class="xp-progress-fill"></div>
                    </div>
                </div>

                <div class="header-search-wrap">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    <input type="text" class="header-search-input" placeholder="Search..." />
                </div>
            </div>
        </div>

        <!-- Subheader: Page Title, Error Warning & Action Buttons -->
        <div class="subheader-action-row">
            <div class="subheader-title-warning">
                <h2 class="form-main-heading">Edit Achievement</h2>
                <div class="error-warning-banner">
                    <svg viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"></circle>
                        <line x1="12" y1="8" x2="12" y2="12" stroke="#FFF" stroke-width="2"></line>
                        <line x1="12" y1="16" x2="12.01" y2="16" stroke="#FFF" stroke-width="2"></line>
                    </svg>
                    <span>Please correct the highlighted errors before publishing.</span>
                </div>
            </div>

            <div class="top-action-buttons">
                <asp:Button ID="btnSaveDraft" runat="server" CssClass="btn-action-draft" Text="Save Draft" OnClick="btnDraft_Click" CausesValidation="false" />
                <asp:Button ID="btnPublishAchievement" runat="server" CssClass="btn-action-publish" Text="Publish Achievement" OnClick="btnPublish_Click" />
            </div>
        </div>

        <!-- 2-Column Split: Form (Left) & Preview (Right) -->
        <div class="edit-form-split-grid">

            <!-- Left Column: Inputs -->
            <div class="form-col-left">

                <!-- Card 1: Fields with Validation States -->
                <div class="form-panel-card">
                    <!-- Title Input (Highlighted Error) -->
                    <div class="form-item-group">
                        <div class="label-with-validation-tag">
                            <label class="form-item-label">Achievement Title</label>
                            <span class="validation-tag-pill">REQUIRED</span>
                        </div>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-text-input has-error" placeholder="e.g. Master of Consistency" Text="e.g. Master of Consistency" />
                        <span class="field-error-hint">Achievement title is required to identify this milestone.</span>
                    </div>

                    <!-- Description Textarea -->
                    <div class="form-item-group">
                        <label class="form-item-label">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-textarea-input" Text="Unlocked after achieving a perfect record in the monthly sprint." />
                    </div>

                    <!-- XP Reward (Highlighted Error) & Category -->
                    <div class="two-inputs-row">
                        <div class="form-item-group">
                            <div class="label-with-validation-tag">
                                <label class="form-item-label">XP Reward</label>
                                <span class="validation-tag-pill">INVALID</span>
                            </div>
                            <div class="input-with-suffix">
                                <asp:TextBox ID="txtXpReward" runat="server" CssClass="form-text-input has-error" Text="-100" />
                                <span class="input-suffix-tag">XP</span>
                            </div>
                            <span class="field-error-hint">XP Reward must be a positive number.</span>
                        </div>

                        <div class="form-item-group">
                            <label class="form-item-label">Category</label>
                            <asp:TextBox ID="txtCategory" runat="server" CssClass="form-text-input" Text="Academic Growth" />
                        </div>
                    </div>
                </div>

                <!-- Card 2: Achievement Visibility Options -->
                <div class="form-panel-card">
                    <h3 class="card-inner-title">Achievement Visibility</h3>

                    <div class="visibility-options-grid">
                        <!-- Standard Option -->
                        <div class="vis-option-card" onclick="selectVis(1)">
                            <div class="vis-header-row">
                                <span class="vis-title">Standard</span>
                                <div class="vis-radio-indicator" id="visRadio1"></div>
                            </div>
                            <p class="vis-description">Visible to everyone with clear requirements.</p>
                        </div>

                        <!-- Hidden Option (Selected) -->
                        <div class="vis-option-card selected-danger" onclick="selectVis(2)">
                            <div class="vis-header-row">
                                <span class="vis-title danger-text">Hidden</span>
                                <div class="vis-radio-indicator selected" id="visRadio2">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                        <polyline points="20 6 9 17 4 12"></polyline>
                                    </svg>
                                </div>
                            </div>
                            <p class="vis-description">Mystery achievement. Rules remain hidden until unlocked.</p>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Right Column: Student View Preview (Hidden State) & Pro-Tip -->
            <div class="form-col-right">

                <div>
                    <div class="preview-header-tag-row">
                        <span class="preview-section-title">STUDENT VIEW PREVIEW</span>
                        <span class="badge-hidden-state">HIDDEN STATE</span>
                    </div>

                    <!-- Mockup Phone Card -->
                    <div class="mockup-phone-card">
                        <div class="mockup-user-bar">
                            <div class="mockup-avatar">SJ</div>
                            <div class="mockup-user-meta">
                                <span class="mockup-catalog-label">Achievement Catalog</span>
                                <span class="mockup-user-name">Sarah Jenkins</span>
                            </div>
                        </div>

                        <div class="mockup-body-area">
                            <div class="large-lock-circle">
                                <svg viewBox="0 0 24 24" fill="currentColor">
                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                </svg>
                            </div>

                            <h3 class="mystery-title">???</h3>
                            <p class="mystery-desc">
                                Keep participating in community challenges to uncover this mysterious milestone.
                            </p>

                            <div class="mystery-specs-row">
                                <span>CONDITION</span>
                                <span style="color:#1C1917;">???</span>
                            </div>

                            <div class="mystery-specs-row">
                                <span>REWARD</span>
                                <span class="mystery-specs-val">+??? XP 🛈</span>
                            </div>

                            <div class="mystery-lock-bar"></div>
                            <span class="mystery-lock-label">PROGRESS: LOCKED</span>

                            <a href="javascript:void(0);" class="back-my-achievements-link">Back to My Achievements</a>
                        </div>
                    </div>
                </div>

                <!-- Pro-Tip Box -->
                <div class="pro-tip-box">
                    <span class="pro-tip-icon">💡</span>
                    <span>
                        <strong>Pro-Tip:</strong> Hidden achievements create curiosity and drive organic engagement. Use them for "easter eggs" in your curriculum.
                    </span>
                </div>

            </div>

        </div>

    </div>

    <script type="text/javascript">
        function selectVis(idx) {
            var cards = document.querySelectorAll('.vis-option-card');
            cards.forEach(function (card) {
                card.classList.remove('selected-danger');
            });
            var rad1 = document.getElementById('visRadio1');
            var rad2 = document.getElementById('visRadio2');

            if (idx === 1) {
                cards[0].classList.add('selected-danger');
                rad1.className = 'vis-radio-indicator selected';
                rad1.innerHTML = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>';
                rad2.className = 'vis-radio-indicator';
                rad2.innerHTML = '';
            } else {
                cards[1].classList.add('selected-danger');
                rad2.className = 'vis-radio-indicator selected';
                rad2.innerHTML = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>';
                rad1.className = 'vis-radio-indicator';
                rad1.innerHTML = '';
            }
        }
    </script>
</asp:Content>
