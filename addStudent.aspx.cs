using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class addStudent : System.Web.UI.Page
{
    //creating a new instance of class Login.
    Login login = new Login();
    Mail mail = new Mail();
        
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
            String firstName = firstNameTxt.Text;
            String lastName = lastNameTxt.Text;
            String street = addressStreetTxt.Text;
            String city = cityTxt.Text;
            String postcode = postcodeTxt.Text.ToUpper();
            String country = countryTxt.Text;
            String mobile = mobileTxt.Text;
            String email = emailTxt.Text;
            String username = usernameTxt.Text;
            String password = passwordTxt.Text;
            String course = chooseCourseDropDownList.Text;
            String imageDetail = imageFileUpload.ToString();
            String studentID = "UoS" + generateRandomNumber(1000000, "D6");
            String userRole = "student";

            //hashing the password and storing it into a new local variable.
            String passwordEncrypt = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");


            //statusLbl.Text = firstName + lastName + street + city + postcode + country + mobile + email + username + password + passwordEncrypt + course + imageDetail;
            //statusLbl.Text = studentID;

            bool test;

            //calling the checkEmail method of a Login class by passing the email enetered by the user.
            test = login.checkEmail(email);
            if (test)
            {
                //if the email matches the one already in the database, the registration is unsuccessful
                //because a user cannot register twice with the same email.
                statusLbl.Text = "***Email already in use!";
            }
            else
            {
                //checking if image file upload has an image..
                if (imageFileUpload.HasFile)
                {
                    String sPath = MapPath("~/images/" + imageFileUpload.FileName);
                    imageFileUpload.PostedFile.SaveAs(sPath);
                }

                //if the email is distinct from the one in the database, then insert the user into the database.
                string mySql;
                mySql = "insert into Students (studentID, firstName,lastName,address_street,city,postcode,country,phoneNumber,email,username,password,course,photo,userRole)" +
                    "values ('" + studentID + "','" + firstName + "','" + lastName + "','" + street + "','" + city + "','" + postcode + "','" + country + "','" 
                    + mobile + "','" + email + "','" + username + "','" + passwordEncrypt + "','" + course + "','" + imageFileUpload.FileName + "','" + userRole + "')";
                studentsDataSource.SelectCommand = mySql;
                studentsDataList.DataBind();

                //sending an email to the user to let them know of successful registration.
                //the email will also notify the user about their account details and where to login.
                string fromEmail = "studentsservice.unisalford@gmail.com";
                string toEmail = email.Trim();
                string localHost = HttpContext.Current.Request.Url.Authority.ToString();
                string mailSubject = "University of Salford Registration";
                string mailBody = "Dear " + firstName + " " + lastName + ",\n\n"
                    + "Your registration has been successful!\n"
                    + "Welcome to The University of Salford.\n"
                    + "Manage your personal information from the 'My Account' page when you login to our website. You simply need to click on your email/ username to view your details.\n"
                    + "You can change your contact details and password, check examination timetables and use the grade estimator.\n"
                    + "To visit your 'My Account' page go to http://" + localHost + "/login.aspx."
                    + "\n\n\n"

                    + "YOUR DETAILS HERE.........please keep track of them!\n"
                    + "-------------------------------------------------------------------------------------------\n"
                    + "First Name: " + firstName + "\n"
                    + "Last Name: " + lastName + "\n"
                    + "Address: " + street + ", " + city + ", " + postcode + ", " + country + "\n"
                    + "Mobile: " + mobile + "\n"
                    + "Email: " + email + "\n"
                    + "Username: " + username + "\t\t\t***please use this username to login.\n"
                    + "Password: " + password + "\t\t\t***please use this password for the first time login.\n\n"
                    + "Course you're enrolled in: " + course + "\n"
                    + "Your Student ID Number: " + studentID + "\n\n"
                    + "Thanks\n"
                    + "University of Salford\n"
                    + "Registration Team\n"
                    + "01234567898";

                //calling the sendMail method of mail class to send email to the student.
                mail.sendMail(fromEmail, toEmail, mailSubject, mailBody);

                statusLbl.Text = "REGISTRATION SUCCESSFUL: The details will be sent to email address provided!";
                statusLbl.ForeColor = System.Drawing.Color.Green;
                Response.AddHeader("REFRESH", "5;URL=addStudent.aspx");
            }
        }
    }

    //method for generating six different random numbers for the use in the student identification. 
    private String generateRandomNumber(int max, string digit)
    {
        Random random = new Random();
        int randNum = random.Next(max);
        string sixDigitNumber = randNum.ToString(digit);

        return sixDigitNumber;
    }
}