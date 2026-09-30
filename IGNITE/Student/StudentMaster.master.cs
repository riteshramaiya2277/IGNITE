using System;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class StudentMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HighlightActiveNavigation();
                LoadStudentGamificationState();
            }
        }

        private void LoadStudentGamificationState()
        {
            // 1. Student Name & Role
            string name = Session["FullName"] as string;
            if (string.IsNullOrWhiteSpace(name))
            {
                name = (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
                    ? HttpContext.Current.User.Identity.Name
                    : "Alex Mercer";
            }
            litStudentName.Text = name;

            string levelTitle = Session["LevelTitle"] as string ?? "Level 12 Scholar";
            litStudentLevelTitle.Text = levelTitle;

            // 2. Streak count (Default 15 as shown in Figma design)
            int streak = 15;
            int parsedStreak;
            if (Session["Streak"] != null && int.TryParse(Session["Streak"].ToString(), out parsedStreak))
            {
                streak = parsedStreak;
            }
            litStreakDays.Text = streak.ToString();

            // 3. Level & XP values (Matching Figma design: LVL 12, 4,500 / 6,000 XP)
            int levelNum = 12;
            int parsedLvl;
            if (Session["CurrentLevel"] != null && int.TryParse(Session["CurrentLevel"].ToString(), out parsedLvl))
            {
                levelNum = parsedLvl;
            }
            litLevelNum.Text = levelNum.ToString();

            string xpText = Session["XPText"] as string ?? "4,500 / 6,000 XP";
            litXPText.Text = xpText;

            int xpPercent = 75; // 4500 / 6000 = 75%
            int parsedPct;
            if (Session["XPProgressPercent"] != null && int.TryParse(Session["XPProgressPercent"].ToString(), out parsedPct))
            {
                xpPercent = Math.Max(0, Math.Min(100, parsedPct));
            }
            xpProgressBar.Style["width"] = xpPercent + "%";

            // 4. Notifications dot (Show red dot by default if notifications exist)
            int unreadCount = 1;
            int parsedNotif;
            if (Session["UnreadNotifications"] != null && int.TryParse(Session["UnreadNotifications"].ToString(), out parsedNotif))
            {
                unreadCount = parsedNotif;
            }
            pnlNotifDot.Visible = (unreadCount > 0);
        }

        private void HighlightActiveNavigation()
        {
            string currentPath = Request.AppRelativeCurrentExecutionFilePath ?? string.Empty;
            string fileName = Path.GetFileName(currentPath);

            ResetNavClasses();

            if (string.Equals(fileName, "Dashboard.aspx", StringComparison.OrdinalIgnoreCase))
            {
                navDashboard.Attributes["class"] = "nav-item active";
            }
            else if (string.Equals(fileName, "Habits.aspx", StringComparison.OrdinalIgnoreCase))
            {
                navHabits.Attributes["class"] = "nav-item active";
            }
            else if (string.Equals(fileName, "Tasks.aspx", StringComparison.OrdinalIgnoreCase) ||
                     string.Equals(fileName, "TaskDetail.aspx", StringComparison.OrdinalIgnoreCase))
            {
                navTasks.Attributes["class"] = "nav-item active";
            }
            else if (string.Equals(fileName, "Goals.aspx", StringComparison.OrdinalIgnoreCase))
            {
                navGoals.Attributes["class"] = "nav-item active";
            }
            else if (string.Equals(fileName, "Challenges.aspx", StringComparison.OrdinalIgnoreCase) ||
                     string.Equals(fileName, "ChallengeDetail.aspx", StringComparison.OrdinalIgnoreCase))
            {
                navChallenges.Attributes["class"] = "nav-item active";
            }
            else if (string.Equals(fileName, "Calendar.aspx", StringComparison.OrdinalIgnoreCase))
            {
                navCalendar.Attributes["class"] = "nav-item active";
            }
            else if (string.Equals(fileName, "Progress.aspx", StringComparison.OrdinalIgnoreCase) ||
                     string.Equals(fileName, "Journal.aspx", StringComparison.OrdinalIgnoreCase) ||
                     string.Equals(fileName, "Notes.aspx", StringComparison.OrdinalIgnoreCase))
            {
                navProgress.Attributes["class"] = "nav-item active";
            }
            else if (string.Equals(fileName, "Profile.aspx", StringComparison.OrdinalIgnoreCase) ||
                     string.Equals(fileName, "Settings.aspx", StringComparison.OrdinalIgnoreCase) ||
                     string.Equals(fileName, "ChangePassword.aspx", StringComparison.OrdinalIgnoreCase) ||
                     string.Equals(fileName, "Security.aspx", StringComparison.OrdinalIgnoreCase))
            {
                navSettings.Attributes["class"] = "settings-pill-btn active";
            }
        }

        private void ResetNavClasses()
        {
            navDashboard.Attributes["class"] = "nav-item";
            navHabits.Attributes["class"] = "nav-item";
            navTasks.Attributes["class"] = "nav-item";
            navGoals.Attributes["class"] = "nav-item";
            navChallenges.Attributes["class"] = "nav-item";
            navCalendar.Attributes["class"] = "nav-item";
            navProgress.Attributes["class"] = "nav-item";
            navSettings.Attributes["class"] = "settings-pill-btn";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();

            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, string.Empty)
                {
                    Expires = DateTime.Now.AddYears(-1)
                };
                Response.Cookies.Add(authCookie);
            }

            Response.Redirect(ResolveUrl("~/Account/Login.aspx"), true);
        }
    }
}