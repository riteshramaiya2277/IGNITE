<%@ Page Title="Student Profile — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="IGNITE.Admin.StudentProfile" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/admin-student-profile.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile-container">
        
        <div class="back-link-wrapper">
            <a href="<%= ResolveUrl("~/Admin/Students.aspx") %>" class="back-link">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
                Back to Students
            </a>
        </div>

        <!-- Header Card -->
        <div class="profile-header-card">
            <div class="profile-header-left">
                <div class="profile-avatar-large">
                    <div class="status-dot"></div>
                </div>
                <div class="profile-info">
                    <h1>Elena Rodriguez <span class="badge-outline">ACTIVE ACCOUNT</span></h1>
                    <div class="student-id">Student ID: #STU-2401</div>
                    <div class="profile-meta">
                        <span>
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
                            elena.rodriguez@university.edu
                        </span>
                        <span>
                            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                            Joined Oct 12, 2023
                        </span>
                    </div>
                </div>
            </div>
            <div class="profile-header-right">
                <button type="button" class="btn-primary">Generate Report</button>
            </div>
        </div>

        <!-- Stats Row -->
        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-card-title">CURRENT LEVEL</div>
                <div class="stat-card-value">12 <span class="stat-card-sub highlight">+2 this month</span></div>
                <div class="progress-bar">
                    <div class="progress-fill"></div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-card-title">XP EARNED</div>
                <div class="stat-card-value">1,250 <span class="stat-card-sub">Total</span></div>
            </div>
            <div class="stat-card">
                <div class="stat-card-title">CURRENT STREAK</div>
                <div class="stat-card-value">15 <span class="stat-card-sub">Days</span></div>
                <div class="flame-icons">
                    <svg viewBox="0 0 24 24" fill="currentColor" stroke="none"><path d="M17.5 19c-1.5 1.5-3.5 1.5-4.5 1-1.5-.5-2.5-1.5-2.5-1.5C9.5 19 8 18 7.5 17c-1-2-.5-4.5 1-6.5-1.5 1.5-2 3.5-1 5-1-1-1.5-2.5-1-4 1-3.5 4-5.5 5.5-8.5-1.5 2-1.5 4 0 5 1-2.5 3.5-3 5-1.5 2 2.5 1.5 5.5 0 8z"/></svg>
                    <svg viewBox="0 0 24 24" fill="currentColor" stroke="none"><path d="M17.5 19c-1.5 1.5-3.5 1.5-4.5 1-1.5-.5-2.5-1.5-2.5-1.5C9.5 19 8 18 7.5 17c-1-2-.5-4.5 1-6.5-1.5 1.5-2 3.5-1 5-1-1-1.5-2.5-1-4 1-3.5 4-5.5 5.5-8.5-1.5 2-1.5 4 0 5 1-2.5 3.5-3 5-1.5 2 2.5 1.5 5.5 0 8z"/></svg>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17.5 19c-1.5 1.5-3.5 1.5-4.5 1-1.5-.5-2.5-1.5-2.5-1.5C9.5 19 8 18 7.5 17c-1-2-.5-4.5 1-6.5-1.5 1.5-2 3.5-1 5-1-1-1.5-2.5-1-4 1-3.5 4-5.5 5.5-8.5-1.5 2-1.5 4 0 5 1-2.5 3.5-3 5-1.5 2 2.5 1.5 5.5 0 8z"/></svg>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-card-title">QUESTS</div>
                <div class="stat-card-value">42 <span class="stat-card-sub">Done</span></div>
            </div>
        </div>

        <!-- Grid Layout -->
        <div class="profile-grid">
            <div class="profile-col-left">
                <!-- Contact & System -->
                <div class="section-card">
                    <div class="section-header">
                        <div class="section-title">CONTACT & SYSTEM</div>
                    </div>
                    <div class="data-list">
                        <div class="data-row">
                            <span class="data-label">Personal Email</span>
                            <span class="data-value">elena.r@gmail.com</span>
                        </div>
                        <div class="data-row">
                            <span class="data-label">Phone</span>
                            <span class="data-value">+1 (555) 012-3456</span>
                        </div>
                        <div class="data-row">
                            <span class="data-label">Last Login</span>
                            <span class="data-value">2 hours ago</span>
                        </div>
                        <div class="data-row">
                            <span class="data-label">IP Address</span>
                            <span class="data-value">192.168.1.45</span>
                        </div>
                    </div>
                </div>

                <!-- Achievements -->
                <div class="section-card">
                    <div class="section-header">
                        <div class="section-title">EARNED ACHIEVEMENTS</div>
                        <div class="badge-filled">3 UNLOCKED</div>
                    </div>
                    <div class="achievements-grid">
                        <div class="achievement-item">
                            <div class="ach-icon-circle" style="color:#D4AF37;">
                                <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/><path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/><path d="M4 22h16"/><path d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34"/><path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"/></svg>
                            </div>
                            <div class="ach-name">Fast Learner</div>
                        </div>
                        <div class="achievement-item">
                            <div class="ach-icon-circle" style="color:#F97316;">
                                <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                            </div>
                            <div class="ach-name">Streak Hero</div>
                        </div>
                        <div class="achievement-item">
                            <div class="ach-icon-circle" style="color:#EC4899;">
                                <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg>
                            </div>
                            <div class="ach-name">Top 1%</div>
                        </div>
                        <div class="achievement-item">
                            <div class="ach-icon-circle locked">
                                <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                            </div>
                            <div class="ach-name locked">Innovator</div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="profile-col-right">
                <!-- Academic Profile -->
                <div class="section-card">
                    <div class="section-header">
                        <div class="section-title">ACADEMIC PROFILE</div>
                    </div>
                    <div class="academic-grid">
                        <div class="academic-item">
                            <span class="academic-label">COLLEGE / DEPARTMENT</span>
                            <span class="academic-value">College of Engineering</span>
                        </div>
                        <div class="academic-item">
                            <span class="academic-label">COURSE OF STUDY</span>
                            <span class="academic-value">B.S. Computer Science</span>
                        </div>
                        <div class="academic-row-2">
                            <div class="academic-item">
                                <span class="academic-label">YEAR</span>
                                <span class="academic-value">3rd Year</span>
                            </div>
                            <div class="academic-item">
                                <span class="academic-label">SEMESTER</span>
                                <span class="academic-value">1st Semester</span>
                            </div>
                        </div>
                        <div class="academic-item" style="margin-top: 8px;">
                            <span class="academic-label">CUMULATIVE GPA</span>
                            <div class="gpa-value">
                                3.85 <span class="badge-green">Dean's List</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Account Management -->
                <div class="section-card">
                    <div class="section-header">
                        <div class="section-title" style="color: #D96A77;">ACCOUNT MANAGEMENT</div>
                    </div>
                    <div class="account-notice">
                        Managing student status will affect their ability to log in and participate in active challenges.
                    </div>
                    <button type="button" class="btn-danger-outline">Deactivate Student Account</button>
                    <button type="button" class="btn-text-muted">RESET PASSWORD</button>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
