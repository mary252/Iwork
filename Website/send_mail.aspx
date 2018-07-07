<%@ Page Language="C#" AutoEventWireup="true" CodeFile="send_mail.aspx.cs" Inherits="send_mail" %>

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
                    <li class="current_page_item"><asp:button  accesskey="2" runat="server"  Text="Homepage" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                           onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="login" CssClass="button-list" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                           onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                </ul>
            </div>
            <br />
        </div>
    </div>
</div>


<div id="page-wrapper">

        <asp:Label ID="send_to" runat="server" Text="send to:  " style="position:absolute; left:50px; top:300px;" ></asp:Label>
        <asp:TextBox ID="txt_send" runat="server" style="position:absolute; left:150px; top:300px;"></asp:TextBox>
         <br />

        <asp:Label ID="serial" runat="server" Text="Email serial : " style="position:absolute; left:50px; top:350px;"></asp:Label>
        <asp:TextBox ID="txt_serial" runat="server" style="position:absolute; left:150px; top:350px;"></asp:TextBox>
        <br />

        <asp:Label ID="subject" runat="server" Text="subject:  " style="position:absolute; left:350px; top:350px;"></asp:Label>
        <asp:TextBox ID="txt_subject" runat="server" style="position:absolute; left:450px; top:350px;" ></asp:TextBox>
         <br />

        <asp:Label ID="body" runat="server" Text="Body: " style="position:absolute; left:350px;top:300px;"></asp:Label>
        <asp:TextBox ID="txt_body" runat="server"  style="position:absolute; left:450px; top:300px;"></asp:TextBox>
         <br />

      <asp:Button ID="sendBtn" runat="server" Text="Send"  onclick="send"  CssClass="button"/> 
      <asp:Label ID="userexists" runat="server" Text="" ></asp:Label>
  

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