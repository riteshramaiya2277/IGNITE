using System;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class GoalDetail : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Can initialize dynamic goal data here if needed
            }
        }
    }
}
