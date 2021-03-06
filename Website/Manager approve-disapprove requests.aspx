﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager approve-disapprove requests.aspx.cs" Inherits="Manager_approve_disapprove_requests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
    <form id="form2" runat="server">
   <div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><span class="icon icon-cog"></span><a href="#">iWork</a></h1>
			<div id="menu">
				<ul>
					<li class="current_page_item"><asp:button  accesskey="2" runat="server"  Text="Homepage" onclick="mghome" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"  ></asp:button></li>
					<li><asp:button  accesskey="2" runat="server"  Text="login" CssClass="button-list" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"  ></asp:button></li>
					<li><asp:button  accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="53px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" ></asp:button></li>
					<li><asp:button  accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" ></asp:button></li>
					<li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" ></asp:button></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div id="page-wrapper">
	<div id="page" >
        
        <div>
		<div id="sidebar">
					<div class="box">
						<h3>what do you want to do?</h3>
						
						<ul class="list">
							<li class="first"><asp:button href="#" runat="server" onclick="see_requests" Text="View new Requests" CssClass="button-small"></asp:button></li>
							<li><asp:button href="#" runat="server" onclick="see_Jobs" Text="View Job Applications" CssClass="button-small"></asp:button></li>
							<li><asp:button href="#" runat="server" onclick="Create_Project" Text="Create new project" CssClass="button-small"></asp:button></li>
							<li><asp:button href="#" runat="server" onclick="Assign_project" Text="Assign to a Project" CssClass="button-small"></asp:button></li>
							<li><asp:button href="#" runat="server" onclick="Remove_Project" Text="Remove from a Project" CssClass="button-small"></asp:button></li>
							<li><asp:button href="#" runat="server" onclick="create_task" Text="Create new Task" CssClass="button-small"></asp:button></li>
                            <li><asp:button href="#" runat="server" onclick="assign_task" Text="Assign Task to Employee" CssClass="button-small"></asp:button></li>
							<li><asp:button href="#" runat="server" onclick="Change_employee" Text="Change Task Employee" CssClass="button-small"></asp:button></li>
							<li><asp:button href="#" runat="server" onclick="view_tasks" Text="View All Tasks" CssClass="button-small"></asp:button></li>
							
						</ul>
					</div>
					
			
           
				<br class="clearfix" />
			</div>
            
			
           
            <div id="content">
					<div id="req" runat="server" class="box">
                        <br />
						<h2>Request</h2>
                        <div style="margin-left: auto; margin-right: auto; text-align:left; padding-left:30px;">
                        <asp:Label ID="appl" runat="server" Text="Applicant:" ></asp:Label>
                        <asp:Label ID="applicant_" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="startd" runat="server" Text="Start Date:" ></asp:Label>
                        <asp:Label ID="startdate" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="endd" runat="server" Text="End Date:" ></asp:Label>
                        <asp:Label ID="enddate" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="reqd" runat="server" Text="Request Date:" ></asp:Label>
                        <asp:Label ID="requestdate" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="tdays" runat="server" Text="Total Days:" ></asp:Label>
                        <asp:Label ID="Totaldays" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="hrres" runat="server" Text="HR Responce:" ></asp:Label>
                        <asp:Label ID="hrresponce" runat="server" Text=""></asp:Label>
                        <br />


                       </div>
            </div>
                <div style="margin-left: auto; margin-right: auto; text-align:left; padding-left:30px;">
                    <asp:Label ID="mgr" runat="server" Text="Manager Reason:" ></asp:Label>
                    
                    <asp:TextBox ID="reason" runat="server"></asp:TextBox>
                    <asp:Label ID="enter" runat="server" ForeColor="Red" Text=""></asp:Label>
                    <br />
                    <asp:Button ID="appr" runat="server" CssClass="button" OnClick="Approve" Text="Approve" />
                    &nbsp;&nbsp;
                    <asp:Button ID="rej" runat="server" CssClass="button" OnClick="reject" Text="Reject" />


                </div>
						
					</div>
					<div class="box">
						
					</div>
					<br class="clearfix" />
				</div>
				            
           
        
        </div>
    
        </div>

    
<div id="copyright" class="container">
	<p>&copy; Untitled. All rights reserved.  | Design by Mary Maher.</p>
		<ul class="contact">
			<li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
			<li><a href="#" class="icon icon-facebook"><span></span></a></li>
			<li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
			<li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
			<li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
		</ul>
</div>
    </form>
</body>
</html>