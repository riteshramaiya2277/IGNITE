<%@ Page Title="My Achievements — IGNITE" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Achievements.aspx.cs" Inherits="IGNITE.Student.Achievements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/achievements.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="achievements-canvas">

        <!-- 1. Header with Title & Total Progress -->
        <div class="achievements-header-row">
            <div class="achievements-title-block">
                <h1 class="achievements-main-title">My Achievements</h1>
                <p class="achievements-sub-title">Your journey through consistency and self-improvement.</p>
            </div>

            <div class="achievements-top-progress">
                <div class="progress-header-nums">
                    <span>Total Progress</span>
                    <span class="progress-score">
                        <asp:Literal ID="litUnlockedCount" runat="server">12</asp:Literal><span class="total-denom">/<asp:Literal ID="litTotalCount" runat="server">45</asp:Literal></span>
                    </span>
                </div>
                <div class="progress-bar-wrap">
                    <div class="progress-bar-fill" style="width: 26.7%;"></div>
                </div>
                <span class="progress-discover-note">
                    <asp:Literal ID="litRemainingCount" runat="server">33</asp:Literal> achievements left to discover
                </span>
            </div>
        </div>

        <!-- Hidden legacy literals to preserve backward compatibility if referenced -->
        <div style="display:none;">
            <asp:Literal ID="litProgressPercent" runat="server">26.7</asp:Literal>
            <asp:Literal ID="litBadgesUnlocked" runat="server">12</asp:Literal>
            <asp:Literal ID="litTotalAchievementsXP" runat="server">12,450</asp:Literal>
            <asp:Literal ID="litStreakAchievementDays" runat="server">15 Days</asp:Literal>
            <asp:Literal ID="litQuestsFinished" runat="server">42</asp:Literal>
        </div>

        <!-- 2. Milestone Achievements (Foundation) -->
        <section class="achievements-section">
            <div class="achievements-section-header">
                <span class="section-accent-bar accent-green"></span>
                <h2 class="section-heading-text">Milestone Achievements</h2>
                <span class="section-category-badge badge-foundation">FOUNDATION</span>
            </div>

            <div class="milestones-grid">
                <!-- Milestone Card 1: First Steps -->
                <div class="milestone-card">
                    <div class="milestone-icon-circle circle-green">
                        <svg viewBox="0 0 24 24" width="26" height="26" fill="currentColor">
                            <path d="M12 22v-7a6 6 0 0 0-6-6H3a1 1 0 0 0-1 1v1a9 9 0 0 0 9 9h1zm0 0v-4a5 5 0 0 1 5-5h3a1 1 0 0 1 1 1v1a8 8 0 0 1-8 8h-1z" />
                        </svg>
                    </div>
                    <h3 class="milestone-card-title">First Steps</h3>
                    <p class="milestone-card-desc">Complete your first 3 habits in a single day.</p>
                    <div class="milestone-card-footer">
                        <span class="footer-date-lbl">OCT 12, 2023</span>
                        <span class="footer-xp-lbl">+100 XP</span>
                    </div>
                </div>

                <!-- Milestone Card 2: 7-Day Streak (Featured / NEW) -->
                <div class="milestone-card card-featured">
                    <span class="new-tag-pill">NEW</span>
                    <div class="milestone-icon-circle circle-amber">
                        <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="9" stroke-dasharray="3 3"></circle>
                            <circle cx="12" cy="12" r="4"></circle>
                            <path d="M12 9v1m0 4v.01"></path>
                        </svg>
                    </div>
                    <h3 class="milestone-card-title">7-Day Streak</h3>
                    <p class="milestone-card-desc">Keep all primary habits active for a full week without missing.</p>
                    <div class="milestone-card-footer">
                        <span class="footer-date-lbl">TODAY, 08:45 AM</span>
                        <span class="footer-xp-lbl">+250 XP</span>
                    </div>
                </div>

                <!-- Milestone Card 3: Century Club (Locked) -->
                <div class="milestone-card card-locked">
                    <div class="milestone-icon-circle circle-muted">
                        <svg viewBox="0 0 24 24" width="26" height="26" fill="currentColor">
                            <path d="M19 4h-2V3a1 1 0 0 0-1-1H8a1 1 0 0 0-1 1v1H5a3 3 0 0 0-3 3v2a6 6 0 0 0 5 5.91V17a3 3 0 0 0 2 2.82V21H7a1 1 0 0 0 0 2h10a1 1 0 0 0 0-2h-2v-1.18A3 3 0 0 0 17 17v-2.09A6 6 0 0 0 22 9V7a3 3 0 0 0-3-3zM4 9V7a1 1 0 0 1 1-1h2v4.82A4 4 0 0 1 4 9zm16 0a4 4 0 0 1-3 1.82V6h2a1 1 0 0 1 1 1z" />
                        </svg>
                    </div>
                    <h3 class="milestone-card-title">Century Club</h3>
                    <p class="milestone-card-desc">Reach a total of 100 habits completed.</p>
                    <div class="milestone-card-footer">
                        <span class="footer-locked-lbl">LOCKED</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- 3. Monthly Challenges (Expert) -->
        <section class="achievements-section">
            <div class="achievements-section-header">
                <span class="section-accent-bar accent-blue"></span>
                <h2 class="section-heading-text">Monthly Challenges</h2>
                <span class="section-category-badge badge-expert">EXPERT</span>
            </div>

            <div class="challenges-two-col">
                <!-- Challenge Card 1: Morning riser -->
                <div class="challenge-row-card">
                    <div class="challenge-badge-icon challenge-badge-blue">
                        <svg viewBox="0 0 24 24" width="26" height="26" fill="currentColor">
                            <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5l4.5-6 3.5 4.5 2.5-3 3.5 4.5z"/>
                        </svg>
                    </div>
                    <div class="challenge-body">
                        <h3 class="challenge-body-title">Morning riser</h3>
                        <p class="challenge-body-desc">Wake up before 6:00 AM for 15 consecutive days.</p>
                        <div class="challenge-status-row status-unlocked">
                            <svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
                            </svg>
                            <span>Unlocked on Oct 24, 2023</span>
                        </div>
                    </div>
                    <span class="challenge-xp-badge xp-badge-amber">+500 XP</span>
                </div>

                <!-- Challenge Card 2: Polymath Quest -->
                <div class="challenge-row-card card-locked">
                    <div class="challenge-badge-icon challenge-badge-grey">
                        <svg viewBox="0 0 24 24" width="26" height="26" fill="currentColor">
                            <path d="M21 5c-1.11-.35-2.33-.5-3.5-.5-1.95 0-4.05.4-5.5 1.5-1.45-1.1-3.55-1.5-5.5-1.5S2.45 4.9 1 6v14.65c0 .25.25.5.5.5.1 0 .15-.05.25-.05C3.1 20.45 5.05 20 6.5 20c1.95 0 4.05.4 5.5 1.5 1.35-.85 3.8-1.5 5.5-1.5 1.65 0 3.35.3 4.75 1.05.1.05.15.05.25.05.25 0 .5-.25.5-.5V6c-.6-.45-1.25-.75-2-1zm-1 14c-1.15-.3-2.55-.5-4-.5-1.95 0-4.05.4-5.5 1.5V7c1.45-1.1 3.55-1.5 5.5-1.5 1.45 0 2.85.2 4 .5v13z"/>
                        </svg>
                    </div>
                    <div class="challenge-body">
                        <h3 class="challenge-body-title">Polymath Quest</h3>
                        <p class="challenge-body-desc">Learn 5 new skills by tracking specific learning habits for 30 days.</p>
                        <div class="challenge-status-row status-inprogress">
                            <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                            <span>IN PROGRESS (2/5)</span>
                        </div>
                    </div>
                    <span class="challenge-xp-badge xp-badge-grey">+1000 XP</span>
                </div>
            </div>
        </section>

        <!-- 4. Hidden Achievements (Discovery) -->
        <section class="achievements-section">
            <div class="achievements-section-header">
                <span class="section-accent-bar accent-purple"></span>
                <h2 class="section-heading-text">Hidden Achievements</h2>
                <span class="section-category-badge badge-discovery">DISCOVERY</span>
            </div>

            <div class="hidden-four-grid">
                <!-- Hidden 1: Night Owl (Discovered) -->
                <div class="hidden-item-card discovered">
                    <div class="hidden-icon-wrap icon-purple-circle">
                        <svg viewBox="0 0 24 24" width="22" height="22" fill="currentColor">
                            <path d="M12.3 2a10 10 0 0 0-1.9 19.8 10 10 0 0 0 10.9-10.9A10 10 0 0 1 12.3 2z"/>
                        </svg>
                    </div>
                    <h3 class="hidden-title">Night Owl</h3>
                    <p class="hidden-desc">Complete a task between 2:00 AM and 4:00 AM.</p>
                    <span class="hidden-xp-pill">+300 XP</span>
                </div>

                <!-- Hidden 2: Undiscovered ??? -->
                <div class="hidden-item-card undiscovered">
                    <div class="hidden-icon-wrap icon-mystery-circle">
                        <svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                            <line x1="12" y1="17" x2="12.01" y2="17"></line>
                        </svg>
                    </div>
                    <h3 class="hidden-title">???</h3>
                    <p class="hidden-desc">Keep exploring to uncover this secret.</p>
                </div>

                <!-- Hidden 3: Undiscovered ??? (VR / Glasses) -->
                <div class="hidden-item-card undiscovered">
                    <div class="hidden-icon-wrap icon-mystery-circle">
                        <svg viewBox="0 0 24 24" width="22" height="22" fill="currentColor">
                            <path d="M20.5 6c-2.61.7-5.67 1-8.5 1s-5.89-.3-8.5-1L2 8v8c0 1.1.9 2 2 2h2c1.1 0 2-.9 2-2v-1h8v1c0 1.1.9 2 2 2h2c1.1 0 2-.9 2-2V8l-1.5-2zM7 14c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3zm10 0c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3z"/>
                        </svg>
                    </div>
                    <h3 class="hidden-title">???</h3>
                    <p class="hidden-desc">Keep exploring to uncover this secret.</p>
                </div>

                <!-- Hidden 4: Undiscovered ??? (Ghost) -->
                <div class="hidden-item-card undiscovered">
                    <div class="hidden-icon-wrap icon-mystery-circle">
                        <svg viewBox="0 0 24 24" width="22" height="22" fill="currentColor">
                            <path d="M12 2a9 9 0 0 0-9 9v9.5a1.5 1.5 0 0 0 2.5 1.1l2.5-2.1 2.5 2.1a1.5 1.5 0 0 0 1.9 0l2.5-2.1 2.5 2.1a1.5 1.5 0 0 0 2.6-1.1V11a9 9 0 0 0-9-9zm-3 8a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3zm6 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3z"/>
                        </svg>
                    </div>
                    <h3 class="hidden-title">???</h3>
                    <p class="hidden-desc">Keep exploring to uncover this secret.</p>
                </div>
            </div>
        </section>

    </div>
</asp:Content>
