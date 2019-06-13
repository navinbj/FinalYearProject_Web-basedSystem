using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class resetPassword : System.Web.UI.Page
{
    //creating a new instance of a Login class.
    Login login = new Login();
    Mail mail = new Mail();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void resetBtn_Click(object sender, EventArgs e)
    {
        string studentID = "";
        string oldPassword = oldPasswordTxt.Text;

        //hashing the password and storing it into a new local variable.
        string oldPasswordHashed = FormsAuthentication.HashPasswordForStoringInConfigFile(oldPassword, "SHA1");

        string newPassword = newPasswordTxt.Text;
        string newPasswordHashed = "";
        string email = "";
        string firstName = "";

        //looping through the datalist that contains all the information about a student in a current session.
        foreach (DataListItem item in studentDataList.Items)
        {
            Label studentIDLbl = (Label)item.FindControl("studentIDLabel");
            studentID = studentIDLbl.Text;

            Label emailLbl = (Label)item.FindControl("emailLabel");
            email = emailLbl.Text;

            Label firstnameLbl = (Label)item.FindControl("firstNameLabel");
            firstName = firstnameLbl.Text;
        }

        //calling a checkPassword method of a Login class to check if the password enetered by a student matches
        //against the record in the database.
        bool isValidPassword = login.checkPassword(oldPasswordHashed, System.Convert.ToString(studentID));

        if (isValidPassword)
        {
            //if the password matches, then hash the password first (decrypting this time)
            newPasswordHashed = FormsAuthentication.HashPasswordForStoringInConfigFile(newPassword, "SHA1");

            //now simply update the password for a specified student. 
            string updatePasswordQuery = "";
            updatePasswordQuery = "update Students set password = '" + newPasswordHashed + "' where studentID = '" + studentID + "'";
            studentUpdatedDataSource.SelectCommand = updatePasswordQuery;
            studentUpdatedDataList.DataBind();

            messageLbl.ForeColor = System.Drawing.Color.Green;
            messageLbl.Text = "Password reset successful!";
            Response.AddHeader("REFRESH", "5");

            //sending email to the student notifying them of the password reset.
            string fromEmail = "studentsservice.unisalford@gmail.com";
            string toEmail = email;
            string localHost = HttpContext.Current.Request.Url.Authority.ToString();
            string mailSubject = "Password Changed for University of Salford Account";
            string mailBody = "Dear " + firstName + ",\n\n"
                + "Thank you for resetting your password because we always encourage our students to reset their password often, atleast every 3 months, for security purposes.\n"
                + "Please keep track of your new password as you would need it to log into our website.\n\n"
                + "YOUR NEW PASSWORD IS..." + newPassword + "\n\n\n"
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
        }
        else
        {
            messageLbl.ForeColor = System.Drawing.Color.Red;
            messageLbl.Text = "**Cannot reset: your old password is invalid!";
        }


    }
}