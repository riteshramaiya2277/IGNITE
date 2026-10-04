<%@ Page Title="Challenges — IGNITE Admin" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Challenges.aspx.cs" Inherits="IGNITE.Admin.Challenges" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/admin-challenges.css") %>" rel="stylesheet" type="text/css" />
    <style>
        .admin-topbar-header { display: none !important; }
        .admin-page-canvas { padding-top: 40px !important; }
    </style>
</asp:Content>

<asp:Content ID="TopbarContent" ContentPlaceHolderID="TopbarContent" runat="server">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="challenges-container">
        
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-title">Challenges</h1>
            <div class="header-actions">
                <div class="search-wrapper-local">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input-local" placeholder="Search challenges..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                </div>
                <a href="EditChallenge.aspx" class="btn-primary" style="text-decoration:none;">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                    Edit Challenge
                </a>
            </div>
        </div>

        <!-- Filter Bar -->
        <div class="filter-bar">
            <div class="filter-left">
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="select-box" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                    <asp:ListItem Text="Category: All" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="select-box" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                    <asp:ListItem Text="Status: All" Value=""></asp:ListItem>
                    <asp:ListItem Text="Published" Value="Published"></asp:ListItem>
                    <asp:ListItem Text="Draft" Value="Draft"></asp:ListItem>
                    <asp:ListItem Text="Archived" Value="Archived"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="filter-right">
                <span class="sort-label">Sort by:</span>
                <asp:DropDownList ID="ddlSort" runat="server" CssClass="select-box" style="border:none; background-color:transparent;" AutoPostBack="true" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                    <asp:ListItem Text="Latest Added" Value="Latest"></asp:ListItem>
                    <asp:ListItem Text="Start Date" Value="StartDate"></asp:ListItem>
                    <asp:ListItem Text="End Date" Value="EndDate"></asp:ListItem>
                    <asp:ListItem Text="Title" Value="Title"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <!-- Table Container -->
        <div class="table-container">
            <table class="challenges-table">
                <thead>
                    <tr>
                        <th style="width: 25%;">CHALLENGE TITLE</th>
                        <th style="width: 15%;">CATEGORY</th>
                        <th style="width: 10%;">DIFFICULTY</th>
                        <th style="width: 15%;">REQUIREMENT</th>
                        <th style="width: 15%;">TIMELINE</th>
                        <th style="width: 10%;">XP REWARD</th>
                        <th style="width: 10%;">STATUS</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder ID="phChallengesTable" runat="server"></asp:PlaceHolder>
                </tbody>
            </table>

            <!-- Pagination -->
            <div class="pagination">
                <span class="pagination-text"><asp:Literal ID="litPaginationText" runat="server" Text="Showing 0-0 of 0 challenges"></asp:Literal></span>
                <div class="pagination-controls">
                    <asp:LinkButton ID="btnPrev" runat="server" CssClass="page-btn" OnClick="btnPrev_Click">&lt;</asp:LinkButton>
                    <asp:PlaceHolder ID="phPageNumbers" runat="server"></asp:PlaceHolder>
                    <asp:LinkButton ID="btnNext" runat="server" CssClass="page-btn" OnClick="btnNext_Click">&gt;</asp:LinkButton>
                </div>
            </div>
        </div>

        <!-- Bottom Stats Row -->
        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-card-title">ACTIVE CHALLENGES</div>
                <div class="stat-card-value"><asp:Literal ID="litActiveChallenges" runat="server" Text="0"></asp:Literal></div>
                <div class="stat-card-sub highlight">Currently running</div>
            </div>
            <div class="stat-card">
                <div class="stat-card-title">TOTAL SUBMISSIONS</div>
                <div class="stat-card-value"><asp:Literal ID="litTotalSubmissions" runat="server" Text="0"></asp:Literal></div>
                <div class="stat-card-sub highlight">All time</div>
            </div>
            <div class="stat-card">
                <div class="stat-card-title">AVG. COMPLETION</div>
                <div class="stat-card-value"><asp:Literal ID="litAvgCompletion" runat="server" Text="0%"></asp:Literal></div>
                <div class="progress-bar">
                    <div class="progress-fill" style="width:<asp:Literal ID="litCompletionPercent" runat="server" Text="0"></asp:Literal>%"></div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-card-title">XP DISTRIBUTED</div>
                <div class="stat-card-value"><asp:Literal ID="litXPDistributed" runat="server" Text="0"></asp:Literal></div>
                <div class="stat-card-sub">Lifetime rewards</div>
            </div>
        </div>

    </div>
</asp:Content>
