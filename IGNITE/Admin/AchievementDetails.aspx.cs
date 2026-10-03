using System;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class AchievementDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load details if query string is present
            }
        }

        protected void btnEditAchievement_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditAchievement.aspx");
        }

        protected void btnArchive_Click(object sender, EventArgs e)
        {
            Response.Redirect("Achievements.aspx");
        }
    }
}
