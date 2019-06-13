<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="gradeEstimator.aspx.cs" Inherits="gradeEstimator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        .registerHeader {
            background-color: beige;
            padding: 15px;
            border-radius: 5px;
            border: thin solid #ccc;
        }   
        fieldset {
            border: thin solid #ccc;
            border-radius: 4px;
            padding-right: 20px;
            padding-left: 20px;
            padding-top: 20px;
            background-color: #fbfbfb;
            margin-top: 5px;
            margin-bottom: 1%;
        }
    </style>

    <div class="container">
        <div class="registerHeader">
            <h2><b style="font-size: 20px">GRADE / DEGREE CLASSIFICATION ESTIMATOR</b></h2>
            <h5><i style="color: #FF0000">You can estimate the overall grade here you wish to achieve</i>
            </h5>
        </div>

        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="statusLbl" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:Label>
                <fieldset>
                    <div class="col-lg-12 col-md-12 form-group">
                        <label for="chooseCourse" style="color:#000099; font-size: medium;">Choose Your Course: </label>                      
                        <asp:DropDownList ID="chooseCourseDropDownList" runat="server" CssClass="form-control" DataSourceID="courseDataSource" DataTextField="courseName" DataValueField="courseName" AutoPostBack="true"></asp:DropDownList>
                        <asp:SqlDataSource ID="courseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [courseName] FROM [Courses]"></asp:SqlDataSource>
                        <br />
                    </div>

                    <div class="col-lg-12 form-group">
                        <label for="" style="color: #000099; font-size: medium;"><span class=""> </span>Enter Second Year Marks:  </label>
                        <br />
                        <div class="col-lg-4 col-md-4 text-left">
                            <label for="selectModule"><span class="req">* </span>Module 1:  </label>
                            <asp:RequiredFieldValidator ID="moduleTxtReqVal" runat="server" ControlToValidate="syModule1Txt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="numberRegExVal" runat="server" ControlToValidate="syModule1Txt" ErrorMessage="Invalid number" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="syModule1Txt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 col-md-4 text-left">
                            <label for="selectModule"><span class="req">* </span>Module 2:  </label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="syModule2Txt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="syModule2Txt" ErrorMessage="Invalid Input" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="syModule2Txt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 col-md-4 text-left" style="margin-bottom:1%">
                            <label for="selectModule"><span class="req">* </span>Module 3:  </label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="syModule3Txt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="syModule3Txt" ErrorMessage="Invalid Input" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="syModule3Txt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 text-left col-md-4">
                            <label for="selectModule"><span class="req">* </span>Module 4:  </label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="syModule4Txt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="syModule4Txt" ErrorMessage="Invalid Input" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>                            
                            <asp:TextBox ID="syModule4Txt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 col-md-4 text-left">
                            <label for="selectModule"><span class="req">* </span>Module 5:  </label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="syModule5Txt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="syModule5Txt" ErrorMessage="Invalid Input" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="syModule5Txt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 col-md-4 text-left">
                            <label for="selectModule"><span class="req">* </span>Module 6:  </label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="syModule6Txt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="syModule6Txt" ErrorMessage="Invalid Input" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="syModule6Txt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                    <div class="col-lg-12 form-group" style="margin-top:2%">
                        <label for="" style="color: #000099; font-size: medium;"><span class=""> </span>Enter Final Year Marks (Expected): </label>
                        <br />
                        <div class="col-lg-4 col-md-4 text-left" style="align-content:center">
                            <label for="selectModule"><span class="req">* </span>Module 1:  </label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="fyModule1Txt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="fyModule1Txt" ErrorMessage="Invalid Input" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>                            
                            <asp:TextBox ID="fyModule1Txt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 col-md-4 text-left">
                            <label for="selectModule"><span class="req">* </span>Module 2:  </label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="fyModule2Txt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="fyModule2Txt" ErrorMessage="Invalid Input" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>                            
                            <asp:TextBox ID="fyModule2Txt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 col-md-4 text-left" style="margin-bottom:1%">
                            <label for="selectModule"><span class="req">* </span>Module 3:  </label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="fyModule3Txt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="fyModule3Txt" ErrorMessage="Invalid Input" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>                           
                            <asp:TextBox ID="fyModule3Txt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 text-left col-md-4">
                            <label for="selectModule"><span class="req">* </span>Module 4:  </label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="fyModule4Txt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="fyModule4Txt" ErrorMessage="Invalid Input" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>                     
                            <asp:TextBox ID="fyModule4Txt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 col-md-4 text-left">
                            <label for="selectModule"><span class="req">* </span>Project:  </label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="fypModuleTxt" ErrorMessage="Required!" ForeColor="Red" Font-Bold="False">Required!</asp:RequiredFieldValidator>                       
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="fypModuleTxt" ErrorMessage="Invalid Input" ValidationExpression="^\d*\.{0,1}\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="fypModuleTxt" runat="server" CssClass=" form-control text-center" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="col-lg-4 col-md-4 text-center">
                            <br />
                            <asp:Button ID="calculateBtn" runat="server" Text="CALCULATE MY FINAL MARK"  CssClass="form-control btn-success" OnClick="calculateBtn_Click" />
                            <br />
                        </div>
                    </div>
                </fieldset>
                
                <div class="col-lg-12 form-group form-control" style="background-color: lavender">
                    <h3><label for="chooseCourse" style="color: darkgreen">Result Here: </label></h3>
                    <div class="col-lg-12">
                        <h5><asp:Label ID="syMarksLbl" runat="server" Text="Second Year Marks : " Font-Bold="True"></asp:Label></h5>
                        <h5><asp:Label ID="fyMarksLbl" runat="server" Text="Final Year Marks : " Font-Bold="True"></asp:Label></h5>
                        
                        <h4><asp:Label ID="syAvgLbl" runat="server" Text="Second Year Percentage (worth 25%) : " Font-Bold="True"></asp:Label></h4>
                        <h4><asp:Label ID="fyAvgLbl" runat="server" Text="Final Year Percentage (worth 75%) : " Font-Bold="True"></asp:Label></h4>
                        <h3><asp:Label ID="progMarkLbl" runat="server" Text="Overall Programme Mark (Expected) : "></asp:Label></h3>
                        <h3><asp:Label ID="degreeLbl" runat="server" Text="Expected Degree Classification : " Font-Bold="True"></asp:Label></h3>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>