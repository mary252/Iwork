﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="leaves_requestss.aspx.cs" Inherits="leaves_requestss" %>

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
					<li class="current_page_item"><asp:button  accesskey="2" runat="server"  Text="Homepage" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"  ></asp:button></li>
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
        
            <asp:GridView ID="table1" runat="server" AutoGenerateColumns="false" OnRowCommand="tableCommand">                 <Columns>                     <asp:BoundField DataField="request_start_date" HeaderText="Request start date" ItemStyle-Width="150" />                     <asp:BoundField DataField="applicant" HeaderText="Applicant" ItemStyle-Width="180" />                     <asp:BoundField DataField="request_end_date" HeaderText="Request end date" ItemStyle-Width="150" />                     <asp:BoundField DataField="request_date" HeaderText="Request Date" ItemStyle-Width="180" />                     <asp:BoundField DataField="total_days" HeaderText="Total number of Requested dates" ItemStyle-Width="150" />                     <asp:BoundField DataField="hr_employee" HeaderText="HR Employee" ItemStyle-Width="150" />                     <asp:BoundField DataField="hr_response" HeaderText="HR Response" ItemStyle-Width="150" />                     <asp:BoundField DataField="manager" HeaderText="Manager" ItemStyle-Width="150" />                     <asp:BoundField DataField="manager_response" HeaderText="Manager Response." ItemStyle-Width="150" />                     <asp:BoundField DataField="manager_reason" HeaderText="Manager Reasone" ItemStyle-Width="150" />                     <asp:BoundField DataField="leave_request_type" HeaderText="Type of the leave request." ItemStyle-Width="150" />                      <asp:ButtonField ButtonType="Button" Text="Accept" CommandName="Accept" HeaderText="Accept" ItemStyle-Width="150" />                     <asp:ButtonField ButtonType="Button" Text="Reject" CommandName="Reject" HeaderText="Reject" ItemStyle-Width="150" />                 </Columns>             </asp:GridView>                      </div>
    
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