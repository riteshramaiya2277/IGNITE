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
                <span class="stat-value">1,284</span>
                <span class="stat-subtext text-green">↑ 12% inc</span>
            </div>
            <div class="stat-card">
                <span class="stat-title">ACTIVE TODAY</span>
                <span class="stat-value">452</span>
                <span class="stat-subtext text-green">• Live now</span>
            </div>
            <div class="stat-card">
                <span class="stat-title">ACTIVE CHALLENGES</span>
                <span class="stat-value highlight">18</span>
                <span class="stat-subtext text-grey">3 ending soon</span>
            </div>
            <div class="stat-card">
                <span class="stat-title">DAILY QUESTS</span>
                <span class="stat-value">42</span>
                <span class="stat-subtext text-grey">95% completion</span>
            </div>
            <div class="stat-card">
                <span class="stat-title">ACHIEVEMENTS</span>
                <span class="stat-value">156</span>
                <span class="stat-subtext text-grey">4 new this week</span>
            </div>
            <div class="stat-card">
                <span class="stat-title">AVG STREAK</span>
                <span class="stat-value">5.4</span>
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
                            <tr>
                                <td>
                                    <div class="student-info">
                                        <div class="avatar">SJ</div>
                                        <div>
                                            <div class="student-name">Sarah Jenkins</div>
                                            <div class="student-email">sarah.j@edu.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="course-name">Computer Science</div>
                                    <div class="course-year">Year 3</div>
                                </td>
                                <td>
                                    <span class="level-badge">Lvl 24</span>
                                    <span class="xp-text">12.4k XP</span>
                                </td>
                                <td>
                                    <span class="streak-text">🔥 12</span>
                                </td>
                                <td>
                                    <span class="status-badge active">ACTIVE</span>
                                </td>
                                <td>
                                    <a href="#" class="action-link">Profile</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="student-info">
                                        <div class="avatar">MT</div>
                                        <div>
                                            <div class="student-name">Marcus Thorne</div>
                                            <div class="student-email">m.thorne@edu.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="course-name">Digital Arts</div>
                                    <div class="course-year">Year 1</div>
                                </td>
                                <td>
                                    <span class="level-badge">Lvl 8</span>
                                    <span class="xp-text">3.2k XP</span>
                                </td>
                                <td>
                                    <span class="streak-text zero">🔥 0</span>
                                </td>
                                <td>
                                    <span class="status-badge inactive">INACTIVE</span>
                                </td>
                                <td>
                                    <a href="#" class="action-link">Profile</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="student-info">
                                        <div class="avatar">ER</div>
                                        <div>
                                            <div class="student-name">Elena Rodriguez</div>
                                            <div class="student-email">elena.r@edu.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="course-name">Biolology</div>
                                    <div class="course-year">Year 2</div>
                                </td>
                                <td>
                                    <span class="level-badge">Lvl 19</span>
                                    <span class="xp-text">2.8k XP</span>
                                </td>
                                <td>
                                    <span class="streak-text">🔥 42</span>
                                </td>
                                <td>
                                    <span class="status-badge active">ACTIVE</span>
                                </td>
                                <td>
                                    <a href="#" class="action-link">Profile</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="pagination">
                        <span class="pagination-text">Showing 1-3 of 1,284 students</span>
                        <div class="pagination-controls">
                            <button class="page-btn"><</button>
                            <button class="page-btn active">1</button>
                            <button class="page-btn">2</button>
                            <button class="page-btn">3</button>
                            <button class="page-btn">></button>
                        </div>
                    </div>
                </div>

                <!-- Active Challenges -->
                <div class="panel">
                    <div class="panel-header">
                        <span class="panel-title">ACTIVE CHALLENGES</span>
                        <a href="#" class="panel-action">Create Challenge</a>
                    </div>
                    
                    <div class="challenge-list">
                        <div class="challenge-card">
                            <div class="challenge-info">
                                <div class="challenge-icon code">
                                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg>
                                </div>
                                <div>
                                    <div class="challenge-title">Daily Algorithm Sprint</div>
                                    <div class="challenge-meta">ACADEMIC &nbsp;•&nbsp; <span>Intermediate</span></div>
                                </div>
                            </div>
                            <div class="challenge-stats">
                                <div>
                                    <div class="participants">248 Participants</div>
                                    <div class="ends-in">Ends in 3 days</div>
                                </div>
                                <span class="status-badge active">ACTIVE</span>
                            </div>
                        </div>

                        <div class="challenge-card">
                            <div class="challenge-info">
                                <div class="challenge-icon creative">
                                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2a10 10 0 1 0 10 10 4 4 0 0 1-5-5 4 4 0 0 1-5-5"></path><path d="M8.5 8.5v.01"></path><path d="M16 12.5v.01"></path><path d="M12 16v.01"></path><path d="M11 7.5v.01"></path></svg>
                                </div>
                                <div>
                                    <div class="challenge-title">Portfolio Revision 2024</div>
                                    <div class="challenge-meta">CREATIVE &nbsp;•&nbsp; <span class="purple">Advanced</span></div>
                                </div>
                            </div>
                            <div class="challenge-stats">
                                <div>
                                    <div class="participants">112 Participants</div>
                                    <div class="ends-in">Ends in 12 days</div>
                                </div>
                                <span class="status-badge active">ACTIVE</span>
                            </div>
                        </div>
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
                            <span class="stat-val">156</span>
                        </div>
                        <div class="stat-row">
                            <span class="stat-label">Active Global</span>
                            <span class="stat-val">42</span>
                        </div>
                        <div class="stat-row">
                            <span class="stat-label">Recently Added</span>
                            <span class="stat-val green">+4</span>
                        </div>
                        <div class="stat-row">
                            <span class="stat-label">Hidden/Draft</span>
                            <span class="stat-val" style="color:#888;">12</span>
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
                        <a href="#" class="panel-action">Manage Quests</a>
                    </div>
                    
                    <div class="quest-list">
                        <div class="quest-item">
                            <div class="quest-info">
                                <div class="quest-icon">☀️</div>
                                <div>
                                    <div class="quest-title">The Early Riser</div>
                                    <div class="quest-desc">Daily • Login before 8:00 AM</div>
                                </div>
                            </div>
                            <div class="quest-stats">
                                <div>
                                    <div class="quest-participants">382 Students</div>
                                    <div class="quest-trend stable">Stable</div>
                                </div>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#ccc" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                            </div>
                        </div>
                        
                        <div class="quest-item">
                            <div class="quest-info">
                                <div class="quest-icon">📚</div>
                                <div>
                                    <div class="quest-title">Research Weekend</div>
                                    <div class="quest-desc">Weekly • Library log-ins</div>
                                </div>
                            </div>
                            <div class="quest-stats">
                                <div>
                                    <div class="quest-participants">94 Students</div>
                                    <div class="quest-trend dropping">Dropping</div>
                                </div>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#ccc" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                            </div>
                        </div>
                        
                        <div class="quest-item">
                            <div class="quest-info">
                                <div class="quest-icon">🗣️</div>
                                <div>
                                    <div class="quest-title">Community Pillar</div>
                                    <div class="quest-desc">Weekly • Help 5 peers in forum</div>
                                </div>
                            </div>
                            <div class="quest-stats">
                                <div>
                                    <div class="quest-participants">156 Students</div>
                                    <div class="quest-trend rising">Rising</div>
                                </div>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#ccc" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                            </div>
                        </div>
                        
                        <div class="quest-item">
                            <div class="quest-info">
                                <div class="quest-icon">🔒</div>
                                <div>
                                    <div class="quest-title" style="color:#888;">Final Exams Grind</div>
                                    <div class="quest-desc">Event • Scheduled for Dec 1st</div>
                                </div>
                            </div>
                            <div class="quest-stats">
                                <div>
                                    <div class="quest-participants" style="visibility:hidden;">0</div>
                                    <div class="quest-trend queued">Queued</div>
                                </div>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#ccc" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
