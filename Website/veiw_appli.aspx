<%@ Page Language="C#" AutoEventWireup="true" CodeFile="veiw_appli.aspx.cs" Inherits="veiw_appli" %>

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
    <form runat="server" >

<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><span class="icon icon-cog"></span><a href="#">iWork</a></h1>
            <div id="menu">
                <ul>
                    <li class="current_page_item"><asp:button accesskey="2" runat="server"  Text="Homepage" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                          ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="login" CssClass="button-list" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                           ></asp:button></li>
                    <li><asp:button accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                </ul>
                 <br />
            </div>
        </div>
    </div>
</div>

<div id="page-wrapper">
	<div id="page">
        <asp:GridView ID="table" runat="server" AutoGenerateColumns="false" OnRowCommand="tableCommand">
                <Columns>
                    <asp:BoundField DataField="title" HeaderText="Job Title" ItemStyle-Width="150" />
                    <asp:BoundField DataField="department" HeaderText="Department" ItemStyle-Width="180" />
                    <asp:BoundField DataField="company" HeaderText="Company Name" ItemStyle-Width="150" />
                    <asp:BoundField DataField="short_discription" HeaderText="Short Discription" ItemStyle-Width="180" />
                    <asp:BoundField DataField="detailed_discription" HeaderText="Detailed Discription" ItemStyle-Width="150" />
                    <asp:BoundField DataField="min_experience" HeaderText="Minimum years of experiance" ItemStyle-Width="150" />
                    <asp:BoundField DataField="salary" HeaderText="Salary" ItemStyle-Width="150" />
                    <asp:BoundField DataField="deadline" HeaderText="Deadline" ItemStyle-Width="150" />
                    <asp:BoundField DataField="no_of_vacancies" HeaderText="Number of avaliable Vacancies" ItemStyle-Width="150" />
                    <asp:BoundField DataField="working_hours" HeaderText="Working Hours" ItemStyle-Width="150" />
					<asp:BoundField DataField="username" HeaderText="username" ItemStyle-Width="150" />
				    <asp:BoundField DataField="pssword" HeaderText="password" ItemStyle-Width="150" />
				    <asp:BoundField DataField="personal_email" HeaderText="personal_email" ItemStyle-Width="150" />
					<asp:BoundField DataField="birth_date" HeaderText="birth_date" ItemStyle-Width="150" />
					<asp:BoundField DataField="years_of_experience" HeaderText="years_of_experience" ItemStyle-Width="150" />
					<asp:BoundField DataField="working_hours" HeaderText="Working Hours" ItemStyle-Width="150" />
					<asp:BoundField DataField="first_name" HeaderText="first_name" ItemStyle-Width="150" />
					<asp:BoundField DataField="middle_name" HeaderText="middle_name" ItemStyle-Width="150" />
				    <asp:BoundField DataField="last_name" HeaderText="last_name" ItemStyle-Width="150" />
				    <asp:BoundField DataField="age" HeaderText="age" ItemStyle-Width="150" />
                    <asp:BoundField DataField="score" HeaderText="score" ItemStyle-Width="150"/>
					
				    <asp:ButtonField ButtonType="Button" Text="Accept" CommandName="Accept" HeaderText="Accept" ItemStyle-Width="150" />
				    <asp:ButtonField ButtonType="Button" Text="Reject" CommandName="Reject" HeaderText="Reject" ItemStyle-Width="150" />
                </Columns>
            </asp:GridView>
            
</div>
 </div>
<div id="copyright" class="container"">
    <ul class="contact" style="position:absolute; left:650px; bottom:100px;" >
			<li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
			<li><a href="#" class="icon icon-facebook"><span></span></a></li>
			<li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
			<li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
			<li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
		</ul>
	<p style="position:absolute; left:400px;">&copy; Untitled. All rights reserved.  | Design by Mary Maher, Dahlia Magdi, Basma Mohamed, Israa Ragheb. </p>
		
</div>
   
</form>
</body>
</html>