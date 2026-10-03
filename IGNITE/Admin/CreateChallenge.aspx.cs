using System;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class CreateChallenge : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set default values if needed
            }
        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
            // Publish challenge logic
            Response.Redirect("Challenges.aspx");
        }

        protected void btnDraft_Click(object sender, EventArgs e)
        {
            // Save draft logic
            Response.Redirect("Challenges.aspx");
        }
    }
}
