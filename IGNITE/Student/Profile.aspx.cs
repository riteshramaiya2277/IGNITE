using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfileData();
            }
        }

        private void LoadProfileData()
        {
            string fullName = Session["FullName"] as string;
            if (string.IsNullOrWhiteSpace(fullName))
            {
                fullName = (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
                    ? HttpContext.Current.User.Identity.Name
                    : "Alex Mercer";
            }
            txtFullName.Text = fullName;

            string email = Session["Email"] as string ?? "alex.mercer@university.edu";
            txtEmailAddress.Text = email;

            if (Session["College"] != null)
            {
                var item = ddlCollege.Items.FindByValue(Session["College"].ToString());
                if (item != null)
                {
                    ddlCollege.ClearSelection();
                    item.Selected = true;
                }
            }

            if (Session["Course"] != null)
            {
                var item = ddlCourse.Items.FindByValue(Session["Course"].ToString());
                if (item != null)
                {
                    ddlCourse.ClearSelection();
                    item.Selected = true;
                }
            }

            if (Session["AcademicYear"] != null)
            {
                var item = ddlAcademicYear.Items.FindByValue(Session["AcademicYear"].ToString());
                if (item != null)
                {
                    ddlAcademicYear.ClearSelection();
                    item.Selected = true;
                }
            }

            if (Session["Semester"] != null)
            {
                var item = ddlSemester.Items.FindByValue(Session["Semester"].ToString());
                if (item != null)
                {
                    ddlSemester.ClearSelection();
                    item.Selected = true;
                }
            }
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtFullName.Text))
            {
                Session["FullName"] = txtFullName.Text.Trim();
            }

            if (!string.IsNullOrWhiteSpace(txtEmailAddress.Text))
            {
                Session["Email"] = txtEmailAddress.Text.Trim();
            }

            Session["College"] = ddlCollege.SelectedValue;
            Session["Course"] = ddlCourse.SelectedValue;
            Session["AcademicYear"] = ddlAcademicYear.SelectedValue;
            Session["Semester"] = ddlSemester.SelectedValue;

            // Trigger client-side toast notification
            ScriptManager.RegisterStartupScript(this, GetType(), "ProfileSavedToast", "showToast('Profile preferences saved successfully!');", true);
        }

        protected void btnLogoutSecurity_Click(object sender, EventArgs e)
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

            Response.Redirect("~/Login.aspx");
        }
    }
}
