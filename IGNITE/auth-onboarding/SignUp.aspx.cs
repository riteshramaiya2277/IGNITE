using System;
using System.Net.Mail;
using System.Web.UI;

namespace IGNITE.AuthOnboarding
{
    public partial class SignUp : Page
    {
        protected string StatusMessage { get; private set; } = string.Empty;
        protected string FullNameValue { get; private set; } = string.Empty;
        protected string EmailValue { get; private set; } = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod != "POST")
            {
                return;
            }

            FullNameValue = (Request.Form["fullName"] ?? string.Empty).Trim();
            EmailValue = (Request.Form["email"] ?? string.Empty).Trim();
            string password = Request.Form["password"] ?? string.Empty;
            string confirmation = Request.Form["confirmPassword"] ?? string.Empty;

            if (FullNameValue.Length == 0 || FullNameValue.Length > 100 || !IsValidEmail(EmailValue))
            {
                StatusMessage = "Enter your name and a valid email address.";
                return;
            }

            if (password.Length < 8)
            {
                StatusMessage = "Your password must be at least 8 characters.";
                return;
            }

            if (!string.Equals(password, confirmation, StringComparison.Ordinal))
            {
                StatusMessage = "The passwords do not match.";
                return;
            }

            string savedEmail = Session["IGNITE.Auth.Email"] as string;
            if (string.Equals(savedEmail, EmailValue, StringComparison.OrdinalIgnoreCase))
            {
                StatusMessage = "An account for this email already exists in this browser session. Sign in instead.";
                return;
            }

            byte[] salt = AuthSecurity.CreateSalt();
            Session["IGNITE.Auth.Email"] = EmailValue;
            Session["IGNITE.Auth.Salt"] = salt;
            Session["IGNITE.Auth.PasswordHash"] = AuthSecurity.HashPassword(password, salt);
            Session["IGNITE.FullName"] = FullNameValue;
            Session["IGNITE.Authenticated"] = true;
            Session["IGNITE.ProfileComplete"] = false;

            Response.Redirect(ResolveUrl("~/auth-onboarding/Onboarding.aspx"), false);
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