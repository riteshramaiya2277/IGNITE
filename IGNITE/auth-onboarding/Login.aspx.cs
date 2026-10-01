using System;
using System.Net.Mail;
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
            if (!IsValidEmail(EmailValue) || string.IsNullOrEmpty(password))
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
            string destination = Session["IGNITE.ProfileComplete"] is bool complete && complete
                ? "~/Student/Dashboard.aspx"
                : "~/auth-onboarding/Onboarding.aspx";
            Response.Redirect(ResolveUrl(destination), false);
            Context.ApplicationInstance.CompleteRequest();
        }

        private static bool IsValidEmail(string value)
        {
            try
            {
                return string.Equals(new MailAddress(value).Address, value, StringComparison.OrdinalIgnoreCase);
            }
            catch (FormatException)
            {
                return false;
            }
        }
    }
}