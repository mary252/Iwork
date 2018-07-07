<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top_acheivers.aspx.cs" Inherits="top_acheivers" %>

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
					<li class="current_page_item"><asp:button  accesskey="2" runat="server"  Text="Homepage"  Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"  ></asp:button></li>
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
				
            <asp:Label ID="month" runat="server" Text="Month: "></asp:Label>
            <asp:DropDownList ID="Dmonth" runat="server">
            <asp:ListItem Enabled="true" Text="Select the month." Value="-1"></asp:ListItem>
            <asp:ListItem Text="1" Value="1"></asp:ListItem>
	        <asp:ListItem Text="2" Value="2"></asp:ListItem>	
            <asp:ListItem Text="3" Value="3"></asp:ListItem>
            <asp:ListItem Text="4" Value="4"></asp:ListItem>	
            <asp:ListItem Text="5" Value="5"></asp:ListItem>
            <asp:ListItem Text="6" Value="6"></asp:ListItem>
            <asp:ListItem Text="7" Value="7"></asp:ListItem>
            <asp:ListItem Text="8" Value="8"></asp:ListItem>	
            <asp:ListItem Text="9" Value="9"></asp:ListItem>
            <asp:ListItem Text="10" Value="10"></asp:ListItem>
            <asp:ListItem Text="11" Value="11"></asp:ListItem>
            <asp:ListItem Text="12" Value="12"></asp:ListItem>					
            </asp:DropDownList>

				
				
            <br/>
			<asp:Label ID="Year" runat="server" Text="Year: "></asp:Label>
            <asp:DropDownList ID="Dyear" runat="server">
            <asp:ListItem Enabled="true" Text="Select the month." Value="-1"></asp:ListItem>
            <asp:ListItem Text="2007" Value="2007"></asp:ListItem>
            <asp:ListItem Text="2008" Value="2008"></asp:ListItem>    
            <asp:ListItem Text="2009" Value="2009"></asp:ListItem>
            <asp:ListItem Text="2010" Value="2010"></asp:ListItem>    
            <asp:ListItem Text="2011" Value="2011"></asp:ListItem>
            <asp:ListItem Text="2012" Value="2012"></asp:ListItem>
            <asp:ListItem Text="2013" Value="2013"></asp:ListItem>
            <asp:ListItem Text="2014" Value="2014"></asp:ListItem>    
            <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
            <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
            <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
            <asp:ListItem Text="2018" Value="2018"></asp:ListItem>                  
            </asp:DropDownList>


				
            <br/>
            <asp:Button ID="btn_view" runat="server" Text="View Top Three Achievers." onclick="View"/>
                    
                
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