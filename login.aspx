<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 text-center">
                <asp:Label ID="incorrectLoginLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <div class="panel panel-default" style="border: 1px ridge #666666; background-color: #F0FFF0">
                    <div class="panel-body">
                        <div class="text-center">
                            <h3><i class="fa fa-lock fa-4x"></i></h3>
                            <h2 class="text-center">Web Portal Login</h2>
                            <p>Please use your network username.</p>
                            <div class="panel-body">
                                <div class="form-group text-left">
                                    <label for="validation"><span class="req">* </span>USERNAME </label>
                                    <asp:RequiredFieldValidator ID="usernameReqVal" runat="server" ControlToValidate="usernameTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False"></asp:RequiredFieldValidator>                      
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <asp:TextBox ID="usernameTxt" runat="server" CssClass="form-control" placeholder="Enter your username here" Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group text-left">
                                    <label for="validation"><span class="req">* </span>PASSWORD </label>
                                    <asp:RequiredFieldValidator ID="passwordReqVal" runat="server" ControlToValidate="passwordTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False"></asp:RequiredFieldValidator>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <asp:TextBox ID="passwordTxt" runat="server" CssClass="form-control" placeholder="Enter new password" Font-Bold="False" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>    

                                <div class="form-group text-left">
                                    <label for="validation"><span class="req">* </span>Anti-bot Validation: </label>
                                    <asp:RequiredFieldValidator ID="charactersReqVal" runat="server" ControlToValidate="charactersTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="charsCompVal" runat="server" ControlToValidate="charactersTxt" ErrorMessage="***ERROR: Characters do not match!" ForeColor="Red" ValueToCompare="g&amp;KO0pq#!" Font-Bold="False"></asp:CompareValidator>
                                    <div class="text-left">
                                        <asp:Label ID="charsToValidateLbl" runat="server" Text="g&KO0pq#!" BackColor="#FFFFCC" BorderColor="#669999" BorderStyle="None" Font-Size="18pt" ForeColor="#00CC00" Font-Bold="False"></asp:Label>
                                        <asp:Label ID="valInfoLbl" runat="server" Font-Italic="True" ForeColor="#9900FF" Text="Type the characters you see, in the textbox!"></asp:Label>
                                    </div>
                                    <div class="input-group" style="margin-top:5px">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-copy"></i></span>
                                        <asp:TextBox ID="charactersTxt" runat="server" CssClass="form-control" placeholder="Please type in the characters here.." Font-Bold="False" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="loginBtn" runat="server" Text="Login" CssClass="form-control btn btn-primary" Font-Size="Medium" OnClick="loginBtn_Click"/>
                            </div>                            
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <a href="forgotPassword.aspx" style="font-weight: bold; text-decoration: none; color: #CC0000; font-size: 20px;">Forgotton account?</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>