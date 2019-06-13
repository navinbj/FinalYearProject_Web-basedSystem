using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class studentSingle : System.Web.UI.Page
{
    Mail mail = new Mail();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void saveBtn_Click1(object sender, EventArgs e)
    {
        //local variables for storing all student related data.
        string studentID = "";
        string firstName = "";
        string lastName = "";
        string address_street = "";
        string city = "";
        string postcode = "";
        string country = "";
        string mobile = "";
        string email = "";
        string username = "";
        string course = "";

        //looping through the datalist that contains all the information about a student in a current session.
        foreach (DataListItem item in studentDataList.Items)
        {
            //finding the controls that contain different types of information about a student and storing them in the local variables..
            Label studentIdLbl = (Label)item.FindControl("studentIDLbl");
            studentID = studentIdLbl.Text;

            TextBox firstNameTxt = (TextBox)item.FindControl("firstNameTxt");
            firstName = firstNameTxt.Text;

            TextBox lastNameTxt = (TextBox)item.FindControl("lastNameTxt");
            lastName = lastNameTxt.Text;

            TextBox address_streetTxt = (TextBox)item.FindControl("address_streetTxt");
            address_street = address_streetTxt.Text;

            TextBox cityTxt = (TextBox)item.FindControl("cityTxt");
            city = cityTxt.Text;

            TextBox postcodeTxt = (TextBox)item.FindControl("postcodeTxt");
            postcode = postcodeTxt.Text;

            TextBox countryTxt = (TextBox)item.FindControl("countryTxt");
            country = countryTxt.Text;

            TextBox mobileTxt = (TextBox)item.FindControl("mobileTxt");
            mobile = mobileTxt.Text;

            TextBox emailTxt = (TextBox)item.FindControl("emailTxt");
            email = emailTxt.Text;

            TextBox usernameTxt = (TextBox)item.FindControl("usernameTxt");
            username = usernameTxt.Text;

            TextBox courseTxt = (TextBox)item.FindControl("courseTxt");
            course = courseTxt.Text;
        }

        string updateQuery;
        //sql update query for updating the student details in the Students class.
        updateQuery = "update Students set address_street = '" + address_street + "', city = '" + city + "', postcode = '" + postcode + "', country = '" + country + "', phoneNumber = '" + mobile + "', email = '" + email + "' where studentID = '" + studentID + "'";
        studentUpdatedDataSource.SelectCommand = updateQuery;
        studentUpdatedDataList.DataBind();

        //sending email to the student notifying them of the account update.
        string fromEmail = "studentsservice.unisalford@gmail.com";
        string toEmail = email;
        string localHost = HttpContext.Current.Request.Url.Authority.ToString();
        string mailSubject = "Successful Update of your Univeristy of Salford Account";
        string mailBody = "Dear " + firstName + ",\n\n"
            + "It has come to our attention that you have recently updated your University of Salford's account details.\n"
            + "We hope that it was you who updated your account details.\n"
            + "If that wasn't you, please contact our Registration Team on the contact details mentioned in the email.\n"
            + "However, if that was you, please keep track of your updated account details.\n\n"
             + "YOUR DETAILS HERE.........please keep track of them!\n"
                    + "-------------------------------------------------------------------------------------------\n"
                    + "First Name: " + firstName + "\n"
                    + "Last Name: " + lastName + "\n"
                    + "Address: " + address_street + ", " + city + ", " + postcode + ", " + country + "\n"
                    + "Mobile: " + mobile + "\n"
                    + "Email: " + email + "\n"
                    + "Username: " + username + "\t\t\t***please use this username to login.\n"
                    + "Course you're enrolled in: " + course + "\n"
                    + "Your Student ID Number: " + studentID + "\n\n"
            + "Manage your personal information from the 'My Account' page when you login to our website. You simply need to click on your email/ username to view your details.\n"
            + "You can change your contact details and password, check examination timetables and use the grade estimator.\n"
            + "To visit your 'My Account' page go to http://" + localHost + "/login.aspx."
            + "\n\n\n"
            + "Thanks\n"
            + "University of Salford\n"
            + "Registration Team\n"
            + "01234567898";

        //calling the sendMail method of mail class to send email to the student.
        mail.sendMail(fromEmail, toEmail, mailSubject, mailBody);


        statusLbl.Text = "ACCOUNT DETAILS UPDATE SUCCESSFUL" + "<br />" + "Please check you email for more details!";
        Response.AddHeader("REFRESH", "4");
    }

    protected void deleteStudentBtn_Click(object sender, EventArgs e)
    {
        string studentID = "";

        //looping through the datalist that contains all the information about a student in a current session.
        foreach (DataListItem item in studentDataList.Items)
        {
            Label studentIdLbl = (Label)item.FindControl("studentIDLbl");
            studentID = studentIdLbl.Text;
        }

        String deleteQuery;
        //sql delete query for deleting the student
        deleteQuery = "delete from Students where studentID = '" + studentID + "'";
        studentUpdatedDataSource.SelectCommand = deleteQuery;
        studentUpdatedDataList.DataBind();

        statusLbl.Text = "STUDENT DELETED!";
        Response.AppendHeader("Refresh", "3;url=viewAllStudents.aspx");
    }
}