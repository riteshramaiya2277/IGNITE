using System;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class ArchiveAchievement : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string title = Request.QueryString["title"];
                if (!string.IsNullOrEmpty(title))
                {
                    litAchievementTitle.Text = title;
                }
            }
        }

        protected void btnConfirmArchive_Click(object sender, EventArgs e)
        {
            Response.Redirect("Achievements.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Achievements.aspx");
        }
    }
}
