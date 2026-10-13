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
                <a href="<%= ResolveUrl("~/Student/Journal.aspx") %>" class="btn-toggle active">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
                    Journal
                </a>
                <a href="<%= ResolveUrl("~/Student/Notes.aspx") %>" class="btn-toggle">
                    <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    Notes
                </a>
            </div>
        </div>

        <div class="journal-body-layout">
            <!-- Sidebar / Entry List -->
            <aside class="journal-sidebar">
                <button id="btnNewEntry" class="btn-new-entry" type="button">+ New Entry</button>
                
                <div id="journalEntriesContainer">
                    <!-- Dynamic timeline groups and cards will be rendered here -->
                </div>
            </aside>

            <!-- Editor Area -->
            <div class="journal-editor-container">
                <div class="editor-header">
                    <div class="editor-title-group" style="flex: 1; margin-right: 20px;">
                        <h2 id="journalEditorTitle" class="editor-title" contenteditable="true" spellcheck="false" data-placeholder="Enter entry title...">Reflection on CS101</h2>
                        <span id="journalSavedStatus" class="editor-saved-status">Last saved Oct 14, 2024 at 11:20 AM</span>
                    </div>
                    <div class="editor-actions">
                        <button id="btnDeleteEntry" class="btn-icon" title="Delete Entry" type="button">
                            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                        </button>
                        <button id="btnSaveChanges" class="btn-save" type="button">Save Changes</button>
                    </div>
                </div>

                <div class="editor-emotion-selector">
                    <span class="selector-label">HOW ARE YOU FEELING?</span>
                    <div class="emotion-icons" id="emotionIconsList">
                        <div class="emotion-item active" data-emotion="happy">
                            <span class="emoji-circle happy">&#128522;</span>
                            <span class="emoji-label happy">HAPPY</span>
                        </div>
                        <div class="emotion-item" data-emotion="calm">
                            <span class="emoji-circle calm">&#128524;</span>
                            <span class="emoji-label calm">CALM</span>
                        </div>
                        <div class="emotion-item" data-emotion="neutral">
                            <span class="emoji-circle neutral">&#128528;</span>
                            <span class="emoji-label neutral">NEUTRAL</span>
                        </div>
                        <div class="emotion-item" data-emotion="focus">
                            <span class="emoji-circle focus">&#9889;</span>
                            <span class="emoji-label focus">FOCUS</span>
                        </div>
                        <div class="emotion-item" data-emotion="tired">
                            <span class="emoji-circle tired">&#129393;</span>
                            <span class="emoji-label tired">TIRED</span>
                        </div>
                        <div class="emotion-item" data-emotion="anxious">
                            <span class="emoji-circle anxious">&#128560;</span>
                            <span class="emoji-label anxious">ANXIOUS</span>
                        </div>
                    </div>
                </div>

                <div class="editor-toolbar">
                    <button class="tool-btn" id="btnToolBold" type="button" title="Bold"><strong style="font-family: serif;">B</strong></button>
                    <button class="tool-btn" id="btnToolItalic" type="button" title="Italic"><em style="font-family: serif;">I</em></button>
                    <button class="tool-btn" id="btnToolList" type="button" title="List">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
                    </button>
                    <button class="tool-btn" id="btnToolLink" type="button" title="Link">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg>
                    </button>
                    <div class="tool-divider"></div>
                    <button class="tool-btn" id="btnToolImage" type="button" title="Image">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg>
                    </button>
                </div>

                <div id="journalEditorContent" class="editor-content-area" contenteditable="true" spellcheck="true" data-placeholder="Start writing your reflection or thoughts here...">
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

        <!-- Toast Notice -->
        <div id="journalToast" class="toast-notice">
            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#5cb85c" stroke-width="2.5">
                <polyline points="20 6 9 17 4 12"></polyline>
            </svg>
            <span id="journalToastText">Notification message</span>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        (function () {
            'use strict';

            const STORAGE_KEY = 'ignite_journal_entries';

            // Emotion mapping for emoji and styling
            const EMOTION_MAP = {
                happy: { emoji: '&#128522;', label: 'HAPPY', tagClass: 'happy' },
                calm: { emoji: '&#128524;', label: 'CALM', tagClass: 'calm' },
                neutral: { emoji: '&#128528;', label: 'NEUTRAL', tagClass: 'neutral' },
                focus: { emoji: '&#9889;', label: 'FOCUS', tagClass: 'focus' },
                energetic: { emoji: '&#9889;', label: 'ENERGETIC', tagClass: 'energetic' },
                tired: { emoji: '&#129393;', label: 'TIRED', tagClass: 'tired' },
                anxious: { emoji: '&#128560;', label: 'ANXIOUS', tagClass: 'anxious' }
            };

            // Seed entries matching original design
            const DEFAULT_ENTRIES = [
                {
                    id: 'entry-1',
                    title: 'Reflection on CS101',
                    dateGroup: 'TODAY',
                    time: '10:45 AM',
                    lastSaved: 'Oct 14, 2024 at 11:20 AM',
                    emotion: 'happy',
                    preview: "Today's lecture on algorithms was particularly challenging but rewarding. I finally understood...",
                    content: "<p>Today's lecture on <strong>algorithms</strong> was particularly challenging but rewarding. I finally understood the time complexity of binary search trees after re-watching the recording.</p><p>I noticed that I concentrate much better in the mornings after a light breakfast. My goal for tomorrow is to start the assignment earlier to avoid the late-night stress I had last week.</p><p>Current thoughts:</p><ul><li>Need more practice with recursion problems.</li><li>Ask TA about the project structure during office hours.</li><li>Remember to take breaks every 45 minutes to avoid burnout.</li></ul>"
                },
                {
                    id: 'entry-2',
                    title: 'Monthly Goal Progress',
                    dateGroup: 'YESTERDAY',
                    time: '4:20 PM',
                    lastSaved: 'Yesterday at 4:20 PM',
                    emotion: 'energetic',
                    preview: 'Feeling productive after completing my monthly goal review. Out of 5 goals set...',
                    content: "<p>Feeling productive after completing my monthly goal review. Out of 5 goals set for this sprint, 4 are fully on schedule!</p><p>Key achievements this month:</p><ul><li>Maintained consistent morning study routine for 15 straight days.</li><li>Completed chapters 1 through 4 of Data Structures.</li><li>Submitted assignment ahead of the deadline.</li></ul>"
                },
                {
                    id: 'entry-3',
                    title: 'Exam Anxiety Notes',
                    dateGroup: 'OCT 12, 2024',
                    time: '11:15 PM',
                    lastSaved: 'Oct 12, 2024 at 11:15 PM',
                    emotion: 'anxious',
                    preview: 'I need to manage my time better to avoid pre-exam stress. When multiple deadlines...',
                    content: "<p>I need to manage my time better to avoid pre-exam stress. When multiple deadlines converge, I feel overwhelmed.</p><p>Strategies to overcome this:</p><ul><li>Divide large study blocks into 25-minute Pomodoro sessions.</li><li>Practice deep breathing before opening test materials.</li><li>Reach out to study partners for group practice.</li></ul>"
                }
            ];

            let entries = [];
            let currentEntryId = null;

            // DOM elements
            let containerEl, titleEl, statusEl, contentEl, btnNewEl, btnSaveEl, btnDeleteEl;
            let btnBold, btnItalic, btnList, btnLink, btnImage;
            let emotionItems;

            // Toast timeout reference
            let toastTimer = null;

            function init() {
                containerEl = document.getElementById('journalEntriesContainer');
                titleEl = document.getElementById('journalEditorTitle');
                statusEl = document.getElementById('journalSavedStatus');
                contentEl = document.getElementById('journalEditorContent');
                btnNewEl = document.getElementById('btnNewEntry');
                btnSaveEl = document.getElementById('btnSaveChanges');
                btnDeleteEl = document.getElementById('btnDeleteEntry');

                btnBold = document.getElementById('btnToolBold');
                btnItalic = document.getElementById('btnToolItalic');
                btnList = document.getElementById('btnToolList');
                btnLink = document.getElementById('btnToolLink');
                btnImage = document.getElementById('btnToolImage');

                emotionItems = document.querySelectorAll('#emotionIconsList .emotion-item');

                loadEntries();

                // Bind main events
                btnNewEl.addEventListener('click', createNewEntry);
                btnSaveEl.addEventListener('click', saveCurrentEntry);
                btnDeleteEl.addEventListener('click', deleteCurrentEntry);

                // Emotion selector events
                emotionItems.forEach(function (item) {
                    item.addEventListener('click', function () {
                        const emotion = item.getAttribute('data-emotion');
                        selectEmotion(emotion);
                    });
                });

                // Prevent toolbar mousedown from un-focusing editor selection
                [btnBold, btnItalic, btnList, btnLink, btnImage].forEach(function (btn) {
                    if (btn) {
                        btn.addEventListener('mousedown', function (e) {
                            e.preventDefault();
                        });
                    }
                });

                // Toolbar formatting execution
                if (btnBold) {
                    btnBold.addEventListener('click', function () {
                        contentEl.focus();
                        document.execCommand('bold', false, null);
                        updateToolbarStatus();
                    });
                }

                if (btnItalic) {
                    btnItalic.addEventListener('click', function () {
                        contentEl.focus();
                        document.execCommand('italic', false, null);
                        updateToolbarStatus();
                    });
                }

                if (btnList) {
                    btnList.addEventListener('click', function () {
                        contentEl.focus();
                        document.execCommand('insertUnorderedList', false, null);
                        updateToolbarStatus();
                    });
                }

                if (btnLink) {
                    btnLink.addEventListener('click', function () {
                        contentEl.focus();
                        const url = prompt('Enter link URL (e.g., https://example.com):', 'https://');
                        if (url && url.trim() && url !== 'https://') {
                            document.execCommand('createLink', false, url.trim());
                        }
                    });
                }

                if (btnImage) {
                    btnImage.addEventListener('click', function () {
                        contentEl.focus();
                        const imgUrl = prompt('Enter image URL:', 'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?w=600');
                        if (imgUrl && imgUrl.trim()) {
                            document.execCommand('insertImage', false, imgUrl.trim());
                        }
                    });
                }

                // Prevent enter in title from creating block breaks; jump to content
                titleEl.addEventListener('keydown', function (e) {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        contentEl.focus();
                    }
                });

                // Real-time update of title in sidebar
                titleEl.addEventListener('input', function () {
                    const activeCardTitle = document.querySelector('.entry-card.active .entry-title');
                    if (activeCardTitle) {
                        activeCardTitle.textContent = titleEl.innerText.trim() || 'Untitled Reflection';
                    }
                });

                // Selection changes update toolbar active highlight
                document.addEventListener('selectionchange', function () {
                    if (document.activeElement === contentEl) {
                        updateToolbarStatus();
                    }
                });

                // Render initial entries list
                renderSidebar();

                // Select initial entry
                if (entries.length > 0) {
                    selectEntry(entries[0].id);
                } else {
                    createNewEntry();
                }
            }

            function loadEntries() {
                try {
                    const raw = localStorage.getItem(STORAGE_KEY);
                    if (raw) {
                        const parsed = JSON.parse(raw);
                        if (Array.isArray(parsed) && parsed.length > 0) {
                            entries = parsed;
                            return;
                        }
                    }
                } catch (e) {
                    console.error('Error loading entries from localStorage', e);
                }
                // Fallback to default entries
                entries = JSON.parse(JSON.stringify(DEFAULT_ENTRIES));
                persistEntries();
            }

            function persistEntries() {
                try {
                    localStorage.setItem(STORAGE_KEY, JSON.stringify(entries));
                } catch (e) {
                    console.error('Error saving entries to localStorage', e);
                }
            }

            function renderSidebar() {
                if (!containerEl) return;
                containerEl.innerHTML = '';

                // Group entries by dateGroup preserving order
                const groups = {};
                const groupOrder = [];

                entries.forEach(function (entry) {
                    const g = entry.dateGroup || 'TODAY';
                    if (!groups[g]) {
                        groups[g] = [];
                        groupOrder.push(g);
                    }
                    groups[g].push(entry);
                });

                groupOrder.forEach(function (groupName) {
                    const groupWrapper = document.createElement('div');
                    groupWrapper.className = 'timeline-group';

                    const groupHeading = document.createElement('h4');
                    groupHeading.className = 'timeline-label';
                    groupHeading.textContent = groupName;
                    groupWrapper.appendChild(groupHeading);

                    groups[groupName].forEach(function (entry) {
                        const card = document.createElement('div');
                        card.className = 'entry-card' + (entry.id === currentEntryId ? ' active' : '');
                        card.setAttribute('data-id', entry.id);

                        const emotionInfo = EMOTION_MAP[entry.emotion] || EMOTION_MAP.happy;

                        card.innerHTML =
                            '<h5 class="entry-title">' + escapeHtml(entry.title || 'Untitled') + '</h5>' +
                            '<p class="entry-preview">' + escapeHtml(entry.preview || '') + '</p>' +
                            '<div class="entry-meta">' +
                                '<span>' + escapeHtml(entry.time || '') + '</span>' +
                                '<span class="emotion-tag ' + emotionInfo.tagClass + '">' +
                                    emotionInfo.emoji + ' ' + emotionInfo.label +
                                '</span>' +
                            '</div>';

                        card.addEventListener('click', function () {
                            selectEntry(entry.id);
                        });

                        groupWrapper.appendChild(card);
                    });

                    containerEl.appendChild(groupWrapper);
                });
            }

            function selectEntry(id) {
                const entry = entries.find(function (e) { return e.id === id; });
                if (!entry) return;

                currentEntryId = id;

                // Update active state in sidebar cards
                const allCards = containerEl.querySelectorAll('.entry-card');
                allCards.forEach(function (card) {
                    if (card.getAttribute('data-id') === id) {
                        card.classList.add('active');
                    } else {
                        card.classList.remove('active');
                    }
                });

                // Populate Editor
                titleEl.innerText = entry.title || 'Untitled Reflection';
                statusEl.textContent = 'Last saved ' + (entry.lastSaved || 'Just now');
                contentEl.innerHTML = entry.content || '<p></p>';

                // Update emotion active state
                emotionItems.forEach(function (item) {
                    if (item.getAttribute('data-emotion') === entry.emotion) {
                        item.classList.add('active');
                    } else {
                        item.classList.remove('active');
                    }
                });

                updateToolbarStatus();
            }

            function selectEmotion(emotionName) {
                emotionItems.forEach(function (item) {
                    if (item.getAttribute('data-emotion') === emotionName) {
                        item.classList.add('active');
                    } else {
                        item.classList.remove('active');
                    }
                });

                const entry = entries.find(function (e) { return e.id === currentEntryId; });
                if (entry) {
                    entry.emotion = emotionName;
                    persistEntries();

                    // Update emotion badge on active sidebar card immediately
                    const activeCard = containerEl.querySelector('.entry-card.active .emotion-tag');
                    if (activeCard) {
                        const emotionInfo = EMOTION_MAP[emotionName] || EMOTION_MAP.happy;
                        activeCard.className = 'emotion-tag ' + emotionInfo.tagClass;
                        activeCard.innerHTML = emotionInfo.emoji + ' ' + emotionInfo.label;
                    }
                }
            }

            function createNewEntry() {
                const now = new Date();
                const timeString = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
                const dateGroup = 'TODAY';

                const newEntry = {
                    id: 'entry-' + Date.now(),
                    title: 'New Reflection',
                    dateGroup: dateGroup,
                    time: timeString,
                    lastSaved: 'Just now',
                    emotion: 'happy',
                    preview: 'Start writing your reflection or thoughts here...',
                    content: '<p>Start writing your reflection or thoughts here...</p>'
                };

                // Add to start of entries
                entries.unshift(newEntry);
                persistEntries();
                renderSidebar();
                selectEntry(newEntry.id);

                // Focus title and select text for effortless renaming
                titleEl.focus();
                try {
                    const range = document.createRange();
                    range.selectNodeContents(titleEl);
                    const sel = window.getSelection();
                    sel.removeAllRanges();
                    sel.addRange(range);
                } catch (e) {
                    // Fallback focus
                }

                showToast('New journal entry created!');
            }

            function saveCurrentEntry() {
                const entry = entries.find(function (e) { return e.id === currentEntryId; });
                if (!entry) return;

                const newTitle = titleEl.innerText.trim() || 'Untitled Reflection';
                const newContent = contentEl.innerHTML;
                const plainText = contentEl.innerText.trim();
                const previewText = plainText.length > 80 ? plainText.substring(0, 80) + '...' : plainText;

                const activeEmotionItem = document.querySelector('#emotionIconsList .emotion-item.active');
                const selectedEmotion = activeEmotionItem ? activeEmotionItem.getAttribute('data-emotion') : entry.emotion;

                const now = new Date();
                const timeStr = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

                entry.title = newTitle;
                entry.content = newContent;
                entry.preview = previewText || "No content yet...";
                entry.emotion = selectedEmotion;
                entry.lastSaved = 'Today at ' + timeStr;

                persistEntries();
                renderSidebar();

                statusEl.textContent = 'Last saved Just now';

                // Visual button confirmation
                btnSaveEl.classList.add('saved-success');
                const originalText = btnSaveEl.textContent;
                btnSaveEl.textContent = '✓ Saved!';

                setTimeout(function () {
                    btnSaveEl.classList.remove('saved-success');
                    btnSaveEl.textContent = originalText;
                }, 1500);

                showToast('Journal entry saved successfully!');
            }

            function deleteCurrentEntry() {
                if (entries.length <= 1) {
                    if (!confirm('This is your only journal entry. Do you want to reset it to a clean entry?')) {
                        return;
                    }
                    entries = [];
                    createNewEntry();
                    showToast('Journal reset.');
                    return;
                }

                if (!confirm('Are you sure you want to delete this journal entry?')) {
                    return;
                }

                const index = entries.findIndex(function (e) { return e.id === currentEntryId; });
                if (index > -1) {
                    entries.splice(index, 1);
                    persistEntries();
                    const nextEntry = entries[Math.min(index, entries.length - 1)];
                    currentEntryId = nextEntry.id;
                    renderSidebar();
                    selectEntry(nextEntry.id);
                    showToast('Journal entry deleted.');
                }
            }

            function updateToolbarStatus() {
                if (btnBold) {
                    btnBold.classList.toggle('active', document.queryCommandState('bold'));
                }
                if (btnItalic) {
                    btnItalic.classList.toggle('active', document.queryCommandState('italic'));
                }
                if (btnList) {
                    btnList.classList.toggle('active', document.queryCommandState('insertUnorderedList'));
                }
            }

            function showToast(msg) {
                const toast = document.getElementById('journalToast');
                const toastText = document.getElementById('journalToastText');
                if (!toast || !toastText) return;

                toastText.textContent = msg;
                toast.classList.add('show');

                if (toastTimer) clearTimeout(toastTimer);
                toastTimer = setTimeout(function () {
                    toast.classList.remove('show');
                }, 3000);
            }

            function escapeHtml(str) {
                if (!str) return '';
                return str
                    .replace(/&/g, '&amp;')
                    .replace(/</g, '&lt;')
                    .replace(/>/g, '&gt;')
                    .replace(/"/g, '&quot;')
                    .replace(/'/g, '&#39;');
            }

            // Initialize when DOM is ready
            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', init);
            } else {
                init();
            }
        })();
    </script>
</asp:Content>
