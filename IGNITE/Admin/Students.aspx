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
            <strong>1,240</strong> students found
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
                    <!-- Row 1 -->
                    <tr>
                        <td>
                            <div class="student-info">
                                <div class="avatar avatar-red"></div>
                                <div>
                                    <div class="student-name">Elena Rodriguez</div>
                                    <div class="student-id">ID: #STU-2401</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="course-name">Engineering</div>
                            <div class="course-dept">Computer Science</div>
                        </td>
                        <td>3rd Year / 1st</td>
                        <td>12</td>
                        <td class="text-pink">1,250 XP</td>
                        <td class="text-orange">🔥 8</td>
                        <td>3</td>
                        <td><span class="status-badge active">Active</span></td>
                        <td class="text-grey">2 hours ago</td>
                        <td>
                            <div class="action-buttons">
                                <a href="StudentProfile.aspx" class="btn-view" style="text-decoration:none;">VIEW</a>
                                <button type="button" class="btn-more"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></button>
                            </div>
                        </td>
                    </tr>
                    
                    <!-- Row 2 -->
                    <tr>
                        <td>
                            <div class="student-info">
                                <div class="avatar avatar-pink"></div>
                                <div>
                                    <div class="student-name">Marcus Chen</div>
                                    <div class="student-id">ID: #STU-2405</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="course-name">Design</div>
                            <div class="course-dept">Visual Arts</div>
                        </td>
                        <td>2nd Year / 2nd</td>
                        <td>8</td>
                        <td class="text-pink">890 XP</td>
                        <td class="text-grey">🔥 0</td>
                        <td>1</td>
                        <td><span class="status-badge inactive">Inactive</span></td>
                        <td class="text-grey">3 days ago</td>
                        <td>
                            <div class="action-buttons">
                                <a href="StudentProfile.aspx" class="btn-view" style="text-decoration:none;">VIEW</a>
                                <button type="button" class="btn-more"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></button>
                            </div>
                        </td>
                    </tr>
                    
                    <!-- Row 3 -->
                    <tr>
                        <td>
                            <div class="student-info">
                                <div class="avatar avatar-rose"></div>
                                <div>
                                    <div class="student-name">Sarah Jenkins</div>
                                    <div class="student-id">ID: #STU-2410</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="course-name">Business</div>
                            <div class="course-dept">Marketing</div>
                        </td>
                        <td>4th Year / 1st</td>
                        <td>18</td>
                        <td class="text-pink">2,400 XP</td>
                        <td class="text-orange">🔥 24</td>
                        <td>5</td>
                        <td><span class="status-badge suspended">Suspended</span></td>
                        <td class="text-grey">1 week ago</td>
                        <td>
                            <div class="action-buttons">
                                <a href="StudentProfile.aspx" class="btn-view" style="text-decoration:none;">VIEW</a>
                                <button type="button" class="btn-more"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></button>
                            </div>
                        </td>
                    </tr>
                    
                    <!-- Row 4 -->
                    <tr>
                        <td>
                            <div class="student-info">
                                <div class="avatar avatar-purple"></div>
                                <div>
                                    <div class="student-name">Alex Thompson</div>
                                    <div class="student-id">ID: #STU-2415</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="course-name">Sciences</div>
                            <div class="course-dept">Bio-Chemistry</div>
                        </td>
                        <td>1st Year / 2nd</td>
                        <td>4</td>
                        <td class="text-pink">450 XP</td>
                        <td class="text-orange">🔥 2</td>
                        <td>2</td>
                        <td><span class="status-badge active">Active</span></td>
                        <td class="text-grey">Just now</td>
                        <td>
                            <div class="action-buttons">
                                <a href="StudentProfile.aspx" class="btn-view" style="text-decoration:none;">VIEW</a>
                                <button type="button" class="btn-more"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <!-- Pagination -->
            <div class="pagination">
                <span class="pagination-text">Showing 1-10 of 1,240 students</span>
                <div class="pagination-controls">
                    <button class="page-btn">&lt;</button>
                    <button class="page-btn active">1</button>
                    <button class="page-btn">2</button>
                    <button class="page-btn">3</button>
                    <span class="page-dots">...</span>
                    <button class="page-btn">124</button>
                    <button class="page-btn">&gt;</button>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
