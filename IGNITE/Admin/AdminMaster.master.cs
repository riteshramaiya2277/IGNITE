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

            // System Operational Status
            string status = Session["SystemStatus"] as string ?? "SYSTEM OPERATIONAL";
            litSystemStatus.Text = status;
        }

        private void HighlightActiveNavigation()
        {
            ResetNavClasses();
        }

        private void ResetNavClasses()
        {
            navOverview.Attributes["class"] = "admin-nav-item";
            navStudents.Attributes["class"] = "admin-nav-item";
            navChallenges.Attributes["class"] = "admin-nav-item";
            navQuests.Attributes["class"] = "admin-nav-item";
            navAchievements.Attributes["class"] = "admin-nav-item";
            navSettings.Attributes["class"] = "admin-settings-pill-btn";
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

        public string SystemStatus
        {
            get => litSystemStatus.Text;
            set => litSystemStatus.Text = value;
        }

        public string AdminTitle
        {
            get => litAdminTitle.Text;
            set => litAdminTitle.Text = value;
        }
    }
}
