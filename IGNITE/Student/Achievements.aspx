<%@ Page Title="Achievements & Badges — IGNITE" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Achievements.aspx.cs" Inherits="IGNITE.Student.Achievements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/achievements.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="achievements-canvas">
        <!-- 1. Header with Title & Subtitle -->
        <div class="achievements-header">
            <div class="achievements-header-text">
                <h1 class="achievements-title">Achievements &amp; Badges</h1>
                <p class="achievements-subtitle">Celebrate your academic milestones, consistency, and hard-earned trophies.</p>
            </div>
        </div>

        <!-- 2. Summary Stats Cards Row -->
        <div class="achievements-summary-grid">
            <div class="summary-stat-box">
                <div class="stat-icon-wrapper icon-amber">
                    <svg viewBox="0 0 24 24" fill="currentColor">
                        <path d="M19 4h-2V3a1 1 0 0 0-1-1H8a1 1 0 0 0-1 1v1H5a3 3 0 0 0-3 3v2a6 6 0 0 0 5 5.91V17a3 3 0 0 0 2 2.82V21H7a1 1 0 0 0 0 2h10a1 1 0 0 0 0-2h-2v-1.18A3 3 0 0 0 17 17v-2.09A6 6 0 0 0 22 9V7a3 3 0 0 0-3-3zM4 9V7a1 1 0 0 1 1-1h2v4.82A4 4 0 0 1 4 9zm16 0a4 4 0 0 1-3 1.82V6h2a1 1 0 0 1 1 1z" />
                    </svg>
                </div>
                <div class="stat-content">
                    <span class="stat-num"><asp:Literal ID="litBadgesUnlocked" runat="server">24</asp:Literal></span>
                    <span class="stat-lbl">Badges Unlocked</span>
                </div>
            </div>

            <div class="summary-stat-box">
                <div class="stat-icon-wrapper icon-rose">
                    <svg viewBox="0 0 24 24" fill="currentColor">
                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                    </svg>
                </div>
                <div class="stat-content">
                    <span class="stat-num"><asp:Literal ID="litTotalAchievementsXP" runat="server">12,450</asp:Literal></span>
                    <span class="stat-lbl">Total XP Earned</span>
                </div>
            </div>

            <div class="summary-stat-box">
                <div class="stat-icon-wrapper icon-orange">
                    <svg viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                    </svg>
                </div>
                <div class="stat-content">
                    <span class="stat-num"><asp:Literal ID="litStreakAchievementDays" runat="server">15 Days</asp:Literal></span>
                    <span class="stat-lbl">Current Streak</span>
                </div>
            </div>

            <div class="summary-stat-box">
                <div class="stat-icon-wrapper icon-green">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                        <circle cx="12" cy="12" r="10"></circle>
                        <polyline points="16 8 10 14 7 11"></polyline>
                    </svg>
                </div>
                <div class="stat-content">
                    <span class="stat-num"><asp:Literal ID="litQuestsFinished" runat="server">42</asp:Literal></span>
                    <span class="stat-lbl">Completed Quests</span>
                </div>
            </div>
        </div>

        <!-- 3. Category Filter Pills -->
        <div class="badge-category-pills">
            <button type="button" class="badge-pill-btn active" onclick="filterBadges('all', this)">All Badges</button>
            <button type="button" class="badge-pill-btn" onclick="filterBadges('academic', this)">Academic</button>
            <button type="button" class="badge-pill-btn" onclick="filterBadges('streak', this)">Streaks &amp; Habits</button>
            <button type="button" class="badge-pill-btn" onclick="filterBadges('quests', this)">Quests &amp; Challenges</button>
        </div>

        <!-- 4. Badges Grid -->
        <div class="badges-main-grid" id="badgesMainGrid">
            <!-- Badge 1: 15 Day Streak -->
            <div class="badge-card" data-category="streak">
                <div class="badge-card-top">
                    <div class="badge-avatar-circle bg-flame" title="15 Day Streak">
                        <svg viewBox="0 0 24 24" fill="currentColor">
                            <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                        </svg>
                    </div>
                    <div class="badge-info-col">
                        <h4 class="badge-name">15 Day Streak</h4>
                        <p class="badge-desc">Maintained a continuous daily study and task completion habit for 15 days.</p>
                    </div>
                </div>
                <div class="badge-card-footer">
                    <span class="badge-unlocked-date">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        Unlocked
                    </span>
                    <span class="badge-xp-reward">+300 XP</span>
                </div>
            </div>

            <!-- Badge 2: Mindful Learner -->
            <div class="badge-card" data-category="academic">
                <div class="badge-card-top">
                    <div class="badge-avatar-circle bg-brain" title="Mindful Learner">
                        <svg viewBox="0 0 24 24" fill="currentColor">
                            <path d="M12 2a5 5 0 0 0-5 5c0 1.5.7 2.8 1.7 3.7C6.4 11.7 5 13.7 5 16a5 5 0 0 0 6 4.9V22h2v-1.1A5 5 0 0 0 19 16c0-2.3-1.4-4.3-3.7-5.3 1-.9 1.7-2.2 1.7-3.7a5 5 0 0 0-5-5zm-1 2.1c.3 0 .7 0 1 .1V6h-1V4.1zm-2 .6c.6-.5 1.3-.7 2-.7V6H9V4.7zm6 0V6h-2V4c.7 0 1.4.2 2 .7zm-3 8.3c1.7 0 3 1.3 3 3s-1.3 3-3 3-3-1.3-3-3 1.3-3 3-3z" />
                        </svg>
                    </div>
                    <div class="badge-info-col">
                        <h4 class="badge-name">Mindful Learner</h4>
                        <p class="badge-desc">Finished 25 deep-work focus sessions without distractions.</p>
                    </div>
                </div>
                <div class="badge-card-footer">
                    <span class="badge-unlocked-date">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        Unlocked
                    </span>
                    <span class="badge-xp-reward">+250 XP</span>
                </div>
            </div>

            <!-- Badge 3: Star Scholar -->
            <div class="badge-card" data-category="academic">
                <div class="badge-card-top">
                    <div class="badge-avatar-circle bg-star" title="Star Scholar">
                        <svg viewBox="0 0 24 24" fill="currentColor">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                        </svg>
                    </div>
                    <div class="badge-info-col">
                        <h4 class="badge-name">Star Scholar</h4>
                        <p class="badge-desc">Achieved top-tier marks in all semester course evaluations.</p>
                    </div>
                </div>
                <div class="badge-card-footer">
                    <span class="badge-unlocked-date">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        Unlocked
                    </span>
                    <span class="badge-xp-reward">+500 XP</span>
                </div>
            </div>

            <!-- Badge 4: Task Slayer -->
            <div class="badge-card" data-category="academic">
                <div class="badge-card-top">
                    <div class="badge-avatar-circle bg-star" title="Task Slayer">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                        </svg>
                    </div>
                    <div class="badge-info-col">
                        <h4 class="badge-name">Task Slayer</h4>
                        <p class="badge-desc">Successfully completed 50 academic and daily assignment tasks.</p>
                    </div>
                </div>
                <div class="badge-card-footer">
                    <span class="badge-unlocked-date">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        Unlocked
                    </span>
                    <span class="badge-xp-reward">+400 XP</span>
                </div>
            </div>

            <!-- Badge 5: Early Bird -->
            <div class="badge-card" data-category="streak">
                <div class="badge-card-top">
                    <div class="badge-avatar-circle bg-target" title="Early Bird">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                            <circle cx="12" cy="8" r="6"></circle>
                            <path d="M15.477 12.89 17 22l-5-3-5 3 1.523-9.11"></path>
                        </svg>
                    </div>
                    <div class="badge-info-col">
                        <h4 class="badge-name">Early Bird</h4>
                        <p class="badge-desc">Checked in and completed your first study session before 6:00 AM.</p>
                    </div>
                </div>
                <div class="badge-card-footer">
                    <span class="badge-unlocked-date">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        Unlocked
                    </span>
                    <span class="badge-xp-reward">+200 XP</span>
                </div>
            </div>

            <!-- Badge 6: Goal Crusher (Locked) -->
            <div class="badge-card locked" data-category="quests">
                <div class="badge-card-top">
                    <div class="badge-avatar-circle bg-locked" title="Goal Crusher">
                        <svg viewBox="0 0 24 24" fill="currentColor">
                            <path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c-0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z" />
                        </svg>
                    </div>
                    <div class="badge-info-col">
                        <h4 class="badge-name">Goal Crusher</h4>
                        <p class="badge-desc">Complete all active semester academic goals and publish milestones.</p>
                    </div>
                </div>
                <div class="badge-card-footer">
                    <span class="badge-lock-status">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                        Locked (2 / 3 Goals completed)
                    </span>
                    <span class="badge-xp-reward">+750 XP</span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        function filterBadges(cat, btn) {
            var buttons = document.querySelectorAll('.badge-pill-btn');
            buttons.forEach(function (b) { b.classList.remove('active'); });
            if (btn) btn.classList.add('active');

            var cards = document.querySelectorAll('#badgesMainGrid .badge-card');
            cards.forEach(function (card) {
                var c = card.getAttribute('data-category');
                if (cat === 'all' || c === cat) {
                    card.style.display = 'flex';
                } else {
                    card.style.display = 'none';
                }
            });
        }
    </script>
</asp:Content>
