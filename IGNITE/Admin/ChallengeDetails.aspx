<%@ Page Title="Challenge Details — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ChallengeDetails.aspx.cs" Inherits="IGNITE.Admin.ChallengeDetails" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/admin-challenge-details.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="TopbarContent" ContentPlaceHolderID="TopbarContent" runat="server">
    <div style="display:flex; justify-content:space-between; align-items:center; width:100%;">
        <div style="display:flex; align-items:center; gap:16px;">
            <a href="Challenges.aspx" style="display:flex; align-items:center; justify-content:center; width:32px; height:32px; border-radius:50%; border:1px solid #ccc; color:#1a1a1a; text-decoration:none;">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px;height:16px;"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
            </a>
            <span style="font-size:18px; font-weight:800; color:#1a1a1a;">Challenge Details</span>
        </div>
        
        <div style="display:flex; align-items:center; background:#fff; border-radius:8px; padding:8px 16px; width:280px; border:1px solid #E0DCD3;">
            <svg viewBox="0 0 24 24" fill="none" stroke="#999" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px; height:16px;">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
            <input type="text" placeholder="Search..." style="border:none; outline:none; font-size:13px; margin-left:10px; width:100%; background:transparent; font-family:inherit;" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="details-container">
        
        <div class="details-header">
            <div>
                <div class="details-title-row">
                    <h1>Mastering React Hooks</h1>
                    <span class="badge-published">PUBLISHED</span>
                </div>
                <div class="details-subtitle">
                    <span>
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path></svg>
                        Web Development
                    </span>
                    <span>&bull;</span>
                    <span>
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="20" x2="12" y2="10"></line><line x1="18" y1="20" x2="18" y2="4"></line><line x1="6" y1="20" x2="6" y2="16"></line></svg>
                        Intermediate
                    </span>
                </div>
            </div>
            <div style="display:flex; gap:10px; align-items:center;">
                <a href="EditChallenge.aspx" class="btn-archive" style="background:#D96A77; color:#fff; border-color:#D96A77; text-decoration:none;">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                    Edit Challenge
                </a>
                <button type="button" class="btn-archive">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="21 8 21 21 3 21 3 8"></polyline><rect x="1" y="3" width="22" height="5"></rect><line x1="10" y1="12" x2="14" y2="12"></line></svg>
                    Archive
                </button>
            </div>
        </div>

        <div class="details-grid">
            <div class="details-col-left">
                <!-- Description Card -->
                <div class="info-card">
                    <div class="info-card-title">Description</div>
                    <div class="desc-text">
                        Dive deep into the world of React's state management and side effects. This challenge focuses on building performant functional components using <span class="code-inline">useState</span>, <span class="code-inline">useEffect</span>, and <span class="code-inline">useMemo</span>. Students will refactor a complex class-based dashboard into a streamlined functional architecture while maintaining strict performance benchmarks.
                    </div>
                    
                    <div class="inner-grid-2">
                        <div>
                            <div class="info-card-title">Dates & Timeline</div>
                            <div class="data-row">
                                <span class="data-label">Starts</span>
                                <span class="data-value">Oct 15, 2023</span>
                            </div>
                            <div class="data-row">
                                <span class="data-label">Ends</span>
                                <span class="data-value">Nov 30, 2023</span>
                            </div>
                        </div>
                        <div>
                            <div class="info-card-title">Requirements</div>
                            <div class="req-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><polyline points="9 12 11 14 15 10"></polyline></svg>
                                Complete 5 sub-tasks
                            </div>
                            <div class="req-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><polyline points="9 12 11 14 15 10"></polyline></svg>
                                Minimum Level 5
                            </div>
                        </div>
                    </div>

                    <div class="info-card-title">Rewards upon Completion</div>
                    <div class="rewards-row">
                        <div class="reward-box yellow">
                            <div class="reward-icon yellow">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor" stroke="currentColor" stroke-width="1"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                            </div>
                            <div>
                                <div class="reward-text-1">500 XP</div>
                                <div class="reward-text-2">Bonus Points</div>
                            </div>
                        </div>
                        <div class="reward-box pink">
                            <div class="reward-icon pink">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor" stroke="currentColor" stroke-width="1"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg>
                            </div>
                            <div>
                                <div class="reward-text-1">Hook Master</div>
                                <div class="reward-text-2">Rare Achievement</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Technical Configuration -->
                <div class="info-card">
                    <div class="info-card-title">Technical Configuration</div>
                    <div class="inner-grid-2" style="margin-bottom:0;">
                        <div>
                            <div class="data-row">
                                <span class="data-label">Auto-approval</span>
                                <span class="data-value"><span style="color:#10B981; margin-right:4px;">●</span> Enabled</span>
                            </div>
                            <div class="data-row">
                                <span class="data-label">Visibility</span>
                                <span class="data-value">Public</span>
                            </div>
                            <div class="data-row">
                                <span class="data-label">Review Required</span>
                                <span class="data-value">No</span>
                            </div>
                        </div>
                        <div>
                            <div class="data-row">
                                <span class="data-label">Team-based Challenge</span>
                                <span class="data-value">Individual Only</span>
                            </div>
                            <div class="data-row">
                                <span class="data-label">Submission Limit</span>
                                <span class="data-value">Unlimited</span>
                            </div>
                            <div class="data-row">
                                <span class="data-label">Late Submission</span>
                                <span class="data-value">Not Allowed</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="details-col-right">
                <div class="info-card">
                    <div class="preview-header">
                        <div class="preview-title">Student Preview</div>
                        <div class="preview-badge">CARD VIEW</div>
                    </div>
                    
                    <div class="preview-image">
                        <span class="img-badge">WEB DEV</span>
                    </div>

                    <div class="pv-title">Mastering React Hooks</div>
                    <div class="pv-stats">
                        <div class="pv-xp">
                            <svg viewBox="0 0 24 24" width="12" height="12" fill="currentColor" stroke="none"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                            500 XP
                        </div>
                        <div class="pv-active">
                            <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            124 Active
                        </div>
                    </div>
                    <div class="pv-progress">
                        <div class="pv-progress-fill"></div>
                    </div>
                    <div class="pv-footer">
                        <span>DIFFICULTY: INTERM.</span>
                        <span class="pv-start">Start Challenge &rarr;</span>
                    </div>

                    <div class="pv-note">
                        *This is how the challenge appears in the global explorer. Ensure your thumbnail is high contrast for better engagement.*
                    </div>

                    <div class="pv-avatars">
                        <div class="avatar-group">
                            <div class="av-circ"></div>
                            <div class="av-circ"></div>
                            <div class="av-circ"></div>
                        </div>
                        +42 others joined today
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
