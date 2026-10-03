<%@ Page Title="Edit Challenge — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="EditChallenge.aspx.cs" Inherits="IGNITE.Admin.EditChallenge" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/admin-create-challenge.css" rel="stylesheet" type="text/css" />
    <style>
        /* Embedded fail-safe styles to guarantee exact rendering in any environment */
        .create-challenge-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 16px 32px 48px 32px;
            background-color: #F5F2EB;
            min-height: calc(100vh - 70px);
            box-sizing: border-box;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        .action-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 4px 0 8px 0;
        }

        .btn-discard {
            font-size: 13px;
            font-weight: 600;
            color: #666;
            text-decoration: none;
            cursor: pointer;
            transition: color 0.15s ease;
        }
        .btn-discard:hover {
            color: #1a1a1a;
            text-decoration: underline;
        }

        .toolbar-right-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .btn-draft {
            background: transparent;
            border: none;
            color: #333;
            font-size: 13px;
            font-weight: 700;
            padding: 9px 18px;
            border-radius: 8px;
            cursor: pointer;
            font-family: inherit;
        }
        .btn-draft:hover {
            background: rgba(0, 0, 0, 0.05);
            color: #000;
        }

        .btn-preview-tb {
            background: #FFF;
            border: 1px solid #E0DCD3;
            color: #333;
            font-size: 13px;
            font-weight: 700;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-family: inherit;
        }
        .btn-preview-tb:hover {
            border-color: #C8C3B8;
            background: #FAF8F5;
        }

        .btn-publish {
            background: #D96A77;
            border: none;
            color: #FFF;
            font-size: 13px;
            font-weight: 700;
            padding: 9px 20px;
            border-radius: 8px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 2px 6px rgba(217, 106, 119, 0.25);
            font-family: inherit;
            text-decoration: none;
        }
        .btn-publish:hover {
            background: #C45A66;
        }

        .create-grid {
            display: grid;
            grid-template-columns: 1.4fr 1fr;
            gap: 24px;
            align-items: start;
        }

        .create-col-left, .create-col-right {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .form-card {
            background: #EAE6DF;
            border-radius: 16px;
            padding: 24px 28px;
            box-sizing: border-box;
        }

        .card-section-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .section-accent-pill {
            width: 4px;
            height: 18px;
            background: #D96A77;
            border-radius: 2px;
            flex-shrink: 0;
        }

        .card-section-title {
            font-size: 16px;
            font-weight: 800;
            color: #1a1a1a;
            margin: 0;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 18px;
        }
        .form-group:last-child {
            margin-bottom: 0;
        }

        .form-label {
            font-size: 12px;
            font-weight: 700;
            color: #222;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
        }

        .required-star {
            color: #D96A77;
            margin-left: 3px;
            font-weight: 800;
        }

        .form-control-input {
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
        }
        .form-control-input:focus {
            background: #FFF;
            border-color: #D96A77;
            box-shadow: 0 0 0 3px rgba(217, 106, 119, 0.12);
        }

        .form-control-textarea {
            width: 100%;
            padding: 12px 14px;
            background: #F5F2EB;
            border: 1px solid transparent;
            border-radius: 8px;
            font-size: 13px;
            color: #1a1a1a;
            font-family: inherit;
            outline: none;
            box-sizing: border-box;
            min-height: 90px;
            resize: vertical;
        }
        .form-control-textarea:focus {
            background: #FFF;
            border-color: #D96A77;
            box-shadow: 0 0 0 3px rgba(217, 106, 119, 0.12);
        }

        .form-error-msg {
            font-size: 11px;
            color: #D96A77;
            margin-top: 5px;
            font-weight: 600;
        }

        .form-row-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 18px;
        }
        .form-row-2:last-child {
            margin-bottom: 0;
        }

        .segmented-control {
            display: flex;
            gap: 8px;
        }

        .segment-btn {
            flex: 1;
            text-align: center;
            background: #F5F2EB;
            border: 1.5px solid transparent;
            border-radius: 8px;
            padding: 9px 8px;
            font-size: 12px;
            font-weight: 600;
            color: #555;
            cursor: pointer;
            user-select: none;
        }
        .segment-btn.active {
            background: #FDF2F3;
            border-color: #D96A77;
            color: #D96A77;
            font-weight: 700;
        }

        .date-input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }
        .date-input-wrapper input {
            padding-right: 36px;
        }
        .date-input-icon {
            position: absolute;
            right: 12px;
            pointer-events: none;
            color: #444;
            width: 16px;
            height: 16px;
        }

        .requirement-types-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 12px;
            margin-bottom: 20px;
        }

        .req-type-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 16px 10px;
            background: #F5F2EB;
            border: 1.5px solid transparent;
            border-radius: 8px;
            cursor: pointer;
            user-select: none;
        }
        .req-type-card.active {
            background: #FDF2F3;
            border-color: #D96A77;
        }
        .req-type-icon {
            width: 20px;
            height: 20px;
            color: #666;
            flex-shrink: 0;
        }
        .req-type-card.active .req-type-icon {
            color: #D96A77;
        }
        .req-type-label {
            font-size: 12px;
            font-weight: 600;
            color: #444;
            text-align: center;
        }
        .req-type-card.active .req-type-label {
            color: #D96A77;
            font-weight: 700;
        }

        .input-with-suffix {
            display: flex;
            align-items: center;
            background: #F5F2EB;
            border-radius: 8px;
            padding: 0 14px;
            border: 1px solid transparent;
        }
        .input-with-suffix:focus-within {
            background: #FFF;
            border-color: #D96A77;
            box-shadow: 0 0 0 3px rgba(217, 106, 119, 0.12);
        }
        .input-with-suffix input {
            flex: 1;
            border: none;
            background: transparent;
            padding: 11px 0;
            font-size: 13px;
            color: #1a1a1a;
            font-family: inherit;
            outline: none;
            width: 50px;
        }
        .input-suffix-text {
            font-size: 11px;
            font-weight: 700;
            color: #888;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        /* Student Preview Card */
        .student-preview-card {
            background: #FFF;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.04);
        }

        .student-preview-header {
            background: #E5989B;
            height: 38px;
            padding: 0 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .student-preview-tag {
            font-size: 10px;
            font-weight: 800;
            color: #FFF;
            letter-spacing: 0.8px;
            text-transform: uppercase;
        }
        .student-preview-indicator {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: #FFF;
        }

        .student-preview-cover {
            background: #F7D6D8;
            height: 140px;
            width: 100%;
        }

        .student-preview-body {
            padding: 16px 20px 20px 20px;
        }

        .preview-tags-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .category-tag {
            background: #F0ECE1;
            color: #555;
            font-size: 10px;
            font-weight: 800;
            padding: 3px 8px;
            border-radius: 4px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .xp-badge-live {
            background: #FEF9E7;
            color: #D97706;
            font-size: 11px;
            font-weight: 800;
            padding: 3px 8px;
            border-radius: 12px;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .preview-challenge-title {
            font-size: 16px;
            font-weight: 800;
            color: #1a1a1a;
            margin: 0 0 12px 0;
            line-height: 1.3;
        }

        .preview-meta-row {
            display: flex;
            align-items: center;
            gap: 16px;
            font-size: 12px;
            color: #666;
            font-weight: 600;
        }
        .preview-meta-item {
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        /* SVG Safeguard so no SVG can ever blow up */
        svg {
            max-width: 100%;
            height: auto;
        }
        .btn-preview-tb svg { width: 16px !important; height: 16px !important; }
        .xp-badge-live svg { width: 12px !important; height: 12px !important; fill: currentColor; }
        .preview-meta-item svg { width: 14px !important; height: 14px !important; color: #888; }

        @media (max-width: 1080px) {
            .create-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="TopbarContent" ContentPlaceHolderID="TopbarContent" runat="server">
    <div style="display:flex; justify-content:space-between; align-items:center; width:100%;">
        <h1 style="font-size: 20px; font-weight: 800; color: #1a1a1a; margin: 0; letter-spacing: -0.2px;">Create New Challenge</h1>
        
        <div style="display:flex; align-items:center; background:#FFF; border-radius:8px; padding:8px 14px; width:260px; border:1px solid #E0DCD3;">
            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#888" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px; height:16px; flex-shrink:0;">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
            <input type="text" placeholder="Search assets..." style="border:none; outline:none; font-size:13px; margin-left:10px; width:100%; background:transparent; font-family:inherit; color:#1a1a1a;" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="create-challenge-container">
        
        <!-- Action Toolbar -->
        <div class="action-toolbar">
            <a href="Challenges.aspx" class="btn-discard" id="btnDiscard">
                Discard Changes
            </a>
            
            <div class="toolbar-right-actions">
                <asp:Button ID="btnSaveDraft" runat="server" Text="Save Draft" CssClass="btn-draft" OnClick="btnDraft_Click" CausesValidation="false" />
                <button type="button" class="btn-preview-tb" id="btnPreviewToggle">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                    Preview
                </button>
                <asp:Button ID="btnPublish" runat="server" Text="Publish Challenge" CssClass="btn-publish" OnClick="btnPublish_Click" />
            </div>
        </div>

        <!-- Main Form Grid -->
        <div class="create-grid">
            
            <!-- Left Column: Basic Information & Schedule -->
            <div class="create-col-left">
                
                <!-- Card 1: Basic Information -->
                <div class="form-card">
                    <div class="card-section-header">
                        <div class="section-accent-pill"></div>
                        <h2 class="card-section-title">Basic Information</h2>
                    </div>

                    <!-- Challenge Title -->
                    <div class="form-group">
                        <label class="form-label">
                            Challenge Title <span class="required-star">*</span>
                        </label>
                        <input type="text" id="txtTitle" class="form-control-input" placeholder="e.g. Master of Deep Work" value="Master of Deep Work" />
                        <div class="form-error-msg" id="msgTitleError" style="display:none;">Challenge title is required.</div>
                    </div>

                    <!-- Description -->
                    <div class="form-group">
                        <label class="form-label">Description</label>
                        <textarea id="txtDescription" class="form-control-textarea" placeholder="Describe the journey..."></textarea>
                    </div>

                    <!-- Category & Difficulty Row -->
                    <div class="form-row-2">
                        <div class="form-group">
                            <label class="form-label">Category</label>
                            <input type="text" id="txtCategory" class="form-control-input" value="Productivity" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Difficulty</label>
                            <div class="segmented-control" id="difficultyControl">
                                <div class="segment-btn" data-diff="Easy">Easy</div>
                                <div class="segment-btn active" data-diff="Medium">Medium</div>
                                <div class="segment-btn" data-diff="Hard">Hard</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Card 2: Schedule & Rewards -->
                <div class="form-card">
                    <div class="card-section-header">
                        <div class="section-accent-pill"></div>
                        <h2 class="card-section-title">Schedule & Rewards</h2>
                    </div>

                    <!-- Dates Row -->
                    <div class="form-row-2">
                        <div class="form-group">
                            <label class="form-label">Start Date</label>
                            <div class="date-input-wrapper">
                                <input type="text" id="txtStartDate" class="form-control-input" value="06/01/2024" />
                                <svg class="date-input-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">End Date</label>
                            <div class="date-input-wrapper">
                                <input type="text" id="txtEndDate" class="form-control-input" value="06/30/2024" />
                                <svg class="date-input-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                            </div>
                        </div>
                    </div>

                    <!-- Rewards Row -->
                    <div class="form-row-2">
                        <div class="form-group">
                            <label class="form-label">XP Reward</label>
                            <input type="text" id="txtXpReward" class="form-control-input" value="500" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Badge Reward</label>
                            <input type="text" id="txtBadgeReward" class="form-control-input" value="Focus Master Silver" />
                        </div>
                    </div>
                </div>

            </div>

            <!-- Right Column: Requirements & Student Preview -->
            <div class="create-col-right">
                
                <!-- Card 1: Requirements -->
                <div class="form-card">
                    <div class="card-section-header">
                        <div class="section-accent-pill"></div>
                        <h2 class="card-section-title">Requirements</h2>
                    </div>

                    <label class="form-label" style="margin-bottom:10px;">Requirement Type</label>
                    <div class="requirement-types-grid" id="reqTypesGrid">
                        <!-- Habit-based -->
                        <div class="req-type-card active" data-type="habit">
                            <svg class="req-type-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:20px;height:20px;">
                                <path d="M19 4H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"></path>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                                <path d="M9 16l2 2 4-4"></path>
                            </svg>
                            <span class="req-type-label">Habit-based</span>
                        </div>

                        <!-- Count-based -->
                        <div class="req-type-card" data-type="count">
                            <svg class="req-type-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:20px;height:20px;">
                                <rect x="4" y="2" width="16" height="20" rx="2"></rect>
                                <line x1="8" y1="6" x2="16" y2="6"></line>
                                <line x1="16" y1="14" x2="16" y2="18"></line>
                                <path d="M8 10h.01"></path>
                                <path d="M12 10h.01"></path>
                                <path d="M16 10h.01"></path>
                                <path d="M8 14h.01"></path>
                                <path d="M12 14h.01"></path>
                                <path d="M8 18h.01"></path>
                                <path d="M12 18h.01"></path>
                            </svg>
                            <span class="req-type-label">Count-based</span>
                        </div>

                        <!-- Target-based -->
                        <div class="req-type-card" data-type="target">
                            <svg class="req-type-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:20px;height:20px;">
                                <circle cx="12" cy="12" r="10"></circle>
                                <circle cx="12" cy="12" r="6"></circle>
                                <circle cx="12" cy="12" r="2"></circle>
                            </svg>
                            <span class="req-type-label">Target-based</span>
                        </div>
                    </div>

                    <!-- Daily Goal & Success Threshold -->
                    <div class="form-row-2">
                        <div class="form-group">
                            <label class="form-label">Daily Goal</label>
                            <div class="input-with-suffix">
                                <input type="text" id="txtDailyGoal" value="4" />
                                <span class="input-suffix-text" id="lblGoalUnit">HOURS</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Success Threshold</label>
                            <div class="input-with-suffix">
                                <input type="text" id="txtThreshold" value="5" />
                                <span class="input-suffix-text" id="lblThresholdUnit">DAYS / WK</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Card 2: Student Preview -->
                <div class="student-preview-card">
                    <div class="student-preview-header">
                        <span class="student-preview-tag">STUDENT PREVIEW</span>
                        <div class="student-preview-indicator"></div>
                    </div>

                    <div class="student-preview-cover"></div>

                    <div class="student-preview-body">
                        <div class="preview-tags-row">
                            <span class="category-tag" id="pvCategory">PRODUCTIVITY</span>
                            <div class="xp-badge-live">
                                <svg viewBox="0 0 24 24" width="12" height="12"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                                <span id="pvXp">500 XP</span>
                            </div>
                        </div>

                        <div class="preview-challenge-title" id="pvTitle">Master of Deep Work</div>

                        <div class="preview-meta-row">
                            <div class="preview-meta-item">
                                <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2l7 4v6c0 5-3.5 9-7 10-3.5-1-7-5-7-10V6l7-4z"></path></svg>
                                <span id="pvDifficulty">Medium</span>
                            </div>
                            <div class="preview-meta-item">
                                <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                                <span id="pvDays">30 Days</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Live Preview Interactive Sync Script -->
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var txtTitle = document.getElementById('txtTitle');
            var txtCategory = document.getElementById('txtCategory');
            var txtXpReward = document.getElementById('txtXpReward');
            var pvTitle = document.getElementById('pvTitle');
            var pvCategory = document.getElementById('pvCategory');
            var pvXp = document.getElementById('pvXp');
            var pvDifficulty = document.getElementById('pvDifficulty');
            var msgTitleError = document.getElementById('msgTitleError');

            // Sync Title
            if (txtTitle && pvTitle) {
                txtTitle.addEventListener('input', function () {
                    var val = txtTitle.value.trim();
                    pvTitle.textContent = val || 'Untitled Challenge';
                    if (!val) {
                        if (msgTitleError) msgTitleError.style.display = 'block';
                    } else {
                        if (msgTitleError) msgTitleError.style.display = 'none';
                    }
                });
            }

            // Sync Category
            if (txtCategory && pvCategory) {
                txtCategory.addEventListener('input', function () {
                    pvCategory.textContent = (txtCategory.value.trim() || 'PRODUCTIVITY').toUpperCase();
                });
            }

            // Sync XP
            if (txtXpReward && pvXp) {
                txtXpReward.addEventListener('input', function () {
                    var xp = txtXpReward.value.trim();
                    pvXp.textContent = xp ? xp + ' XP' : '0 XP';
                });
            }

            // Segmented Difficulty Control
            var diffButtons = document.querySelectorAll('#difficultyControl .segment-btn');
            diffButtons.forEach(function (btn) {
                btn.addEventListener('click', function () {
                    diffButtons.forEach(function (b) { b.classList.remove('active'); });
                    btn.classList.add('active');
                    var diff = btn.getAttribute('data-diff');
                    if (pvDifficulty) {
                        pvDifficulty.textContent = diff;
                    }
                });
            });

            // Requirement Types Toggle
            var reqCards = document.querySelectorAll('#reqTypesGrid .req-type-card');
            var lblGoalUnit = document.getElementById('lblGoalUnit');
            var lblThresholdUnit = document.getElementById('lblThresholdUnit');

            reqCards.forEach(function (card) {
                card.addEventListener('click', function () {
                    reqCards.forEach(function (c) { c.classList.remove('active'); });
                    card.classList.add('active');
                    var type = card.getAttribute('data-type');
                    if (type === 'habit') {
                        if (lblGoalUnit) lblGoalUnit.textContent = 'HOURS';
                        if (lblThresholdUnit) lblThresholdUnit.textContent = 'DAYS / WK';
                    } else if (type === 'count') {
                        if (lblGoalUnit) lblGoalUnit.textContent = 'TIMES';
                        if (lblThresholdUnit) lblThresholdUnit.textContent = 'PER WEEK';
                    } else if (type === 'target') {
                        if (lblGoalUnit) lblGoalUnit.textContent = 'POINTS';
                        if (lblThresholdUnit) lblThresholdUnit.textContent = 'GOAL TOTAL';
                    }
                });
            });
        });
    </script>
</asp:Content>