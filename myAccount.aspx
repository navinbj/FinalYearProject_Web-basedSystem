<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myAccount.aspx.cs" Inherits="myAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">


    <style>
      .header {
            background-color: #C60C30;
            padding: 15px;
            border-radius: opx;
            border: thin solid black;
            color: white;
        }  
    </style>

    <div class="container">
        <div class="header">
            <h3><b>Your Personal Details: </b></h3>
            <h5><i style="color: aliceblue">You can edit your account details on this page and save the new changes!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </i></h5>
            <br />
        </div>

        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="statusLbl" runat="server" Font-Bold="True" ForeColor="Green" CssClass="text-center"></asp:Label>
                <asp:DataList ID="studentDataList" runat="server" DataKeyField="id" DataSourceID="studentDataSource" CssClass="form-group table table-responsive" BackColor="#C60C30" BorderColor="Black">
                    <ItemTemplate>
                        <fieldset style="border: 2px groove #000000; background-color: #FFFFCC; padding-top: 10px; padding-right: 10px; padding-left: 10px;">                     
                            <div class="form-group text-center" style="background-color: #FFFFCC; color: #CC0000;">
                                <asp:Label ID="idLbl" runat="server" Text='<%# Eval("id") %>' Visible="False" />
                                <b style="font-size: medium">STUDENT ID: </b>
                                <asp:Label ID="studentIDLbl" runat="server" Text='<%# Eval("studentID").ToString().Trim() %>' Font-Size="Medium" Font-Bold="False"></asp:Label>
                            </div>                          

                            <div class="details col-md-9" style="border: 1px ridge #999999; background-color: #CCFFFF; padding-top: 5px; padding-right: 10px; padding-left: 10px; margin-bottom:2%">
                                <div class="form-group">
                                    <asp:Label ID="firstNameLbl" runat="server" Text="First Name: " Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="firstNameTxt" runat="server" Text='<%# Eval("firstName").ToString().Trim() %>' CssClass="form-control" Font-Bold="False" Enabled="False"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lastNameLbl" runat="server" Text="Last Name: " Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="lastNameTxt" runat="server" Text='<%# Eval("lastName").ToString().Trim() %>' CssClass="form-control" Font-Bold="False" Enabled="False"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="addressLbl" runat="server" Text="Address: " Font-Bold="True"></asp:Label>
                                    <asp:RegularExpressionValidator ID="addressRegExVal" runat="server" ControlToValidate="address_streetTxt" ErrorMessage="***ERR: not a valid address!" ForeColor="Red" ValidationExpression="^[#.0-9a-zA-Z\s,-]+$" Font-Bold="False" ValidationGroup="1"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="address_streetTxt" runat="server" Text='<%# Eval("address_street").ToString().Trim() %>' CssClass="form-control" Font-Bold="False" ValidationGroup="1"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="cityLbl" runat="server" Text="City: " Font-Bold="True"></asp:Label>
                                    <asp:RegularExpressionValidator ID="cityRegExVal" runat="server" ControlToValidate="cityTxt" ErrorMessage="***ERR: not a valid city name!" ForeColor="Red" ValidationExpression="[A-Za-z ]*" Font-Bold="False" ValidationGroup="1"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="cityTxt" runat="server" Text='<%# Eval("city").ToString().Trim() %>' CssClass="form-control" Font-Bold="False" ValidationGroup="1"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="postcodeLbl" runat="server" Text="Postcode: " Font-Bold="True"></asp:Label>
                                    <asp:RegularExpressionValidator ID="postcodeRegExVal" runat="server" ControlToValidate="postcodeTxt" ErrorMessage="***ERR: not a valid postcode!" ForeColor="Red" ValidationExpression="^[A-Za-z]{1,2}[0-9]{1,2}[A-Za-z]?\s[0-9][A-Za-z][A-Za-z]$" Font-Bold="False" ValidationGroup="1"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="postcodeTxt" runat="server" Text='<%# Eval("postcode").ToString().Trim() %>' CssClass="form-control" Font-Bold="False" ValidationGroup="1"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="countryLbl" runat="server" Text="Country: " Font-Bold="True"></asp:Label>
                                    <asp:RegularExpressionValidator ID="countryRegExVal" runat="server" ControlToValidate="countryTxt" ErrorMessage="***ERR: not a valid city name!" ForeColor="Red" ValidationExpression="[A-Za-z ]*" Font-Bold="False" ValidationGroup="1"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="countryTxt" runat="server" Text='<%# Eval("country").ToString().Trim() %>' CssClass="form-control" Font-Bold="False" ValidationGroup="1"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="mobileLbl" runat="server" Text="Mobile: " Font-Bold="True"></asp:Label>
                                    <asp:RegularExpressionValidator ID="mobileRegExVal" runat="server" ControlToValidate="mobileTxt" ErrorMessage="***ERR: not a valid mobile number!" ForeColor="Red" ValidationExpression="^(\+44\s?7\d{3}|\(?07\d{3}\)?)\s?\d{3}\s?\d{3}$" Font-Bold="False" ValidationGroup="1"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="mobileTxt" runat="server" Text='<%# Eval("phoneNumber").ToString().Trim() %>' CssClass="form-control" Font-Bold="False" ValidationGroup="1"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="emailLbl" runat="server" Text="Email: " Font-Bold="True"></asp:Label>
                                    <asp:RegularExpressionValidator ID="emailRegExVal" runat="server" ControlToValidate="emailTxt" ErrorMessage="***ERR: not a valid email address!" ForeColor="Red" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" Font-Bold="False"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="emailTxt" runat="server" Text='<%# Eval("email").ToString().Trim() %>' CssClass="form-control" Font-Bold="False" ValidationGroup="1"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="usernameLbl" runat="server" Text="Username: " Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="usernameTxt" runat="server" Text='<%# Eval("username").ToString().Trim() %>' CssClass="form-control" Font-Bold="False" Enabled="False"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="courseLbl" runat="server" Text="Course: " Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="courseTxt" runat="server" Text='<%# Eval("course").ToString().Trim() %>' CssClass="form-control" Font-Bold="False" ValidationGroup="1" Enabled="false"></asp:TextBox>
                                </div>
                            </div>


                            <div class="form-group col-md-3">
                                <asp:Image ID="studentImage" runat="server" ImageUrl='<%#("images/") + Eval("photo").ToString().Trim() %>' CssClass="img-responsive img-rounded" />

                                <div class="form-group" style="margin-top: 20px">
                                    <asp:Button ID="saveBtn" runat="server" Text="Save Changes" CssClass="btn btn-success form-control" ValidationGroup="1" OnClick="saveBtn_Click1" OnClientClick="return confirm('Are you sure you want to make changes to your account details?')" />
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CssClass="btn btn-warning form-control" OnClientClick="window.history.back();" ValidationGroup="1" />
                                </div>

                                <div class="text-center" style="margin-bottom: 10px">
                                    <a href="resetPassword.aspx" style="font-size: large; font-weight: bold;">Reset Your Password</a>
                                </div>
                            </div>                          

                        </fieldset>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="studentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="selectStudent" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DataList ID="studentUpdatedDataList" runat="server" DataKeyField="id" DataSourceID="studentUpdatedDataSource" Visible="False">
        <ItemTemplate>
            id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            studentID:
            <asp:Label ID="studentIDLabel" runat="server" Text='<%# Eval("studentID") %>' />
            <br />
            firstName:
            <asp:Label ID="firstNameLabel" runat="server" Text='<%# Eval("firstName") %>' />
            <br />
            lastName:
            <asp:Label ID="lastNameLabel" runat="server" Text='<%# Eval("lastName") %>' />
            <br />
            address_street:
            <asp:Label ID="address_streetLabel" runat="server" Text='<%# Eval("address_street") %>' />
            <br />
            city:
            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
            <br />
            postcode:
            <asp:Label ID="postcodeLabel" runat="server" Text='<%# Eval("postcode") %>' />
            <br />
            country:
            <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("country") %>' />
            <br />
            phoneNumber:
            <asp:Label ID="phoneNumberLabel" runat="server" Text='<%# Eval("phoneNumber") %>' />
            <br />
            email:
            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
            <br />
            username:
            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
            <br />
            password:
            <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
            <br />
            course:
            <asp:Label ID="courseLabel" runat="server" Text='<%# Eval("course") %>' />
            <br />
            photo:
            <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="studentUpdatedDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Students]"></asp:SqlDataSource>
</asp:Content>