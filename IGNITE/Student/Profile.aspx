<%@ Page Title="Profile — IGNITE" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="IGNITE.Student.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/profile.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Profile
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile-canvas">
        <!-- 1. Profile Overview Canvas (Matching Screenshot Exactly) -->
        <asp:Panel ID="pnlProfileOverview" runat="server">
            <!-- Header with Title & Subtitle -->
            <div class="profile-header">
                <h1 class="profile-title">Profile</h1>
                <p class="profile-subtitle">Your progress, identity, and achievements</p>
            </div>

            <!-- Profile Hero Banner Card -->
            <div class="profile-hero-card" style="margin-top: 20px;">
                <div class="profile-hero-left">
                    <div class="profile-hero-avatar-wrap">
                        <div class="profile-hero-avatar">
                            <span><asp:Literal ID="litHeroInitials" runat="server">AM</asp:Literal></span>
                        </div>
                        <span class="profile-hero-lvl-badge">
                            <asp:Literal ID="litHeroLvlBadge" runat="server">LVL 12</asp:Literal>
                        </span>
                    </div>

                    <div class="profile-hero-meta">
                        <h2 class="profile-hero-name">
                            <asp:Literal ID="litHeroName" runat="server">Alex Mercer</asp:Literal>
                        </h2>
                        <p class="profile-hero-institution">
                            <asp:Literal ID="litHeroInstitution" runat="server">Stanford University</asp:Literal>
                        </p>
                        <div class="profile-hero-tags">
                            <span class="profile-hero-tag">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M22 10v6M2 10l10-5 10 5-10 5z"></path>
                                    <path d="M6 12v5c3 3 9 3 12 0v-5"></path>
                                </svg>
                                <asp:Literal ID="litHeroMajor" runat="server">Computer Science</asp:Literal>
                            </span>
                            <span class="profile-hero-tag">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                                <asp:Literal ID="litHeroSemester" runat="server">Junior / 5th Sem</asp:Literal>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="profile-hero-right">
                    <button type="button" class="btn-edit-profile-pill" onclick="toggleEditPreferencesView()">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                            <path d="M12 20h9"></path>
                            <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                        </svg>
                        <span>Edit Profile</span>
                    </button>
                </div>
            </div>

            <!-- Two Column Section Grid -->
            <div class="profile-overview-grid" style="margin-top: 24px;">
                <!-- Left Column: Academic Profile -->
                <div class="profile-section-card">
                    <div class="profile-section-header">
                        <div class="profile-section-title-wrap">
                            <div class="profile-section-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <h3 class="profile-section-title">Academic Profile</h3>
                        </div>
                    </div>

                    <!-- Meta Grid (University, Major, Academic Year, Current Semester) -->
                    <div class="academic-fields-grid">
                        <div class="academic-field-item">
                            <span class="academic-field-label">UNIVERSITY</span>
                            <span class="academic-field-value">
                                <asp:Literal ID="litAcademicUniv" runat="server">Stanford University</asp:Literal>
                            </span>
                        </div>
                        <div class="academic-field-item">
                            <span class="academic-field-label">MAJOR</span>
                            <span class="academic-field-value">
                                <asp:Literal ID="litAcademicMajor" runat="server">Computer Science</asp:Literal>
                            </span>
                        </div>
                        <div class="academic-field-item">
                            <span class="academic-field-label">ACADEMIC YEAR</span>
                            <span class="academic-field-value">
                                <asp:Literal ID="litAcademicYear" runat="server">2023-2024</asp:Literal>
                            </span>
                        </div>
                        <div class="academic-field-item">
                            <span class="academic-field-label">CURRENT SEMESTER</span>
                            <span class="academic-field-value">
                                <asp:Literal ID="litAcademicSemester" runat="server">5th Semester</asp:Literal>
                            </span>
                        </div>
                    </div>

                    <!-- Academic Goals Sub-Section -->
                    <div class="academic-goals-group">
                        <span class="academic-goals-label">ACADEMIC GOALS</span>

                        <!-- Goal 1 -->
                        <div class="academic-goal-item">
                            <div class="goal-checkbox-custom checked" onclick="toggleGoalCheck(this)">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </div>
                            <span class="academic-goal-text">Maintain 3.8 GPA in Core Modules</span>
                        </div>

                        <!-- Goal 2 -->
                        <div class="academic-goal-item">
                            <div class="goal-checkbox-custom" onclick="toggleGoalCheck(this)">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" style="display: none;">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </div>
                            <span class="academic-goal-text">Complete AI Research Project</span>
                        </div>

                        <!-- Goal 3 -->
                        <div class="academic-goal-item">
                            <div class="goal-checkbox-custom" onclick="toggleGoalCheck(this)">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" style="display: none;">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </div>
                            <span class="academic-goal-text">Secure Software Engineering Internship</span>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Overall Progress & Recent Achievements -->
                <div style="display: flex; flex-direction: column; gap: 24px;">
                    <!-- Overall Progress Card -->
                    <div class="profile-section-card">
                        <div class="profile-section-header">
                            <h3 class="profile-section-title">Overall Progress</h3>
                        </div>

                        <div class="overall-progress-list">
                            <!-- Streak -->
                            <div class="progress-stat-row">
                                <div class="progress-stat-left">
                                    <div class="progress-stat-icon-wrap icon-wrap-streak">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
                                            <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                                        </svg>
                                    </div>
                                    <span class="progress-stat-label">Streak</span>
                                </div>
                                <span class="progress-stat-value value-streak">
                                    <asp:Literal ID="litTotalStreak" runat="server">15 Days</asp:Literal>
                                </span>
                            </div>

                            <!-- Challenges -->
                            <div class="progress-stat-row">
                                <div class="progress-stat-left">
                                    <div class="progress-stat-icon-wrap icon-wrap-challenges">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.5">
                                            <circle cx="12" cy="12" r="10"></circle>
                                            <polyline points="16 8 10 14 7 11"></polyline>
                                        </svg>
                                    </div>
                                    <span class="progress-stat-label">Challenges</span>
                                </div>
                                <span class="progress-stat-value value-challenges">
                                    <asp:Literal ID="litTotalChallenges" runat="server">42 Total</asp:Literal>
                                </span>
                            </div>

                            <!-- Total XP -->
                            <div class="progress-stat-row">
                                <div class="progress-stat-left">
                                    <div class="progress-stat-icon-wrap icon-wrap-xp">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
                                            <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                        </svg>
                                    </div>
                                    <span class="progress-stat-label">Total XP</span>
                                </div>
                                <span class="progress-stat-value value-xp">
                                    <asp:Literal ID="litTotalXP" runat="server">12,400</asp:Literal>
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Achievements Card -->
                    <div class="profile-section-card">
                        <div class="profile-section-header">
                            <div>
                                <div style="display: flex; align-items: center; gap: 8px;">
                                    <span style="color: #D97706; font-size: 1.15rem; display: flex; align-items: center;">
                                        <svg viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
                                            <path d="M19 4h-2V3a1 1 0 0 0-1-1H8a1 1 0 0 0-1 1v1H5a3 3 0 0 0-3 3v2a6 6 0 0 0 5 5.91V17a3 3 0 0 0 2 2.82V21H7a1 1 0 0 0 0 2h10a1 1 0 0 0 0-2h-2v-1.18A3 3 0 0 0 17 17v-2.09A6 6 0 0 0 22 9V7a3 3 0 0 0-3-3zM4 9V7a1 1 0 0 1 1-1h2v4.82A4 4 0 0 1 4 9zm16 0a4 4 0 0 1-3 1.82V6h2a1 1 0 0 1 1 1z" />
                                        </svg>
                                    </span>
                                    <h3 class="profile-section-title">Recent Achievements</h3>
                                </div>
                                <p class="profile-section-subtitle">
                                    <asp:Literal ID="litBadgeCount" runat="server">24 Badges Unlocked</asp:Literal>
                                </p>
                            </div>
                            <a href="<%= ResolveUrl("~/Student/Achievements.aspx") %>" class="profile-section-link">View All Achievements</a>
                        </div>

                        <!-- 4 Badges Row -->
                        <div class="achievements-badges-row">
                            <!-- Badge 1: 15 Day Streak -->
                            <div class="achievement-badge-col">
                                <div class="achievement-badge-circle badge-bg-flame" title="15 Day Streak">
                                    <svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
                                        <path d="M12 2C10.5 4.5 10 6.5 10 8.5C10 10.5 11 11.5 11 13C11 14 10 15 9 15C8 15 7 14 7 12.5C7 10 5.5 8.5 4.5 8C4.5 12 6.5 15.5 9 18C11.5 20.5 14.5 21.5 17 20C19.5 18.5 20.5 15.5 20 13C19.5 10.5 18 9 17 8C17 9.5 16 10.5 15 10.5C14 10.5 13.5 9.5 13.5 8C13.5 5.5 15 3.5 16 2.5C14.5 2 13 2 12 2Z" />
                                    </svg>
                                </div>
                                <span class="achievement-badge-label">15 Day Streak</span>
                            </div>

                            <!-- Badge 2: Mindful Learner -->
                            <div class="achievement-badge-col">
                                <div class="achievement-badge-circle badge-bg-brain" title="Mindful Learner">
                                    <svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
                                        <path d="M12 2a5 5 0 0 0-5 5c0 1.5.7 2.8 1.7 3.7C6.4 11.7 5 13.7 5 16a5 5 0 0 0 6 4.9V22h2v-1.1A5 5 0 0 0 19 16c0-2.3-1.4-4.3-3.7-5.3 1-.9 1.7-2.2 1.7-3.7a5 5 0 0 0-5-5zm-1 2.1c.3 0 .7 0 1 .1V6h-1V4.1zm-2 .6c.6-.5 1.3-.7 2-.7V6H9V4.7zm6 0V6h-2V4c.7 0 1.4.2 2 .7zm-3 8.3c1.7 0 3 1.3 3 3s-1.3 3-3 3-3-1.3-3-3 1.3-3 3-3z" />
                                    </svg>
                                </div>
                                <span class="achievement-badge-label">Mindful Learner</span>
                            </div>

                            <!-- Badge 3: Star Scholar -->
                            <div class="achievement-badge-col">
                                <div class="achievement-badge-circle badge-bg-star" title="Star Scholar">
                                    <svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
                                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                    </svg>
                                </div>
                                <span class="achievement-badge-label">Star Scholar</span>
                            </div>

                            <!-- Badge 4: Goal Crusher (Locked) -->
                            <div class="achievement-badge-col">
                                <div class="achievement-badge-circle badge-bg-locked" title="Goal Crusher (Locked)">
                                    <svg viewBox="0 0 24 24" width="22" height="22" fill="currentColor">
                                        <path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c-0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z" />
                                    </svg>
                                </div>
                                <span class="achievement-badge-label">Goal Crusher</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- 2. Edit Profile / Manage Preferences Section (Can be toggled) -->
        <asp:Panel ID="pnlPreferencesSection" runat="server" style="display: none; margin-top: 10px;">
            <div style="display: flex; align-items: center; margin-bottom: 12px;">
                <button type="button" class="btn-discard-preferences" onclick="toggleEditPreferencesView()" style="display: inline-flex; align-items: center; gap: 6px; font-size: 0.9rem; font-weight: 700; color: #57534E;">
                    <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.5">
                        <line x1="19" y1="12" x2="5" y2="12"></line>
                        <polyline points="12 19 5 12 12 5"></polyline>
                    </svg>
                    <span>Back to Profile Overview</span>
                </button>
            </div>

            <!-- Profile Information Card -->
            <div class="pref-card">
                <h2 class="pref-card-title">Edit Profile Information</h2>

                <div class="profile-info-grid">
                    <!-- Top Row: Avatar + Full Name + Email Address -->
                    <div class="profile-avatar-row">
                        <!-- Avatar Upload -->
                        <div class="avatar-upload-box">
                            <div class="avatar-circle" id="avatarDisplay">
                                <span id="avatarInitials">AM</span>
                            </div>
                            <label for="avatarUploadInput" class="avatar-camera-btn" title="Change Avatar Image">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
                                    <circle cx="12" cy="13" r="4"></circle>
                                </svg>
                            </label>
                            <input type="file" id="avatarUploadInput" accept="image/*" style="display: none;" onchange="handleAvatarSelected(event)" />
                        </div>

                        <!-- Full Name -->
                        <div class="pref-field-group">
                            <label class="pref-field-label">Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="pref-input" Text="Alex Mercer" placeholder="Enter your full name" />
                        </div>

                        <!-- Email Address -->
                        <div class="pref-field-group">
                            <label class="pref-field-label">Email Address</label>
                            <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="pref-input" Text="alex.mercer@university.edu" TextMode="Email" placeholder="Enter your university email" />
                        </div>
                    </div>

                    <!-- Middle Row: College / Institution + Current Course -->
                    <div class="pref-form-row">
                        <div class="pref-field-group">
                            <label class="pref-field-label">College / Institution</label>
                            <div class="pref-select-wrap">
                                <asp:DropDownList ID="ddlCollege" runat="server" CssClass="pref-select">
                                    <asp:ListItem Text="Stanford University" Value="Stanford University" Selected="True" />
                                    <asp:ListItem Text="Institute of Modern Science" Value="Institute of Modern Science" />
                                    <asp:ListItem Text="Faculty of Engineering &amp; Technology" Value="Faculty of Engineering & Technology" />
                                    <asp:ListItem Text="School of Humanities &amp; Social Arts" Value="School of Humanities & Social Arts" />
                                    <asp:ListItem Text="College of Health Sciences" Value="College of Health Sciences" />
                                </asp:DropDownList>
                                <span class="pref-select-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </span>
                            </div>
                        </div>

                        <div class="pref-field-group">
                            <label class="pref-field-label">Current Course</label>
                            <div class="pref-select-wrap">
                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="pref-select">
                                    <asp:ListItem Text="Computer Science" Value="Computer Science" Selected="True" />
                                    <asp:ListItem Text="B.Sc. Biology &amp; Chemistry" Value="B.Sc. Biology & Chemistry" />
                                    <asp:ListItem Text="B.Eng. Mechanical Engineering" Value="B.Eng. Mechanical Engineering" />
                                    <asp:ListItem Text="B.A. Cognitive Psychology" Value="B.A. Cognitive Psychology" />
                                </asp:DropDownList>
                                <span class="pref-select-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- Bottom Row: Academic Year + Semester -->
                    <div class="pref-form-row">
                        <div class="pref-field-group">
                            <label class="pref-field-label">Academic Year</label>
                            <div class="pref-select-wrap">
                                <asp:DropDownList ID="ddlAcademicYear" runat="server" CssClass="pref-select">
                                    <asp:ListItem Text="Freshman (Year 1)" Value="Freshman (Year 1)" />
                                    <asp:ListItem Text="Sophomore (Year 2)" Value="Sophomore (Year 2)" />
                                    <asp:ListItem Text="Junior (Year 3)" Value="Junior (Year 3)" Selected="True" />
                                    <asp:ListItem Text="Senior (Year 4)" Value="Senior (Year 4)" />
                                </asp:DropDownList>
                                <span class="pref-select-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </span>
                            </div>
                        </div>

                        <div class="pref-field-group">
                            <label class="pref-field-label">Semester</label>
                            <div class="pref-select-wrap">
                                <asp:DropDownList ID="ddlSemester" runat="server" CssClass="pref-select">
                                    <asp:ListItem Text="5th Semester" Value="5th Semester" Selected="True" />
                                    <asp:ListItem Text="Fall 2024" Value="Fall 2024" />
                                    <asp:ListItem Text="Spring 2025" Value="Spring 2025" />
                                    <asp:ListItem Text="Summer 2025" Value="Summer 2025" />
                                </asp:DropDownList>
                                <span class="pref-select-icon">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- Form Action Buttons -->
                    <div class="pref-actions-row">
                        <asp:Button ID="btnSaveProfile" runat="server" CssClass="btn-save-preferences" Text="Save Profile Changes" OnClick="btnSaveProfile_Click" />
                        <button type="button" class="btn-discard-preferences" onclick="toggleEditPreferencesView()">Cancel</button>
                    </div>
                </div>
            </div>

            <!-- Password & Security Card -->
            <div class="security-card" style="margin-top: 20px;">
                <div class="security-info">
                    <h3 class="security-title">Password &amp; Security</h3>
                    <p class="security-subtitle">Last changed 3 months ago. We recommend regular updates.</p>
                </div>

                <div class="security-actions">
                    <a href="ChangePassword.aspx" class="btn-change-password-link">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 2l-2 2m-1.5 1.5L14 9l-1.5-1.5L11 9l-1.5-1.5L8 9l-1.5-1.5L5 9l-3 3 7 7 3-3-1.5-1.5L12 13l1.5-1.5L15 13l1.5-1.5L18 13l1.5-1.5L21 10z"></path>
                        </svg>
                        <span>Change Password</span>
                    </a>

                    <asp:LinkButton ID="btnLogoutSecurity" runat="server" CssClass="btn-security-logout" OnClick="btnLogoutSecurity_Click" CausesValidation="false">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                        </svg>
                        <span>Logout</span>
                    </asp:LinkButton>
                </div>
            </div>

            <!-- Danger Zone Card -->
            <div class="danger-zone-card" style="margin-top: 20px;">
                <div class="danger-zone-left">
                    <div class="danger-icon-wrap">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                            <line x1="12" y1="9" x2="12" y2="13"></line>
                            <line x1="12" y1="17" x2="12.01" y2="17"></line>
                        </svg>
                    </div>
                    <div class="danger-content">
                        <h3 class="danger-title">Danger Zone</h3>
                        <p class="danger-desc">Deleting your account is permanent. All your streak data, quest progress, and journal entries will be lost forever.</p>
                    </div>
                </div>

                <button type="button" class="btn-delete-account-outline" onclick="openDeleteAccountModal()">Delete My Account</button>
            </div>
        </asp:Panel>
    </div>

    <!-- Modal: Delete Account Confirmation -->
    <div id="deleteModal" class="pref-modal-overlay" onclick="closeOnOverlay(event, 'deleteModal')">
        <div class="pref-modal-card" style="border-color: #FCA5A5;">
            <div class="pref-modal-header">
                <h3 class="pref-modal-title" style="color: #DC2626;">Delete Account</h3>
                <button type="button" class="btn-pref-close-modal" onclick="closeModal('deleteModal')">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
            </div>
            <div class="pref-modal-body">
                <p style="font-size: 0.9rem; color: #4B5563; line-height: 1.5; margin: 0;">
                    Are you absolutely sure you want to delete your account? This action <strong>cannot be undone</strong>. Your study records, level progress, badges, and habits history will be permanently deleted.
                </p>
                <div class="pref-field-group" style="margin-top: 6px;">
                    <label class="pref-field-label">Type "DELETE" to confirm</label>
                    <input type="text" id="txtDeleteConfirm" class="pref-input" placeholder="DELETE" />
                </div>
            </div>
            <div class="pref-modal-footer">
                <button type="button" class="btn-discard-preferences" onclick="closeModal('deleteModal')">Cancel</button>
                <button type="button" class="btn-delete-account-outline" style="background-color: #EF4444; color: #FFFFFF;" onclick="confirmDeleteAccount()">Permanently Delete</button>
            </div>
        </div>
    </div>

    <!-- Toast Notification -->
    <div id="profileToast" class="toast-notice">
        <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2.5">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
        <span id="profileToastMessage">Profile preferences saved successfully!</span>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        // Handle Avatar File Selection
        function handleAvatarSelected(event) {
            var file = event.target.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var display = document.getElementById('avatarDisplay');
                    if (display) {
                        display.innerHTML = '<img src="' + e.target.result + '" alt="Avatar" />';
                    }
                    showToast('Avatar image updated!');
                };
                reader.readAsDataURL(file);
            }
        }

        // Toggle between Profile Overview and Edit Preferences
        function toggleEditPreferencesView() {
            var overview = document.getElementById('<%= pnlProfileOverview.ClientID %>');
            var editPrefs = document.getElementById('<%= pnlPreferencesSection.ClientID %>');
            if (overview && editPrefs) {
                if (editPrefs.style.display === 'none' || editPrefs.style.display === '') {
                    overview.style.display = 'none';
                    editPrefs.style.display = 'block';
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                } else {
                    editPrefs.style.display = 'none';
                    overview.style.display = 'block';
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                }
            }
        }

        // Toggle Academic Goal checkboxes
        function toggleGoalCheck(el) {
            var isChecked = el.classList.contains('checked');
            var svg = el.querySelector('svg');
            if (isChecked) {
                el.classList.remove('checked');
                if (svg) svg.style.display = 'none';
            } else {
                el.classList.add('checked');
                if (svg) svg.style.display = 'block';
            }
        }

        // Modals
        function openDeleteAccountModal() {
            var modal = document.getElementById('deleteModal');
            if (modal) modal.classList.add('active');
        }

        function closeModal(modalId) {
            var modal = document.getElementById(modalId);
            if (modal) modal.classList.remove('active');
        }

        function closeOnOverlay(e, modalId) {
            if (e.target.id === modalId) {
                closeModal(modalId);
            }
        }

        // Confirm Delete Account
        function confirmDeleteAccount() {
            var confirmTxt = document.getElementById('txtDeleteConfirm').value;
            if (confirmTxt.trim().toUpperCase() !== 'DELETE') {
                alert('Please type DELETE to confirm account removal.');
                return;
            }
            closeModal('deleteModal');
            alert('Your account deletion request has been submitted.');
            window.location.href = '<%= ResolveUrl("~/Student/Dashboard.aspx") %>';
        }

        // Toast feedback
        function showToast(msg) {
            var toast = document.getElementById('profileToast');
            var toastMsg = document.getElementById('profileToastMessage');
            if (toast && toastMsg) {
                toastMsg.innerText = msg;
                toast.classList.add('show');
                setTimeout(function () {
                    toast.classList.remove('show');
                }, 3500);
            }
        }

        // Auto-show edit section if url contains ?edit=true or #edit
        document.addEventListener('DOMContentLoaded', function () {
            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('edit') === 'true' || window.location.hash === '#edit') {
                toggleEditPreferencesView();
            }
        });
    </script>
</asp:Content>
