using System;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class Challenges : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Master page automatically handles streak, XP, active navigation highlighting, and student profile
            }
        }
    }
}
