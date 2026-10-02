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
            int unlocked = 12;
            int total = 45;

            if (Session["BadgesCount"] != null && int.TryParse(Session["BadgesCount"].ToString(), out int parsedBadges))
            {
                unlocked = parsedBadges;
            }

            int remaining = Math.Max(0, total - unlocked);
            double percent = (total > 0) ? ((double)unlocked / total) * 100.0 : 0;

            if (litUnlockedCount != null)
                litUnlockedCount.Text = unlocked.ToString();

            if (litTotalCount != null)
                litTotalCount.Text = total.ToString();

            if (litRemainingCount != null)
                litRemainingCount.Text = remaining.ToString();

            if (litProgressPercent != null)
                litProgressPercent.Text = Math.Round(percent, 1).ToString(System.Globalization.CultureInfo.InvariantCulture);

            // Legacy fallbacks if rendered
            if (litBadgesUnlocked != null)
                litBadgesUnlocked.Text = unlocked.ToString();

            if (litStreakAchievementDays != null)
            {
                int streak = 15;
                if (Session["Streak"] != null && int.TryParse(Session["Streak"].ToString(), out int parsedStreak))
                {
                    streak = parsedStreak;
                }
                litStreakAchievementDays.Text = streak + " Days";
            }

            if (litTotalAchievementsXP != null && Session["TotalXP"] != null)
            {
                litTotalAchievementsXP.Text = Session["TotalXP"].ToString();
            }
        }
    }
}
