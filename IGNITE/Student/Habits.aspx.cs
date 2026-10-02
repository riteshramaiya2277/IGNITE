using System;
using System.Web;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class Habits : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentInfo();
            }
        }

        private void LoadStudentInfo()
        {
            string fullName = Session["FullName"] as string;
            if (string.IsNullOrWhiteSpace(fullName))
            {
                fullName = (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
                    ? HttpContext.Current.User.Identity.Name
                    : "Ritesh Ramaiya";
            }

            string firstName = fullName.Trim().Split(' ')[0];
            litStudentFirstName.Text = string.IsNullOrWhiteSpace(firstName) ? "Ritesh" : firstName;
        }
    }
}
