using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewAllStudents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUsername"] == null && Session["username"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if (Session["username"] != null)
        {
            Response.Redirect("Default.aspx");
        }

        studentsListView.Visible = true;
        studentsListView.DataSourceID = studentsDataSource.ID;
    }

    protected void filterByCourseBtn_Click(object sender, EventArgs e)
    {
        string userRole = "student";
        string course = chooseCourseDDList.Text.Trim();
        statusLbl.Text = course;

        string selectQuery = "select * from Students where course = '" + course + "' and userRole = '" + userRole + "'";
        studentsDataSource.SelectCommand = selectQuery;
        studentsListView.DataSourceID = studentsDataSource.ID;
    }
}