<%@ Page Title="Students — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="IGNITE.Admin.Students" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/admin-students.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="TopbarContent" ContentPlaceHolderID="TopbarContent" runat="server">
    <div style="display:flex; justify-content:flex-end; align-items:center; width:100%; gap:24px;">
        
        <!-- Search Bar -->
        <div style="display:flex; align-items:center; background:#fff; border-radius:24px; padding:8px 16px; width:280px; box-shadow:0 1px 2px rgba(0,0,0,0.02);">
            <svg viewBox="0 0 24 24" fill="none" stroke="#999" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="width:16px; height:16px;">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
            <input type="text" placeholder="Search platform..." style="border:none; outline:none; font-size:13px; margin-left:10px; width:100%; background:transparent; font-family:inherit;" />
        </div>

        <!-- Admin Profile -->
        <div style="display:flex; align-items:center; gap:12px; cursor:pointer;">
            <div style="text-align:right;">
                <div style="font-weight:700; color:#1a1a1a; font-size:13px; line-height:1.2;">Admin User</div>
                <div style="font-weight:700; color:#888; font-size:9px; text-transform:uppercase; letter-spacing:0.5px;">System Admin</div>
            </div>
            <div style="width:36px; height:36px; border-radius:50%; background:#1a1a1a url('<%= ResolveUrl("~/assets/Avatar.png") %>') center/cover; border:2px solid #D96A77;"></div>
        </div>

    </div>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="students-container">
        
        <!-- Page Header -->
        <div class="page-header">
            <div>
                <h1 class="page-title">Students</h1>
                <p class="page-subtitle">Monitor and manage student accounts</p>
            </div>
        </div>

        <!-- Filter Bar -->
        <div class="filter-bar">
            <div class="filter-left">
                <div class="search-input-wrapper">
                    <svg viewBox="0 0 24 24" fill="none" stroke="#999" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="search-icon"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                    <input type="text" class="search-input" placeholder="Search student by name or ID..." />
                </div>
                
                <div class="select-wrapper">
                    <select class="filter-select">
                        <option>Course</option>
                    </select>
                </div>
                
                <div class="select-wrapper">
                    <select class="filter-select">
                        <option>Year</option>
                    </select>
                </div>
                
                <div class="select-wrapper">
                    <select class="filter-select">
                        <option>Status</option>
                    </select>
                </div>
                
                <div class="select-wrapper">
                    <select class="filter-select">
                        <option>Level</option>
                    </select>
                </div>
                
                <button type="button" class="btn-clear-filters">Clear filters</button>
            </div>
            
            <div class="filter-right">
                <span class="sort-label">Sort by:</span>
                <div class="select-wrapper outline">
                    <select class="sort-select">
                        <option>Last Active</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Results count -->
        <div class="results-count">
            <strong><asp:Literal ID="litTotalCount" runat="server" Text="0"></asp:Literal></strong> students found
        </div>

        <!-- Students Table -->
        <div class="table-container">
            <table class="students-table">
                <thead>
                    <tr>
                        <th>STUDENT NAME</th>
                        <th>COURSE</th>
                        <th>YEAR / SEM</th>
                        <th>LEVEL</th>
                        <th>XP</th>
                        <th>STREAK</th>
                        <th>ACTIVE CH.</th>
                        <th>STATUS</th>
                        <th>LAST ACTIVE</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder ID="phStudentsTable" runat="server"></asp:PlaceHolder>
                </tbody>
            </table>
            
            <!-- Pagination -->
            <div class="pagination">
                <span class="pagination-text"><asp:Literal ID="litPaginationText" runat="server" Text="Showing 0-0 of 0 students"></asp:Literal></span>
                <div class="pagination-controls">
                    <asp:LinkButton ID="btnPrev" runat="server" CssClass="page-btn" OnClick="btnPrev_Click">&lt;</asp:LinkButton>
                    <asp:PlaceHolder ID="phPageNumbers" runat="server"></asp:PlaceHolder>
                    <asp:LinkButton ID="btnNext" runat="server" CssClass="page-btn" OnClick="btnNext_Click">&gt;</asp:LinkButton>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
