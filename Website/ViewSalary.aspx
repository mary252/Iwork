﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewSalary.aspx.cs" Inherits="ViewSalary" %>


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
    <form runat="server">
    
<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><span class="icon icon-cog"></span><a href="#">iWork</a></h1>
            <div id="menu">
                <ul>
                    <li class="current_page_item"><asp:button OnClick= "home" accesskey="2" runat="server"  Text="Homepage" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                           onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                    <li><asp:button OnClick= "signin" accesskey="2" runat="server"  Text="login" CssClass="button-list" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                           onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                    <li><asp:button   onclick= "register" accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                </ul>
            </div>
            <br />
             <asp:Button  onclick="searchcomp" runat="server" Text="search for a company" BorderStyle="None" ForeColor="White" BackColor="Transparent"
                  onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:30px; top:195px; height: 50px; width: 250px; font-size:23px;" />

             <asp:Button  runat="server" Text="view all available companies" BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:290px; top:195px; height: 50px; width: 300px; font-size:23px;" />  <%--to add onclick method--%>

              <asp:Button runat="server" Text="view salary of all companies" BorderStyle="None" ForeColor="White" BackColor="GreenYellow"
            style="position:absolute; left:600px; top:195px; height: 50px; width: 300px; font-size:23px;" />

        </div>
    </div>
</div>


<div id="page-wrapper">
           
        <div id="table_part">
            <asp:GridView ID="table" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="table_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="company" HeaderText="Company" ItemStyle-Width="150" />
                    <asp:BoundField DataField="salary" HeaderText="Average Salary" ItemStyle-Width="180" />
                </Columns>
            </asp:GridView>
            </div>
    </div>
    
<div id="copyright" class="container"">
    <ul class="contact" style="position:absolute; left:650px; bottom:50px;" >
			<li><a href="#" class="icon icon-twitter" ><span>Twitter</span></a></li>
			<li><a href="#" class="icon icon-facebook"><span>facebook</span></a></li>
			<li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
			<li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
			<li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
		</ul>
     <br />
     <br />
	<p style="position:absolute; left:400px;">&copy; Untitled. All rights reserved.  | Design by Mary Maher, Dahlia Magdi, Basma Mohamed, Israa Ragheb. </p>
		
</div>
   
</form>
</body>
</html>

