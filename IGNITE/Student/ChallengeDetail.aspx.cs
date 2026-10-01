using System;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class ChallengeDetail : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"] ?? string.Empty;
                string view = Request.QueryString["view"] ?? string.Empty;
                string status = Request.QueryString["status"] ?? string.Empty;

                // If user requests active tracker view or mindful-mornings
                if (string.Equals(view, "active", StringComparison.OrdinalIgnoreCase) ||
                    string.Equals(status, "active", StringComparison.OrdinalIgnoreCase) ||
                    string.Equals(id, "mindful-mornings", StringComparison.OrdinalIgnoreCase))
                {
                    previewChallengeView.Style["display"] = "none";
                    activeTrackerView.Style["display"] = "block";
                }
                else
                {
                    previewChallengeView.Style["display"] = "block";
                    activeTrackerView.Style["display"] = "none";
                }
            }
        }
    }
}
