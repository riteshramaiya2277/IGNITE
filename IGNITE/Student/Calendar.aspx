<%@ Page Title="Calendar" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true"
    CodeBehind="Calendar.aspx.cs" Inherits="IGNITE.Student.Calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= ResolveUrl("~/Content/dashboard.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%= ResolveUrl("~/Content/calendar.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="calendar-canvas">
        <div class="calendar-header">
            <div class="cal-title-area">
                <h1 class="cal-main-title">Academic Calendar</h1>
                <p class="cal-subtitle">Track your deadlines, exams, and milestones.</p>
            </div>
            
            <div class="cal-controls">
                <div class="cal-month-nav">
                    <button class="btn-nav" type="button"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><polyline points="15 18 9 12 15 6"></polyline></svg></button>
                    <span class="cal-current-month">October 2024</span>
                    <button class="btn-nav" type="button"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2"><polyline points="9 18 15 12 9 6"></polyline></svg></button>
                </div>
                <button class="btn-today" type="button">Today</button>
                <div class="cal-view-toggle">
                    <button class="btn-toggle active" type="button">Month</button>
                    <button class="btn-toggle" type="button">Week</button>
                </div>
            </div>
        </div>

        <div class="calendar-body-layout">
            <!-- Left Sidebar for Events -->
            <aside class="calendar-sidebar">
                <div class="event-categories">
                    <h3 class="sidebar-title">EVENT CATEGORIES</h3>
                    <ul class="category-list">
                        <li><span class="cat-dot" style="background-color: #485cff;"></span> Assignments</li>
                        <li><span class="cat-dot" style="background-color: #ff4848;"></span> Exams</li>
                        <li><span class="cat-dot" style="background-color: #ff8c00;"></span> Goals</li>
                        <li><span class="cat-dot" style="background-color: #00c466;"></span> Academic Events</li>
                    </ul>
                </div>

                <div class="event-details">
                    <h3 class="sidebar-title">EVENT DETAILS</h3>
                    
                    <div class="event-detail-card card-assignment">
                        <div class="card-header">
                            <span class="tag tag-assignment">ASSIGNMENT</span>
                            <span class="time">2:00 PM</span>
                        </div>
                        <h4 class="card-title">CS101: Final Project</h4>
                        <p class="card-desc">Complete the final implementation of the Dijkstra algorithm visualizer and submit documentation.</p>
                        <a href="#" class="card-link">View Details &rarr;</a>
                    </div>
                    
                    <div class="event-detail-card card-goal">
                        <div class="card-header">
                            <span class="tag tag-goal">GOAL</span>
                            <span class="time">Due Today</span>
                        </div>
                        <h4 class="card-title">Finish Research Paper</h4>
                        <p class="card-desc">Complete the introduction and methodology sections for the Sociology paper.</p>
                        <a href="#" class="card-link">Check Goal &rarr;</a>
                    </div>
                </div>
            </aside>

            <!-- Main Calendar Grid -->
            <div class="calendar-grid-container">
                <div class="calendar-grid">
                    <!-- Days Header -->
                    <div class="cal-day-header">MON</div>
                    <div class="cal-day-header">TUE</div>
                    <div class="cal-day-header">WED</div>
                    <div class="cal-day-header">THU</div>
                    <div class="cal-day-header">FRI</div>
                    <div class="cal-day-header">SAT</div>
                    <div class="cal-day-header">SUN</div>

                    <!-- Row 1 -->
                    <div class="cal-cell empty"><span class="day-num">30</span></div>
                    <div class="cal-cell"><span class="day-num">1</span></div>
                    <div class="cal-cell"><span class="day-num">2</span></div>
                    <div class="cal-cell">
                        <span class="day-num">3</span>
                        <div class="cal-event event-exam">Lab Report: Bio</div>
                    </div>
                    <div class="cal-cell"><span class="day-num">4</span></div>
                    <div class="cal-cell empty"><span class="day-num">5</span></div>
                    <div class="cal-cell empty"><span class="day-num">6</span></div>

                    <!-- Row 2 -->
                    <div class="cal-cell"><span class="day-num">7</span></div>
                    <div class="cal-cell">
                        <span class="day-num">8</span>
                        <div class="cal-event event-academic">Guest Lecture: AI</div>
                    </div>
                    <div class="cal-cell"><span class="day-num">9</span></div>
                    <div class="cal-cell">
                        <span class="day-num">10</span>
                        <div class="cal-event event-exam">Midterm: Calc</div>
                    </div>
                    <div class="cal-cell"><span class="day-num">11</span></div>
                    <div class="cal-cell empty"><span class="day-num">12</span></div>
                    <div class="cal-cell empty"><span class="day-num">13</span></div>

                    <!-- Row 3 -->
                    <div class="cal-cell"><span class="day-num">14</span></div>
                    <div class="cal-cell">
                        <span class="day-num">15</span>
                        <div class="cal-event event-goal">Research Paper</div>
                    </div>
                    <div class="cal-cell active-day">
                        <span class="day-num highlight-num">16</span>
                        <div class="cal-event event-assignment filled">CS101: Project</div>
                        <div class="cal-event event-assignment filled">Submit Draft</div>
                    </div>
                    <div class="cal-cell"><span class="day-num">17</span></div>
                    <div class="cal-cell"><span class="day-num">18</span></div>
                    <div class="cal-cell empty"><span class="day-num">19</span></div>
                    <div class="cal-cell empty"><span class="day-num">20</span></div>

                    <!-- Row 4 -->
                    <div class="cal-cell"><span class="day-num">21</span></div>
                    <div class="cal-cell"><span class="day-num">22</span></div>
                    <div class="cal-cell"><span class="day-num">23</span></div>
                    <div class="cal-cell">
                        <span class="day-num">24</span>
                        <div class="cal-event event-exam">History Exam</div>
                    </div>
                    <div class="cal-cell"><span class="day-num">25</span></div>
                    <div class="cal-cell empty"><span class="day-num">26</span></div>
                    <div class="cal-cell empty"><span class="day-num">27</span></div>

                    <!-- Row 5 -->
                    <div class="cal-cell"><span class="day-num">28</span></div>
                    <div class="cal-cell">
                        <span class="day-num">29</span>
                        <div class="cal-event event-academic">Seminar: Ethics</div>
                    </div>
                    <div class="cal-cell"><span class="day-num">30</span></div>
                    <div class="cal-cell"><span class="day-num">31</span></div>
                    <div class="cal-cell empty"><span class="day-num">1</span></div>
                    <div class="cal-cell empty"><span class="day-num">2</span></div>
                    <div class="cal-cell empty"><span class="day-num">3</span></div>
                </div>

                <div class="calendar-footer">
                    <div class="cal-stats">
                        <span class="stat-item"><span class="cat-dot" style="background-color: #ff4848;"></span> 12 Assignments</span>
                        <span class="stat-item"><span class="cat-dot" style="background-color: #ff4848;"></span> 3 Exams</span>
                    </div>
                    <div class="cal-help">
                        <svg viewBox="0 0 24 24" width="14" height="14" fill="currentColor"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"/></svg>
                        Click on any event to view detailed instructions or related resources.
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
