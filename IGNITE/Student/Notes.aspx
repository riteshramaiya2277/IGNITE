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
                    <input type="text" id="notesSearchInput" placeholder="Search all notes..." class="notes-search-input" />
                </div>
                <a href="<%= ResolveUrl("~/Student/AddNote.aspx") %>" class="btn-new-note" style="text-decoration:none;
                    display:inline-flex; align-items:center; justify-content:center; box-sizing:border-box;">+ New
                    Note</a>
            </div>

            <!-- Notes Grid -->
            <div class="notes-grid" id="notesGridContainer">

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

                <!-- Dynamic Notes rendered here -->
            </div>

            <!-- Toast Notice -->
            <div id="notesToast" class="toast-notice">
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#5cb85c" stroke-width="2.5">
                    <polyline points="20 6 9 17 4 12"></polyline>
                </svg>
                <span id="notesToastText">Notification message</span>
            </div>

        </div>
    </asp:Content>

    <asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
        <script type="text/javascript">
            (function () {
                'use strict';

                const STORAGE_KEY = 'ignite_notes_list';

                const DEFAULT_NOTES = [
                    {
                        id: 'note-1',
                        title: 'Study Tips for Finals',
                        preview: 'Focus on active recall and spaced repetition. Use the Pomodoro technique for long sessions. Break down the syllabus into manageable chunks...',
                        date: 'UPDATED 2 HOURS AGO',
                        tag: 'ACADEMIC',
                        tagClass: 'tag-academic'
                    },
                    {
                        id: 'note-2',
                        title: 'Project Ideas - AI App',
                        preview: '1. Personal habit tracker with predictive analysis 2. Automated flashcard generator from lecture transcripts. 3. Smart grocery list and budget planner...',
                        date: 'OCT 12, 2024',
                        tag: 'IDEAS',
                        tagClass: 'tag-ideas'
                    },
                    {
                        id: 'note-3',
                        title: 'Meeting Notes: Group 4',
                        preview: 'Decided on the tech stack: Next.js and Tailwind Alex to handle backend, Sarah on UI/UX. Next sync is Friday at 3PM.',
                        date: 'OCT 10, 2024',
                        tag: 'MEETINGS',
                        tagClass: 'tag-meetings'
                    },
                    {
                        id: 'note-4',
                        title: 'Weekly Shopping List',
                        preview: 'Oat milk, avocados, whole grain bread, chicken breast, spinach, Greek yogurt, frozen berries, coffee beans.',
                        date: 'OCT 08, 2024',
                        tag: 'PERSONAL',
                        tagClass: 'tag-personal'
                    },
                    {
                        id: 'note-5',
                        title: 'Reading List: Psychology',
                        preview: '"Thinking, Fast and Slow" by Daniel Kahneman "Flow" by Mihaly Csikszentmihalyi, "Atomic Habits" by James Clear.',
                        date: 'OCT 05, 2024',
                        tag: 'READING',
                        tagClass: 'tag-reading'
                    },
                    {
                        id: 'note-6',
                        title: 'Research Paper Outline',
                        preview: '1. Introduction and Thesis Statement. 2. Literature Review of current trends. 3. Methodology and Data Analysis.',
                        date: 'OCT 14, 2024',
                        tag: 'ACADEMIC',
                        tagClass: 'tag-academic'
                    }
                ];

                let notes = [];
                let toastTimer = null;

                function init() {
                    loadNotes();
                    renderNotes();

                    const searchInput = document.getElementById('notesSearchInput');
                    if (searchInput) {
                        searchInput.addEventListener('input', function () {
                            filterNotes(this.value.trim().toLowerCase());
                        });
                    }

                    // Close any open dropdowns when clicking outside
                    document.addEventListener('click', function (e) {
                        if (!e.target.closest('.note-card-header')) {
                            closeAllDropdowns();
                        }
                    });
                }

                function loadNotes() {
                    try {
                        const raw = localStorage.getItem(STORAGE_KEY);
                        if (raw) {
                            const parsed = JSON.parse(raw);
                            if (Array.isArray(parsed) && parsed.length > 0) {
                                notes = parsed;
                                return;
                            }
                        }
                    } catch (e) {
                        console.error('Error loading notes from localStorage', e);
                    }
                    notes = JSON.parse(JSON.stringify(DEFAULT_NOTES));
                    persistNotes();
                }

                function persistNotes() {
                    try {
                        localStorage.setItem(STORAGE_KEY, JSON.stringify(notes));
                    } catch (e) {
                        console.error('Error saving notes to localStorage', e);
                    }
                }

                function renderNotes() {
                    const grid = document.getElementById('notesGridContainer');
                    if (!grid) return;

                    // Keep Create New Note card
                    const createCard = grid.querySelector('.note-card-create');
                    grid.innerHTML = '';
                    if (createCard) {
                        grid.appendChild(createCard);
                    }

                    notes.forEach(function (note) {
                        const card = createNoteCardElement(note);
                        grid.appendChild(card);
                    });
                }

                function createNoteCardElement(note) {
                    const card = document.createElement('div');
                    card.className = 'note-card';
                    card.setAttribute('data-id', note.id);

                    const header = document.createElement('div');
                    header.className = 'note-card-header';

                    const title = document.createElement('h3');
                    title.className = 'note-title';
                    title.textContent = note.title;

                    const btnMore = document.createElement('button');
                    btnMore.className = 'btn-more';
                    btnMore.setAttribute('type', 'button');
                    btnMore.setAttribute('title', 'More options');
                    btnMore.innerHTML = '<svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">' +
                        '<circle cx="12" cy="5" r="2"></circle>' +
                        '<circle cx="12" cy="12" r="2"></circle>' +
                        '<circle cx="12" cy="19" r="2"></circle>' +
                        '</svg>';

                    // Dropdown menu
                    const dropdown = document.createElement('div');
                    dropdown.className = 'note-menu-dropdown';

                    const btnCopy = document.createElement('button');
                    btnCopy.className = 'note-menu-item';
                    btnCopy.setAttribute('type', 'button');
                    btnCopy.innerHTML = '<svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="2"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg> Copy Text';
                    btnCopy.addEventListener('click', function (e) {
                        e.stopPropagation();
                        closeAllDropdowns();
                        copyNoteContent(note);
                    });

                    const btnDelete = document.createElement('button');
                    btnDelete.className = 'note-menu-item danger';
                    btnDelete.setAttribute('type', 'button');
                    btnDelete.innerHTML = '<svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg> Delete Note';
                    btnDelete.addEventListener('click', function (e) {
                        e.stopPropagation();
                        closeAllDropdowns();
                        deleteNote(note.id);
                    });

                    dropdown.appendChild(btnCopy);
                    dropdown.appendChild(btnDelete);

                    btnMore.addEventListener('click', function (e) {
                        e.stopPropagation();
                        const isShown = dropdown.classList.contains('show');
                        closeAllDropdowns();
                        if (!isShown) {
                            dropdown.classList.add('show');
                        }
                    });

                    header.appendChild(title);
                    header.appendChild(btnMore);
                    header.appendChild(dropdown);

                    const preview = document.createElement('p');
                    preview.className = 'note-preview';
                    preview.textContent = note.preview;

                    const footer = document.createElement('div');
                    footer.className = 'note-footer';

                    const date = document.createElement('span');
                    date.className = 'note-date';
                    date.textContent = note.date;

                    const tag = document.createElement('span');
                    const tagClass = note.tagClass || ('tag-' + (note.tag || 'academic').toLowerCase());
                    tag.className = 'note-tag ' + tagClass;
                    tag.textContent = note.tag || 'GENERAL';

                    footer.appendChild(date);
                    footer.appendChild(tag);

                    card.appendChild(header);
                    card.appendChild(preview);
                    card.appendChild(footer);

                    return card;
                }

                function closeAllDropdowns() {
                    const dropdowns = document.querySelectorAll('.note-menu-dropdown.show');
                    dropdowns.forEach(function (d) {
                        d.classList.remove('show');
                    });
                }

                function copyNoteContent(note) {
                    const text = note.title + '\n\n' + note.preview;
                    if (navigator.clipboard && navigator.clipboard.writeText) {
                        navigator.clipboard.writeText(text).then(function () {
                            showToast('Note copied to clipboard!');
                        }).catch(function () {
                            fallbackCopy(text);
                        });
                    } else {
                        fallbackCopy(text);
                    }
                }

                function fallbackCopy(text) {
                    const ta = document.createElement('textarea');
                    ta.value = text;
                    ta.style.position = 'fixed';
                    ta.style.left = '-9999px';
                    document.body.appendChild(ta);
                    ta.select();
                    document.execCommand('copy');
                    document.body.removeChild(ta);
                    showToast('Note copied to clipboard!');
                }

                function deleteNote(id) {
                    if (!confirm('Are you sure you want to delete this note?')) return;

                    notes = notes.filter(function (n) { return n.id !== id; });
                    persistNotes();
                    renderNotes();
                    showToast('Note deleted.');
                }

                function filterNotes(query) {
                    const cards = document.querySelectorAll('.notes-grid .note-card:not(.note-card-create)');
                    let visibleCount = 0;

                    cards.forEach(function (card) {
                        const title = (card.querySelector('.note-title')?.textContent || '').toLowerCase();
                        const preview = (card.querySelector('.note-preview')?.textContent || '').toLowerCase();
                        const tag = (card.querySelector('.note-tag')?.textContent || '').toLowerCase();

                        if (!query || title.includes(query) || preview.includes(query) || tag.includes(query)) {
                            card.style.display = '';
                            visibleCount++;
                        } else {
                            card.style.display = 'none';
                        }
                    });

                    // Manage empty message
                    let emptyMsg = document.getElementById('notesEmptyMessage');
                    if (visibleCount === 0 && query) {
                        if (!emptyMsg) {
                            emptyMsg = document.createElement('div');
                            emptyMsg.id = 'notesEmptyMessage';
                            emptyMsg.className = 'notes-empty-state';
                            emptyMsg.textContent = 'No notes match "' + query + '".';
                            document.getElementById('notesGridContainer').appendChild(emptyMsg);
                        } else {
                            emptyMsg.textContent = 'No notes match "' + query + '".';
                            emptyMsg.style.display = '';
                        }
                    } else if (emptyMsg) {
                        emptyMsg.style.display = 'none';
                    }
                }

                function showToast(msg) {
                    const toast = document.getElementById('notesToast');
                    const toastText = document.getElementById('notesToastText');
                    if (!toast || !toastText) return;

                    toastText.textContent = msg;
                    toast.classList.add('show');

                    if (toastTimer) clearTimeout(toastTimer);
                    toastTimer = setTimeout(function () {
                        toast.classList.remove('show');
                    }, 3000);
                }

                if (document.readyState === 'loading') {
                    document.addEventListener('DOMContentLoaded', init);
                } else {
                    init();
                }
            })();
        </script>
    </asp:Content>