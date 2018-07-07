﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager sees Jobs.aspx.cs" Inherits="Manager_sees_Jobs" %>

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
        
        <div id="top">
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
					<div class="box">
						<h2>View Job</h2>
                        <asp:Label ID="text" Text="Job Title" runat="server"></asp:Label>&nbsp;
                        <asp:TextBox ID="jobtitle" runat="server"></asp:TextBox>&nbsp;&nbsp;
                        <asp:Button ID="vie" runat="server" CssClass="button" Text="View" OnClick="viewjob" />
                        <br />
                        <asp:Label ID="entertitle" runat="server" ForeColor="Red" Text=""></asp:Label>
                        
						
					</div>
					<div class="box">
						
					</div>
					<br class="clearfix" />
				</div>
				            
           
        
        </div>
        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
         <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
        <div id="table_part" >
            <asp:GridView ID="table" runat="server" AutoGenerateColumns="false" OnRowCommand= "tablecomand" >
                <Columns>
                    <asp:boundfield datafield="title"  HeaderText="Title" ItemStyle-Width="150" />
                    <asp:BoundField DataField="short_discription" HeaderText="Short Discreption" ItemStyle-Width="180" />
                    <asp:BoundField DataField="min_experience" HeaderText="Minimum Experience years" ItemStyle-Width="180" />
                    <asp:BoundField DataField="salary" HeaderText="Salary" ItemStyle-Width="150" />
                    <asp:BoundField DataField="deadline" HeaderText="Deadline" ItemStyle-Width="150" />
                    <asp:BoundField DataField="no_of_vacancies" HeaderText="Number of vacancies" ItemStyle-Width="150" />
                    <asp:BoundField DataField="working_hours" HeaderText="Working Hours" ItemStyle-Width="150" />
                    <asp:BoundField DataField="username" HeaderText="Username" ItemStyle-Width="150" />
                    <asp:BoundField DataField="years_of_experience" HeaderText="Applicant Years of Experience" ItemStyle-Width="180" />
                    <asp:BoundField DataField="age" HeaderText="Age" ItemStyle-Width="150" />
                    <asp:BoundField DataField="score" HeaderText="Score" ItemStyle-Width="150" />

                    <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="View" ControlStyle-CssClass="button-small" Text="View" />
                </Columns>
            </asp:GridView>
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