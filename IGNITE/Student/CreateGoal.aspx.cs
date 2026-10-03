using System;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class CreateGoal : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Can initialize prefilled goal data for edit mode if needed
            }
        }
    }
}
