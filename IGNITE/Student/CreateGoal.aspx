<%@ Page Title="Create New SMART Goal" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true"
    CodeBehind="CreateGoal.aspx.cs" Inherits="IGNITE.Student.CreateGoal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/dashboard.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%= ResolveUrl("~/Content/goals.css?v=" + DateTime.Now.Ticks) %>" rel="stylesheet" type="text/css" />
    <style>
        .create-goal-canvas {
            padding: 0 10px 40px 10px;
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #18181B;
        }
        .create-goal-header-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 24px;
            gap: 16px;
        }
        .create-goal-title-area {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }
        .create-goal-main-title {
            font-size: 1.9rem;
            font-weight: 800;
            color: #18181B;
            margin: 0;
            letter-spacing: -0.02em;
        }
        .create-goal-subtitle {
            font-size: 0.95rem;
            color: #57534E;
            margin: 0;
        }
        .create-goal-header-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .btn-create-goal-cancel {
            background-color: #FAF8F5;
            border: 1px solid #DDD6CB;
            color: #27272A;
            font-size: 0.9rem;
            font-weight: 700;
            padding: 10px 22px;
            border-radius: 12px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.15s ease;
            display: inline-block;
            text-align: center;
        }
        .btn-create-goal-cancel:hover {
            background-color: #F4EFE6;
        }
        .btn-create-goal-save {
            background-color: #DF6A74;
            color: #FFFFFF;
            border: none;
            font-size: 0.9rem;
            font-weight: 700;
            padding: 10px 24px;
            border-radius: 12px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            box-shadow: 0 3px 10px rgba(223, 106, 116, 0.35);
            transition: all 0.15s ease;
        }
        .btn-create-goal-save:hover {
            background-color: #D45B65;
            transform: translateY(-1px);
        }
        .create-goal-grid {
            display: grid;
            grid-template-columns: 1.15fr 1fr;
            gap: 20px;
            align-items: start;
        }
        .create-goal-left-col {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .create-goal-right-col {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .create-goal-card {
            background-color: #EDE8DE;
            border-radius: 20px;
            padding: 24px 28px;
            display: flex;
            flex-direction: column;
            gap: 16px;
            border: 1px solid rgba(0, 0, 0, 0.04);
        }
        .create-goal-card-header {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .create-smart-badge {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #DF6A74;
            background-color: #FEECEE;
            font-size: 0.8rem;
            font-weight: 900;
        }
        .create-smart-badge.badge-a {
            color: #0D9488;
            background-color: #E6FFFA;
        }
        .create-smart-badge.badge-r {
            color: #EA580C;
            background-color: #FFEDD5;
        }
        .create-smart-badge.badge-t {
            color: #DF6A74;
            background-color: #FEECEE;
        }
        .create-smart-badge.badge-m {
            color: #8B5CF6;
            background-color: #F3E8FF;
        }
        .create-smart-title {
            font-size: 0.95rem;
            font-weight: 800;
            color: #18181B;
        }
        .create-form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
            width: 100%;
        }
        .create-form-label {
            font-size: 0.82rem;
            font-weight: 700;
            color: #44403C;
        }
        .create-form-input,
        .create-form-select,
        .create-form-textarea {
            width: 100%;
            box-sizing: border-box;
            padding: 11px 16px;
            border-radius: 12px;
            border: 1px solid #DDD6CB;
            background-color: #F7F5F0;
            font-family: inherit;
            font-size: 0.9rem;
            color: #18181B;
            outline: none;
            transition: all 0.15s ease;
        }
        .create-form-input:focus,
        .create-form-select:focus,
        .create-form-textarea:focus {
            border-color: #DF6A74;
            background-color: #FFFFFF;
        }
        .create-form-textarea {
            resize: none;
            min-height: 85px;
        }
        .create-form-row-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }
        .create-form-row-3 {
            display: grid;
            grid-template-columns: 1fr 1fr 1.2fr;
            gap: 14px;
        }
        .two-cards-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }
        .milestone-action-row {
            background-color: #F7F5F0;
            border-radius: 14px;
            padding: 14px 18px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
        }
        .milestone-action-left {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }
        .milestone-action-title {
            font-size: 0.88rem;
            font-weight: 700;
            color: #18181B;
            margin: 0;
        }
        .milestone-action-subtitle {
            font-size: 0.76rem;
            color: #78716C;
            margin: 0;
        }
        .btn-outline-action {
            background-color: #FFFFFF;
            border: 1px solid #DDD6CB;
            color: #DF6A74;
            font-size: 0.82rem;
            font-weight: 700;
            padding: 7px 14px;
            border-radius: 9px;
            cursor: pointer;
            white-space: nowrap;
            transition: all 0.15s ease;
        }
        .btn-outline-action:hover {
            background-color: #FEECEE;
            border-color: #DF6A74;
        }
        .create-goal-footer-link {
            text-align: center;
            margin-top: 24px;
        }
        .create-goal-footer-link a {
            color: #78716C;
            text-decoration: none;
            font-size: 0.88rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            transition: color 0.15s ease;
        }
        .create-goal-footer-link a:hover {
            color: #18181B;
        }
        @media (max-width: 1024px) {
            .create-goal-grid {
                grid-template-columns: 1fr;
            }
            .two-cards-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="create-goal-canvas">
        <!-- Top Header & Actions -->
        <div class="create-goal-header-row">
            <div class="create-goal-title-area">
                <h1 class="create-goal-main-title">Create New SMART Goal</h1>
                <p class="create-goal-subtitle">Structure your ambition for maximum success.</p>
            </div>
            <div class="create-goal-header-actions">
                <a href="Goals.aspx" class="btn-create-goal-cancel">Cancel</a>
                <button type="button" class="btn-create-goal-save" onclick="saveNewGoal()">
                    <span>+</span> Save Goal
                </button>
            </div>
        </div>

        <!-- 2 Column Form Layout -->
        <div class="create-goal-grid">
            <!-- Left Column -->
            <div class="create-goal-left-col">
                <!-- S Specific Card -->
                <div class="create-goal-card">
                    <div class="create-goal-card-header">
                        <div class="create-smart-badge">S</div>
                        <span class="create-smart-title">Specific</span>
                    </div>

                    <div class="create-form-group">
                        <label class="create-form-label" for="txtGoalTitle">Goal Title</label>
                        <input type="text" id="txtGoalTitle" class="create-form-input" placeholder="e.g. Master Calculus Fundamentals" value="Master Advanced Calculus" />
                    </div>

                    <div class="create-form-row-2">
                        <div class="create-form-group">
                            <label class="create-form-label" for="ddlCategory">Category</label>
                            <select id="ddlCategory" class="create-form-select">
                                <option value="Academic" selected="selected">Academic</option>
                                <option value="Personal">Personal</option>
                                <option value="Career">Career</option>
                                <option value="Health">Health</option>
                                <option value="Finance">Finance</option>
                            </select>
                        </div>
                        <div class="create-form-group">
                            <label class="create-form-label" for="ddlPriority">Priority</label>
                            <select id="ddlPriority" class="create-form-select">
                                <option value="High" selected="selected">High</option>
                                <option value="Medium">Medium</option>
                                <option value="Low">Low</option>
                            </select>
                        </div>
                    </div>

                    <div class="create-form-group">
                        <label class="create-form-label" for="txtDescription">Detailed Description</label>
                        <textarea id="txtDescription" class="create-form-textarea" placeholder="What exactly do you want to achieve?">Achieve a grade of 90% or higher in the final semester examination by mastering multidimensional calculus.</textarea>
                    </div>
                </div>

                <!-- M Measurable Card -->
                <div class="create-goal-card">
                    <div class="create-goal-card-header">
                        <div class="create-smart-badge badge-m">M</div>
                        <span class="create-smart-title">Measurable</span>
                    </div>

                    <div class="create-form-row-3">
                        <div class="create-form-group">
                            <label class="create-form-label" for="txtStartValue">Starting Value</label>
                            <input type="number" id="txtStartValue" class="create-form-input" value="0" />
                        </div>
                        <div class="create-form-group">
                            <label class="create-form-label" for="txtTargetValue">Target Value</label>
                            <input type="number" id="txtTargetValue" class="create-form-input" value="100" />
                        </div>
                        <div class="create-form-group">
                            <label class="create-form-label" for="txtUnit">Unit</label>
                            <input type="text" id="txtUnit" class="create-form-input" placeholder="e.g. Pages, Hours" value="%" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="create-goal-right-col">
                <!-- A Achievable & R Relevant (Two Cards in Row / Combined) -->
                <div class="create-goal-card">
                    <div class="two-cards-row">
                        <!-- Achievable -->
                        <div class="create-form-group">
                            <div class="create-goal-card-header" style="margin-bottom: 8px;">
                                <div class="create-smart-badge badge-a">A</div>
                                <span class="create-smart-title">Achievable</span>
                            </div>
                            <label class="create-form-label" for="txtAchievable">Why is this realistic?</label>
                            <textarea id="txtAchievable" class="create-form-textarea" placeholder="List your available resources...">Dedicate 10 hours per week to study and utilize university tutoring center twice a month.</textarea>
                        </div>

                        <!-- Relevant -->
                        <div class="create-form-group">
                            <div class="create-goal-card-header" style="margin-bottom: 8px;">
                                <div class="create-smart-badge badge-r">R</div>
                                <span class="create-smart-title">Relevant</span>
                            </div>
                            <label class="create-form-label" for="txtRelevant">How does this align?</label>
                            <textarea id="txtRelevant" class="create-form-textarea" placeholder="Link to long-term objectives...">Foundational knowledge required for next semester's Quantum Mechanics and Advanced Engineering courses.</textarea>
                        </div>
                    </div>
                </div>

                <!-- T Time-bound Card -->
                <div class="create-goal-card">
                    <div class="create-goal-card-header">
                        <div class="create-smart-badge badge-t">T</div>
                        <span class="create-smart-title">Time-bound</span>
                    </div>

                    <div class="create-form-row-2">
                        <div class="create-form-group">
                            <label class="create-form-label" for="txtDeadline">Deadline</label>
                            <input type="date" id="txtDeadline" class="create-form-input" value="2024-12-15" />
                        </div>
                        <div class="create-form-group">
                            <label class="create-form-label" for="ddlFrequency">Check-in Frequency</label>
                            <select id="ddlFrequency" class="create-form-select">
                                <option value="Daily" selected="selected">Daily</option>
                                <option value="Weekly">Weekly</option>
                                <option value="Bi-weekly">Bi-weekly</option>
                                <option value="Monthly">Monthly</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Milestones & Initial Tasks Card -->
                <div class="create-goal-card">
                    <h3 class="create-smart-title" style="margin: 0 0 4px 0;">Milestones &amp; Initial Tasks</h3>

                    <div class="milestone-action-row">
                        <div class="milestone-action-left">
                            <p class="milestone-action-title">Add your first milestone</p>
                            <p class="milestone-action-subtitle">Break your goal into manageable steps</p>
                        </div>
                        <button type="button" class="btn-outline-action" onclick="addMilestonePrompt()">
                            + Add Milestone
                        </button>
                    </div>

                    <div class="milestone-action-row">
                        <div class="milestone-action-left">
                            <p class="milestone-action-title">Link existing tasks</p>
                            <p class="milestone-action-subtitle">Connect this goal to your current workload</p>
                        </div>
                        <button type="button" class="btn-outline-action" onclick="linkTaskPrompt()">
                            + Link Task
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Link -->
        <div class="create-goal-footer-link">
            <a href="Goals.aspx">Show more goals <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"></polyline></svg></a>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        function saveNewGoal() {
            var title = document.getElementById('txtGoalTitle').value.trim();
            if (!title) {
                alert('Please enter a Goal Title.');
                document.getElementById('txtGoalTitle').focus();
                return;
            }

            alert('Goal "' + title + '" successfully saved! Redirecting to Goal Details...');
            window.location.href = 'GoalDetail.aspx';
        }

        function addMilestonePrompt() {
            var m = prompt("Enter milestone title:", "Complete Unit 1 Review");
            if (m && m.trim()) {
                alert("Milestone '" + m.trim() + "' added!");
            }
        }

        function linkTaskPrompt() {
            var t = prompt("Enter existing task to link:", "Watch week 8 lecture recordings");
            if (t && t.trim()) {
                alert("Task '" + t.trim() + "' linked to this goal!");
            }
        }
    </script>
</asp:Content>
