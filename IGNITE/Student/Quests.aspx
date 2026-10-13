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
                <span class="banner-potential-val" id="bannerPotentialVal">+850 XP</span>
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
                    <span class="quest-column-meta" id="dailyResetMeta">Resets in 14h 20m</span>
                </div>

                <!-- Daily Quest 1: Mindful Review -->
                <div class="quest-card" id="cardMindfulReview">
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
                        <span class="pill-quest-status pill-quest-active" id="badgeMindfulStatus">ACTIVE</span>
                    </div>

                    <div class="quest-progress-section">
                        <div class="quest-progress-header">
                            <span id="labelMindfulProgress">Progress: 2/5 cards</span>
                            <span id="pctMindfulProgress">40%</span>
                        </div>
                        <div class="quest-track">
                            <div class="quest-fill" id="fillMindfulProgress" style="width: 40%;"></div>
                        </div>
                    </div>

                    <div class="quest-footer-row">
                        <span class="quest-xp-amount">150 XP</span>
                        <button type="button" class="btn-in-progress" id="btnMindfulReview" onclick="openFlashcardsModal()">Review (2/5)</button>
                    </div>
                </div>

                <!-- Daily Quest 2: Reflection Prompt (Completed / Ready to Claim) -->
                <div class="quest-card quest-card-highlight" id="cardReflection">
                    <div class="quest-card-top">
                        <div class="quest-card-left">
                            <div class="quest-icon-wrap" title="Journal Prompt" onclick="window.location.href='Journal.aspx';" style="cursor: pointer;">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
                                    <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
                                </svg>
                            </div>
                            <div class="quest-info-group">
                                <div class="quest-title-row">
                                    <h3 class="quest-title" style="cursor: pointer;" onclick="window.location.href='Journal.aspx';" title="Go to Journal">Reflection Prompt</h3>
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
                <div class="quest-card quest-card-expired" id="cardEarlyRiser" onclick="showExpiredInfo()" style="cursor: pointer;" title="View Reset Information">
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
                        <span class="expired-note-text">No longer available (Resets tomorrow)</span>
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
                <div class="quest-card" id="cardCourseConqueror">
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
                        <span class="pill-quest-status pill-quest-active" id="badgeCourseStatus">ACTIVE</span>
                    </div>

                    <div class="quest-progress-section">
                        <div class="quest-progress-header">
                            <span>Quest Milestone</span>
                            <span id="labelCourseMilestone">3 / 10 Lessons</span>
                        </div>
                        <div class="quest-track">
                            <div class="quest-fill" id="fillCourseMilestone" style="width: 30%;"></div>
                        </div>
                        <div class="quest-subnote-row">
                            <span class="dot-subnote"></span>
                            <span id="labelCourseSubnote">On track to finish by Sunday</span>
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

                        <button type="button" class="btn-view-module" id="btnViewModule" onclick="openCourseModuleModal()">View Module</button>
                    </div>
                </div>

                <!-- Weekly Quest 2: Weekly Reflection -->
                <div class="quest-card" id="cardWeeklyReflection">
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
                        <span class="pill-quest-status pill-quest-active" id="badgeMovementStatus">ACTIVE</span>
                    </div>

                    <div class="quest-progress-section">
                        <div class="quest-progress-header">
                            <span id="labelMovementProgress">Progress: 0/1 session</span>
                            <span id="pctMovementProgress">0%</span>
                        </div>
                        <div class="quest-track">
                            <div class="quest-fill" id="fillMovementProgress" style="width: 0%;"></div>
                        </div>
                    </div>

                    <div class="quest-footer-row">
                        <span class="quest-xp-amount">300 XP</span>
                        <button type="button" class="btn-find-session" id="btnMovementSession" onclick="openMovementSessionsModal()">Find Session</button>
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
                        <circle class="ring-meter" id="ringMeter" cx="34" cy="34" r="28"
                            stroke-dasharray="175.93" stroke-dashoffset="52.78"></circle>
                    </svg>
                    <span class="ring-percent-text" id="ringPercentText">70%</span>
                </div>
                <div class="completion-text-group">
                    <h3 class="completion-headline">Weekly Quest Completion</h3>
                    <p class="completion-subtext" id="ringSubtext">You're just 2 quests away from your level-up bonus!</p>
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

    <!-- ==============================================================
         MODAL 1: Flashcards Review Modal (Mindful Review)
         ============================================================== -->
    <div class="modal-overlay" id="flashcardsModal" onclick="handleOverlayClick(event, 'flashcardsModal')">
        <div class="modal-card">
            <div class="modal-header">
                <div class="modal-title-group">
                    <h3 class="modal-title">Mindful Review Flashcards</h3>
                    <span class="modal-subtitle">Review active study cards to earn +150 XP</span>
                </div>
                <button type="button" class="btn-close-modal" onclick="closeModal('flashcardsModal')">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </button>
            </div>
            <div class="modal-body">
                <div class="flashcard-box">
                    <div class="flashcard-header">
                        <span class="flashcard-counter" id="fcCounter">CARD 3 OF 5</span>
                        <span class="badge-source-system" id="fcSubject">ALGORITHMS</span>
                    </div>
                    <h4 class="flashcard-prompt" id="fcQuestion">What is the average and worst-case search complexity of a Balanced Binary Search Tree?</h4>
                    <div class="flashcard-answer-box" id="fcAnswerBox">
                        <strong>Answer:</strong> O(log n) time complexity. Because the tree remains balanced, heights never exceed logarithmic bounds compared to node counts.
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-modal-secondary" id="btnRevealAnswer" onclick="revealFlashcardAnswer()">Reveal Answer</button>
                <button type="button" class="btn-modal-action" id="btnNextCard" onclick="nextFlashcard()">Next Card →</button>
            </div>
        </div>
    </div>

    <!-- ==============================================================
         MODAL 2: Course Module Lessons (Mindful Mornings)
         ============================================================== -->
    <div class="modal-overlay" id="courseModuleModal" onclick="handleOverlayClick(event, 'courseModuleModal')">
        <div class="modal-card">
            <div class="modal-header">
                <div class="modal-title-group">
                    <h3 class="modal-title">Mindful Mornings Module</h3>
                    <span class="modal-subtitle" id="modalCourseSubtitle">Module Progress: 3 of 10 Lessons Completed</span>
                </div>
                <button type="button" class="btn-close-modal" onclick="closeModal('courseModuleModal')">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </button>
            </div>
            <div class="modal-body">
                <div class="module-lessons-list" id="lessonsContainer">
                    <!-- Lessons rendered dynamically -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-modal-secondary" onclick="closeModal('courseModuleModal')">Done</button>
            </div>
        </div>
    </div>

    <!-- ==============================================================
         MODAL 3: Live Movement Sessions (Weekly Reflection)
         ============================================================== -->
    <div class="modal-overlay" id="movementSessionsModal" onclick="handleOverlayClick(event, 'movementSessionsModal')">
        <div class="modal-card">
            <div class="modal-header">
                <div class="modal-title-group">
                    <h3 class="modal-title">Live Movement Sessions</h3>
                    <span class="modal-subtitle">Join any session this week to complete your Weekly Reflection (+300 XP)</span>
                </div>
                <button type="button" class="btn-close-modal" onclick="closeModal('movementSessionsModal')">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </button>
            </div>
            <div class="modal-body">
                <div class="sessions-list" id="sessionsContainer">
                    <!-- Sessions rendered dynamically -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-modal-secondary" onclick="closeModal('movementSessionsModal')">Close</button>
            </div>
        </div>
    </div>

    <!-- Toast Notification -->
    <div id="toastNotice" class="quest-toast">
        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#5cb85c" stroke-width="2.5">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
        <span id="toastNoticeText">Notification message</span>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        (function () {
            'use strict';

            const STORAGE_KEY = 'ignite_quests_state_v1';

            // Flashcards dataset
            const FLASHCARDS = [
                {
                    subject: 'ALGORITHMS',
                    question: 'What is the average and worst-case search complexity of a Balanced Binary Search Tree?',
                    answer: 'O(log n) time complexity. Because heights remain balanced, trees never degenerate into linear linked lists.'
                },
                {
                    subject: 'COGNITIVE SCIENCE',
                    question: 'What is Spaced Repetition and why is it superior to cramming?',
                    answer: 'Reviewing material at systematically increasing intervals leverages the psychological spacing effect to reinforce long-term memory encoding.'
                },
                {
                    subject: 'PRODUCTIVITY',
                    question: 'What core principle defines the Pomodoro Technique?',
                    answer: '25 minutes of deep, single-task focus followed by a strict 5-minute cognitive break to prevent mental fatigue and burnout.'
                }
            ];

            // Course Module Lessons dataset
            const MODULE_LESSONS = [
                { id: 1, title: 'Mindful Awakening & Setting Intention', duration: '8 mins', completed: true },
                { id: 2, title: 'Deep Diaphragmatic Breathwork', duration: '10 mins', completed: true },
                { id: 3, title: 'Hydration & Fueling Morning Cognition', duration: '6 mins', completed: true },
                { id: 4, title: 'Digital Detox: The First 60 Minutes', duration: '12 mins', completed: false },
                { id: 5, title: 'Spinal Alignment & Morning Mobility', duration: '15 mins', completed: false },
                { id: 6, title: 'The 3 Priority Academic Tasks Framework', duration: '14 mins', completed: false },
                { id: 7, title: 'Minimizing Morning Dopamine Spikes', duration: '10 mins', completed: false },
                { id: 8, title: 'Natural Sunlight & Circadian Clock Sync', duration: '8 mins', completed: false },
                { id: 9, title: 'Mid-Morning Focus Preservation', duration: '11 mins', completed: false },
                { id: 10, title: 'Mastering The Daily Study Sprint', duration: '16 mins', completed: false }
            ];

            // Live Movement Sessions dataset
            const MOVEMENT_SESSIONS = [
                {
                    id: 'sess-1',
                    title: 'Desk Posture & Spine Alignment',
                    instructor: 'Marcus Vance',
                    time: 'TODAY, 4:00 PM',
                    duration: '25 mins'
                },
                {
                    id: 'sess-2',
                    title: 'Mindful Breathing & Joint Mobility',
                    instructor: 'Elena Rostova',
                    time: 'TOMORROW, 8:30 AM',
                    duration: '30 mins'
                },
                {
                    id: 'sess-3',
                    title: 'Evening Tension Relief & Stretch',
                    instructor: 'Sarah Jenkins',
                    time: 'THURSDAY, 6:30 PM',
                    duration: '35 mins'
                }
            ];

            // Default State
            let state = {
                mindfulCardsReviewed: 2, // 2 out of 5
                mindfulClaimed: false,
                reflectionClaimed: false,
                courseLessonsCompleted: 3, // 3 out of 10
                courseClaimed: false,
                movementAttended: false,
                movementClaimed: false,
                totalXP: 24500,
                totalQuests: 128
            };

            let currentFlashcardIndex = 0; // Relative to remaining cards (0 = card 3, 1 = card 4, 2 = card 5)

            function init() {
                loadState();
                renderUI();
                renderLessons();
                renderSessions();

                // Close modals with Escape key
                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape') {
                        closeAllModals();
                    }
                });
            }

            function loadState() {
                try {
                    const raw = localStorage.getItem(STORAGE_KEY);
                    if (raw) {
                        state = Object.assign(state, JSON.parse(raw));
                    }
                } catch (e) {
                    console.error('Error loading quests state', e);
                }
            }

            function saveState() {
                try {
                    localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
                } catch (e) {
                    console.error('Error saving quests state', e);
                }
            }

            function renderUI() {
                // 1. Mindful Review Card
                const mindfulPct = Math.round((state.mindfulCardsReviewed / 5) * 100);
                document.getElementById('labelMindfulProgress').textContent = 'Progress: ' + state.mindfulCardsReviewed + '/5 cards';
                document.getElementById('pctMindfulProgress').textContent = mindfulPct + '%';
                document.getElementById('fillMindfulProgress').style.width = mindfulPct + '%';

                const mindfulCard = document.getElementById('cardMindfulReview');
                const mindfulBadge = document.getElementById('badgeMindfulStatus');
                const btnMindful = document.getElementById('btnMindfulReview');

                if (state.mindfulClaimed) {
                    mindfulBadge.className = 'pill-quest-status pill-quest-completed';
                    mindfulBadge.textContent = 'COMPLETED';
                    mindfulCard.className = 'quest-card quest-card-highlight';
                    btnMindful.className = 'btn-claim-reward claimed';
                    btnMindful.textContent = 'Claimed ✓';
                    btnMindful.disabled = true;
                    btnMindful.onclick = null;
                } else if (state.mindfulCardsReviewed >= 5) {
                    mindfulBadge.className = 'pill-quest-status pill-quest-completed';
                    mindfulBadge.textContent = 'COMPLETED';
                    mindfulCard.className = 'quest-card quest-card-highlight';
                    btnMindful.className = 'btn-claim-reward';
                    btnMindful.textContent = 'Claim Reward';
                    btnMindful.disabled = false;
                    btnMindful.onclick = claimMindfulReward;
                } else {
                    mindfulBadge.className = 'pill-quest-status pill-quest-active';
                    mindfulBadge.textContent = 'ACTIVE';
                    mindfulCard.className = 'quest-card';
                    btnMindful.className = 'btn-in-progress';
                    btnMindful.textContent = 'Review (' + state.mindfulCardsReviewed + '/5)';
                    btnMindful.disabled = false;
                    btnMindful.onclick = window.openFlashcardsModal;
                }

                // 2. Reflection Prompt Card
                const btnReflect = document.getElementById('btnClaimReflection');
                if (state.reflectionClaimed) {
                    btnReflect.className = 'btn-claim-reward claimed';
                    btnReflect.textContent = 'Claimed ✓';
                    btnReflect.disabled = true;
                } else {
                    btnReflect.className = 'btn-claim-reward';
                    btnReflect.textContent = 'Claim Reward';
                    btnReflect.disabled = false;
                }

                // 3. Course Conqueror Card
                const coursePct = Math.round((state.courseLessonsCompleted / 10) * 100);
                document.getElementById('labelCourseMilestone').textContent = state.courseLessonsCompleted + ' / 10 Lessons';
                document.getElementById('fillCourseMilestone').style.width = coursePct + '%';

                const btnViewModule = document.getElementById('btnViewModule');
                const badgeCourse = document.getElementById('badgeCourseStatus');

                if (state.courseClaimed) {
                    badgeCourse.className = 'pill-quest-status pill-quest-completed';
                    badgeCourse.textContent = 'COMPLETED';
                    btnViewModule.textContent = 'Claimed ✓';
                    btnViewModule.disabled = true;
                } else if (state.courseLessonsCompleted >= 10) {
                    badgeCourse.className = 'pill-quest-status pill-quest-completed';
                    badgeCourse.textContent = 'COMPLETED';
                    btnViewModule.textContent = 'Claim 600 XP';
                    btnViewModule.className = 'btn-claim-reward';
                    btnViewModule.onclick = claimCourseReward;
                }

                // 4. Weekly Reflection (Movement) Card
                const moveCard = document.getElementById('cardWeeklyReflection');
                const badgeMovement = document.getElementById('badgeMovementStatus');
                const btnMovement = document.getElementById('btnMovementSession');
                const movePct = state.movementAttended ? 100 : 0;

                document.getElementById('labelMovementProgress').textContent = 'Progress: ' + (state.movementAttended ? '1/1 session' : '0/1 session');
                document.getElementById('pctMovementProgress').textContent = movePct + '%';
                document.getElementById('fillMovementProgress').style.width = movePct + '%';

                if (state.movementClaimed) {
                    badgeMovement.className = 'pill-quest-status pill-quest-completed';
                    badgeMovement.textContent = 'COMPLETED';
                    moveCard.className = 'quest-card quest-card-highlight';
                    btnMovement.className = 'btn-claim-reward claimed';
                    btnMovement.textContent = 'Claimed ✓';
                    btnMovement.disabled = true;
                    btnMovement.onclick = null;
                } else if (state.movementAttended) {
                    badgeMovement.className = 'pill-quest-status pill-quest-completed';
                    badgeMovement.textContent = 'COMPLETED';
                    moveCard.className = 'quest-card quest-card-highlight';
                    btnMovement.className = 'btn-claim-reward';
                    btnMovement.textContent = 'Claim Reward';
                    btnMovement.disabled = false;
                    btnMovement.onclick = claimMovementReward;
                } else {
                    badgeMovement.className = 'pill-quest-status pill-quest-active';
                    badgeMovement.textContent = 'ACTIVE';
                    moveCard.className = 'quest-card';
                    btnMovement.className = 'btn-find-session';
                    btnMovement.textContent = 'Find Session';
                    btnMovement.disabled = false;
                    btnMovement.onclick = window.openMovementSessionsModal;
                }

                // 5. Dynamic Stats & Potentials
                document.getElementById('valTotalXP').textContent = state.totalXP.toLocaleString();
                document.getElementById('valTotalQuests').textContent = state.totalQuests.toString();

                let potentialXP = 0;
                if (!state.mindfulClaimed) potentialXP += 150;
                if (!state.reflectionClaimed) potentialXP += 100;
                if (!state.courseClaimed) potentialXP += 600;
                potentialXP += (state.movementClaimed ? 0 : 300); // weekly component

                document.getElementById('bannerPotentialVal').textContent = '+' + potentialXP + ' XP';

                // Weekly completion calculation
                let completedWeeklyCount = (state.courseLessonsCompleted >= 10 ? 1 : 0) + (state.movementAttended ? 1 : 0);
                let completionPct = Math.min(100, Math.round(70 + (completedWeeklyCount * 15)));
                document.getElementById('ringPercentText').textContent = completionPct + '%';
                const circumference = 175.93;
                const offset = circumference - (circumference * (completionPct / 100));
                document.getElementById('ringMeter').style.strokeDashoffset = offset;

                // Sync with master header XP if available
                syncMasterXP();
            }

            function syncMasterXP() {
                const xpLabels = document.querySelectorAll('.xp-label');
                xpLabels.forEach(function (el) {
                    el.textContent = '4,500 / 6,000 XP';
                });
            }

            // ==========================================
            // Flashcard Modal Logic
            // ==========================================
            window.openFlashcardsModal = function () {
                if (state.mindfulCardsReviewed >= 5) {
                    showToast('All 5 flashcards already reviewed!');
                    return;
                }
                currentFlashcardIndex = Math.max(0, state.mindfulCardsReviewed - 2);
                renderCurrentFlashcard();
                openModal('flashcardsModal');
            };

            function renderCurrentFlashcard() {
                if (currentFlashcardIndex >= FLASHCARDS.length) {
                    // All 5 reviewed
                    closeModal('flashcardsModal');
                    state.mindfulCardsReviewed = 5;
                    saveState();
                    renderUI();
                    showToast('🎉 All 5 flashcards reviewed! You can now claim +150 XP!');
                    return;
                }

                const cardData = FLASHCARDS[currentFlashcardIndex];
                const cardNum = 3 + currentFlashcardIndex;
                document.getElementById('fcCounter').textContent = 'CARD ' + cardNum + ' OF 5';
                document.getElementById('fcSubject').textContent = cardData.subject;
                document.getElementById('fcQuestion').textContent = cardData.question;

                const ansBox = document.getElementById('fcAnswerBox');
                ansBox.innerHTML = '<strong>Answer:</strong> ' + cardData.answer;
                ansBox.classList.remove('revealed');

                document.getElementById('btnRevealAnswer').style.display = '';
                document.getElementById('btnNextCard').textContent = (currentFlashcardIndex === FLASHCARDS.length - 1) ? 'Complete Quest ✓' : 'Next Card →';
            }

            window.revealFlashcardAnswer = function () {
                document.getElementById('fcAnswerBox').classList.add('revealed');
                document.getElementById('btnRevealAnswer').style.display = 'none';
            };

            window.nextFlashcard = function () {
                currentFlashcardIndex++;
                state.mindfulCardsReviewed = Math.min(5, 2 + currentFlashcardIndex);
                saveState();
                renderUI();
                renderCurrentFlashcard();
            };

            function claimMindfulReward() {
                if (state.mindfulClaimed) return;
                state.mindfulClaimed = true;
                state.totalXP += 150;
                state.totalQuests += 1;
                saveState();
                renderUI();
                showToast('🎉 Congratulations! +150 XP added for Mindful Review!');
            }

            // ==========================================
            // Reflection Claim Logic
            // ==========================================
            window.claimReflectionReward = function () {
                if (state.reflectionClaimed) return;
                state.reflectionClaimed = true;
                state.totalXP += 100;
                state.totalQuests += 1;
                saveState();
                renderUI();
                showToast('🎉 Goal Reward Claimed! +100 XP added to your profile!');
            };

            // ==========================================
            // Course Module Logic
            // ==========================================
            window.openCourseModuleModal = function () {
                renderLessons();
                openModal('courseModuleModal');
            };

            function renderLessons() {
                const container = document.getElementById('lessonsContainer');
                if (!container) return;
                container.innerHTML = '';

                document.getElementById('modalCourseSubtitle').textContent = 'Module Progress: ' + state.courseLessonsCompleted + ' of 10 Lessons Completed';

                MODULE_LESSONS.forEach(function (lesson) {
                    const isDone = lesson.id <= state.courseLessonsCompleted;
                    const row = document.createElement('div');
                    row.className = 'lesson-row-item' + (isDone ? ' completed' : '');

                    row.innerHTML =
                        '<div class="lesson-row-left">' +
                            '<div class="lesson-number-circle">' + (isDone ? '✓' : lesson.id) + '</div>' +
                            '<div>' +
                                '<div class="lesson-title-text">' + lesson.title + '</div>' +
                                '<div class="lesson-duration">' + lesson.duration + '</div>' +
                            '</div>' +
                        '</div>' +
                        '<div>' +
                            (isDone ?
                                '<span class="badge-lesson-done"><svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg> Completed</span>' :
                                (lesson.id === state.courseLessonsCompleted + 1 ?
                                    '<button type="button" class="btn-complete-lesson" onclick="completeLesson(' + lesson.id + ')">Complete Lesson</button>' :
                                    '<span style="font-size:0.75rem; color:#999;">Upcoming</span>'
                                )
                            ) +
                        '</div>';

                    container.appendChild(row);
                });
            }

            window.completeLesson = function (lessonId) {
                if (lessonId > state.courseLessonsCompleted) {
                    state.courseLessonsCompleted = lessonId;
                    state.totalXP += 50;
                    saveState();
                    renderUI();
                    renderLessons();
                    showToast('Lesson ' + lessonId + ' Completed! +50 XP awarded!');
                }
            };

            function claimCourseReward() {
                if (state.courseClaimed) return;
                state.courseClaimed = true;
                state.totalXP += 600;
                state.totalQuests += 1;
                saveState();
                renderUI();
                showToast('🏆 Master Achievement: Zen Master Badge & +600 XP Unlocked!');
            }

            // ==========================================
            // Movement Sessions Logic
            // ==========================================
            window.openMovementSessionsModal = function () {
                renderSessions();
                openModal('movementSessionsModal');
            };

            function renderSessions() {
                const container = document.getElementById('sessionsContainer');
                if (!container) return;
                container.innerHTML = '';

                MOVEMENT_SESSIONS.forEach(function (sess) {
                    const card = document.createElement('div');
                    card.className = 'session-card-item';

                    card.innerHTML =
                        '<div class="session-info">' +
                            '<h4 class="session-title">' + sess.title + '</h4>' +
                            '<div class="session-meta-row">' +
                                '<span class="badge-session-time">' + sess.time + '</span>' +
                                '<span>Instructor: ' + sess.instructor + '</span>' +
                                '<span>(' + sess.duration + ')</span>' +
                            '</div>' +
                        '</div>' +
                        '<div>' +
                            (state.movementAttended ?
                                '<span class="badge-lesson-done"><svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg> Attended</span>' :
                                '<button type="button" class="btn-join-session" onclick="attendMovementSession(\'' + sess.id + '\')">Attend Session</button>'
                            ) +
                        '</div>';

                    container.appendChild(card);
                });
            }

            window.attendMovementSession = function (sessId) {
                state.movementAttended = true;
                saveState();
                closeModal('movementSessionsModal');
                renderUI();
                showToast('🧘 Movement session attended! You can now claim +300 XP!');
            };

            function claimMovementReward() {
                if (state.movementClaimed) return;
                state.movementClaimed = true;
                state.totalXP += 300;
                state.totalQuests += 1;
                saveState();
                renderUI();
                showToast('🎉 Weekly Movement Reflection Completed! +300 XP added!');
            }

            // ==========================================
            // Early Riser Info
            // ==========================================
            window.showExpiredInfo = function () {
                showToast('🌅 Early Riser Quest: Check in between 5:00 AM - 8:00 AM tomorrow to claim +50 XP!');
            };

            // ==========================================
            // Modal Helpers
            // ==========================================
            function openModal(id) {
                const modal = document.getElementById(id);
                if (modal) modal.classList.add('active');
            }

            window.closeModal = function (id) {
                const modal = document.getElementById(id);
                if (modal) modal.classList.remove('active');
            };

            function closeAllModals() {
                document.querySelectorAll('.modal-overlay.active').forEach(function (m) {
                    m.classList.remove('active');
                });
            }

            window.handleOverlayClick = function (e, id) {
                if (e.target && e.target.id === id) {
                    closeModal(id);
                }
            };

            // ==========================================
            // Toast Notice Helper
            // ==========================================
            let toastTimer = null;
            function showToast(msg) {
                const toast = document.getElementById('toastNotice');
                const toastText = document.getElementById('toastNoticeText');
                if (!toast || !toastText) return;

                toastText.textContent = msg;
                toast.classList.add('show');

                if (toastTimer) clearTimeout(toastTimer);
                toastTimer = setTimeout(function () {
                    toast.classList.remove('show');
                }, 3500);
            }

            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', init);
            } else {
                init();
            }
        })();
    </script>
</asp:Content>
