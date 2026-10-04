using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using IGNITE;

namespace IGNITE.Admin
{
    public partial class Overview : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOverviewData();
            }
        }

        private void LoadOverviewData()
        {
            try
            {
                LoadOverviewStats();
                LoadRecentActivity();
                LoadActiveChallenges();
                LoadActiveQuests();
                LoadAchievementStats();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading overview data: " + ex.Message);
            }
        }

        private void LoadOverviewStats()
        {
            DataTable stats = DatabaseHelper.ExecuteStoredProcedure("sp_Admin_GetOverviewStats");

            if (stats.Rows.Count > 0)
            {
                DataRow row = stats.Rows[0];
                litTotalStudents.Text = DatabaseHelper.GetInt(row, "TotalStudents").ToString("N0");
                litActiveToday.Text = DatabaseHelper.GetInt(row, "ActiveToday").ToString("N0");
                litActiveChallenges.Text = DatabaseHelper.GetInt(row, "ActiveChallenges").ToString();
                litDailyQuests.Text = DatabaseHelper.GetInt(row, "DailyQuests").ToString();
                litTotalAchievements.Text = DatabaseHelper.GetInt(row, "TotalAchievements").ToString();

                decimal avgStreak = DatabaseHelper.GetDecimal(row, "AvgStreak");
                litAvgStreak.Text = avgStreak.ToString("F1");
            }
        }

        private void LoadRecentActivity()
        {
            DataTable activity = DatabaseHelper.ExecuteStoredProcedure("sp_Admin_GetRecentActivity");

            phRecentActivity.Controls.Clear();

            if (activity.Rows.Count == 0)
            {
                phRecentActivity.Controls.Add(new LiteralControl("<tr><td colspan='6' style='text-align:center; padding:20px; color:#888;'>No recent activity</td></tr>"));
                litActivityPagination.Text = "No students found";
                return;
            }

            string[] avatarClasses = { "avatar-red", "avatar-pink", "avatar-rose", "avatar-purple" };
            int avatarIndex = 0;

            foreach (DataRow row in activity.Rows)
            {
                HtmlTableRow tr = new HtmlTableRow();

                // Student Name cell
                HtmlTableCell tdName = new HtmlTableCell();
                string avatarClass = avatarClasses[avatarIndex % avatarClasses.Length];
                avatarIndex++;

                string initials = GetInitials(DatabaseHelper.GetString(row, "FullName"));
                tdName.InnerHtml = string.Format(@"
                    <div class=""student-info"">
                        <div class=""avatar {0}"">{1}</div>
                        <div>
                            <div class=""student-name"">{2}</div>
                            <div class=""student-email"">{3}</div>
                        </div>
                    </div>", avatarClass, initials, DatabaseHelper.GetString(row, "FullName"), DatabaseHelper.GetString(row, "Email"));
                tr.Cells.Add(tdName);

                // Course/Year cell
                HtmlTableCell tdCourse = new HtmlTableCell();
                string college = DatabaseHelper.GetString(row, "College", "N/A");
                string course = DatabaseHelper.GetString(row, "Course", "N/A");
                int year = DatabaseHelper.GetInt(row, "Year", 0);
                tdCourse.InnerHtml = string.Format(@"
                    <div class=""course-name"">{0}</div>
                    <div class=""course-year"">{1} - Year {2}</div>", college, course, year);
                tr.Cells.Add(tdCourse);

                // Level/XP cell
                HtmlTableCell tdLevel = new HtmlTableCell();
                int levelNumber = DatabaseHelper.GetInt(row, "LevelNumber", 1);
                int totalXP = DatabaseHelper.GetInt(row, "TotalXP", 0);
                tdLevel.InnerHtml = string.Format(@"
                    <span class=""level-badge"">Lvl {0}</span>
                    <span class=""xp-text"">{1:N0} XP</span>", levelNumber, totalXP);
                tr.Cells.Add(tdLevel);

                // Streak cell
                HtmlTableCell tdStreak = new HtmlTableCell();
                int streak = DatabaseHelper.GetInt(row, "CurrentStreak", 0);
                string streakClass = streak > 0 ? "" : " zero";
                tdStreak.InnerHtml = string.Format("<span class=\"streak-text{0}\">🔥 {1}</span>", streakClass, streak);
                tr.Cells.Add(tdStreak);

                // Status cell
                HtmlTableCell tdStatus = new HtmlTableCell();
                bool isActive = DatabaseHelper.GetBool(row, "IsActive", true);
                string statusClass = isActive ? "active" : "inactive";
                string statusText = isActive ? "ACTIVE" : "INACTIVE";
                tdStatus.InnerHtml = string.Format("<span class=\"status-badge {0}\">{1}</span>", statusClass, statusText);
                tr.Cells.Add(tdStatus);

                // Action cell
                HtmlTableCell tdAction = new HtmlTableCell();
                int userId = DatabaseHelper.GetInt(row, "UserId");
                tdAction.InnerHtml = string.Format("<a href=\"StudentProfile.aspx?id={0}\" class=\"action-link\">Profile</a>", userId);
                tr.Cells.Add(tdAction);

                phRecentActivity.Controls.Add(tr);
            }

            litActivityPagination.Text = string.Format("Showing {0} recent students", activity.Rows.Count);
        }

        private void LoadActiveChallenges()
        {
            DataTable challenges = DatabaseHelper.ExecuteStoredProcedure("sp_Admin_GetActiveChallenges");

            phActiveChallenges.Controls.Clear();

            if (challenges.Rows.Count == 0)
            {
                phActiveChallenges.Controls.Add(new LiteralControl("<div style='padding:20px; text-align:center; color:#888;'>No active challenges</div>"));
                return;
            }

            foreach (DataRow row in challenges.Rows)
            {
                string title = DatabaseHelper.GetString(row, "Title");
                string categoryName = DatabaseHelper.GetString(row, "CategoryName", "General");
                string difficulty = DatabaseHelper.GetString(row, "Difficulty", "Medium");
                int participantCount = DatabaseHelper.GetInt(row, "ParticipantCount", 0);
                DateTime endDate = DatabaseHelper.GetDateTime(row, "EndDate");

                string difficultyClass = difficulty.ToLower();
                string endsInText = GetEndsInText(endDate);

                phActiveChallenges.Controls.Add(new LiteralControl(string.Format(@"
                    <div class=""challenge-card"">
                        <div class=""challenge-info"">
                            <div class=""challenge-icon code"">
                                <svg viewBox=""0 0 24 24"" width=""20"" height=""20"" fill=""none"" stroke=""currentColor"" stroke-width=""2"" stroke-linecap=""round"" stroke-linejoin=""round""><polyline points=""16 18 22 12 16 6""></polyline><polyline points=""8 6 2 12 8 18""></polyline></svg>
                            </div>
                            <div>
                                <div class=""challenge-title"">{0}</div>
                                <div class=""challenge-meta"">{1} &nbsp;•&nbsp; <span class=""{2}"">{3}</span></div>
                            </div>
                        </div>
                        <div class=""challenge-stats"">
                            <div>
                                <div class=""participants"">{4} Participants</div>
                                <div class=""ends-in"">{5}</div>
                            </div>
                            <span class=""status-badge active"">ACTIVE</span>
                        </div>
                    </div>", title, categoryName.ToUpper(), difficultyClass, difficulty.ToUpper(), participantCount, endsInText)));
            }
        }

        private void LoadActiveQuests()
        {
            DataTable quests = DatabaseHelper.ExecuteStoredProcedure("sp_Admin_GetActiveQuests");

            phActiveQuests.Controls.Clear();

            if (quests.Rows.Count == 0)
            {
                phActiveQuests.Controls.Add(new LiteralControl("<div style='padding:20px; text-align:center; color:#888;'>No active quests</div>"));
                return;
            }

            foreach (DataRow row in quests.Rows)
            {
                string title = DatabaseHelper.GetString(row, "Title");
                string questType = DatabaseHelper.GetString(row, "QuestType", "Automatic");
                string requirementValue = DatabaseHelper.GetString(row, "RequirementValue", "");
                int participantCount = DatabaseHelper.GetInt(row, "ParticipantCount", 0);

                string icon = GetQuestIcon(questType);
                string trend = GetRandomTrend();

                phActiveQuests.Controls.Add(new LiteralControl(string.Format(@"
                    <div class=""quest-item"">
                        <div class=""quest-info"">
                            <div class=""quest-icon"">{0}</div>
                            <div>
                                <div class=""quest-title"">{1}</div>
                                <div class=""quest-desc"">{2} • {3}</div>
                            </div>
                        </div>
                        <div class=""quest-stats"">
                            <div>
                                <div class=""quest-participants"">{4} Students</div>
                                <div class=""quest-trend {5}"">{6}</div>
                            </div>
                            <svg viewBox=""0 0 24 24"" width=""16"" height=""16"" fill=""none"" stroke=""#ccc"" stroke-width=""2"" stroke-linecap=""round"" stroke-linejoin=""round""><circle cx=""12"" cy=""12"" r=""1""></circle><circle cx=""12"" cy=""5"" r=""1""></circle><circle cx=""12"" cy=""19"" r=""1""></circle></svg>
                        </div>
                    </div>", icon, title, questType, requirementValue, participantCount, trend.Item1, trend.Item2)));
            }
        }

        private void LoadAchievementStats()
        {
            DataTable stats = DatabaseHelper.ExecuteStoredProcedure("sp_Admin_GetAchievementStats");

            if (stats.Rows.Count > 0)
            {
                DataRow row = stats.Rows[0];
                litTotalPublished.Text = DatabaseHelper.GetInt(row, "TotalPublished").ToString();
                litActiveGlobal.Text = DatabaseHelper.GetInt(row, "ActiveGlobal").ToString();
                litRecentlyAdded.Text = "+" + DatabaseHelper.GetInt(row, "RecentlyAdded").ToString();
                litHiddenDraft.Text = DatabaseHelper.GetInt(row, "HiddenDraft").ToString();
            }
        }

        private string GetInitials(string fullName)
        {
            if (string.IsNullOrEmpty(fullName))
                return "??";

            string[] parts = fullName.Split(' ');
            if (parts.Length >= 2)
                return (parts[0][0] + "" + parts[1][0]).ToUpper();
            return fullName.Substring(0, Math.Min(2, fullName.Length)).ToUpper();
        }

        private string GetEndsInText(DateTime endDate)
        {
            TimeSpan span = endDate - DateTime.Now;

            if (span.TotalDays < 0)
                return "Ended";
            if (span.TotalDays < 1)
                return "Ends today";
            if (span.TotalDays < 2)
                return "Ends in 1 day";
            if (span.TotalDays < 7)
                return string.Format("Ends in {0} days", (int)span.TotalDays);

            return endDate.ToString("MMM dd, yyyy");
        }

        private string GetQuestIcon(string questType)
        {
            switch (questType.ToLower())
            {
                case "automatic":
                    return "☀️";
                case "management":
                    return "📚";
                default:
                    return "🎯";
            }
        }

        private System.Tuple<string, string> GetRandomTrend()
        {
            // For demo purposes, return random trends
            string[] trends = { "stable", "rising", "dropping" };
            string[] labels = { "Stable", "Rising", "Dropping" };
            int index = new Random().Next(trends.Length);
            return System.Tuple.Create(trends[index], labels[index]);
        }
    }
}
