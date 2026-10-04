using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration;
using IGNITE;

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
            if (SaveQuest(false))
            {
                Response.Redirect("Quests.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Quests.aspx");
        }

        private bool SaveQuest(bool isPublished)
        {
            try
            {
                string title = txtTitle.Text.Trim();
                string description = txtDescription.Text.Trim();
                string questType = ddlQuestType.SelectedValue;
                string requirementType = txtRequirementType.Text.Trim();
                string requirementValue = txtRequirementValue.Text.Trim();
                int xpReward;

                if (string.IsNullOrEmpty(title))
                {
                    ShowError("Quest title is required");
                    return false;
                }

                if (!int.TryParse(txtXPReward.Text.Trim(), out xpReward) || xpReward <= 0)
                {
                    ShowError("Valid XP reward is required");
                    return false;
                }

                DateTime? startDate = null;
                DateTime? endDate = null;

                if (!string.IsNullOrEmpty(txtStartDate.Text))
                {
                    startDate = DateTime.Parse(txtStartDate.Text);
                }

                if (!string.IsNullOrEmpty(txtEndDate.Text))
                {
                    endDate = DateTime.Parse(txtEndDate.Text);
                }

                SqlParameter questIdParam = new SqlParameter("@QuestId", SqlDbType.Int);
                questIdParam.Direction = ParameterDirection.Output;

                SqlParameter[] parameters = new SqlParameter[]
                {
                    DatabaseHelper.CreateParam("@Title", title),
                    DatabaseHelper.CreateParam("@Description", description),
                    DatabaseHelper.CreateParam("@QuestType", questType),
                    DatabaseHelper.CreateParam("@RequirementType", requirementType),
                    DatabaseHelper.CreateParam("@RequirementValue", requirementValue),
                    DatabaseHelper.CreateParam("@XPReward", xpReward),
                    DatabaseHelper.CreateParam("@StartDate", startDate),
                    DatabaseHelper.CreateParam("@EndDate", endDate),
                    DatabaseHelper.CreateParam("@IsPublished", isPublished),
                    DatabaseHelper.CreateParam("@CreatedBy", 1), // TODO: Get from session
                    questIdParam
                };

                // Execute directly with connection to get output parameter
                using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["IGNITEConnection"].ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("sp_Quest_Create", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddRange(parameters);
                        command.ExecuteNonQuery();
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                ShowError("Error saving quest: " + ex.Message);
                return false;
            }
        }

        private void UpdatePreview()
        {
            litPreviewTitle.Text = string.IsNullOrEmpty(txtTitle.Text) ? "Quest Title" : txtTitle.Text;
            litPreviewType.Text = ddlQuestType.SelectedValue;
            litPreviewXP.Text = string.IsNullOrEmpty(txtXPReward.Text) ? "0 XP" : txtXPReward.Text + " XP";
            litPreviewReq.Text = string.IsNullOrEmpty(txtRequirementValue.Text) ? "Requirement" : txtRequirementValue.Text;
        }

        private void ShowError(string message)
        {
            // TODO: Implement error display
            System.Diagnostics.Debug.WriteLine(message);
        }
    }
}
