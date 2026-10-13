using System;
using System.Web.UI;

namespace IGNITE.Admin
{
    public partial class Students : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (litTotalCount != null)
                {
                    litTotalCount.Text = "4";
                }
            }
        }
    }
}
