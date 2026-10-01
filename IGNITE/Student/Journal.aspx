<%@ Page Title="Journal & Notes" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true"
    CodeBehind="Journal.aspx.cs" Inherits="IGNITE.Student.Journal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/dashboard.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%= ResolveUrl("~/Content/journal.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="journal-canvas">
        
        <!-- Header -->
        <div class="journal-header-row">
            <div class="journal-title-area">
                <h1 class="journal-main-title">Journal &amp; Notes</h1>
                <div class="privacy-badge">
                    <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                    </svg>
                    Private to you. Not visible to instructors or management.
                </div>
            </div>
            
            <div class="journal-mode-toggle">
                <button class="btn-toggle active" type="button">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
                    Journal
                </button>
                <button class="btn-toggle" type="button">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    Notes
                </button>
            </div>
        </div>

        <div class="journal-body-layout">
            <!-- Sidebar / Entry List -->
            <aside class="journal-sidebar">
                <button class="btn-new-entry" type="button">+ New Entry</button>
                
                <div class="timeline-group">
                    <h4 class="timeline-label">TODAY</h4>
                    <div class="entry-card active">
                        <h5 class="entry-title">Reflection on CS101</h5>
                        <p class="entry-preview">Today's lecture on algorithms</p>
                        <div class="entry-meta">
                            <span>10:45 AM</span>
                            <span class="emotion-tag happy">&#128522; HAPPY</span>
                        </div>
                    </div>
                </div>

                <div class="timeline-group">
                    <h4 class="timeline-label">YESTERDAY</h4>
                    <div class="entry-card">
                        <h5 class="entry-title">Monthly Goal Progress</h5>
                        <p class="entry-preview">Feeling productive after...</p>
                        <div class="entry-meta">
                            <span>4:20 PM</span>
                            <span class="emotion-tag energetic">&#9889; ENERGETIC</span>
                        </div>
                    </div>
                </div>

                <div class="timeline-group">
                    <h4 class="timeline-label">OCT 12, 2024</h4>
                    <div class="entry-card">
                        <h5 class="entry-title">Exam Anxiety Notes</h5>
                        <p class="entry-preview">I need to manage my time...</p>
                        <div class="entry-meta">
                            <span>11:15 PM</span>
                            <span class="emotion-tag anxious">&#128560; ANXIOUS</span>
                        </div>
                    </div>
                </div>
            </aside>

            <!-- Editor Area -->
            <div class="journal-editor-container">
                <div class="editor-header">
                    <div class="editor-title-group">
                        <h2 class="editor-title">Reflection on CS101</h2>
                        <span class="editor-saved-status">Last saved Oct 14, 2024 at 11:20 AM</span>
                    </div>
                    <div class="editor-actions">
                        <button class="btn-icon" title="Delete Entry" type="button">
                            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                        </button>
                        <button class="btn-save" type="button">Save Changes</button>
                    </div>
                </div>

                <div class="editor-emotion-selector">
                    <span class="selector-label">HOW ARE YOU FEELING?</span>
                    <div class="emotion-icons">
                        <div class="emotion-item active">
                            <span class="emoji-circle happy">&#128522;</span>
                            <span class="emoji-label happy">HAPPY</span>
                        </div>
                        <div class="emotion-item">
                            <span class="emoji-circle calm">&#128524;</span>
                            <span class="emoji-label calm">CALM</span>
                        </div>
                        <div class="emotion-item">
                            <span class="emoji-circle neutral">&#128528;</span>
                            <span class="emoji-label neutral">NEUTRAL</span>
                        </div>
                        <div class="emotion-item">
                            <span class="emoji-circle focus">&#9889;</span>
                            <span class="emoji-label focus">FOCUS</span>
                        </div>
                        <div class="emotion-item">
                            <span class="emoji-circle tired">&#129393;</span>
                            <span class="emoji-label tired">TIRED</span>
                        </div>
                        <div class="emotion-item">
                            <span class="emoji-circle anxious">&#128560;</span>
                            <span class="emoji-label anxious">ANXIOUS</span>
                        </div>
                    </div>
                </div>

                <div class="editor-toolbar">
                    <button class="tool-btn" type="button" title="Bold"><strong style="font-family: serif;">B</strong></button>
                    <button class="tool-btn" type="button" title="Italic"><em style="font-family: serif;">I</em></button>
                    <button class="tool-btn" type="button" title="List">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
                    </button>
                    <button class="tool-btn" type="button" title="Link">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg>
                    </button>
                    <div class="tool-divider"></div>
                    <button class="tool-btn" type="button" title="Image">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg>
                    </button>
                </div>

                <div class="editor-content-area">
                    <p>Today's lecture on <strong>algorithms</strong> was particularly challenging but rewarding. I finally understood the time complexity of binary search trees after re-watching the recording.</p>
                    <p>I noticed that I concentrate much better in the mornings after a light breakfast. My goal for tomorrow is to start the assignment earlier to avoid the late-night stress I had last week.</p>
                    <p>Current thoughts:</p>
                    <ul>
                        <li>Need more practice with recursion problems.</li>
                        <li>Ask TA about the project structure during office hours.</li>
                        <li>Remember to take breaks every 45 minutes to avoid burnout.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
