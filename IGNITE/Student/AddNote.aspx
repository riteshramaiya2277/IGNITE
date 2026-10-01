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
                <a href="<%= ResolveUrl("~/Student/Notes.aspx") %>" class="btn-close">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </a>
            </div>

            <div class="form-group">
                <label class="form-label">NOTE TITLE</label>
                <input type="text" class="form-input" placeholder="e.g. Research Paper Outline" />
            </div>

            <div class="form-group">
                <label class="form-label">CATEGORY</label>
                <div class="category-options">
                    <button type="button" class="btn-category active">ACADEMIC</button>
                    <button type="button" class="btn-category">PERSONAL</button>
                    <button type="button" class="btn-category">IDEAS</button>
                    <button type="button" class="btn-category">MEETINGS</button>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">NOTE CONTENT</label>
                <div class="editor-container">
                    <div class="editor-toolbar">
                        <button type="button" class="tool-btn"><strong style="font-family: serif;">B</strong></button>
                        <button type="button" class="tool-btn"><em style="font-family: serif;">I</em></button>
                        <button type="button" class="tool-btn"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg></button>
                        <button type="button" class="tool-btn"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><line x1="10" y1="6" x2="21" y2="6"></line><line x1="10" y1="12" x2="21" y2="12"></line><line x1="10" y1="18" x2="21" y2="18"></line><path d="M4 6h1v4"></path><path d="M4 10h2"></path><path d="M6 18H4c0-1 2-2 2-3s-1-1.5-2-1"></path></svg></button>
                        <div class="tool-divider"></div>
                        <button type="button" class="tool-btn"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg></button>
                        <button type="button" class="tool-btn"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg></button>
                    </div>
                    <textarea class="editor-textarea" placeholder="Start typing your note here..."></textarea>
                </div>
            </div>

            <div class="add-note-footer">
                <a href="<%= ResolveUrl("~/Student/Notes.aspx") %>" class="btn-cancel">Cancel</a>
                <button type="button" class="btn-save">+ Save Note</button>
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
