using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myExams : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUsername"] == null && Session["username"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if (Session["adminUsername"] != null)
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void myExamsListView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}