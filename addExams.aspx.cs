using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addExams : System.Web.UI.Page
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
    }

    protected void submitBtn_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            //if the page validation is successful, then do the following...

            //get the values from textboxes entered by a user and store them in the local variables.
            string examCode = examCodeTxt.Text;
            string examName = examNameTxt.Text;
            string course = chooseCourseDropDownList.Text;
            string module = moduleDropDownList.Text;

            //formatting the date..
            DateTime date = Convert.ToDateTime(dateTxt.Text.Trim());
            String dateString = date.DayOfWeek.ToString() + ", " + date.ToLongDateString();

            //formating the exam start time
            DateTime startTime = Convert.ToDateTime(startTimeTxt.Text.Trim());
            string startTimeString = string.Format("{0:hh:mm tt}", startTime);

            //formatting the exam end time
            DateTime endTime = Convert.ToDateTime(endTimeTxt.Text.Trim());
            string endTimeString = string.Format("{0:hh:mm tt}", endTime);

            string duration = durationTxt.Text;
            string building = buildingTxt.Text;
            string room = roomTxt.Text;

            //statusLbl.Text = examCode + ",\t" + examName + ",\t" + course + ",\t" + module + ",\t" + dateString + ",\t\t\t" + startTimeString + ",\t\t\t" + endTimeString + ",\t" + duration + ",\t" + building + ",\t" + room;

            //inserting an examination into a database
            string mySql;
            mySql = "insert into Exams (examCode,examName,course,module,date,duration,startTime,endTime,building,room)" +
                "values ('" + examCode + "','" + examName + "','" + course + "','" + module + "','" + dateString + "','" + duration + "','" + startTimeString + "','"
                + endTimeString + "','" + building + "','" + room + "')";
            examDataSource.SelectCommand = mySql;
            examDataList.DataBind();

            statusLbl.Text = "Examination successfully added to a database!";
            statusLbl.ForeColor = System.Drawing.Color.Green;
            Response.AddHeader("REFRESH", "5;URL=addExams.aspx");
        }
    }
}