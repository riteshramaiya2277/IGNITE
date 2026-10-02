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
                string mode = (Request.QueryString["mode"] ?? string.Empty).ToLowerInvariant();
                string edit = (Request.QueryString["edit"] ?? string.Empty).ToLowerInvariant();
                if (mode == "settings" || edit == "true")
                {
                    pnlProfileOverview.Style["display"] = "none";
                    pnlPreferencesSection.Style["display"] = "block";
                    litTopPageTitle.Text = "Settings";
                }

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
                    : "Ritesh Ramaiya";
            }
            txtFullName.Text = fullName;

            string email = Session["Email"] as string ?? "riteshramaiya2277@gmail.com";
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

            // Overview Hero & Stats binding
            litHeroName.Text = fullName;
            string[] nameParts = fullName.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (nameParts.Length > 1)
            {
                litHeroInitials.Text = (nameParts[0].Substring(0, 1) + nameParts[nameParts.Length - 1].Substring(0, 1)).ToUpper();
            }
            else if (nameParts.Length == 1 && nameParts[0].Length > 0)
            {
                litHeroInitials.Text = nameParts[0].Substring(0, Math.Min(2, nameParts[0].Length)).ToUpper();
            }

            string institution = Session["College"] as string ?? ddlCollege.SelectedValue;
            litHeroInstitution.Text = institution;
            litAcademicUniv.Text = institution;

            string major = Session["Course"] as string ?? ddlCourse.SelectedValue;
            litHeroMajor.Text = major;
            litAcademicMajor.Text = major;

            string academicYear = Session["AcademicYear"] as string ?? ddlAcademicYear.SelectedValue;
            litAcademicYear.Text = academicYear;

            string semester = Session["Semester"] as string ?? ddlSemester.SelectedValue;
            litHeroSemester.Text = semester;
            litAcademicSemester.Text = semester;

            int levelNum = 12;
            if (Session["CurrentLevel"] != null && int.TryParse(Session["CurrentLevel"].ToString(), out int parsedLvl))
            {
                levelNum = parsedLvl;
            }
            litHeroLvlBadge.Text = "LVL " + levelNum;

            int streak = 15;
            if (Session["Streak"] != null && int.TryParse(Session["Streak"].ToString(), out int parsedStreak))
            {
                streak = parsedStreak;
            }
            litTotalStreak.Text = streak + " Days";

            if (Session["TotalXP"] != null)
            {
                litTotalXP.Text = Session["TotalXP"].ToString();
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

            Response.Redirect("~/auth-onboarding/Login.aspx");
        }
    }
}
