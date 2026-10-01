using System;
using System.Web.UI;

namespace IGNITE.AuthOnboarding
{
    public partial class Onboarding : Page
    {
        private static readonly string[] Categories = { "Academic Excellence", "Physical Health", "Mental Well-being", "Personal Growth" };

        protected string StatusMessage { get; private set; } = string.Empty;
        protected string FullNameValue { get; private set; } = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            FullNameValue = Session["FullName"] as string ?? Session["IGNITE.FullName"] as string ?? "Guest";
            if (Request.HttpMethod != "POST")
            {
                return;
            }

            string fullName = (Request.Form["fullName"] ?? string.Empty).Trim();
            string major = (Request.Form["academicMajor"] ?? string.Empty).Trim();
            string habitFrequency = Request.Form["habitFrequency"] ?? "Daily";
            string[] selectedCategories = Request.Form.GetValues("categories") ?? new string[0];
            string[] validCategories = Array.FindAll(selectedCategories, category => Array.IndexOf(Categories, category) >= 0);

            if (!string.IsNullOrWhiteSpace(fullName))
            {
                Session["FullName"] = fullName;
                Session["IGNITE.FullName"] = fullName;
            }
            if (!string.IsNullOrWhiteSpace(major))
            {
                Session["AcademicMajor"] = major;
                Session["Course"] = major;
            }

            Session["IGNITE.Categories"] = validCategories;
            Session["IGNITE.HabitName"] = (Request.Form["habitName"] ?? string.Empty).Trim();
            Session["IGNITE.HabitFrequency"] = habitFrequency == "Weekly" || habitFrequency == "Custom" ? habitFrequency : "Daily";
            Session["IGNITE.HabitReminders"] = Request.Form["habitReminders"] == "on";
            Session["IGNITE.GoalDescription"] = (Request.Form["goalDescription"] ?? string.Empty).Trim();
            Session["IGNITE.GoalDeadline"] = Request.Form["goalDeadline"] ?? string.Empty;
            Session["IGNITE.ProfileComplete"] = true;
            Response.Redirect(ResolveUrl("~/Student/Dashboard.aspx"), false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}