using System;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class CreateQuest : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize form values if editing
            }
        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
            // Publish quest logic
            Response.Redirect("Quests.aspx");
        }

        protected void btnDraft_Click(object sender, EventArgs e)
        {
            // Save draft logic
            Response.Redirect("Quests.aspx");
        }
    }
}
