using System;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    //creating a new instance of class Login
    Login userLogin = new Login();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["adminUsername"] != null || Session["username"] != null)
        {
            Response.Redirect("Default.aspx");
        }
    }


    protected void loginBtn_Click(object sender, EventArgs e)
    {
        bool test;  //a boolean variable to store either true or a false. 

        String username = usernameTxt.Text;
        String password = passwordTxt.Text;

        //hashing the password and storing it into a new local variable.
        String passwordEncrypt = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

        if (charactersTxt.Text.Equals(charsToValidateLbl.Text))
        {
            //calling a authenticateLogin function of class Login and then providing the inputs 
            //entered by a user to the parameters.
            test = userLogin.authenticateUsersViaDatabase(username, passwordEncrypt);

            if (test && userLogin.getUserRole(username).Equals("student"))
            {
                Session["username"] = username;     //creating a session variable for username. 
                string userID = userLogin.getStudentID(username);
                Session["userID"] = userID;      //creating a session variable for student ID. 
                //System.Web.Security.FormsAuthentication.RedirectFromLoginPage(usernameTxt.Text, false);
                Response.Redirect("Default.aspx");
            }
            else if(test && userLogin.getUserRole(username).Equals("admin"))
            {
                Session["adminUsername"] = username;     //creating a session variable for username. 
                string adminUserID = userLogin.getStudentID(username);
                Session["adminUserID"] = adminUserID;      //creating a session variable for admin user ID. 
                //System.Web.Security.FormsAuthentication.RedirectFromLoginPage(usernameTxt.Text, false);
                Response.Redirect("Default.aspx");
            }
            else
            {
                incorrectLoginLbl.Text = "***ERROR: Incorrect Username or Password !";
            }
        }
        else
        {
            //***ERROR: Characters do not match!;
        }
    }
}