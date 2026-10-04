using System;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class Achievements : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initial data load if needed
            }
        }

        protected void btnCreateAchievement_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAchievement.aspx");
        }
    }
}
