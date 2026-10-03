using System;
using System.Net.Mail;
using System.Web.UI;

namespace IGNITE.AuthOnboarding
{
    public partial class ForgotPassword : Page
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
            if (string.IsNullOrWhiteSpace(EmailValue))
            {
                StatusMessage = "Enter a valid email address.";
                return;
            }

            try
            {
                new MailAddress(EmailValue);
                StatusMessage = "Password recovery is not connected yet. Return to sign in or create a new prototype account.";
            }
            catch (Exception)
            {
                StatusMessage = "Enter a valid email address.";
            }
        }
    }
}