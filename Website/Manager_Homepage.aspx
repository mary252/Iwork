<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager_Homepage.aspx.cs" Inherits="Manager_Homepage" %>

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
					<li class="current_page_item"><asp:button  accesskey="2" runat="server"  Text="Homepage"   Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"  ></asp:button></li>
					<li><asp:button  accesskey="2" runat="server"  Text="login" CssClass="button-list" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"  ></asp:button></li>
					<li><asp:button  accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="53px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" ></asp:button></li>
					<li><asp:button  accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" ></asp:button></li>
					<li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" ></asp:button></li>
				</ul>
                <br />
                <asp:label id="hello" runat="server" style="position:absolute; left:650px; top:200px; font-size:25px;" Text=""></asp:label>

			</div>
		</div>
	</div>
</div>

<div id="page-wrapper">
    <div id="StaffMemberPart" >
          <asp:Button onclick="checkin" runat="server" Text="Check-in" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="16px" ForeColor="black"
         style="position:absolute; top:220px;   height:50px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>

    <asp:Button  onclick="checkout" runat="server" Text="Check-out" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="16px" ForeColor="black"
         style="position:relative; bottom:65px; left:145px; height:50px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>

    <asp:Button  onclick="viewattendance" runat="server" Text="View Attendance" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="16px" ForeColor="black"
         style="position:relative; bottom:65px; left:145px; height:50px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>

    <asp:Button  onclick="leave" runat="server" Text="Leave request" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="11px" ForeColor="black" 
         style="position:relative; bottom:75px; left:145px; height:23px; width:150px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>

    <asp:Button  onclick="buisness" runat="server" Text="Buis.Trip request" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="11px" ForeColor="black" 
         style="position:relative; bottom:50px; left:-10px; height:23px; width:150px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>

   <asp:Button onclick="prev_requests" runat="server" Text="Prev. requests" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="16px" ForeColor="black"
         style="position:relative; bottom:65px; left:-5px; height:50px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>

    <asp:Button  onclick="delete_request" runat="server" Text="Delete request" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="16px" ForeColor="black"
         style="position:relative; bottom:65px; left:0px; height:50px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>

    <asp:Button onclick="view_announcements" runat="server" Text="View announcements" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="16px" ForeColor="black"
         style="position:relative; bottom:65px; left:10px; height:50px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>

    <asp:Button onclick="send_mail" runat="server" Text="Send mail" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="16px" ForeColor="black"
         style="position:relative; bottom:90px; left:-415px; height:50px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>

    <asp:Button  onclick="check_mail" runat="server" Text="Check mail" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="16px" ForeColor="black"
         style="position:relative; bottom:90px; left:-415px; height:50px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>

    <asp:Button onclick="reply_mail" runat="server" Text="Reply mail" CssClass="button" BackColor="#ccff99" BorderStyle="None" Font-Bold="true" Font-Size="16px" ForeColor="black"
         style="position:relative; bottom:90px; left:-415px; height:50px; "
         onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#000'"/>


</div>

	<div id="page">
        
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
					<div class="box">
						<h2>Welcome</h2>
                        <asp:Label ID="user" Text="Username:" runat="server"></asp:Label>
                        <asp:Label ID="username" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="fname" Text="First name:" runat="server"></asp:Label>
                        <asp:Label ID="firstname" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="mname" Text="Middle name:" runat="server"></asp:Label>
                        <asp:Label ID="Middlename" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="lname" Text="Last Name:" runat="server"></asp:Label>
                        <asp:Label ID="Lastname" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="bdate" Text="Birthdate:" runat="server"></asp:Label>
                        <asp:Label ID="birth_date" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="user_age" Text="age:" runat="server"></asp:Label>
                        <asp:Label ID="_age" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="pemail" Text="Personal Email:" runat="server"></asp:Label>
                        <asp:Label ID="personalemail" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="expyears" Text="Years of experience:" runat="server"></asp:Label>
                        <asp:Label ID="yearsofexp" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="com" Text="Company:" runat="server"></asp:Label>
                        <asp:Label ID="company" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="dep" Text="Department:" runat="server"></asp:Label>
                        <asp:Label ID="department" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="Job" Text="Job:" runat="server"></asp:Label>
                        <asp:Label ID="_job" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="anleaves" Text="Annual Leaves:" runat="server"></asp:Label>
                        <asp:Label ID="anualleaves" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="commail" Text="Company Email:" runat="server"></asp:Label>
                        <asp:Label ID="Companyemail" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="dayoff" Text="Day off:" runat="server"></asp:Label>
                        <asp:Label ID="day_off" Text="" runat="server"></asp:Label>
                        <br/>
                        <asp:Label ID="sal" Text="Salary:" runat="server"></asp:Label>
                        <asp:Label ID="salary" Text="" runat="server"></asp:Label>
                        <br/>
						
					</div>
					<div class="box">
						
					</div>
					<br class="clearfix" />
				</div>
				            
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