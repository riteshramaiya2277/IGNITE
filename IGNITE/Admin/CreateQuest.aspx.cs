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
                    if (litPageTitle != null) litPageTitle.Text = "Edit Quest";
                    if (btnPublishQuest != null) btnPublishQuest.Text = "Update Quest";
                    if (txtQuestName != null) txtQuestName.Text = "Deep Focus Master";
                    if (txtDescription != null) txtDescription.Text = "A daily ritual designed to build cognitive endurance and focused execution.";
                    if (txtReqType != null) txtReqType.Text = "Complete Challenges";
                    if (txtTargetAmount != null) txtTargetAmount.Text = "2";
                    if (txtXpReward != null) txtXpReward.Text = "500";
                    if (txtCategory != null) txtCategory.Text = "History & Arts";
                }
            }
        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
            Response.Redirect("Quests.aspx");
        }

        protected void btnDraft_Click(object sender, EventArgs e)
        {
            Response.Redirect("Quests.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Quests.aspx");
        }
    }
}
