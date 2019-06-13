<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="resetPassword.aspx.cs" Inherits="resetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 text-center">
                <asp:Label ID="messageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <div class="panel panel-default" style="border: 1px ridge #666666; background-color: #F0FFF0; margin-bottom: 10px;">
                    <div class="panel-body">
                        <div class="text-center">
                            <h3><i class="fa fa-lock fa-4x"></i></h3>
                            <h2 class="text-center">Change a password?</h2>
                            <p>You can reset your password here.</p>
                            <div class="panel-body">
                                <div class="form-group text-left">
                                    <label for="validation"><span class="req">* </span>CURRENT PASSWORD </label>
                                    <asp:RequiredFieldValidator ID="oldPassReqVal" runat="server" ControlToValidate="oldPasswordTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False" ValidationGroup="2"></asp:RequiredFieldValidator>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <asp:TextBox ID="oldPasswordTxt" runat="server" CssClass="form-control" placeholder="Enter current password" Font-Bold="False" TextMode="Password" ValidationGroup="2"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group text-left" >
                                    <label for="validation"><span class="req">* </span>NEW PASSWORD </label>
                                    <asp:RequiredFieldValidator ID="newPassReqVal" runat="server" ControlToValidate="newPasswordTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False" ValidationGroup="2"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="passwordRegExVal" runat="server" ControlToValidate="newPasswordTxt" ErrorMessage="***ERR: not a valid password pattern!" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9_@#*&%$£^]*$" Font-Bold="False" ValidationGroup="2"></asp:RegularExpressionValidator>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <asp:TextBox ID="newPasswordTxt" runat="server" CssClass="form-control" placeholder="Enter new password" Font-Bold="False" TextMode="Password" ValidationGroup="2"></asp:TextBox>
                                    </div>
                                </div>                             
                                <div class="form-group text-left">
                                    <label for="validation"><span class="req">* </span>CONFIRM NEW PASSWORD </label>
                                    <asp:RequiredFieldValidator ID="passwordConfirmReqVal" runat="server" ControlToValidate="passwordConfirmTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False" ValidationGroup="2"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="passwordCompVal" runat="server" ControlToCompare="newPasswordTxt" ControlToValidate="passwordConfirmTxt" ErrorMessage="Passwords do not match!" ForeColor="Red" Font-Bold="False" ValidationGroup="2"></asp:CompareValidator>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <asp:TextBox ID="passwordConfirmTxt" runat="server" CssClass="form-control" placeholder="Re-enter new password" Font-Bold="False" TextMode="Password" ValidationGroup="2"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <asp:Button ID="resetBtn" runat="server" Text="Reset Password" CssClass="form-control btn btn-primary" Font-Size="Medium" OnClick="resetBtn_Click" OnClientClick="" ValidationGroup="2" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:DataList ID="studentDataList" runat="server" DataKeyField="id" DataSourceID="studentDataSource" Visible="False">
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
            course:
            <asp:Label ID="courseLabel" runat="server" Text='<%# Eval("course") %>' />
            <br />
            photo:
            <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>

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