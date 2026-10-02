<%@ Page Title="XP & Level — IGNITE" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="XP.aspx.cs" Inherits="IGNITE.Student.XP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/xp.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="xp-canvas">
        <!-- 1. Header with Title & Subtitle -->
        <div class="xp-page-header">
            <h1 class="xp-page-title">XP &amp; Level</h1>
            <p class="xp-page-subtitle">You're doing amazing, <asp:Literal ID="litHeaderFirstName" runat="server">Alex</asp:Literal>! Keep leveling up your potential.</p>
        </div>

        <!-- 2. Two-Column Main Grid -->
        <div class="xp-main-grid">
            <!-- Left Column: Hero, XP Sources, Upcoming Milestones -->
            <div class="xp-left-column">
                <!-- Level Hero Card -->
                <div class="xp-hero-card">
                    <div class="xp-hero-top">
                        <div class="xp-hero-title-group">
                            <h2 class="xp-hero-level">
                                Level <asp:Literal ID="litHeroLevel" runat="server">12</asp:Literal>
                            </h2>
                            <p class="xp-hero-total">
                                Total Experience: <asp:Literal ID="litHeroTotalXP" runat="server">12,450 XP</asp:Literal>
                            </p>
                        </div>

                        <!-- Active Streak Badge -->
                        <div class="xp-hero-streak-chip">
                            <span class="xp-hero-streak-label">ACTIVE STREAK</span>
                            <span class="xp-hero-streak-val">
                                <asp:Literal ID="litHeroStreakDays" runat="server">15 Days</asp:Literal> 🔥
                            </span>
                        </div>
                    </div>

                    <!-- Progress Bar & Milestones -->
                    <div class="xp-hero-progress-group">
                        <div class="xp-hero-markers">
                            <span class="xp-marker-curr">Level 12 (4,500 XP)</span>
                            <span class="xp-marker-needed">1,500 XP needed</span>
                            <span class="xp-marker-next">Level 13 (6,000 XP)</span>
                        </div>

                        <div class="xp-hero-bar-track">
                            <div id="barHeroFill" runat="server" class="xp-hero-bar-fill" style="width: 75%;"></div>
                        </div>
                    </div>
                </div>

                <!-- XP Sources Section (Habits, Tasks, Challenges) -->
                <div class="xp-sources-section">
                    <h3 class="xp-section-heading">XP Sources</h3>

                    <div class="xp-sources-grid">
                        <!-- Source 1: Habits -->
                        <a href="<%= ResolveUrl("~/Student/Habits.aspx") %>" class="xp-source-card">
                            <div class="xp-source-top">
                                <div class="xp-source-icon-wrap icon-habits">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <path d="M12 2a10 10 0 0 1 10 10H12V2z" fill="currentColor"></path>
                                    </svg>
                                </div>
                                <div class="xp-source-meta">
                                    <h4 class="xp-source-title">Habits</h4>
                                    <p class="xp-source-desc">Daily streak rewards</p>
                                </div>
                            </div>
                            <div class="xp-source-bottom">
                                <span>+50 XP / day</span>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="9 18 15 12 9 6"></polyline>
                                </svg>
                            </div>
                        </a>

                        <!-- Source 2: Tasks -->
                        <a href="<%= ResolveUrl("~/Student/Tasks.aspx") %>" class="xp-source-card">
                            <div class="xp-source-top">
                                <div class="xp-source-icon-wrap icon-tasks">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <line x1="8" y1="6" x2="21" y2="6"></line>
                                        <line x1="8" y1="12" x2="21" y2="12"></line>
                                        <line x1="8" y1="18" x2="21" y2="18"></line>
                                        <line x1="3" y1="6" x2="3.01" y2="6"></line>
                                        <line x1="3" y1="12" x2="3.01" y2="12"></line>
                                        <line x1="3" y1="18" x2="3.01" y2="18"></line>
                                    </svg>
                                </div>
                                <div class="xp-source-meta">
                                    <h4 class="xp-source-title">Tasks</h4>
                                    <p class="xp-source-desc">Academic completions</p>
                                </div>
                            </div>
                            <div class="xp-source-bottom">
                                <span>+100 XP / task</span>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="9 18 15 12 9 6"></polyline>
                                </svg>
                            </div>
                        </a>

                        <!-- Source 3: Challenges -->
                        <a href="<%= ResolveUrl("~/Student/Challenges.aspx") %>" class="xp-source-card">
                            <div class="xp-source-top">
                                <div class="xp-source-icon-wrap icon-challenges">
                                    <svg viewBox="0 0 24 24" fill="currentColor">
                                        <path d="M19 4h-2V3a1 1 0 0 0-1-1H8a1 1 0 0 0-1 1v1H5a3 3 0 0 0-3 3v2a6 6 0 0 0 5 5.91V17a3 3 0 0 0 2 2.82V21H7a1 1 0 0 0 0 2h10a1 1 0 0 0 0-2h-2v-1.18A3 3 0 0 0 17 17v-2.09A6 6 0 0 0 22 9V7a3 3 0 0 0-3-3zM4 9V7a1 1 0 0 1 1-1h2v4.82A4 4 0 0 1 4 9zm16 0a4 4 0 0 1-3 1.82V6h2a1 1 0 0 1 1 1z" />
                                    </svg>
                                </div>
                                <div class="xp-source-meta">
                                    <h4 class="xp-source-title">Challenges</h4>
                                    <p class="xp-source-desc">Community sprints</p>
                                </div>
                            </div>
                            <div class="xp-source-bottom">
                                <span>+500 XP / goal</span>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="9 18 15 12 9 6"></polyline>
                                </svg>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Upcoming Milestones Card -->
                <div class="xp-milestones-card">
                    <h3 class="xp-section-heading">Upcoming Milestones</h3>

                    <div class="milestones-list">
                        <!-- Milestone 13 (NEXT) -->
                        <div class="milestone-item">
                            <div class="milestone-lvl-badge next-up">13</div>
                            <div class="milestone-content">
                                <div class="milestone-header-row">
                                    <h4 class="milestone-name">Focus Master Title</h4>
                                    <span class="milestone-next-tag">NEXT</span>
                                </div>
                                <p class="milestone-unlock-info">Unlock at 6,000 XP</p>
                                <div class="milestone-tags-row">
                                    <span class="milestone-tag">Profile Badge</span>
                                    <span class="milestone-tag">+1 Custom Habit Slot</span>
                                </div>
                            </div>
                        </div>

                        <!-- Milestone 14 -->
                        <div class="milestone-item">
                            <div class="milestone-lvl-badge">14</div>
                            <div class="milestone-content">
                                <div class="milestone-header-row">
                                    <h4 class="milestone-name">Insight Wizard Unlock</h4>
                                </div>
                                <p class="milestone-unlock-info">Unlock at 8,500 XP</p>
                                <div class="milestone-tags-row">
                                    <span class="milestone-tag">Advanced Analytics</span>
                                </div>
                            </div>
                        </div>

                        <!-- Milestone 15 -->
                        <div class="milestone-item">
                            <div class="milestone-lvl-badge">15</div>
                            <div class="milestone-content">
                                <div class="milestone-header-row">
                                    <h4 class="milestone-name">Prestige Level</h4>
                                </div>
                                <p class="milestone-unlock-info">Unlock at 12,000 XP</p>
                                <div class="milestone-tags-row">
                                    <span class="milestone-tag">Exclusive Themes</span>
                                    <span class="milestone-tag">Early Access Features</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column: Recent Trophies & XP Activity Feed -->
            <div class="xp-right-column">
                <!-- Recent Trophies Card -->
                <div class="xp-trophies-card">
                    <div class="xp-card-header">
                        <h3 class="xp-card-title">Recent Trophies</h3>
                        <a href="<%= ResolveUrl("~/Student/Achievements.aspx") %>" class="xp-card-link">View All</a>
                    </div>

                    <div class="trophies-row">
                        <!-- Trophy 1 -->
                        <div class="trophy-item-box">
                            <div class="trophy-circle-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="8" r="6"></circle>
                                    <path d="M15.477 12.89 17 22l-5-3-5 3 1.523-9.11"></path>
                                </svg>
                            </div>
                            <h5 class="trophy-title">Early Bird</h5>
                            <span class="trophy-sub">5 AM Check-in</span>
                        </div>

                        <!-- Trophy 2 -->
                        <div class="trophy-item-box">
                            <div class="trophy-circle-icon star">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                            </div>
                            <h5 class="trophy-title">Task Slayer</h5>
                            <span class="trophy-sub">10 Tasks Done</span>
                        </div>
                    </div>
                </div>

                <!-- XP Activity Feed -->
                <div class="xp-activity-card">
                    <div class="xp-card-header">
                        <h3 class="xp-card-title">XP Activity</h3>
                        <button type="button" class="activity-filter-btn">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon>
                            </svg>
                            <span>All</span>
                        </button>
                    </div>

                    <div class="activity-list">
                        <!-- Activity 1 -->
                        <div class="activity-item">
                            <div class="activity-left">
                                <div class="activity-icon-wrap act-plus">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                        <line x1="12" y1="5" x2="12" y2="19"></line>
                                        <line x1="5" y1="12" x2="19" y2="12"></line>
                                    </svg>
                                </div>
                                <div class="activity-meta">
                                    <h5 class="activity-title">Algorithm Assignment</h5>
                                    <span class="activity-sub">Academic Task • Today, 4:15 PM</span>
                                </div>
                            </div>
                            <span class="activity-amount">+100 XP</span>
                        </div>

                        <!-- Activity 2 -->
                        <div class="activity-item">
                            <div class="activity-left">
                                <div class="activity-icon-wrap act-habit">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <path d="M12 2a10 10 0 0 1 10 10H12V2z" fill="currentColor"></path>
                                    </svg>
                                </div>
                                <div class="activity-meta">
                                    <h5 class="activity-title">Daily Water Intake</h5>
                                    <span class="activity-sub">Habit Streak • Today, 9:30 AM</span>
                                </div>
                            </div>
                            <span class="activity-amount">+50 XP</span>
                        </div>

                        <!-- Activity 3 -->
                        <div class="activity-item">
                            <div class="activity-left">
                                <div class="activity-icon-wrap act-trophy">
                                    <svg viewBox="0 0 24 24" fill="currentColor">
                                        <path d="M19 4h-2V3a1 1 0 0 0-1-1H8a1 1 0 0 0-1 1v1H5a3 3 0 0 0-3 3v2a6 6 0 0 0 5 5.91V17a3 3 0 0 0 2 2.82V21H7a1 1 0 0 0 0 2h10a1 1 0 0 0 0-2h-2v-1.18A3 3 0 0 0 17 17v-2.09A6 6 0 0 0 22 9V7a3 3 0 0 0-3-3z" />
                                    </svg>
                                </div>
                                <div class="activity-meta">
                                    <h5 class="activity-title">Study Sprint Participation</h5>
                                    <span class="activity-sub">Community Challenge • Yesterday</span>
                                </div>
                            </div>
                            <span class="activity-amount">+500 XP</span>
                        </div>

                        <!-- Skeleton Preview Item -->
                        <div class="activity-skeleton-item"></div>
                    </div>

                    <p class="activity-loading-text">More history loading...</p>

                    <button type="button" class="btn-load-history" onclick="alert('All recent XP activities are up to date.')">
                        Load Full History
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
