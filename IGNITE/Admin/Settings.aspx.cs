using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IGNITE.Admin
{
    public partial class Settings : Page
    {
        [Serializable]
        public class CategoryItem
        {
            public string Description { get; set; }
            public string Status { get; set; } // "ACTIVE" or "INACTIVE"
        }

        private List<CategoryItem> CategoriesList
        {
            get
            {
                if (ViewState["AdminCategories"] == null)
                {
                    var defaults = new List<CategoryItem>
                    {
                        new CategoryItem { Description = "Recurring daily activities for students.", Status = "ACTIVE" },
                        new CategoryItem { Description = "High-effort tasks with double XP rewards.", Status = "ACTIVE" },
                        new CategoryItem { Description = "Old challenge tracks from season 1.", Status = "INACTIVE" }
                    };
                    ViewState["AdminCategories"] = defaults;
                }
                return (List<CategoryItem>)ViewState["AdminCategories"];
            }
            set
            {
                ViewState["AdminCategories"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
            }
        }

        private void BindCategories()
        {
            rptCategories.DataSource = CategoriesList;
            rptCategories.DataBind();
        }

        protected void btnSavePlatform_Click(object sender, EventArgs e)
        {
            // In a production scenario, update database or config
            Session["PlatformName"] = txtPlatformName.Text.Trim();
            Session["PlatformLanguage"] = ddlLanguage.SelectedValue;
            Session["PlatformDescription"] = txtDescription.Text.Trim();
            Session["PlatformUtcOffset"] = ddlTimezone.SelectedValue;

            ShowToast("Platform settings saved successfully!");
        }

        protected void btnSaveAll_Click(object sender, EventArgs e)
        {
            // Platform
            Session["PlatformName"] = txtPlatformName.Text.Trim();
            Session["PlatformLanguage"] = ddlLanguage.SelectedValue;
            Session["PlatformDescription"] = txtDescription.Text.Trim();
            Session["PlatformUtcOffset"] = ddlTimezone.SelectedValue;

            // Challenges & Quests
            Session["EnableSystemChallenges"] = chkSystemChallenges.Checked;
            Session["ParticipationLimitRules"] = chkParticipationRules.Checked;
            Session["BaseXpReward"] = txtBaseXp.Text.Trim();

            // Achievements
            Session["AchievementSystemEnabled"] = chkAchievementSystem.Checked;
            Session["DefaultUiBehavior"] = ddlUiBehavior.SelectedValue;
            Session["HiddenAchievementSupport"] = chkHiddenAchievements.Checked;

            // Student Accounts
            Session["SelfDeactivation"] = chkSelfDeactivation.Checked;
            Session["PasswordPolicy"] = ddlPasswordPolicy.SelectedValue;
            Session["DataRetentionPolicy"] = ddlDataRetention.SelectedValue;

            ShowToast("All system configuration preferences updated successfully!");
        }

        protected void btnAddCategorySubmit_Click(object sender, EventArgs e)
        {
            string newDesc = txtNewCategoryDesc.Text.Trim();
            string newStatus = ddlNewCategoryStatus.SelectedValue;

            if (!string.IsNullOrWhiteSpace(newDesc))
            {
                var list = CategoriesList;
                list.Add(new CategoryItem { Description = newDesc, Status = newStatus });
                CategoriesList = list;
                BindCategories();

                txtNewCategoryDesc.Text = string.Empty;
                ShowToast("Category added successfully!");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();

            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, string.Empty)
                {
                    Expires = DateTime.Now.AddYears(-1)
                };
                Response.Cookies.Add(authCookie);
            }

            Response.Redirect(ResolveUrl("~/auth-onboarding/Login.aspx"), true);
        }

        private void ShowToast(string message)
        {
            string script = string.Format("window.showToastNotice('{0}');", HttpUtility.JavaScriptStringEncode(message));
            ScriptManager.RegisterStartupScript(this, GetType(), "ToastAlertKey", script, true);
        }
    }
}
