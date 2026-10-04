<%@ Page Title="Overview — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="IGNITE.Admin.Overview" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/admin-overview.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="overview-container">
        
        <!-- Header Actions -->
        <div class="overview-header">
            <div class="header-actions">
                <button class="btn btn-primary" type="button">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
                    Create Challenge
                </button>
                <button class="btn btn-secondary" type="button">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
                    Create Quest
                </button>
                <button class="btn btn-secondary" type="button">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
                    Create Achievement
                </button>
            </div>
            <a href="<%= ResolveUrl("~/Admin/Students.aspx") %>" class="btn btn-secondary">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                View All Students
            </a>
        </div>

        <!-- Stats Grid -->
        <div class="stats-grid">
            <div class="stat-card">
                <span class="stat-title">TOTAL STUDENTS</span>
                <span class="stat-value"><asp:Literal ID="litTotalStudents" runat="server" Text="0"></asp:Literal></span>
                <span class="stat-subtext text-green">• Registered</span>
            </div>
            <div class="stat-card">
                <span class="stat-title">ACTIVE TODAY</span>
                <span class="stat-value"><asp:Literal ID="litActiveToday" runat="server" Text="0"></asp:Literal></span>
                <span class="stat-subtext text-green">• Live now</span>
            </div>
            <div class="stat-card">
                <span class="stat-title">ACTIVE CHALLENGES</span>
                <span class="stat-value highlight"><asp:Literal ID="litActiveChallenges" runat="server" Text="0"></asp:Literal></span>
                <span class="stat-subtext text-grey">Currently running</span>
            </div>
            <div class="stat-card">
                <span class="stat-title">DAILY QUESTS</span>
                <span class="stat-value"><asp:Literal ID="litDailyQuests" runat="server" Text="0"></asp:Literal></span>
                <span class="stat-subtext text-grey">Available</span>
            </div>
            <div class="stat-card">
                <span class="stat-title">ACHIEVEMENTS</span>
                <span class="stat-value"><asp:Literal ID="litTotalAchievements" runat="server" Text="0"></asp:Literal></span>
                <span class="stat-subtext text-grey">Published</span>
            </div>
            <div class="stat-card">
                <span class="stat-title">AVG STREAK</span>
                <span class="stat-value"><asp:Literal ID="litAvgStreak" runat="server" Text="0"></asp:Literal></span>
                <span class="stat-subtext text-orange">🔥 Days avg.</span>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-grid">
            
            <!-- Left Column -->
            <div class="left-col" style="display:flex; flex-direction:column; gap:24px;">
                
                <!-- Recent Student Activity -->
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-title">RECENT STUDENT ACTIVITY</span>
                        <a href="#" class="panel-action">View All</a>
                    </div>
                    <table class="activity-table">
                        <thead>
                            <tr>
                                <th>STUDENT</th>
                                <th>COURSE / YEAR</th>
                                <th>LEVEL / XP</th>
                                <th>STREAK</th>
                                <th>STATUS</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="phRecentActivity" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </table>

                    <div class="pagination">
                        <span class="pagination-text"><asp:Literal ID="litActivityPagination" runat="server" Text="Showing 0 students"></asp:Literal></span>
                        <a href="Students.aspx" class="action-link" style="font-size:12px;">View All Students →</a>
                    </div>
                </div>

                <!-- Active Challenges -->
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-title">ACTIVE CHALLENGES</span>
                        <a href="CreateChallenge.aspx" class="panel-action">Create Challenge</a>
                    </div>

                    <div class="challenge-list">
                        <asp:PlaceHolder ID="phActiveChallenges" runat="server"></asp:PlaceHolder>
                    </div>
                </div>

            </div>
            
            <!-- Right Column -->
            <div class="right-col" style="display:flex; flex-direction:column; gap:24px;">
                
                <!-- Achievements Panel -->
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-title">ACHIEVEMENTS</span>
                        <a href="#" class="panel-action">Manage</a>
                    </div>
                    
                    <div class="stats-list">
                        <div class="stat-row">
                            <span class="stat-label">Total Published</span>
                            <span class="stat-val"><asp:Literal ID="litTotalPublished" runat="server" Text="0"></asp:Literal></span>
                        </div>
                        <div class="stat-row">
                            <span class="stat-label">Active Global</span>
                            <span class="stat-val"><asp:Literal ID="litActiveGlobal" runat="server" Text="0"></asp:Literal></span>
                        </div>
                        <div class="stat-row">
                            <span class="stat-label">Recently Added</span>
                            <span class="stat-val green"><asp:Literal ID="litRecentlyAdded" runat="server" Text="+0"></asp:Literal></span>
                        </div>
                        <div class="stat-row">
                            <span class="stat-label">Hidden/Draft</span>
                            <span class="stat-val" style="color:#888;"><asp:Literal ID="litHiddenDraft" runat="server" Text="0"></asp:Literal></span>
                        </div>
                    </div>
                    
                    <div class="panel-title" style="font-size:10px; color:#999; margin-bottom:8px;">RECENT ACHIEVEMENT</div>
                    <div class="recent-achievement">
                        <div class="ach-icon">🏆</div>
                        <div>
                            <div class="ach-title">Early Bird Streak</div>
                            <div class="ach-date">Created 2 days ago</div>
                        </div>
                    </div>
                </div>

                <!-- Recurring Quests Panel -->
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-title">RECURRING QUESTS</span>
                        <a href="Quests.aspx" class="panel-action">Manage Quests</a>
                    </div>

                    <div class="quest-list">
                        <asp:PlaceHolder ID="phActiveQuests" runat="server"></asp:PlaceHolder>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
