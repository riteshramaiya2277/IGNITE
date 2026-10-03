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
                if (Request.QueryString["mode"] == "edit" || !string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    litPageTitle.Text = "Edit Quest";
                    btnPublishQuest.Text = "Update Quest";
                    txtQuestName.Text = "Deep Focus Master";
                    txtDescription.Text = "A daily ritual designed to build cognitive endurance and focused execution.";
                    txtReqType.Text = "Complete Challenges";
                    txtTargetAmount.Text = "2";
                    txtXpReward.Text = "500";
                    txtCategory.Text = "History & Arts";
                }
            }
        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
            // Save or publish quest logic
            Response.Redirect("Quests.aspx");
        }

        protected void btnDraft_Click(object sender, EventArgs e)
        {
            // Save draft logic
            Response.Redirect("Quests.aspx");
        }
    }
}
