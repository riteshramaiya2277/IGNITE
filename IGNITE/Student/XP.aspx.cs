using System;
using System.Web;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class XP : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadXPData();
            }
        }

        private void LoadXPData()
        {
            string fullName = Session["FullName"] as string;
            if (string.IsNullOrWhiteSpace(fullName))
            {
                fullName = (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
                    ? HttpContext.Current.User.Identity.Name
                    : "Ritesh Ramaiya";
            }

            string firstName = fullName.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries)[0];
            litHeaderFirstName.Text = firstName;

            int levelNum = 12;
            if (Session["CurrentLevel"] != null && int.TryParse(Session["CurrentLevel"].ToString(), out int parsedLvl))
            {
                levelNum = parsedLvl;
            }
            litHeroLevel.Text = levelNum.ToString();

            int streak = 15;
            if (Session["Streak"] != null && int.TryParse(Session["Streak"].ToString(), out int parsedStreak))
            {
                streak = parsedStreak;
            }
            litHeroStreakDays.Text = streak + " Days";

            string totalXP = Session["TotalXP"] as string ?? "12,450 XP";
            litHeroTotalXP.Text = totalXP.EndsWith("XP", StringComparison.OrdinalIgnoreCase) ? totalXP : totalXP + " XP";

            int xpPercent = 75;
            if (Session["XPProgressPercent"] != null && int.TryParse(Session["XPProgressPercent"].ToString(), out int parsedPct))
            {
                xpPercent = Math.Max(0, Math.Min(100, parsedPct));
            }
            barHeroFill.Style["width"] = xpPercent + "%";
        }
    }
}
