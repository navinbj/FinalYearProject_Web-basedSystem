using System;

public partial class gradeEstimator : System.Web.UI.Page
{
    GradeEstimator estimator = new GradeEstimator();

    double[] syMarksArray;
    double[] fyMarksArray;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUsername"] == null && Session["username"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void calculateBtn_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            //second year module marks
            double syModule1Mark = System.Convert.ToDouble(syModule1Txt.Text);
            double syModule2Mark = System.Convert.ToDouble(syModule2Txt.Text);
            double syModule3Mark = System.Convert.ToDouble(syModule3Txt.Text);
            double syModule4Mark = System.Convert.ToDouble(syModule4Txt.Text);
            double syModule5Mark = System.Convert.ToDouble(syModule5Txt.Text);
            double syModule6Mark = System.Convert.ToDouble(syModule6Txt.Text);

            //final year module marks
            double fyModule1Mark = System.Convert.ToDouble(fyModule1Txt.Text);
            double fyModule2Mark = System.Convert.ToDouble(fyModule2Txt.Text);
            double fyModule3Mark = System.Convert.ToDouble(fyModule3Txt.Text);
            double fyModule4Mark = System.Convert.ToDouble(fyModule4Txt.Text);
            double fypModuleMark = System.Convert.ToDouble(fypModuleTxt.Text);
            double fypModuleMarkPart1 = System.Convert.ToDouble(fypModuleTxt.Text);
            double fypModuleMarkPart2 = System.Convert.ToDouble(fypModuleTxt.Text);


            //array for storing second year marks
            syMarksArray = new double[] { syModule1Mark, syModule2Mark, syModule3Mark, syModule4Mark, syModule5Mark, syModule6Mark };
            estimator.setSecondYearMarks(syMarksArray);

            //array for storing final year marks
            fyMarksArray = new double[] { fyModule1Mark, fyModule2Mark, fyModule3Mark, fyModule4Mark, fypModuleMarkPart1, fypModuleMarkPart2 };
            estimator.setFinalYearMarks(fyMarksArray);

            double syMarksSum = estimator.getSumOfBest5SecondYearMarks();
            double syPercentage = estimator.getSecondYearMarksPercentage();
            double syPercentageWithCreditValue = estimator.getSecondYearPercentageWithCreditValue();

            double fyMarksSum = estimator.getSumOfBest5FinalYearMarks();
            double fyPercentage = estimator.getFinalYearMarksPercentage();
            double fyPercentageWithCreditValue = estimator.getFinalYearPercentageWithCreditValue();

            double overallProgMark = estimator.getOverallExpectedProgrammeMark();
            String degreeType = estimator.getDegreeClassification(overallProgMark);


            syMarksLbl.Text = "Second Year Marks :\t" + syModule1Mark + ", " + syModule2Mark + ", " + syModule3Mark + ", " + syModule4Mark + ", " + syModule5Mark + ", " + syModule6Mark;
            fyMarksLbl.Text = "Final Year Marks :\t" + fyModule1Mark + ", " + fyModule2Mark + ", " + fyModule3Mark + ", " + fyModule4Mark + ", " + fypModuleMarkPart1 + ", " + fypModuleMarkPart2;
            syAvgLbl.Text = "Second Year Percentage (worth 25%) :\t" + syPercentage + "%";
            fyAvgLbl.Text = "Final Year Percentage (worth 75%) :\t" + fyPercentage + "%";
            progMarkLbl.Text = "Overall Programme Mark (Expected) :\t" + overallProgMark + "%";
            degreeLbl.Text = "Expected Degree Classification :\t" + degreeType;
        }
    }
}