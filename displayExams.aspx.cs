using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class displayExams : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUsername"] == null && Session["username"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void examsListView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}