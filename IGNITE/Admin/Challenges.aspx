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
                    <input type="text" class="search-input-local" placeholder="Search challenges..." />
                </div>
                <button type="button" class="btn-primary">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                    Edit Challenge
                </button>
            </div>
        </div>

        <!-- Filter Bar -->
        <div class="filter-bar">
            <div class="filter-left">
                <select class="select-box">
                    <option>Category: All</option>
                </select>
                <select class="select-box">
                    <option>Status: All</option>
                </select>
            </div>
            <div class="filter-right">
                <span class="sort-label">Sort by:</span>
                <select class="select-box" style="border:none; background-color:transparent;">
                    <option>Latest Added</option>
                </select>
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
                    <tr>
                        <td>
                            <div class="chal-title">Advanced Python Patterns</div>
                            <div class="chal-ref">Ref: #CHL-9021</div>
                        </td>
                        <td class="chal-category">Programming</td>
                        <td><span class="badge-diff badge-hard">HARD</span></td>
                        <td class="chal-req">Project Submission</td>
                        <td>
                            <div class="chal-timeline">
                                Oct 12, 2023<br/>
                                Oct 26, 2023
                            </div>
                        </td>
                        <td>
                            <div class="xp-reward"><div class="xp-dot"></div>2,500 XP</div>
                        </td>
                        <td>
                            <div class="status published"><div class="status-dot"></div>Published</div>
                        </td>
                        <td>
                            <div class="action-btns">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.12 2.12 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="chal-title">UI Typography Basics</div>
                            <div class="chal-ref">Ref: #CHL-8842</div>
                        </td>
                        <td class="chal-category">Design</td>
                        <td><span class="badge-diff badge-easy">EASY</span></td>
                        <td class="chal-req">Quiz</td>
                        <td>
                            <div class="chal-timeline">
                                Nov 01, 2023<br/>
                                Nov 05, 2023
                            </div>
                        </td>
                        <td>
                            <div class="xp-reward"><div class="xp-dot"></div>500 XP</div>
                        </td>
                        <td>
                            <div class="status draft"><div class="status-dot"></div>Draft</div>
                        </td>
                        <td>
                            <div class="action-btns">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.12 2.12 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="chal-title">Data Analysis Challenge</div>
                            <div class="chal-ref">Ref: #CHL-7751</div>
                        </td>
                        <td class="chal-category">Mathematics</td>
                        <td><span class="badge-diff badge-medium">MEDIUM</span></td>
                        <td class="chal-req">File Upload</td>
                        <td>
                            <div class="chal-timeline">
                                Sep 15, 2023<br/>
                                Sep 30, 2023
                            </div>
                        </td>
                        <td>
                            <div class="xp-reward"><div class="xp-dot"></div>1,200 XP</div>
                        </td>
                        <td>
                            <div class="status archived"><div class="status-dot"></div>Archived</div>
                        </td>
                        <td>
                            <div class="action-btns">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.12 2.12 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="chal-title">Responsive Web Layouts</div>
                            <div class="chal-ref">Ref: #CHL-9110</div>
                        </td>
                        <td class="chal-category">Programming</td>
                        <td><span class="badge-diff badge-medium">MEDIUM</span></td>
                        <td class="chal-req">GitHub URL</td>
                        <td>
                            <div class="chal-timeline">
                                Nov 10, 2023<br/>
                                Nov 20, 2023
                            </div>
                        </td>
                        <td>
                            <div class="xp-reward"><div class="xp-dot"></div>1,800 XP</div>
                        </td>
                        <td>
                            <div class="status published"><div class="status-dot"></div>Published</div>
                        </td>
                        <td>
                            <div class="action-btns">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.12 2.12 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- Pagination -->
            <div class="pagination">
                <span class="pagination-text">Showing 1 to 4 of 24 challenges</span>
                <div class="pagination-controls">
                    <button class="page-btn">&lt;</button>
                    <button class="page-btn active">1</button>
                    <button class="page-btn">2</button>
                    <button class="page-btn">3</button>
                    <button class="page-btn">&gt;</button>
                </div>
            </div>
        </div>

        <!-- Bottom Stats Row -->
        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-card-title">ACTIVE CHALLENGES</div>
                <div class="stat-card-value">18</div>
                <div class="stat-card-sub highlight">↑ +2 this month</div>
            </div>
            <div class="stat-card">
                <div class="stat-card-title">TOTAL SUBMISSIONS</div>
                <div class="stat-card-value">1,248</div>
                <div class="stat-card-sub highlight">↑ 12% growth</div>
            </div>
            <div class="stat-card">
                <div class="stat-card-title">AVG. COMPLETION</div>
                <div class="stat-card-value">64%</div>
                <div class="progress-bar">
                    <div class="progress-fill"></div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-card-title">XP DISTRIBUTED</div>
                <div class="stat-card-value">42.5k</div>
                <div class="stat-card-sub">Lifetime rewards</div>
            </div>
        </div>

    </div>
</asp:Content>
