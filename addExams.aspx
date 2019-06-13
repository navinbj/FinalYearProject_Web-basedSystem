<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addExams.aspx.cs" Inherits="addExams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .registerHeader {
            background-color: aquamarine;
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
            <h2><b style="font-size: 20px">ADD EXAMINATION TIMETABLES</b></h2>
            <h5><i style="color: #FF0000">Please note that all fields are mandatory* </i>
            </h5>
        </div>

        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="statusLbl" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:Label>
                <fieldset>
                    <div class="col-lg-6 col-md-6 form-group">
                        <label for="examCode"><span class="req">* </span>Examination Code: </label>
                        <asp:RequiredFieldValidator ID="examCodeReqVal" runat="server" ControlToValidate="examCodeTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="examCodeRegExVal" runat="server" ControlToValidate="examCodeTxt" ErrorMessage="***ERR: not a valid exam code!" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9_@#*&%$£^-]*$" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="examCodeTxt" runat="server" CssClass="form-control" placeholder="please enter exam code here.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="col-lg-6 col-md-6 form-group">
                        <label for="examName"><span class="req">* </span>Examination Name: </label>
                        <asp:RequiredFieldValidator ID="examNameReqVal" runat="server" ControlToValidate="examNameTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="examNameRegExVal" runat="server" ControlToValidate="examNameTxt" ErrorMessage="***ERR: not a valid exam name!" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9 _@&-]*$" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="examNameTxt" runat="server" CssClass="form-control" placeholder="please enter exam name here.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="col-lg-6 col-md-6 form-group">
                        <label for="chooseCourse"><span class="req">* </span>Select Course: </label>                      
                        <asp:RequiredFieldValidator ID="courseDropDownListReqVal" runat="server" ControlToValidate="chooseCourseDropDownList" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:DropDownList ID="chooseCourseDropDownList" runat="server" CssClass="form-control" DataSourceID="courseDataSource" DataTextField="courseName" DataValueField="courseName" AutoPostBack="true"></asp:DropDownList>
                        <asp:SqlDataSource ID="courseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [courseName] FROM [Courses]"></asp:SqlDataSource>
                    </div>

                    <div class="col-lg-6 col-md-6 form-group">
                        <label for="selectModule"><span class="req">* </span>Select Module: </label>
                        <asp:RequiredFieldValidator ID="moduleReqVal" runat="server" ControlToValidate="moduleDropDownList" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:DropDownList ID="moduleDropDownList" runat="server" DataSourceID="moduleDataSource" CssClass="form-control" DataTextField="moduleName" DataValueField="moduleName"></asp:DropDownList>
                        <asp:SqlDataSource ID="moduleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="selectModules" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="chooseCourseDropDownList" Name="course" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <div class="form-group col-lg-6 col-md-6">
                        <label for="date"><span class="req">* </span>Date: </label>
                        <asp:RequiredFieldValidator ID="dateReqVal" runat="server" ControlToValidate="dateTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>                       
                        <asp:TextBox ID="dateTxt" runat="server" CssClass="form-control" placeholder="please enter the exam date here.." Font-Bold="False" TextMode="Date"></asp:TextBox>
                    </div>

                    <div class="form-group col-lg-6 col-md-6">
                        <label for="duration"><span class="req">* </span>Duration: </label>
                        <asp:RequiredFieldValidator ID="durationReqVal" runat="server" ControlToValidate="durationTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="durationRegExVal" runat="server" ControlToValidate="durationTxt" ErrorMessage="***ERR: not a valid exam duration pattern!" ForeColor="Red" ValidationExpression="[A-Za-z0-9.: ]*" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="durationTxt" runat="server" CssClass="form-control" placeholder="please enter the exam duration.." Font-Bold="False"></asp:TextBox>
                    <br />
                    </div>

                    <div class="form-group col-lg-6 col-md-6">
                        <label for="startTime"><span class="req">* </span>Start Time (24hr format): </label>
                        <asp:RequiredFieldValidator ID="startTimeReqVal" runat="server" ControlToValidate="startTimeTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:TextBox ID="startTimeTxt" runat="server" CssClass="form-control" placeholder="please enter the exam start name.." Font-Bold="False" TextMode="Time"></asp:TextBox>
                    </div>

                    <div class="form-group col-lg-6 col-md-6">
                        <label for="endTime"><span class="req">* </span>End Time (24hr format): </label>
                        <asp:RequiredFieldValidator ID="endTimeReqVal" runat="server" ControlToValidate="endTimeTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:TextBox ID="endTimeTxt" runat="server" CssClass="form-control" placeholder="please enter the exam end name.." Font-Bold="False" TextMode="Time"></asp:TextBox>
                    </div>

                    <div class="form-group col-lg-6 col-md-6">
                        <label for="building"><span class="req">* </span>Building: </label>
                        <asp:RequiredFieldValidator ID="buildingReqVal" runat="server" ControlToValidate="buildingTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="buildingRegExVal" runat="server" ControlToValidate="buildingTxt" ErrorMessage="***ERR: not a valid building name!" ForeColor="Red" ValidationExpression="[A-Za-z0-9 ]*" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="buildingTxt" runat="server" CssClass="form-control" placeholder="please enter building name here.." Font-Bold="False"></asp:TextBox>
                    </div>

                    <div class="form-group col-lg-6 col-md-6">
                        <label for="room"><span class="req">* </span>Room: </label>
                        <asp:RequiredFieldValidator ID="roomReqVal" runat="server" ControlToValidate="roomTxt" ErrorMessage="This is Required!" ForeColor="Red" Font-Bold="False">This is Required!</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="roomRegExVal" runat="server" ControlToValidate="roomTxt" ErrorMessage="***ERR: not a valid room name and/or number!" ForeColor="Red" ValidationExpression="[A-Za-z0-9 ]*" Font-Bold="False"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="roomTxt" runat="server" CssClass="form-control" placeholder="please enter the room name and/or number here.." Font-Bold="False"></asp:TextBox>
                    </div>                   
                </fieldset>

                <!-- ends register form -->
            </div>

            <div class="form-group col-lg-6">
                <asp:Button ID="submitBtn" runat="server" Text="ADD EXAMINATION" CssClass="btn btn-success form-control" OnClick="submitBtn_Click" />
            </div>

            <div class="form-group col-lg-6">
                <asp:Button ID="resetBtn" runat="server" Text="RESET" CssClass="btn btn-warning form-control" OnClientClick="this.form.reset(); return true;" />
            </div>
            <!-- ends col-6 -->
        </div>
    </div>

    <asp:DataList ID="examDataList" runat="server" DataKeyField="examID" DataSourceID="examDataSource" Visible="False">
        <ItemTemplate>
            examID:
            <asp:Label ID="examIDLabel" runat="server" Text='<%# Eval("examID") %>' />
            <br />
            examCode:
            <asp:Label ID="examCodeLabel" runat="server" Text='<%# Eval("examCode") %>' />
            <br />
            examName:
            <asp:Label ID="examNameLabel" runat="server" Text='<%# Eval("examName") %>' />
            <br />
            course:
            <asp:Label ID="courseLabel" runat="server" Text='<%# Eval("course") %>' />
            <br />
            module:
            <asp:Label ID="moduleLabel" runat="server" Text='<%# Eval("module") %>' />
            <br />
            date:
            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
            <br />
            duration:
            <asp:Label ID="durationLabel" runat="server" Text='<%# Eval("duration") %>' />
            <br />
            startTme:
            <asp:Label ID="startTmeLabel" runat="server" Text='<%# Eval("startTime") %>' />
            <br />
            endTme:
            <asp:Label ID="endTmeLabel" runat="server" Text='<%# Eval("endTime") %>' />
            <br />
            building:
            <asp:Label ID="buildingLabel" runat="server" Text='<%# Eval("building") %>' />
            <br />
            room:
            <asp:Label ID="roomLabel" runat="server" Text='<%# Eval("room") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="examDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Exams]"></asp:SqlDataSource>
</asp:Content>