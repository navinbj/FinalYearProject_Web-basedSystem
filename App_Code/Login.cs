using System;
using System.Data;

/// <summary>
/// The class Login is created for storing all the login functionalities which will be
/// used to authenticate and authorise user to the certain website contents. 
/// </summary>
public class Login
{
    StudentsDataSetTableAdapters.StudentsTableAdapter studentsData;
    StudentsDataSet.StudentsDataTable studentsTable;

    /**
     * Constructor for the objects of class Login
     **/

    public Login()
    {
        studentsData = new StudentsDataSetTableAdapters.StudentsTableAdapter();
        studentsTable = studentsData.GetData();
    }

    //method for authenticating the user to the website by checking the login details against the records in the database.
    public bool authenticateUsersViaDatabase(String username, String password)
    {
        foreach (DataRow row in studentsTable.Rows)
        {
            if (username == System.Convert.ToString(row["username"]).TrimEnd() && password == System.Convert.ToString(row["password"]).TrimEnd())
                return true;
        }
        return false;
    }

    //method for checking whether the email the user wants to register with already exists in the database or not.
    public bool checkEmail(String email)
    {
        foreach (DataRow row in studentsTable.Rows)
        {
            if (email == System.Convert.ToString(row["email"]).TrimEnd())
                return true;
        }
        return false;
    }

    //method for returning an email address the student is registered with when specified the student identification number.
    public String getStudentEmail(String studentID)
    {
        string email = "";
        foreach (DataRow row in studentsTable.Rows)
        {
            if (studentID == System.Convert.ToString(row["studentID"]).TrimEnd())
            {
                email = System.Convert.ToString(row["email"]).Trim();
            }             
        }
        return email;
    }

    //method for returning the id of a customer when specified the email address of a student.
    public string getStudentID(String username)
    {
        string studentID = "";

        foreach (DataRow row in studentsTable.Rows)
        {
            if (username == System.Convert.ToString(row["username"]).TrimEnd())
            {
                studentID = System.Convert.ToString(row["studentID"]).Trim();
            }
        }
        return studentID;
    }

    //method for checking the role of a user.
    public String getUserRole(String username)
    {
        String userRole = "";

        foreach(DataRow row in studentsTable.Rows)
        {
            if (username == System.Convert.ToString(row["username"]).TrimEnd())
            {
                userRole = System.Convert.ToString(row["userRole"]).Trim();
            }
        }
        return userRole;
    }

    //method for checking where the password that the user has enetered matches with the one in database, for a reset purpose.
    public bool checkPassword(string password, string studentID)
    {
        foreach (DataRow row in studentsTable.Rows)
        {
            if (studentID == System.Convert.ToString(row["studentID"]) && password == System.Convert.ToString(row["password"]).TrimEnd())
                return true;
        }
        return false;
    }
}