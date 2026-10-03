using System;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class QuestDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Can load specific quest by ID in query string if provided, e.g. Request.QueryString["id"]
            }
        }

        protected void btnEditQuest_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateQuest.aspx?mode=edit");
        }

        protected void btnUnpublish_Click(object sender, EventArgs e)
        {
            // Toggle publish status logic
            Response.Redirect("Quests.aspx");
        }

        protected void btnConfirmArchive_Click(object sender, EventArgs e)
        {
            // Archive quest logic
            Response.Redirect("Quests.aspx");
        }
    }
}
