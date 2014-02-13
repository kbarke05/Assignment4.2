using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["personkey"] != null)
        {
            ManagePerson mp = new ManagePerson((int)Session["personkey"]);
            Customer c = mp.GetCustomer();
            lblFirst.Text = c.FirstName;
            lblLast.Text = c.LastName;
            lblEmail.Text = c.email;

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}