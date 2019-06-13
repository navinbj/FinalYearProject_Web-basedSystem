using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GradeEstimator
/// </summary>
public class GradeEstimator
{
    double[] syMarksArray;
    double[] fyMarksArray;

    public GradeEstimator()
    {

    }

    //setter method for the second year marks
    public void setSecondYearMarks(double[] array)
    {
        this.syMarksArray = array;
    }

    //setter method for the final year marks.
    public void setFinalYearMarks(double[] array)
    {
        this.fyMarksArray = array;
    }

    //method for returning smallest number in an array of second year marks.
    public double getLowestSecondYearMark()
    {
        return syMarksArray.Min();
    }

    //method for calculating the sum of best 5 second year marks.
    public double getSumOfBest5SecondYearMarks()
    {
        double syMarksSum = syMarksArray.Sum() - syMarksArray.Min();
        return syMarksSum;
    }

    //method for returning second year marks percentage
    public double getSecondYearMarksPercentage()
    {
        double syPercentage = getSumOfBest5SecondYearMarks() / 500 * 100;
        return syPercentage;
    }

    //method for returning second year percentage based on it's credit value (25%)
    //second year is worth only 25% of the degree..
    public double getSecondYearPercentageWithCreditValue()
    {
        double syPercentageWithCreditValue = getSecondYearMarksPercentage() * 0.25;
        return syPercentageWithCreditValue;
    }



    //method for returning smallest number in an array of final year marks.
    public double getLowestFinalYearMark()
    {
        return fyMarksArray.Min();
    }

    //method for calculating the sum of best 5 final year marks.
    public double getSumOfBest5FinalYearMarks()
    {
        double fyMarksSum = fyMarksArray.Sum() - fyMarksArray.Min();
        return fyMarksSum;
    }

    //method for returning final year marks percentage
    public double getFinalYearMarksPercentage()
    {
        double fyPercentage = getSumOfBest5FinalYearMarks() / 500 * 100;
        return fyPercentage;
    }

    //method for returning final year percentage based on it's credit value (75%)
    //final year is worth only 75% of the degree..
    public double getFinalYearPercentageWithCreditValue()
    {
        double fyPercentageWithCreditValue = getFinalYearMarksPercentage() * 0.75;
        return fyPercentageWithCreditValue;
    }


    //method for returning the overall expected programme mark.
    //(addition of second year percentage- worth 25% and the final year percentage- worth 75%)
    public double getOverallExpectedProgrammeMark()
    {
        double overallProgMark = getSecondYearPercentageWithCreditValue() + getFinalYearPercentageWithCreditValue();
        return overallProgMark;
    }


    //method for returning the type of degree into which the programme mark falls under when specified
    //the programme mark in the parameter.
    public String getDegreeClassification(double progMark)
    {
        String typeOfDegree = "";

        if (progMark < 40)
        {
            typeOfDegree = "Ordinary Degree";
        }
        else if (progMark >= 40 && progMark < 50)
        {
            typeOfDegree = "Third Class Honors Degree";
        }
        else if (progMark >= 50 && progMark < 60)
        {
            typeOfDegree = "Lower Second Class Honors Degree";
        }
        else if (progMark >= 60 && progMark < 70)

        {
            typeOfDegree = "Upper Second Class Honors Degree";
        }
        else
        {
            typeOfDegree = "First Class Honors Degree";
        }
        return typeOfDegree;
    }
}