using System;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class AdminMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HighlightActiveNavigation();
                LoadAdminState();
            }
        }

        private void LoadAdminState()
        {
            // Admin Display Name
            string adminName = Session["AdminName"] as string;
            if (string.IsNullOrWhiteSpace(adminName))
            {
                adminName = (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
                    ? HttpContext.Current.User.Identity.Name
                    : "Admin";
            }
            litAdminTitle.Text = adminName;
        }

        private void HighlightActiveNavigation()
        {
            ResetNavClasses();

            string currentPath = Request.AppRelativeCurrentExecutionFilePath.ToLower();

            if (currentPath.Contains("overview"))
            {
                navOverview.Attributes["class"] += " active";
            }
            else if (currentPath.Contains("student"))
            {
                navStudents.Attributes["class"] += " active";
            }
            else if (currentPath.Contains("challenge"))
            {
                navChallenges.Attributes["class"] += " active";
            }
            else if (currentPath.Contains("quest"))
            {
                navQuests.Attributes["class"] += " active";
            }
            else if (currentPath.Contains("achievement"))
            {
                navAchievements.Attributes["class"] += " active";
            }
            else if (currentPath.Contains("settings"))
            {
                navSettings.Attributes["class"] += " active";
            }
        }

        private void ResetNavClasses()
        {
            if (navOverview != null) navOverview.Attributes["class"] = "admin-nav-item";
            if (navStudents != null) navStudents.Attributes["class"] = "admin-nav-item";
            if (navChallenges != null) navChallenges.Attributes["class"] = "admin-nav-item";
            if (navQuests != null) navQuests.Attributes["class"] = "admin-nav-item";
            if (navAchievements != null) navAchievements.Attributes["class"] = "admin-nav-item";
            if (navSettings != null) navSettings.Attributes["class"] = "admin-settings-pill-btn";
        }

        protected void btnAdminLogout_Click(object sender, EventArgs e)
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



        public string AdminTitle
        {
            get { return litAdminTitle.Text; }
            set { litAdminTitle.Text = value; }
        }
    }
}
