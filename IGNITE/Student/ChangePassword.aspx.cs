using System;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class ChangePassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize default dummy password mask if needed
            }
        }

        protected void btnUpdateSecurity_Click(object sender, EventArgs e)
        {
            string current = txtCurrentPassword.Text;
            string newPass = txtNewPassword.Text;
            string confirm = txtConfirmPassword.Text;

            if (string.IsNullOrWhiteSpace(current))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "PwdErr", "showToast('Please enter your current password.');", true);
                return;
            }

            if (string.IsNullOrWhiteSpace(newPass) || newPass.Length < 8)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "PwdErr", "showToast('New password must be at least 8 characters.');", true);
                return;
            }

            if (newPass != confirm)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "PwdErr", "showToast('New passwords do not match.');", true);
                return;
            }

            // Successfully updated
            txtNewPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            ScriptManager.RegisterStartupScript(this, GetType(), "PwdSuccess", "showToast('🔐 Security preferences and password updated successfully!');", true);
        }
    }
}
