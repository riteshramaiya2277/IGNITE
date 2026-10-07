using System;
using System.Net.Mail;
using System.Web.UI;

namespace IGNITE.AuthOnboarding
{
    public partial class SignUp : Page
    {
        protected global::System.Web.UI.WebControls.TextBox fullName;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvFullName;
        protected global::System.Web.UI.WebControls.TextBox email;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvEmail;
        protected global::System.Web.UI.WebControls.RegularExpressionValidator revEmail;
        protected global::System.Web.UI.WebControls.TextBox password;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvPassword;
        protected global::System.Web.UI.WebControls.RegularExpressionValidator revPassword;
        protected global::System.Web.UI.WebControls.TextBox confirmPassword;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvConfirmPassword;
        protected global::System.Web.UI.WebControls.CompareValidator cmpPassword;
        protected global::System.Web.UI.WebControls.Button btnSignUp;

        protected string StatusMessage { get; private set; } = string.Empty;
        protected string FullNameValue { get; private set; } = string.Empty;
        protected string EmailValue { get; private set; } = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            if (Request.HttpMethod == "POST")
            {
                ProcessSignUp();
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            ProcessSignUp();
        }

        private void ProcessSignUp()
        {
            if (!Page.IsValid)
            {
                return;
            }

            FullNameValue = (fullName != null && !string.IsNullOrEmpty(fullName.Text))
                ? fullName.Text.Trim()
                : (Request.Form["fullName"] ?? string.Empty).Trim();

            EmailValue = (email != null && !string.IsNullOrEmpty(email.Text))
                ? email.Text.Trim()
                : (Request.Form["email"] ?? string.Empty).Trim();

            string passwordVal = (password != null && !string.IsNullOrEmpty(password.Text))
                ? password.Text
                : (Request.Form["password"] ?? string.Empty);

            string confirmationVal = (confirmPassword != null && !string.IsNullOrEmpty(confirmPassword.Text))
                ? confirmPassword.Text
                : (Request.Form["confirmPassword"] ?? string.Empty);

            if (FullNameValue.Length == 0 || FullNameValue.Length > 100 || !IsValidEmail(EmailValue))
            {
                StatusMessage = "Enter your name and a valid email address.";
                return;
            }

            if (passwordVal.Length < 8)
            {
                StatusMessage = "Your password must be at least 8 characters.";
                return;
            }

            if (!string.Equals(passwordVal, confirmationVal, StringComparison.Ordinal))
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
            Session["IGNITE.Auth.PasswordHash"] = AuthSecurity.HashPassword(passwordVal, salt);
            Session["IGNITE.FullName"] = FullNameValue;
            Session["FullName"] = FullNameValue;
            Session["Email"] = EmailValue;
            Session["IGNITE.Authenticated"] = true;
            Session["IGNITE.ProfileComplete"] = false;

            Response.Redirect(ResolveUrl("~/auth-onboarding/Onboarding.aspx"), false);
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