using System;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class Quests : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initial data load if needed
            }
        }

        protected void btnCreateQuest_Click(object sender, EventArgs e)
        {
            // Redirect to CreateQuest or EditQuest
            Response.Redirect("Quests.aspx");
        }
    }
}
