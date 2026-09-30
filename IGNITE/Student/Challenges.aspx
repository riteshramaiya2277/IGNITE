<%@ Page Title="Challenges — IGNITE" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Challenges.aspx.cs" Inherits="IGNITE.Student.Challenges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/challenges.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="challenges-canvas">
        <!-- 1. Header with Title & Status Tabs Toggle (Available / Active / Completed) -->
        <div class="challenges-header">
            <div class="challenges-header-text">
                <h1 class="challenges-title">System Challenges</h1>
                <p class="challenges-subtitle" id="challengesSubtitle">Choose a quest to ignite your academic journey.</p>
            </div>

            <!-- Segmented Pill Toggle: Available, Active, Completed -->
            <div class="status-pill-toggle">
                <button type="button" id="tabAvailable" class="status-tab-btn active" onclick="switchStatusTab('available', this)">Available</button>
                <button type="button" id="tabActive" class="status-tab-btn" onclick="switchStatusTab('active', this)">Active</button>
                <button type="button" id="tabCompleted" class="status-tab-btn" onclick="switchStatusTab('completed', this)">Completed</button>
            </div>
        </div>

        <!-- ====================================================================
             TAB 1: AVAILABLE CHALLENGES VIEW (Matches Original Browse UI)
             ==================================================================== -->
        <div id="availableViewContainer">
            <!-- 2. Category Filter Pills Row -->
            <div class="category-filter-row">
                <button type="button" class="category-pill-btn active" data-category="all" onclick="filterCategory('all', this)">All Categories</button>
                <button type="button" class="category-pill-btn" data-category="academic" onclick="filterCategory('academic', this)">Academic Excellence</button>
                <button type="button" class="category-pill-btn" data-category="physical" onclick="filterCategory('physical', this)">Physical Health</button>
                <button type="button" class="category-pill-btn" data-category="mental" onclick="filterCategory('mental', this)">Mental Well-being</button>
                <button type="button" class="category-pill-btn" data-category="personal" onclick="filterCategory('personal', this)">Personal Growth</button>
            </div>

            <!-- 3. Available Challenges Grid -->
            <div class="challenges-grid" id="challengesGrid">

                <!-- Card 1: The Academic Sprint -->
                <div class="challenge-card" data-category="academic" id="challenge-academic-sprint">
                    <div class="card-tags-row">
                        <span class="badge-category">Academic Excellence</span>
                        <span class="badge-difficulty difficulty-medium">
                            <svg viewBox="0 0 24 24" width="12" height="12" fill="currentColor">
                                <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                            </svg>
                            Medium
                        </span>
                    </div>

                    <div class="card-content">
                        <h2 class="challenge-name">The Academic Sprint</h2>
                        <p class="challenge-desc">Boost your productivity and master your course material with intensive study sessions.</p>

                        <div class="challenge-meta-list">
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                </span>
                                <span>Duration: 7 Days</span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                        <polyline points="14 2 14 8 20 8"></polyline>
                                        <line x1="16" y1="13" x2="8" y2="13"></line>
                                        <line x1="16" y1="17" x2="8" y2="17"></line>
                                        <polyline points="10 9 9 9 8 9"></polyline>
                                    </svg>
                                </span>
                                <span>Complete 5 study sessions (2h+)</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-rewards-box">
                        <span class="rewards-label">Rewards</span>
                        <div class="rewards-row">
                            <div class="reward-xp">
                                <svg class="reward-xp-icon" viewBox="0 0 24 24" stroke="currentColor">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                                <span>500 XP</span>
                            </div>
                            <div class="reward-badge-pill">
                                <svg class="badge-icon" viewBox="0 0 24 24" fill="currentColor">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                                <span>Sprint Master</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-actions-row">
                        <a href="ChallengeDetail.aspx?id=academic-sprint" class="btn-join-challenge">Join Challenge</a>
                        <a href="ChallengeDetail.aspx?id=academic-sprint" class="btn-info-square" title="Challenge Details">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                        </a>
                    </div>
                </div>

                <!-- Card 2: Zen Master -->
                <div class="challenge-card" data-category="mental" id="challenge-zen-master">
                    <div class="card-tags-row">
                        <span class="badge-category">Mental Well-being</span>
                        <span class="badge-difficulty difficulty-easy">
                            <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M20.24 12.24a6 6 0 0 0-8.49-8.49L5 10.5V19h8.5z"></path>
                                <line x1="16" y1="8" x2="2" y2="22"></line>
                                <line x1="17.5" y1="15" x2="9" y2="15"></line>
                            </svg>
                            Easy
                        </span>
                    </div>

                    <div class="card-content">
                        <h2 class="challenge-name">Zen Master</h2>
                        <p class="challenge-desc">Cultivate inner peace and reduce academic stress through daily mindfulness practices.</p>

                        <div class="challenge-meta-list">
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                </span>
                                <span>Duration: 14 Days</span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <circle cx="12" cy="7" r="3"></circle>
                                        <path d="M6 21v-2a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v2"></path>
                                    </svg>
                                </span>
                                <span>Meditate for 10 mins daily</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-rewards-box">
                        <span class="rewards-label">Rewards</span>
                        <div class="rewards-row">
                            <div class="reward-xp">
                                <svg class="reward-xp-icon" viewBox="0 0 24 24" stroke="currentColor">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                                <span>300 XP</span>
                            </div>
                            <div class="reward-badge-pill">
                                <svg class="badge-icon" viewBox="0 0 24 24" fill="currentColor">
                                    <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                </svg>
                                <span>Inner Calm</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-actions-row">
                        <a href="ChallengeDetail.aspx?id=zen-master" class="btn-join-challenge">Join Challenge</a>
                        <a href="ChallengeDetail.aspx?id=zen-master" class="btn-info-square" title="Challenge Details">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                        </a>
                    </div>
                </div>

                <!-- Card 3: Morning Warrior -->
                <div class="challenge-card" data-category="personal" id="challenge-morning-warrior">
                    <div class="card-tags-row">
                        <span class="badge-category">Personal Growth</span>
                        <span class="badge-difficulty difficulty-hard">
                            <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <polyline points="12 6 12 12 16 14"></polyline>
                            </svg>
                            Hard
                        </span>
                    </div>

                    <div class="card-content">
                        <h2 class="challenge-name">Morning Warrior</h2>
                        <p class="challenge-desc">Transform your mornings and win the day by establishing a consistent early wake-up routine.</p>

                        <div class="challenge-meta-list">
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                </span>
                                <span>Duration: 30 Days</span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <circle cx="12" cy="12" r="7"></circle>
                                        <polyline points="12 9 12 12 13.5 13.5"></polyline>
                                    </svg>
                                </span>
                                <span>Wake up before 7:00 AM</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-rewards-box">
                        <span class="rewards-label">Rewards</span>
                        <div class="rewards-row">
                            <div class="reward-xp">
                                <svg class="reward-xp-icon" viewBox="0 0 24 24" stroke="currentColor">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                                <span>1200 XP</span>
                            </div>
                            <div class="reward-badge-pill">
                                <svg class="badge-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="8" r="7"></circle>
                                    <polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline>
                                </svg>
                                <span>Early Riser</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-actions-row">
                        <a href="ChallengeDetail.aspx?id=morning-warrior" class="btn-join-challenge">Join Challenge</a>
                        <a href="ChallengeDetail.aspx?id=morning-warrior" class="btn-info-square" title="Challenge Details">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                        </a>
                    </div>
                </div>

                <!-- Card 4: Scholarly Reader -->
                <div class="challenge-card" data-category="academic" id="challenge-scholarly-reader">
                    <div class="card-tags-row">
                        <span class="badge-category">Academic Excellence</span>
                        <span class="badge-difficulty difficulty-easy">
                            <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                            Easy
                        </span>
                    </div>

                    <div class="card-content">
                        <h2 class="challenge-name">Scholarly Reader</h2>
                        <p class="challenge-desc">Broaden your academic horizons by engaging with research papers and academic literature.</p>

                        <div class="challenge-meta-list">
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                </span>
                                <span>Duration: 10 Days</span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
                                        <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
                                    </svg>
                                </span>
                                <span>Read 1 scholarly article daily</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-rewards-box">
                        <span class="rewards-label">Rewards</span>
                        <div class="rewards-row">
                            <div class="reward-xp">
                                <svg class="reward-xp-icon" viewBox="0 0 24 24" stroke="currentColor">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                                <span>400 XP</span>
                            </div>
                            <div class="reward-badge-pill">
                                <svg class="badge-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
                                    <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
                                </svg>
                                <span>Scholar</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-actions-row">
                        <a href="ChallengeDetail.aspx?id=scholarly-reader" class="btn-join-challenge">Join Challenge</a>
                        <a href="ChallengeDetail.aspx?id=scholarly-reader" class="btn-info-square" title="Challenge Details">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                        </a>
                    </div>
                </div>

                <!-- Card 5: Fit Body, Fit Mind -->
                <div class="challenge-card" data-category="physical" id="challenge-fit-body">
                    <div class="card-tags-row">
                        <span class="badge-category">Physical Health</span>
                        <span class="badge-difficulty difficulty-medium">
                            <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="16 18 22 12 16 6"></polyline>
                                <polyline points="8 6 2 12 8 18"></polyline>
                            </svg>
                            Medium
                        </span>
                    </div>

                    <div class="card-content">
                        <h2 class="challenge-name">Fit Body, Fit Mind</h2>
                        <p class="challenge-desc">Improve your cognitive performance through consistent physical exercise and hydration.</p>

                        <div class="challenge-meta-list">
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                </span>
                                <span>Duration: 21 Days</span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <circle cx="12" cy="5" r="2"></circle>
                                        <path d="M10 22v-5l-2-2v-4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v4l-2 2v5"></path>
                                    </svg>
                                </span>
                                <span>30 min workout 4x week</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-rewards-box">
                        <span class="rewards-label">Rewards</span>
                        <div class="rewards-row">
                            <div class="reward-xp">
                                <svg class="reward-xp-icon" viewBox="0 0 24 24" stroke="currentColor">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                                <span>750 XP</span>
                            </div>
                            <div class="reward-badge-pill">
                                <svg class="badge-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="5" r="2"></circle>
                                    <path d="M10 22v-5l-2-2v-4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v4l-2 2v5"></path>
                                </svg>
                                <span>Athlete</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-actions-row">
                        <a href="ChallengeDetail.aspx?id=fit-body" class="btn-join-challenge">Join Challenge</a>
                        <a href="ChallengeDetail.aspx?id=fit-body" class="btn-info-square" title="Challenge Details">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                        </a>
                    </div>
                </div>

                <!-- Card 6: Deep Work Diver -->
                <div class="challenge-card" data-category="personal" id="challenge-deep-work">
                    <div class="card-tags-row">
                        <span class="badge-category">Personal Growth</span>
                        <span class="badge-difficulty difficulty-medium">
                            <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <polyline points="12 6 12 12 16 14"></polyline>
                            </svg>
                            Medium
                        </span>
                    </div>

                    <div class="card-content">
                        <h2 class="challenge-name">Deep Work Diver</h2>
                        <p class="challenge-desc">Master the art of deep concentration and eliminate all distractions during study hours.</p>

                        <div class="challenge-meta-list">
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                    </svg>
                                </span>
                                <span>Duration: 5 Days</span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <rect x="5" y="2" width="14" height="20" rx="2" ry="2"></rect>
                                        <line x1="12" y1="18" x2="12.01" y2="18"></line>
                                    </svg>
                                </span>
                                <span>0 min phone use during study</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-rewards-box">
                        <span class="rewards-label">Rewards</span>
                        <div class="rewards-row">
                            <div class="reward-xp">
                                <svg class="reward-xp-icon" viewBox="0 0 24 24" stroke="currentColor">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                                <span>600 XP</span>
                            </div>
                            <div class="reward-badge-pill">
                                <svg class="badge-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <circle cx="12" cy="12" r="6"></circle>
                                    <circle cx="12" cy="12" r="2"></circle>
                                </svg>
                                <span>Zen Focused</span>
                            </div>
                        </div>
                    </div>

                    <div class="card-actions-row">
                        <a href="ChallengeDetail.aspx?id=deep-work" class="btn-join-challenge">Join Challenge</a>
                        <a href="ChallengeDetail.aspx?id=deep-work" class="btn-info-square" title="Challenge Details">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="12" y1="16" x2="12" y2="12"></line>
                                <line x1="12" y1="8" x2="12.01" y2="8"></line>
                            </svg>
                        </a>
                    </div>
                </div>

                <!-- Empty State -->
                <div id="challengesEmptyState" class="challenges-empty-state" style="display: none;">
                    <svg class="empty-state-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                        <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"></path>
                        <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"></path>
                        <path d="M4 22h16"></path>
                        <path d="M10 14.66V17c0 .55-.45 1-1 1H8c-.55 0-1 .45-1 1v1h10v-1c0-.55-.45-1-1-1h-1c-.55 0-1-.45-1-1v-2.34"></path>
                        <path d="M6 4h12v5c0 3.31-2.69 6-6 6s-6-2.69-6-6V4z"></path>
                    </svg>
                    <div class="empty-state-title">No Challenges Found</div>
                    <div class="empty-state-desc">There are no challenges matching the selected filters.</div>
                </div>

            </div>
        </div>

        <!-- ====================================================================
             TAB 2: ACTIVE CHALLENGES VIEW (Matches Image 3)
             ==================================================================== -->
        <div id="activeViewContainer" style="display: none; flex-direction: column; gap: 24px;">

            <div class="active-challenges-list">

                <!-- Active Card 1: The Academic Sprint -->
                <div class="active-challenge-card">
                    <div class="active-card-left">
                        <div class="active-card-badges">
                            <span class="badge-category" style="background-color: #FDECEF; color: #CE576A;">Academic Excellence</span>
                            <span class="badge-difficulty difficulty-medium">
                                <svg viewBox="0 0 24 24" width="12" height="12" fill="currentColor">
                                    <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                                </svg>
                                Medium
                            </span>
                        </div>

                        <h2 class="active-card-title">The Academic Sprint</h2>
                        <p class="active-card-desc">
                            Complete intensive study sessions to master your current coursework and build academic stamina.
                        </p>

                        <div class="active-progress-section">
                            <div class="active-progress-header">
                                <span>Overall Progress</span>
                                <span>3 / 5 Sessions</span>
                            </div>
                            <div class="active-progress-bar-track">
                                <div class="active-progress-bar-fill" style="width: 60%;"></div>
                            </div>
                        </div>

                        <div class="active-card-meta-row">
                            <span class="meta-chip">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <polyline points="12 6 12 12 16 14"></polyline>
                                </svg>
                                4 days remaining
                            </span>
                            <span class="meta-chip" style="color: #EA580C; font-weight: 700;">
                                <svg viewBox="0 0 24 24" fill="none" stroke="#EA580C" stroke-width="2">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                                500 XP Reward
                            </span>
                        </div>
                    </div>

                    <div class="active-card-right">
                        <div class="active-circle-badge-wrap">
                            <div class="circle-badge-ring">
                                <svg viewBox="0 0 24 24" fill="currentColor">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                            </div>
                            <span class="circle-badge-title">Sprint Master</span>
                        </div>

                        <a href="ChallengeDetail.aspx?id=academic-sprint&view=active" class="btn-update-progress">Update Progress</a>
                        <a href="ChallengeDetail.aspx?id=academic-sprint" class="btn-view-details-link">View Details</a>
                    </div>
                </div>

                <!-- Active Card 2: Fit Body, Fit Mind -->
                <div class="active-challenge-card">
                    <div class="active-card-left">
                        <div class="active-card-badges">
                            <span class="badge-category" style="background-color: #FDECEF; color: #CE576A;">Physical Health</span>
                            <span class="badge-difficulty difficulty-medium">
                                <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2">
                                    <polyline points="16 18 22 12 16 6"></polyline>
                                    <polyline points="8 6 2 12 8 18"></polyline>
                                </svg>
                                Medium
                            </span>
                        </div>

                        <h2 class="active-card-title">Fit Body, Fit Mind</h2>
                        <p class="active-card-desc">
                            Boost your brainpower through regular movement. Complete 4 workouts per week to maintain mental clarity.
                        </p>

                        <div class="active-progress-section">
                            <div class="active-progress-header">
                                <span>This Week's Goal</span>
                                <span>1 / 4 Workouts</span>
                            </div>
                            <div class="active-progress-bar-track">
                                <div class="active-progress-bar-fill" style="width: 25%;"></div>
                            </div>
                        </div>

                        <div class="active-card-meta-row">
                            <span class="meta-chip">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <polyline points="12 6 12 12 16 14"></polyline>
                                </svg>
                                12 days remaining
                            </span>
                            <span class="meta-chip" style="color: #EA580C; font-weight: 700;">
                                <svg viewBox="0 0 24 24" fill="none" stroke="#EA580C" stroke-width="2">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                                750 XP Reward
                            </span>
                        </div>
                    </div>

                    <div class="active-card-right">
                        <div class="active-circle-badge-wrap">
                            <div class="circle-badge-ring">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M12 2c-4 4-6 7.5-6 11a6 6 0 0 0 12 0c0-3.5-2-7-6-11z"></path>
                                    <path d="M12 18a2.5 2.5 0 0 0 2.5-2.5c0-1.5-1-2.5-2.5-4-1.5 1.5-2.5 2.5-2.5 4a2.5 2.5 0 0 0 2.5 2.5z"></path>
                                </svg>
                            </div>
                            <span class="circle-badge-title">Athlete</span>
                        </div>

                        <a href="ChallengeDetail.aspx?id=fit-body&view=active" class="btn-update-progress">Update Progress</a>
                        <a href="ChallengeDetail.aspx?id=fit-body" class="btn-view-details-link">View Details</a>
                    </div>
                </div>

            </div>

            <!-- 4 Stat Summary Cards at Bottom (Matching Image 3) -->
            <div class="challenges-stats-row">
                <div class="challenge-stat-card">
                    <span class="stat-label-title">Total XP Earned</span>
                    <div class="stat-val-group">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                        </svg>
                        <span class="stat-big-number">4,850</span>
                    </div>
                </div>

                <div class="challenge-stat-card">
                    <span class="stat-label-title">Completed Quests</span>
                    <div class="stat-val-group">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="10"></circle>
                            <circle cx="12" cy="12" r="6"></circle>
                            <circle cx="12" cy="12" r="2"></circle>
                        </svg>
                        <span class="stat-big-number">12</span>
                    </div>
                </div>

                <div class="challenge-stat-card">
                    <span class="stat-label-title">Badges Collected</span>
                    <div class="stat-val-group">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
                        </svg>
                        <span class="stat-big-number">7</span>
                    </div>
                </div>

                <div class="challenge-stat-card">
                    <span class="stat-label-title">Current Streak</span>
                    <div class="stat-val-group">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M12 2c-4 4-6 7.5-6 11a6 6 0 0 0 12 0c0-3.5-2-7-6-11z"></path>
                        </svg>
                        <span class="stat-big-number">14 Days</span>
                    </div>
                </div>
            </div>

        </div>

        <!-- ====================================================================
             TAB 3: COMPLETED CHALLENGES VIEW
             ==================================================================== -->
        <div id="completedViewContainer" style="display: none; flex-direction: column; gap: 20px;">
            <div class="active-challenges-list">
                <div class="active-challenge-card" style="opacity: 0.95;">
                    <div class="active-card-left">
                        <div class="active-card-badges">
                            <span class="badge-category" style="background-color: #DCFCE7; color: #15803D;">Completed Quest</span>
                            <span class="badge-difficulty difficulty-easy">Easy</span>
                        </div>
                        <h2 class="active-card-title">Zen Master</h2>
                        <p class="active-card-desc">Completed 14-day continuous mindfulness meditation journey.</p>
                        <div class="active-card-meta-row">
                            <span class="meta-chip" style="color: #15803D; font-weight: 700;">✓ Completed on Sep 28</span>
                            <span class="meta-chip" style="color: #EA580C; font-weight: 700;">+300 XP Awarded</span>
                        </div>
                    </div>
                    <div class="active-card-right">
                        <div class="active-circle-badge-wrap">
                            <div class="circle-badge-ring" style="border-color: #10B981; color: #10B981; background-color: #ECFDF5;">
                                <svg viewBox="0 0 24 24" fill="currentColor"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                            </div>
                            <span class="circle-badge-title">Inner Calm</span>
                        </div>
                        <span class="completed-stamp-badge">Badge Collected</span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        var currentStatusFilter = 'available';
        var currentCategoryFilter = 'all';

        // Filter Category Pills
        function filterCategory(category, buttonEl) {
            currentCategoryFilter = category;

            var pills = document.querySelectorAll('.category-pill-btn');
            pills.forEach(function (pill) {
                pill.classList.remove('active');
            });
            if (buttonEl) {
                buttonEl.classList.add('active');
            }

            applyCategoryFilter();
        }

        function applyCategoryFilter() {
            var cards = document.querySelectorAll('#challengesGrid .challenge-card');
            var visibleCount = 0;

            cards.forEach(function (card) {
                var cardCategory = card.getAttribute('data-category');
                var matchesCategory = (currentCategoryFilter === 'all' || cardCategory === currentCategoryFilter);

                if (matchesCategory) {
                    card.style.display = 'flex';
                    visibleCount++;
                } else {
                    card.style.display = 'none';
                }
            });

            var emptyState = document.getElementById('challengesEmptyState');
            if (emptyState) {
                emptyState.style.display = (visibleCount === 0) ? 'flex' : 'none';
            }
        }

        // Switch Status Tabs (Available / Active / Completed)
        function switchStatusTab(status, buttonEl) {
            currentStatusFilter = status;

            var tabs = document.querySelectorAll('.status-tab-btn');
            tabs.forEach(function (tab) {
                tab.classList.remove('active');
            });
            if (buttonEl) {
                buttonEl.classList.add('active');
            }

            var availableCont = document.getElementById('availableViewContainer');
            var activeCont = document.getElementById('activeViewContainer');
            var completedCont = document.getElementById('completedViewContainer');
            var subtitle = document.getElementById('challengesSubtitle');

            if (status === 'available') {
                availableCont.style.display = 'block';
                activeCont.style.display = 'none';
                completedCont.style.display = 'none';
                if (subtitle) subtitle.innerText = 'Choose a quest to ignite your academic journey.';
                applyCategoryFilter();
            } else if (status === 'active') {
                availableCont.style.display = 'none';
                activeCont.style.display = 'flex';
                completedCont.style.display = 'none';
                if (subtitle) subtitle.innerText = 'Keep the fire burning. You have 2 challenges in progress.';
            } else if (status === 'completed') {
                availableCont.style.display = 'none';
                activeCont.style.display = 'none';
                completedCont.style.display = 'flex';
                if (subtitle) subtitle.innerText = 'Achievements unlocked and completed academic quests.';
            }
        }

        // Check URL Query Parameters on load (e.g. ?tab=active)
        document.addEventListener('DOMContentLoaded', function () {
            var urlParams = new URLSearchParams(window.location.search);
            var tabParam = urlParams.get('tab');
            if (tabParam === 'active') {
                var activeTabBtn = document.getElementById('tabActive');
                if (activeTabBtn) {
                    switchStatusTab('active', activeTabBtn);
                }
            } else if (tabParam === 'completed') {
                var compTabBtn = document.getElementById('tabCompleted');
                if (compTabBtn) {
                    switchStatusTab('completed', compTabBtn);
                }
            } else {
                applyCategoryFilter();
            }
        });
    </script>
</asp:Content>
