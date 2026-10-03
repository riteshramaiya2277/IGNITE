using System;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class HabitDetail : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"] ?? string.Empty;
            string type = Request.QueryString["type"] ?? string.Empty;

            if (string.Equals(id, "meditation", StringComparison.OrdinalIgnoreCase) ||
                string.Equals(id, "flashcards", StringComparison.OrdinalIgnoreCase) ||
                string.Equals(type, "binary", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("HabitDetailBinary.aspx", true);
            }
            else
            {
                Response.Redirect("HabitDetailMeasurable.aspx", true);
            }
        }
    }
}
