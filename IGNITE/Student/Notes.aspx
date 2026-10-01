<%@ Page Title="Journal & Notes - Notes" Language="C#" MasterPageFile="~/Student/StudentMaster.master"
    AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="IGNITE.Student.Notes" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="<%= ResolveUrl("~/Content/dashboard.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/Content/journal.css") %>" rel="stylesheet" type="text/css" />
        <link href="<%= ResolveUrl("~/Content/notes.css") %>" rel="stylesheet" type="text/css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
        Dashboard
    </asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <div class="notes-canvas">

            <!-- Header -->
            <div class="journal-header-row">
                <div class="journal-title-area">
                    <h1 class="journal-main-title">Journal &amp; Notes</h1>
                    <div class="privacy-badge">
                        <svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor"
                            stroke-width="2">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                        Private to you. Not visible to instructors or management.
                    </div>
                </div>

                <div class="journal-mode-toggle">
                    <a href="<%= ResolveUrl("~/Student/Journal.aspx") %>" class="btn-toggle">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2">
                            <path d="M12 20h9"></path>
                            <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                        </svg>
                        Journal
                    </a>
                    <a href="<%= ResolveUrl("~/Student/Notes.aspx") %>" class="btn-toggle active">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                            stroke-width="2">
                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                            <polyline points="14 2 14 8 20 8"></polyline>
                            <line x1="16" y1="13" x2="8" y2="13"></line>
                            <line x1="16" y1="17" x2="8" y2="17"></line>
                            <polyline points="10 9 9 9 8 9"></polyline>
                        </svg>
                        Notes
                    </a>
                </div>
            </div>

            <!-- Notes Toolbar -->
            <div class="notes-toolbar">
                <div class="notes-search">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    <input type="text" placeholder="Search all notes..." class="notes-search-input" />
                </div>
                <a href="<%= ResolveUrl("~/Student/AddNote.aspx") %>" class="btn-new-note" style="text-decoration:none;
                    display:inline-flex; align-items:center; justify-content:center; box-sizing:border-box;">+ New
                    Note</a>
            </div>

            <!-- Notes Grid -->
            <div class="notes-grid">

                <!-- Create New Note Card -->
                <a href="<%= ResolveUrl("~/Student/AddNote.aspx") %>" class="note-card note-card-create"
                    style="text-decoration:none;">
                    <div class="create-icon">
                        <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor"
                            stroke-width="2">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                    </div>
                    <span>Create New Note</span>
                </a>

                <!-- Note Card 1 -->
                <div class="note-card">
                    <div class="note-card-header">
                        <h3 class="note-title">Study Tips for Finals</h3>
                        <button class="btn-more"><svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                <circle cx="12" cy="5" r="2"></circle>
                                <circle cx="12" cy="12" r="2"></circle>
                                <circle cx="12" cy="19" r="2"></circle>
                            </svg></button>
                    </div>
                    <p class="note-preview">Focus on active recall and spaced repetition. Use the Pomodoro technique for
                        long sessions. Break down the syllabus into manageable...</p>
                    <div class="note-footer">
                        <span class="note-date">UPDATED 2 HOURS AGO</span>
                        <span class="note-tag tag-academic">ACADEMIC</span>
                    </div>
                </div>

                <!-- Note Card 2 -->
                <div class="note-card">
                    <div class="note-card-header">
                        <h3 class="note-title">Project Ideas - AI App</h3>
                        <button class="btn-more"><svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                <circle cx="12" cy="5" r="2"></circle>
                                <circle cx="12" cy="12" r="2"></circle>
                                <circle cx="12" cy="19" r="2"></circle>
                            </svg></button>
                    </div>
                    <p class="note-preview">1. Personal habit tracker with predictive analys 2. Automated flashcard
                        generator from lecture transcripts. 3. Smart grocery list...</p>
                    <div class="note-footer">
                        <span class="note-date">OCT 12, 2024</span>
                        <span class="note-tag tag-ideas">IDEAS</span>
                    </div>
                </div>

                <!-- Note Card 3 -->
                <div class="note-card">
                    <div class="note-card-header">
                        <h3 class="note-title">Meeting Notes: Group 4</h3>
                        <button class="btn-more"><svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                <circle cx="12" cy="5" r="2"></circle>
                                <circle cx="12" cy="12" r="2"></circle>
                                <circle cx="12" cy="19" r="2"></circle>
                            </svg></button>
                    </div>
                    <p class="note-preview">Decided on the tech stack: Next.js and Tailwind Alex to handle backend,
                        Sarah on UI/UX. Next sync is Friday at 3PM.</p>
                    <div class="note-footer">
                        <span class="note-date">OCT 10, 2024</span>
                        <span class="note-tag tag-meetings">MEETINGS</span>
                    </div>
                </div>

                <!-- Note Card 4 -->
                <div class="note-card">
                    <div class="note-card-header">
                        <h3 class="note-title">Weekly Shopping List</h3>
                        <button class="btn-more"><svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                <circle cx="12" cy="5" r="2"></circle>
                                <circle cx="12" cy="12" r="2"></circle>
                                <circle cx="12" cy="19" r="2"></circle>
                            </svg></button>
                    </div>
                    <p class="note-preview">Oat milk, avocados, whole grain bread, chicken breast, spinach, Greek
                        yogurt, frozen berries, coffee beans.</p>
                    <div class="note-footer">
                        <span class="note-date">OCT 08, 2024</span>
                        <span class="note-tag tag-personal">PERSONAL</span>
                    </div>
                </div>

                <!-- Note Card 5 -->
                <div class="note-card">
                    <div class="note-card-header">
                        <h3 class="note-title">Reading List: Psychology</h3>
                        <button class="btn-more"><svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                <circle cx="12" cy="5" r="2"></circle>
                                <circle cx="12" cy="12" r="2"></circle>
                                <circle cx="12" cy="19" r="2"></circle>
                            </svg></button>
                    </div>
                    <p class="note-preview">"Thinking, Fast and Slow" by Daniel Kahneman "Flow" by Mihaly
                        Csikszentmihalyi, "Atomic Habits" by James Clear.</p>
                    <div class="note-footer">
                        <span class="note-date">OCT 05, 2024</span>
                        <span class="note-tag tag-reading">READING</span>
                    </div>
                </div>

                <!-- Note Card 6 -->
                <div class="note-card">
                    <div class="note-card-header">
                        <h3 class="note-title">Research Paper Outline</h3>
                        <button class="btn-more"><svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                <circle cx="12" cy="5" r="2"></circle>
                                <circle cx="12" cy="12" r="2"></circle>
                                <circle cx="12" cy="19" r="2"></circle>
                            </svg></button>
                    </div>
                    <p class="note-preview">1. Introduction and Thesis Statement. 2. Literature Review of current
                        trends. 3. Methodology and Data Analysis.</p>
                    <div class="note-footer">
                        <span class="note-date">OCT 14, 2024</span>
                        <span class="note-tag tag-academic">ACADEMIC</span>
                    </div>
                </div>

            </div>

        </div>
    </asp:Content>

    <asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    </asp:Content>