using System;
using System.Web;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardGreeting();
            }
        }

        private void LoadDashboardGreeting()
        {
            string fullName = Session["FullName"] as string;
            if (string.IsNullOrWhiteSpace(fullName))
            {
                fullName = (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
                    ? HttpContext.Current.User.Identity.Name
                    : "Ritesh Ramaiya";
            }

            string firstName = fullName.Trim().Split(' ')[0];
            litGreetingName.Text = string.IsNullOrWhiteSpace(firstName) ? "Ritesh" : firstName;

            int streak = 15;
            int parsedStreak;
            if (Session["Streak"] != null && int.TryParse(Session["Streak"].ToString(), out parsedStreak))
            {
                streak = parsedStreak;
            }
            litGreetingStreak.Text = streak.ToString();
        }
    }
}
