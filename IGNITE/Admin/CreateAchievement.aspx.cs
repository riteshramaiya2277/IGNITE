using System;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class CreateAchievement : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Init
            }
        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
            Response.Redirect("Achievements.aspx");
        }

        protected void btnDraft_Click(object sender, EventArgs e)
        {
            Response.Redirect("Achievements.aspx");
        }
    }
}
