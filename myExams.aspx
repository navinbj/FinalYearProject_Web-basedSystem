<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myExams.aspx.cs" Inherits="myExams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="jumbotron jumbotron-lg" style="background-color: #996600; color: #FFF; padding-top: 10px; padding-bottom: 10px; margin-bottom: 10px; margin-top:-1%">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-lg-12 pull-left" style="color: #FFFFFF;">
                    <h2><b>UPCOMING EXAMINATIONS</b></h2>
                    <i style="color: #CCCCCC; padding-left: -10px;">You can see the upcoming exams here for all of the courses..</i>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid" style="margin-top: 0%; text-align: center;">
        <asp:ListView ID="myExamsListView" runat="server" DataKeyNames="examID" DataSourceID="myExamsDataSource" GroupItemCount="2" ItemPlaceholderID="itemPlaceholder" GroupPlaceholderID="groupPlaceholder" OnSelectedIndexChanged="myExamsListView_SelectedIndexChanged">
           
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>

            <LayoutTemplate>
                <table align="center">
                    <asp:PlaceHolder ID="groupPlaceholder" runat="server"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>

            
            <ItemTemplate>
                <td runat="server" style="display: inline-grid; padding: 0px; margin: 10px; text-align: left;">
                    <div class="col-xs-12 col-lg-6 col-md-6 eachExam" style="background-color: #b8e6e8; border: 4px solid solid; border-radius: 5px; width: auto;">
                       
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="cardHeader" style="padding:10px; padding-left:20px; padding-right: 20px; margin-top:25px; text-align: center; background-color: #00001e; color: white; border: 4px solid solid; border-radius: 5px;">
                                    <h2><asp:Label ID="Label1" runat="server" Text='<%# Eval("examName") %>' /></h2>
                                </div>

                                <div class="card-body" style="padding:20px; padding-left:20px; padding-right: 20px; margin-top:5px; text-align: left; background-color: #00001e; color: white; border: 4px solid solid; border-radius: 5px;">         
                                    <div class="form-group-md" style="background-color:white; border: 4px solid solid; border-radius: 5px">
                                        <div class="form-control"><h4><asp:Label ID="Label2" runat="server" Text='<%# "<b>EXAM CODE:</b> " + Eval("examCode".Trim().ToString()) %>' /></h4></div>
                                        <div class="form-control"><h4><asp:Label ID="Label3" runat="server" Text='<%# "<b>COURSE:</b> " + Eval("course".Trim().ToString()) %>' /></h4></div>
                                        <div class="form-control"><h4><asp:Label ID="Label4" runat="server" Text='<%# "<b>MODULE:</b> " + Eval("module".Trim().ToString()) %>' /></h4></div>
                                        <div class="form-control"><h4><asp:Label ID="Label5" runat="server" Text='<%# "<b>DATE:</b> " + Eval("date".Trim().ToString()) %>' /></h4></div>
                                        <div class="form-control"><h4><asp:Label ID="Label6" runat="server" Text='<%# "<b>DURATION:</b> " + Eval("duration".Trim().ToString()) %>' /></h4></div>
                                        <div class="form-control"><h4><asp:Label ID="Label7" runat="server" Text='<%# "<b>TIME:</b> " + Eval("startTime".Trim().ToString()) + " -" + Eval("endTime".Trim().ToString()) %>' /></h4></div>
                                        <div class="form-control"><h4><asp:Label ID="Label9" runat="server" Text='<%# "<b>VENUE:</b> " + Eval("building".Trim().ToString()) + ", " + Eval("room".Trim().ToString()) %>' /></h4></div>                                    
                                    </div>
                                </div>
                                
                                <div class="form-group" style="margin-top: 2%">
                                    <a href="map.html?examCode=<%#Eval("examCode")%>">
                                    <asp:Label ID="test" runat="server" Text="CLICK FOR DIRECTION" CssClass="form-control btn-block btn-primary text-center"></asp:Label>
                                    </a>
                                </div>
                            </div>
                        </div>
                </td>
            </ItemTemplate>
            
           
        </asp:ListView>
        <asp:SqlDataSource ID="myExamsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="selectExams" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>