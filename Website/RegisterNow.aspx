<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterNow.aspx.cs" Inherits="RegisterNow" %>

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
                    <li class="current_page_item"><asp:button  onclick= "home" accesskey="2" runat="server"  Text="Homepage" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                           onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                    <li><asp:button OnClick= "signin" accesskey="2" runat="server"  Text="login" CssClass="button-list" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                           onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="GreenYellow" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                </ul>
            </div>
        </div>
    </div>
</div>


<div id="page-wrapper">
           
     <h1 style="color:blue;">Please fill in all the required information </h1>
     <asp:Label ID="check" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label>

        <asp:Label ID="lbl_firstname" runat="server" Text="First name: " style="position:fixed; left:50px; top:350px;" ></asp:Label>
        <asp:TextBox ID="txt_firstname" runat="server" style="position:fixed; left:150px; top:350px;"></asp:TextBox>
         <br />

        <asp:Label ID="lbl_middlename" runat="server" Text="Middle name: " style="position:fixed; left:50px; top:400px;"></asp:Label>
        <asp:TextBox ID="txt_middlename" runat="server" style="position:fixed; left:150px; top:400px;" ></asp:TextBox>
         <br />

        <asp:Label ID="lbl_lastname" runat="server" Text="Last name: " style="position:fixed; left:50px;top:450px;"></asp:Label>
        <asp:TextBox ID="txt_lastname" runat="server"  style="position:fixed; left:150px; top:450px;"></asp:TextBox>
         <br />

        <asp:Label ID="lbl_email" runat="server" Text="Email: " style="position:fixed; left:350px; top:350px;"></asp:Label>
        <asp:TextBox ID="txt_email" runat="server" style="position:fixed; left:450px; top:350px;"></asp:TextBox>
         <br />

        <asp:Label ID="lbl_birth" runat="server" Text="Birthday: " style="position:fixed; left:350px; top:400px;"></asp:Label>
        <asp:TextBox ID="txt_birthday" runat="server" style="position:fixed; left:450px; top:400px;"></asp:TextBox>
         <br />

        <asp:Label ID="lbl_years" runat="server" Text="Years of exp. " style="position:fixed; left:350px;top:450px;"></asp:Label>
        <asp:TextBox ID="txt_years" runat="server"  style="position:fixed; left:450px; top:450px;" ></asp:TextBox>
         <br />

        <asp:Label ID="lbl_username" runat="server" Text="Username: " style="position:fixed; left:650px; top:380px;"></asp:Label>
        <asp:TextBox ID="txt_username" runat="server" style="position:fixed; left:750px; top:380px;" ></asp:TextBox>
         <br />

        <asp:Label ID="lbl_password" runat="server" Text="Password: " style="position:fixed; left:650px; top:430px;" ></asp:Label>
        <asp:TextBox ID="txt_password" runat="server" TextMode="Password" style="position:fixed; left:750px; top:430px;" ></asp:TextBox>
         <br />

         <asp:Button ID="create" runat="server" Text="Register" 
            style="position:fixed; right:300px; top:380px; height: 75px; width: 150px; font-size:25px" OnClick="Register" />
         <br />

</div>
    
<div id="copyright" class="container"">
    <ul class="contact" style="position:absolute; left:650px; bottom:100px;" >
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

