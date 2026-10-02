using System;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class Achievements : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAchievementsData();
            }
        }

        private void LoadAchievementsData()
        {
            int streak = 15;
            if (Session["Streak"] != null && int.TryParse(Session["Streak"].ToString(), out int parsedStreak))
            {
                streak = parsedStreak;
            }
            litStreakAchievementDays.Text = streak + " Days";

            if (Session["TotalXP"] != null)
            {
                litTotalAchievementsXP.Text = Session["TotalXP"].ToString();
            }

            if (Session["BadgesCount"] != null)
            {
                litBadgesUnlocked.Text = Session["BadgesCount"].ToString();
            }
        }
    }
}
