using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlError.Attributes["class"] = "status-alert";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string adminId = (txtAdminId.Text ?? string.Empty).Trim();
            string password = (txtPassword.Text ?? string.Empty);

            if (string.IsNullOrEmpty(adminId) || string.IsNullOrEmpty(password))
            {
                ShowError("Please provide both an Admin ID and password.");
                return;
            }

            bool isValidId = string.Equals(adminId, "admin@ignite.com", StringComparison.OrdinalIgnoreCase) ||
                             string.Equals(adminId, "admin", StringComparison.OrdinalIgnoreCase);

            bool isValidPassword = (password == "Admin@123" || password == "admin123" || password == "admin");

            if (isValidId && isValidPassword)
            {
                FormsAuthentication.SetAuthCookie("Admin", false);
                Session["IGNITE.Authenticated"] = true;
                Session["IsAdmin"] = true;
                Session["AdminName"] = "Admin";
                Session["FullName"] = "Administrator";
                Session["Email"] = "admin@ignite.com";
                Session["IGNITE.ProfileComplete"] = true;

                Response.Redirect(ResolveUrl("~/Admin/Overview.aspx"), false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            ShowError("Invalid Admin credentials. Use admin@ignite.com and Admin@123.");
        }

        private void ShowError(string message)
        {
            litErrorMessage.Text = message;
            pnlError.Attributes["class"] = "status-alert visible";
        }
    }
}
