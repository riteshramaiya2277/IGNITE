<%@ Page Title="Create New Note" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true"
    CodeBehind="AddNote.aspx.cs" Inherits="IGNITE.Student.AddNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/add-note.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Create Note
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="add-note-canvas">
        <div class="add-note-card">
            
            <div class="add-note-header">
                <div class="header-left">
                    <div class="icon-circle">
                        <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="#d9534f" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
                    </div>
                    <h1 class="header-title">Create New Note</h1>
                </div>
                <a href="<%= ResolveUrl("~/Student/Notes.aspx") %>" class="btn-close" title="Close">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </a>
            </div>

            <div class="form-group">
                <label class="form-label">NOTE TITLE</label>
                <input type="text" id="noteTitleInput" class="form-input" placeholder="e.g. Research Paper Outline" />
            </div>

            <div class="form-group">
                <label class="form-label">CATEGORY</label>
                <div class="category-options" id="categoryOptions">
                    <button type="button" class="btn-category active" data-category="ACADEMIC">ACADEMIC</button>
                    <button type="button" class="btn-category" data-category="PERSONAL">PERSONAL</button>
                    <button type="button" class="btn-category" data-category="IDEAS">IDEAS</button>
                    <button type="button" class="btn-category" data-category="MEETINGS">MEETINGS</button>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">NOTE CONTENT</label>
                <div class="editor-container">
                    <div class="editor-toolbar">
                        <button type="button" class="tool-btn" id="btnNoteBold" title="Bold"><strong style="font-family: serif;">B</strong></button>
                        <button type="button" class="tool-btn" id="btnNoteItalic" title="Italic"><em style="font-family: serif;">I</em></button>
                        <button type="button" class="tool-btn" id="btnNoteBullet" title="Bullet List"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg></button>
                        <button type="button" class="tool-btn" id="btnNoteNumbered" title="Numbered List"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="10" y1="6" x2="21" y2="6"></line><line x1="10" y1="12" x2="21" y2="12"></line><line x1="10" y1="18" x2="21" y2="18"></line><path d="M4 6h1v4"></path><path d="M4 10h2"></path><path d="M6 18H4c0-1 2-2 2-3s-1-1.5-2-1"></path></svg></button>
                        <div class="tool-divider"></div>
                        <button type="button" class="tool-btn" id="btnNoteLink" title="Insert Link"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg></button>
                        <button type="button" class="tool-btn" id="btnNoteImage" title="Insert Image"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg></button>
                    </div>
                    <textarea id="noteContentArea" class="editor-textarea" placeholder="Start typing your note here..."></textarea>
                </div>
            </div>

            <div class="add-note-footer">
                <a href="<%= ResolveUrl("~/Student/Notes.aspx") %>" class="btn-cancel">Cancel</a>
                <button type="button" id="btnSaveNote" class="btn-save">+ Save Note</button>
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script type="text/javascript">
        (function () {
            'use strict';

            const STORAGE_KEY = 'ignite_notes_list';

            document.addEventListener('DOMContentLoaded', function () {
                const titleInput = document.getElementById('noteTitleInput');
                const contentArea = document.getElementById('noteContentArea');
                const saveBtn = document.getElementById('btnSaveNote');
                const categoryBtns = document.querySelectorAll('#categoryOptions .btn-category');

                let selectedCategory = 'ACADEMIC';

                // Category toggle
                categoryBtns.forEach(function (btn) {
                    btn.addEventListener('click', function () {
                        categoryBtns.forEach(function (b) { b.classList.remove('active'); });
                        btn.classList.add('active');
                        selectedCategory = btn.getAttribute('data-category') || 'ACADEMIC';
                    });
                });

                // Helper to wrap or prepend text in textarea
                function insertFormatting(prefix, suffix, defaultText) {
                    contentArea.focus();
                    const start = contentArea.selectionStart;
                    const end = contentArea.selectionEnd;
                    const val = contentArea.value;
                    const selected = val.substring(start, end);

                    const insertText = selected ? (prefix + selected + suffix) : (prefix + defaultText + suffix);
                    contentArea.value = val.substring(0, start) + insertText + val.substring(end);

                    const newCursorPos = selected ? start + insertText.length : start + prefix.length;
                    contentArea.setSelectionRange(newCursorPos, newCursorPos + (selected ? 0 : defaultText.length));
                }

                // Toolbar handlers
                document.getElementById('btnNoteBold')?.addEventListener('click', function () {
                    insertFormatting('**', '**', 'bold text');
                });

                document.getElementById('btnNoteItalic')?.addEventListener('click', function () {
                    insertFormatting('*', '*', 'italic text');
                });

                document.getElementById('btnNoteBullet')?.addEventListener('click', function () {
                    insertFormatting('\n- ', '', 'List item');
                });

                document.getElementById('btnNoteNumbered')?.addEventListener('click', function () {
                    insertFormatting('\n1. ', '', 'Numbered item');
                });

                document.getElementById('btnNoteLink')?.addEventListener('click', function () {
                    const url = prompt('Enter link URL (e.g. https://...):', 'https://');
                    if (url && url.trim() && url !== 'https://') {
                        insertFormatting('[', '](' + url.trim() + ')', 'Link text');
                    }
                });

                document.getElementById('btnNoteImage')?.addEventListener('click', function () {
                    const url = prompt('Enter image URL:', 'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?w=600');
                    if (url && url.trim()) {
                        insertFormatting('![Image](', url.trim() + ')', '');
                    }
                });

                // Save Note
                saveBtn?.addEventListener('click', function () {
                    const title = titleInput.value.trim();
                    if (!title) {
                        titleInput.focus();
                        titleInput.style.border = '1px solid #d9534f';
                        alert('Please enter a note title.');
                        return;
                    }
                    titleInput.style.border = '';

                    const content = contentArea.value.trim();
                    const preview = content ? (content.length > 120 ? content.substring(0, 120) + '...' : content) : 'No content provided.';

                    let notes = [];
                    try {
                        const raw = localStorage.getItem(STORAGE_KEY);
                        if (raw) notes = JSON.parse(raw);
                    } catch (e) {}

                    const newNote = {
                        id: 'note-' + Date.now(),
                        title: title,
                        preview: preview,
                        date: 'JUST NOW',
                        tag: selectedCategory,
                        tagClass: 'tag-' + selectedCategory.toLowerCase()
                    };

                    notes.unshift(newNote);
                    try {
                        localStorage.setItem(STORAGE_KEY, JSON.stringify(notes));
                    } catch (e) {}

                    saveBtn.textContent = '✓ Saved!';
                    saveBtn.style.backgroundColor = '#48bb78';

                    setTimeout(function () {
                        window.location.href = '<%= ResolveUrl("~/Student/Notes.aspx") %>';
                    }, 500);
                });
            });
        })();
    </script>
</asp:Content>
