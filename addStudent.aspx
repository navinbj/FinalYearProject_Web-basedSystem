<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addStudent.aspx.cs" Inherits="addStudent
    " %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .registerHeader {
            background-color: blanchedalmond;
            padding: 15px;
            border-radius: 5px;
            border: thin solid #ccc;
        }
        fieldset {
            border: thin solid #ccc;
            border-radius: 4px;
            padding-right: 20px;
            padding-left: 20px;
            padding-top: 10px;
            background: #fbfbfb;
            margin-top: 5px;
        }
    </style>

    <div class="container">
        <div class="registerHeader">
            <h2><b style="font-size: 20px">ADD STUDENT HERE</b></h2>
            <h5><i style="color: #FF0000">Please note that all fields are mandatory* </i>
            </h5>
        </div>

        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="statusLbl" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:Label>
                <fieldset>
                    <div class="form-group">
                        <label for="firstName"><span class="req">* </span>First Name/s: </label>
                        <asp:RequiredFieldValidator ID="firstNameReqVal" runat="server" ControlToValidate="firstNameTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="firstNameRegExVal" runat="server" ControlToValidate="firstNameTxt" ErrorMessage="***ERR: not a valid name!" ForeColor="Red" ValidationExpression="[A-Za-z ]*" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="firstNameTxt" runat="server" CssClass="form-control" placeholder="please enter your first name/s here.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="lastName"><span class="req">* </span>Last Name: </label>
                        <asp:RequiredFieldValidator ID="lastNameReqVal" runat="server" ControlToValidate="lastNameTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="lastNameRegExVal" runat="server" ControlToValidate="lastNameTxt" ErrorMessage="***ERR: not a valid name!" ForeColor="Red" ValidationExpression="[A-Za-z ]*" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="lastNameTxt" runat="server" CssClass="form-control" placeholder="please enter your last name here.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="address"><span class="req">* </span>Address (street): </label>
                        <asp:RequiredFieldValidator ID="streetReqVal" runat="server" ControlToValidate="addressStreetTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="addressRegExVal" runat="server" ControlToValidate="addressStreetTxt" ErrorMessage="***ERR: not a valid address!" ForeColor="Red" ValidationExpression="^[#.0-9a-zA-Z\s,-]+$" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="addressStreetTxt" runat="server" CssClass="form-control" placeholder="please enter your street number and name here.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="city"><span class="req">* </span>City/ Town: </label>
                        <asp:RequiredFieldValidator ID="cityReqVal" runat="server" ControlToValidate="cityTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="cityRegExVal" runat="server" ControlToValidate="cityTxt" ErrorMessage="***ERR: not a valid city name!" ForeColor="Red" ValidationExpression="[A-Za-z ]*" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="cityTxt" runat="server" CssClass="form-control" placeholder="please enter your city or town name.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="postcode"><span class="req">* </span>Postcode: </label>
                        <asp:RequiredFieldValidator ID="postcodeReqVal" runat="server" ControlToValidate="postcodeTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="postcodeRegExVal" runat="server" ControlToValidate="postcodeTxt" ErrorMessage="***ERR: not a valid postcode!" ForeColor="Red" ValidationExpression="^[A-Za-z]{1,2}[0-9]{1,2}[A-Za-z]?\s[0-9][A-Za-z][A-Za-z]$" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="postcodeTxt" runat="server" CssClass="form-control" placeholder="please enter your postcode here.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="country"><span class="req">* </span>Country: </label>
                        <asp:RequiredFieldValidator ID="countryReqVal" runat="server" ControlToValidate="countryTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="countryRegExVal" runat="server" ControlToValidate="countryTxt" ErrorMessage="***ERR: not a valid country name!" ForeColor="Red" ValidationExpression="[A-Za-z ]*" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="countryTxt" runat="server" CssClass="form-control" placeholder="please enter your country name.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="mobile"><span class="req">* </span>Mobile: </label>
                        <asp:RequiredFieldValidator ID="mobileReqVal" runat="server" ControlToValidate="mobileTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="mobileRegExVal" runat="server" ControlToValidate="mobileTxt" ErrorMessage="***ERR: not a valid mobile number!" ForeColor="Red" ValidationExpression="^(\+44\s?7\d{3}|\(?07\d{3}\)?)\s?\d{3}\s?\d{3}$" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="mobileTxt" runat="server" CssClass="form-control" placeholder="please enter your mobile number.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="email"><span class="req">* </span>Email: </label>
                        <asp:RequiredFieldValidator ID="emailReqVal" runat="server" ControlToValidate="emailTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="emailRegExVal" runat="server" ControlToValidate="emailTxt" ErrorMessage="***ERR: not a valid email address!" ForeColor="Red" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="emailTxt" runat="server" CssClass="form-control" placeholder="please enter your email address here.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="username"><span class="req">* </span>Username: </label>
                        <asp:RequiredFieldValidator ID="usernameReqVal" runat="server" ControlToValidate="usernameTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="usernameRegExVal" runat="server" ControlToValidate="usernameTxt" ErrorMessage="***ERR: not a valid username!" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9_]*$" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="usernameTxt" runat="server" CssClass="form-control" placeholder="please create a new username.." TextMode="SingleLine" Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="password"><span class="req">* </span>Password: </label>
                        <asp:RequiredFieldValidator ID="passwordReqVal" runat="server" ControlToValidate="passwordTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="passwordRegExVal" runat="server" ControlToValidate="passwordTxt" ErrorMessage="***ERR: not a valid password pattern!" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9_@#*&%$£^]*$" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="passwordTxt" runat="server" CssClass="form-control" placeholder="please enter your new password here.." TextMode="Password" Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="passwordConfirm"><span class="req">* </span>Password Confirm: </label>
                        <asp:RequiredFieldValidator ID="passwordConfirmReqVal" runat="server" ControlToValidate="passwordConfirmTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passwordTxt" ControlToValidate="passwordConfirmTxt" ErrorMessage="Passwords do not match!" ForeColor="Red" Font-Bold="False"></asp:CompareValidator>
                        <asp:TextBox ID="passwordConfirmTxt" runat="server" CssClass="form-control" placeholder="please enter your password again here.." TextMode="Password" Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="chooseCourse"><span class="req">* </span>Choose Course Here: </label>
                        <asp:RequiredFieldValidator ID="courseDropDownListReqVal" runat="server" ControlToValidate="chooseCourseDropDownList" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:DropDownList ID="chooseCourseDropDownList" runat="server" CssClass="form-control" DataSourceID="courseDataSource" DataTextField="courseName" DataValueField="courseName"></asp:DropDownList>
                        <asp:SqlDataSource ID="courseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [courseName] FROM [Courses]"></asp:SqlDataSource>
                    </div>

                    <div class="form-group">
                        <label for="uploadPhoto"><span class="req">* </span>Upload Student Photo: </label>
                        <asp:RequiredFieldValidator ID="imageFileUploadReqVal" runat="server" ControlToValidate="imageFileUpload" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:FileUpload ID="imageFileUpload" runat="server" CssClass="form-control" accept=".jpg" />
                    </div>

                    <div class="form-group">
                        <label for="validation"><span class="req">* </span>Anti-bot Validation: </label>
                        <asp:RequiredFieldValidator ID="charactersReqVal" runat="server" ControlToValidate="charactersTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="charsCompVal" runat="server" ControlToValidate="charactersTxt" ErrorMessage="***ERROR: Characters do not match!" ForeColor="Red" ValueToCompare="g&amp;KO0pq#!" Font-Bold="False"></asp:CompareValidator>
                        <br />
                        <asp:Label ID="charsToValidateLbl" runat="server" Text="g&KO0pq#!" BackColor="#FFFFCC" BorderColor="#669999" BorderStyle="None" Font-Size="18pt" ForeColor="#00CC00" Font-Bold="False"></asp:Label>
                        <asp:Label ID="valInfoLbl" runat="server" Font-Italic="True" ForeColor="#9900FF" Text="Type the characters you see, in the textbox!"></asp:Label>
                        <asp:TextBox ID="charactersTxt" runat="server" CssClass="form-control" placeholder="please type in the characters here.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="submitBtn" runat="server" Text="ADD STUDENT" CssClass="btn btn-success" OnClick="submitBtn_Click" />
                        <asp:Button ID="resetBtn" runat="server" Text="RESET" CssClass="btn btn-warning"  OnClientClick="this.form.reset(); return true;" />
                    </div>

                    <asp:DataList ID="studentsDataList" runat="server" DataSourceID="studentsDataSource" Visible="False">
                        <ItemTemplate>
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
                            User Role:
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("userRole") %>' />
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>

                    <asp:SqlDataSource ID="studentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [studentID], [firstName], [lastName], [address_street], [city], [postcode], [country], [phoneNumber], [email], [username], [password], [course], [photo], [userRole] FROM [Students]"></asp:SqlDataSource>

                </fieldset>
                <!-- ends register form -->
            </div>
            <!-- ends col-6 -->

        </div>
    </div>
</asp:Content>