<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager approve-disapprove job.aspx.cs" Inherits="Manager_approve_disapprove_job" %>

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
            
			
           
            <div id="content" style="height:600px;">
					<div id="req" runat="server" class="box">
                        <br />
						<h2>Job Application</h2>
                        <div style="margin-left: auto; margin-right: auto; text-align:left; padding-left:30px;">
                        <asp:Label ID="titl" runat="server" Text="Job Title:" ></asp:Label>
                        <asp:Label ID="jtitle" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="shortdis" runat="server" Text="Short Discreption:" ></asp:Label>
                        <asp:Label ID="short_discription" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="detaileddis" runat="server" Text="Detailed Discreption:" ></asp:Label>
                        <asp:Label ID="detailed_discription" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="min_ex" runat="server" Text="Minimum Experience Years:" ></asp:Label>
                        <asp:Label ID="min_experience" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="sal" runat="server" Text="Salary:" ></asp:Label>
                        <asp:Label ID="salary" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="deadlin" runat="server" Text="Deadline:" ></asp:Label>
                        <asp:Label ID="deadline" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="numvanc" runat="server" Text="Number of Vacancies:" ></asp:Label>
                        <asp:Label ID="no_of_vacancies" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="workhours" runat="server" Text="Working Hours:" ></asp:Label>
                        <asp:Label ID="working_hours" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <br />

                        <asp:Label ID="user" runat="server" Text="Username:" ></asp:Label>
                        <asp:Label ID="username" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="persemail" runat="server" Text="Personal Email:" ></asp:Label>
                        <asp:Label ID="personal_email" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="firstname" runat="server" Text="First Name:" ></asp:Label>
                        <asp:Label ID="first_name" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="middlename" runat="server" Text="Middle Name:" ></asp:Label>
                        <asp:Label ID="middle_name" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="lastname" runat="server" Text="Last Name:" ></asp:Label>
                        <asp:Label ID="last_name" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="birth" runat="server" Text="BirthDate:" ></asp:Label>
                        <asp:Label ID="birth_date" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="age_" runat="server" Text="Age:" ></asp:Label>
                        <asp:Label ID="age" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="Label19" runat="server" Text="Applicant Years of Experience:" ></asp:Label>
                        <asp:Label ID="years_of_experience" runat="server" Text=""></asp:Label>
                        <br />

                        <asp:Label ID="sc" runat="server" Text="Score:" ></asp:Label>
                        <asp:Label ID="score" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                       </div>
            </div>
                <div style="margin-left: auto; margin-right: auto; text-align:left; padding-left:30px;">
                    
                    <asp:Button ID="appr" runat="server" CssClass="button" OnClick="Approve" Text="Approve" />
                    &nbsp;&nbsp;
                    <asp:Button ID="rej" runat="server" CssClass="button" OnClick="reject" Text="Reject" />
                    <br />
                    <asp:Label ID="application" runat="server" ForeColor="Red" Text=""></asp:Label>

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