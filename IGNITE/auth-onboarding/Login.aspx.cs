using System;
using System.Net.Mail;
using System.Web.Security;
using System.Web.UI;

namespace IGNITE.AuthOnboarding
{
    public partial class Login : Page
    {
        protected string StatusMessage { get; private set; } = string.Empty;
        protected string EmailValue { get; private set; } = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod != "POST")
            {
                return;
            }

            EmailValue = (Request.Form["email"] ?? string.Empty).Trim();
            string password = Request.Form["password"] ?? string.Empty;

            if (string.IsNullOrEmpty(EmailValue) || string.IsNullOrEmpty(password))
            {
                StatusMessage = "Enter your ID / email address and password.";
                return;
            }

            // 1. Admin Panel Credentials Access
            bool isAdminId = string.Equals(EmailValue, "admin@ignite.com", StringComparison.OrdinalIgnoreCase) ||
                             string.Equals(EmailValue, "admin", StringComparison.OrdinalIgnoreCase);

            if (isAdminId && (password == "Admin@123" || password == "admin123" || password == "admin"))
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

            // 2. User Account Access (e.g. riteshramaiya2277@gmail.com / 11111111)
            bool isRiteshUser = string.Equals(EmailValue, "riteshramaiya2277@gmail.com", StringComparison.OrdinalIgnoreCase) ||
                               string.Equals(EmailValue, "ritesh", StringComparison.OrdinalIgnoreCase) ||
                               string.Equals(EmailValue, "riteshramaiya2277", StringComparison.OrdinalIgnoreCase);

            if (isRiteshUser && (password == "11111111" || password == "Student@123" || password == "student123"))
            {
                FormsAuthentication.SetAuthCookie("Ritesh Ramaiya", false);
                Session["IGNITE.Authenticated"] = true;
                Session["IsAdmin"] = false;
                Session["FullName"] = "Ritesh Ramaiya";
                Session["Email"] = "riteshramaiya2277@gmail.com";
                Session["IGNITE.ProfileComplete"] = true;

                Response.Redirect(ResolveUrl("~/Student/Dashboard.aspx"), false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            // 3. Demo Student Account Access
            bool isDemoStudent = string.Equals(EmailValue, "student@ignite.com", StringComparison.OrdinalIgnoreCase) ||
                                string.Equals(EmailValue, "student", StringComparison.OrdinalIgnoreCase);

            if (isDemoStudent && (password == "Student@123" || password == "student123" || password == "student" || password == "11111111"))
            {
                FormsAuthentication.SetAuthCookie("Alex Mercer", false);
                Session["IGNITE.Authenticated"] = true;
                Session["IsAdmin"] = false;
                Session["FullName"] = "Alex Mercer";
                Session["Email"] = "student@ignite.com";
                Session["IGNITE.ProfileComplete"] = true;

                Response.Redirect(ResolveUrl("~/Student/Dashboard.aspx"), false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            // 3. Standard Student Session Account Validation
            if (!IsValidEmail(EmailValue))
            {
                StatusMessage = "Enter a valid email address and password.";
                return;
            }

            string savedEmail = Session["IGNITE.Auth.Email"] as string;
            byte[] salt = Session["IGNITE.Auth.Salt"] as byte[];
            byte[] passwordHash = Session["IGNITE.Auth.PasswordHash"] as byte[];
            if (!string.Equals(savedEmail, EmailValue, StringComparison.OrdinalIgnoreCase) || salt == null || passwordHash == null || !AuthSecurity.VerifyPassword(password, salt, passwordHash))
            {
                StatusMessage = "Those sign-in details do not match an account in this browser session.";
                return;
            }

            Session["IGNITE.Authenticated"] = true;
            Session["IsAdmin"] = false;
            if (Session["IGNITE.FullName"] != null)
            {
                Session["FullName"] = Session["IGNITE.FullName"];
            }
            Session["Email"] = EmailValue;
            string destination = Session["IGNITE.ProfileComplete"] is bool complete && complete
                ? "~/Student/Dashboard.aspx"
                : "~/auth-onboarding/Onboarding.aspx";
            Response.Redirect(ResolveUrl(destination), false);
            Context.ApplicationInstance.CompleteRequest();
        }

        private static bool IsValidEmail(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
            {
                return false;
            }

            try
            {
                return string.Equals(new MailAddress(value).Address, value, StringComparison.OrdinalIgnoreCase);
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}