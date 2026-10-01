using System;
using System.Web.UI;

namespace IGNITE.Student
{
    public partial class Journal : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize page data here
            }
        }
    }
}
