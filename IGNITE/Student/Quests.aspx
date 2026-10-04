<%@ Page Title="Active Quests" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Quests.aspx.cs" Inherits="IGNITE.Student.Quests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/quests.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Fail-safe stylesheet link -->
    <link href="../Content/quests.css" rel="stylesheet" type="text/css" />

    <div class="quests-canvas">

        <!-- 1. Top Banner Card: Active Quests & Today's Potential -->
        <div class="quests-banner-card">
            <div class="quests-banner-left">
                <h1 class="quests-banner-title">Active Quests</h1>
                <p class="quests-banner-subtitle">Complete daily and weekly objectives to boost your learning progress.</p>
            </div>
            <div class="quests-banner-right">
                <span class="banner-potential-label">TODAY'S POTENTIAL</span>
                <span class="banner-potential-val">+850 XP</span>
            </div>
        </div>

        <!-- 2. Two-Column Workspace Layout (Daily Quests & Weekly Quests) -->
        <div class="quests-grid-layout">

            <!-- ==============================================================
                 LEFT COLUMN: Daily Quests (Resets in 14h 20m)
                 ============================================================== -->
            <div class="quest-column">
                <div class="quest-column-header">
                    <h2 class="quest-column-title">Daily Quests</h2>
                    <span class="quest-column-meta">Resets in 14h 20m</span>
                </div>

                <!-- Daily Quest 1: Mindful Review -->
                <div class="quest-card">
                    <div class="quest-card-top">
                        <div class="quest-card-left">
                            <div class="quest-icon-wrap" title="Review Quest">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path>
                                </svg>
                            </div>
                            <div class="quest-info-group">
                                <div class="quest-title-row">
                                    <h3 class="quest-title">Mindful Review</h3>
                                    <span class="badge-source-system">SYSTEM</span>
                                </div>
                                <p class="quest-desc">Review 5 flashcards from your latest course.</p>
                            </div>
                        </div>
                        <span class="pill-quest-status pill-quest-active">ACTIVE</span>
                    </div>

                    <div class="quest-progress-section">
                        <div class="quest-progress-header">
                            <span>Progress: 2/5 cards</span>
                            <span>40%</span>
                        </div>
                        <div class="quest-track">
                            <div class="quest-fill" style="width: 40%;"></div>
                        </div>
                    </div>

                    <div class="quest-footer-row">
                        <span class="quest-xp-amount">150 XP</span>
                        <button type="button" class="btn-in-progress" disabled>In Progress</button>
                    </div>
                </div>

                <!-- Daily Quest 2: Reflection Prompt (Completed / Ready to Claim) -->
                <div class="quest-card quest-card-highlight">
                    <div class="quest-card-top">
                        <div class="quest-card-left">
                            <div class="quest-icon-wrap" title="Journal Prompt">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
                                    <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
                                </svg>
                            </div>
                            <div class="quest-info-group">
                                <div class="quest-title-row">
                                    <h3 class="quest-title">Reflection Prompt</h3>
                                    <span class="badge-source-instructor">INSTRUCTOR</span>
                                </div>
                                <p class="quest-desc">Write one goal for today in the journal.</p>
                            </div>
                        </div>
                        <span class="pill-quest-status pill-quest-completed" id="badgeReflectionStatus">COMPLETED</span>
                    </div>

                    <div class="quest-progress-section">
                        <div class="quest-progress-header">
                            <span>Progress: 1/1 goal</span>
                            <span>100%</span>
                        </div>
                        <div class="quest-track">
                            <div class="quest-fill" style="width: 100%;"></div>
                        </div>
                    </div>

                    <div class="quest-footer-row">
                        <span class="quest-xp-amount">100 XP</span>
                        <button type="button" class="btn-claim-reward" id="btnClaimReflection" onclick="claimReflectionReward()">Claim Reward</button>
                    </div>
                </div>

                <!-- Daily Quest 3: Early Riser (Expired) -->
                <div class="quest-card quest-card-expired">
                    <div class="quest-card-top">
                        <div class="quest-card-left">
                            <div class="quest-icon-wrap quest-icon-expired" title="Morning Check-in">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <circle cx="12" cy="7" r="4"></circle>
                                    <path d="M6 21v-2a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v2"></path>
                                </svg>
                            </div>
                            <div class="quest-info-group">
                                <div class="quest-title-row">
                                    <h3 class="quest-title">Early Riser</h3>
                                    <span class="badge-source-system">SYSTEM</span>
                                </div>
                                <p class="quest-desc">Check-in before 8:00 AM.</p>
                            </div>
                        </div>
                        <span class="pill-quest-status pill-quest-expired">EXPIRED</span>
                    </div>

                    <div class="quest-footer-row" style="margin-top: 6px;">
                        <span class="quest-xp-amount xp-muted">50 XP</span>
                        <span class="expired-note-text">No longer available</span>
                    </div>
                </div>

            </div>

            <!-- ==============================================================
                 RIGHT COLUMN: Weekly Quests (4 days remaining)
                 ============================================================== -->
            <div class="quest-column">
                <div class="quest-column-header">
                    <h2 class="quest-column-title">Weekly Quests</h2>
                    <span class="quest-column-meta">4 days remaining</span>
                </div>

                <!-- Weekly Quest 1: Course Conqueror -->
                <div class="quest-card">
                    <div class="quest-card-top">
                        <div class="quest-card-left">
                            <div class="quest-icon-wrap" title="Course Objective">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                            </div>
                            <div class="quest-info-group">
                                <div class="quest-title-row">
                                    <h3 class="quest-title">Course Conqueror</h3>
                                    <span class="badge-source-system">SYSTEM</span>
                                </div>
                                <p class="quest-desc">Complete all lessons in the "Mindful Mornings" module.</p>
                            </div>
                        </div>
                        <span class="pill-quest-status pill-quest-active">ACTIVE</span>
                    </div>

                    <div class="quest-progress-section">
                        <div class="quest-progress-header">
                            <span>Quest Milestone</span>
                            <span>3 / 10 Lessons</span>
                        </div>
                        <div class="quest-track">
                            <div class="quest-fill" style="width: 30%;"></div>
                        </div>
                        <div class="quest-subnote-row">
                            <span class="dot-subnote"></span>
                            <span>On track to finish by Sunday</span>
                        </div>
                    </div>

                    <div class="course-rewards-ribbon">
                        <div class="reward-badge-group">
                            <div class="badge-round-medal">
                                <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="8" r="7"></circle>
                                    <polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline>
                                </svg>
                            </div>
                            <div class="reward-titles">
                                <span class="reward-micro-label">BONUS</span>
                                <span class="reward-main-name">Zen Master Badge</span>
                            </div>
                        </div>

                        <div class="reward-xp-callout">
                            <span class="reward-micro-label">REWARD</span>
                            <span class="quest-xp-amount">600 XP</span>
                        </div>

                        <button type="button" class="btn-view-module" onclick="viewCourseModule()">View Module</button>
                    </div>
                </div>

                <!-- Weekly Quest 2: Weekly Reflection -->
                <div class="quest-card">
                    <div class="quest-card-top">
                        <div class="quest-card-left">
                            <div class="quest-icon-wrap" title="Weekly Activity">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path d="M10 2v7.31M14 9.31V2M8.5 2h7M14 9.31a6.5 6.5 0 1 1-4 0"></path>
                                    <path d="M5.52 16h12.96"></path>
                                </svg>
                            </div>
                            <div class="quest-info-group">
                                <div class="quest-title-row">
                                    <h3 class="quest-title">Weekly Reflection</h3>
                                    <span class="badge-source-instructor">INSTRUCTOR</span>
                                </div>
                                <p class="quest-desc">Attend at least one live movement session this week.</p>
                            </div>
                        </div>
                        <span class="pill-quest-status pill-quest-active">ACTIVE</span>
                    </div>

                    <div class="quest-progress-section">
                        <div class="quest-progress-header">
                            <span>Progress: 0/1 session</span>
                            <span>0%</span>
                        </div>
                        <div class="quest-track">
                            <div class="quest-fill" style="width: 0%;"></div>
                        </div>
                    </div>

                    <div class="quest-footer-row">
                        <span class="quest-xp-amount">300 XP</span>
                        <button type="button" class="btn-find-session" onclick="findMovementSession()">Find Session</button>
                    </div>
                </div>

            </div>

        </div>

        <!-- 3. Bottom Section: Weekly Quest Completion Donut & Totals -->
        <div class="quests-bottom-row">

            <!-- Left: Weekly Quest Completion (Donut Ring 70%) -->
            <div class="weekly-completion-card">
                <div class="completion-ring-wrap">
                    <svg class="completion-ring-svg" viewBox="0 0 68 68">
                        <circle class="ring-bg" cx="34" cy="34" r="28"></circle>
                        <circle class="ring-meter" cx="34" cy="34" r="28"
                            stroke-dasharray="175.93" stroke-dashoffset="52.78"></circle>
                    </svg>
                    <span class="ring-percent-text">70%</span>
                </div>
                <div class="completion-text-group">
                    <h3 class="completion-headline">Weekly Quest Completion</h3>
                    <p class="completion-subtext">You're just 2 quests away from your level-up bonus!</p>
                </div>
            </div>

            <!-- Right: Total Quests Done & Total XP Earned -->
            <div class="quest-totals-boxes">
                <div class="total-stat-box">
                    <span class="total-stat-box-label">TOTAL QUESTS DONE</span>
                    <span class="total-stat-box-val" id="valTotalQuests">128</span>
                </div>
                <div class="total-stat-box">
                    <span class="total-stat-box-label">TOTAL XP EARNED</span>
                    <span class="total-stat-box-val" id="valTotalXP">24,500</span>
                </div>
            </div>

        </div>

    </div>

    <script type="text/javascript">
        var reflectionClaimed = false;

        function claimReflectionReward() {
            if (reflectionClaimed) return;
            reflectionClaimed = true;

            var btn = document.getElementById('btnClaimReflection');
            btn.classList.add('claimed');
            btn.innerText = "Claimed ✓";
            btn.disabled = true;

            // Increment XP counter
            var xpEl = document.getElementById('valTotalXP');
            xpEl.innerText = "24,600";

            var questsEl = document.getElementById('valTotalQuests');
            questsEl.innerText = "129";

            showQuestToast("🎉 Congratulations! +100 XP added to your profile!");
        }

        function viewCourseModule() {
            showQuestToast("Opening Mindful Mornings module lessons...");
        }

        function findMovementSession() {
            showQuestToast("Browsing live movement sessions scheduled for this week...");
        }

        function showQuestToast(msg) {
            var toast = document.getElementById('toastNotice');
            if (!toast) {
                toast = document.createElement('div');
                toast.id = 'toastNotice';
                toast.className = 'quest-toast';
                document.body.appendChild(toast);
            }
            toast.innerText = msg;
            toast.classList.add('show');
            setTimeout(function() {
                toast.classList.remove('show');
            }, 3500);
        }
    </script>
</asp:Content>
