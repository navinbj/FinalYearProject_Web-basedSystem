<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewAllStudents.aspx.cs" Inherits="viewAllStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container-fluid" style="margin-top: 0%; text-align: center;">
        <div class="col-lg-12">
            <asp:Label ID="statusLbl" runat="server" Font-Bold="True" ForeColor="Green" CssClass="text-center"></asp:Label>
        </div>
        <div class="form-group col-lg-10 col-md-9">
            <asp:DropDownList ID="chooseCourseDDList" runat="server" CssClass="form-control" OnLoad="filterByCourseBtn_Click" DataSourceID="courseDataSource" DataTextField="" DataValueField="courseName"></asp:DropDownList>
            <asp:SqlDataSource ID="courseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="selectCourses" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="chooseCourseDDList" DefaultValue="Filter Student by Course" Name="name" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="form-group col-lg-2 col-md-3">
            <asp:Button ID="filterByCourseBtn" runat="server" CssClass="form-control btn-primary" Text="Filter By Course" OnClick="filterByCourseBtn_Click" />
        </div>

        <asp:ListView ID="studentsListView" runat="server" DataKeyNames="id" DataSourceID="studentsDataSource" GroupItemCount="4" ItemPlaceholderID="itemHere" GroupPlaceholderID="groupHere">
            
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemHere" runat="server"></td>
                </tr>
            </GroupTemplate>

            <LayoutTemplate>
                <table align="center">
                    <asp:PlaceHolder ID="groupHere" runat="server"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            
            <ItemTemplate>
                <td style="display: inline-grid; padding: 0px; margin: 10px; text-align: center;">
                    <div class="col-xs-12 eachStudent text-center" style="background-color: darkslategrey; border: 4px solid #FFFFFF; border-radius: 30px; width: auto;">                       
                        <div class="name" style="padding-bottom: 0px; padding-top: 5px; color: aliceblue; font-size: medium; font-weight: bold;">
<%--                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("firstName") + " " + Eval("LastName")%>'/>--%>
                            <b style="font-size: medium">ID: </b> 
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("studentID")%>'/>
                        </div>
                        <div class="image" style="padding-top: 10px">              
                            <asp:Image ID="image1" runat="server" ImageUrl='<%#("images/") + Eval("photo").ToString().Trim() %>' Height="150" Width="200" CssClass="img-thumbnail" />                            
                        </div>
                        <div class="course" style="padding-bottom: 10px; padding-top: 5px; color: white; font-size: medium;">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("course") %>' />
                        </div>
                        <div class="form-group">
                            <a href="studentSingle.aspx?studentID=<%#Eval("studentID")%>">
                                <asp:Label ID="test" runat="server" Text="View Details" CssClass="form-control btn-primary text-center"></asp:Label>
                            </a>
                        </div>
                    </div>
                </td>
            </ItemTemplate>         
        </asp:ListView>

        <asp:SqlDataSource ID="studentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Students] WHERE ([userRole] = @userRole)">
            <SelectParameters>
                <asp:Parameter DefaultValue="student" Name="userRole" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="studentDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Students]">
        </asp:SqlDataSource>

    </div>
</asp:Content>