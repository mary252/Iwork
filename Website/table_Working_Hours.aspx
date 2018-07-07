<%@ Page Language="C#" AutoEventWireup="true" CodeFile="table_Working_Hours.aspx.cs" Inherits="table_Working_Hours" %>

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
        <div>   
               
            <asp:GridView ID="table1" runat="server" AutoGenerateColumns="false" >
             <Columns>
             <asp:BoundField DataField="staff" HeaderText="Staff Memeber" ItemStyle-Width="150" />
             <asp:BoundField DataField="s" HeaderText="Working Hours of the year" ItemStyle-Width="180" />
             </Columns>
            </asp:GridView>
                    
                
        </div>
         
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