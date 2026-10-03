using System;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class HabitDetailMeasurable : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize habit state if needed
            }
        }
    }
}
