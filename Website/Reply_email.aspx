<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reply_email.aspx.cs" Inherits="Reply_email" %>

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

    <asp:Label ID="lab" runat="server" Text="please check the serial number of the mail you wish to reply and the sender username and enter it in the right textbox" CssClass="label" ForeColor="black"></asp:Label>
    <br />
  <div id="table_part">
         <asp:GridView ID="table" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="table_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="serial_number" HeaderText="Email serial" ItemStyle-Width="150" />
                    <asp:BoundField DataField="sender" HeaderText="Recieved from" ItemStyle-Width="150" />
                    <asp:BoundField DataField="date" HeaderText="Date" ItemStyle-Width="150" />
                    <asp:BoundField DataField="isubject" HeaderText="Subject" ItemStyle-Width="180" />
                    <asp:BoundField DataField="body" HeaderText="Body" ItemStyle-Width="380" ItemStyle-height="80" />
                </Columns>
            </asp:GridView>
            </div>

     <asp:Label ID="recieved" runat="server" Text="recieved from: " style="position:absolute; left:50px; top:450px;" ></asp:Label>
        <asp:TextBox ID="txt_recieved_from" runat="server" style="position:absolute; left:160px; top:450px;"></asp:TextBox>
         <br />

        <asp:Label ID="serial" runat="server" Text="Old email serial : " style="position:absolute; left:350px; top:450px;"></asp:Label>
        <asp:TextBox ID="txt_oldserial" runat="server" style="position:absolute; left:470px; top:450px;"></asp:TextBox>
        <br />

        <asp:Label ID="newserial" runat="server" Text="New email serial : " style="position:absolute; left:50px; top:500px;"></asp:Label>
        <asp:TextBox ID="txt_newserial" runat="server" style="position:absolute; left:150px; top:500px;"></asp:TextBox>
        <br />

        <asp:Label ID="subject" runat="server" Text="subject:  " style="position:absolute; left:350px; top:500px;"></asp:Label>
        <asp:TextBox ID="txt_subject" runat="server" style="position:absolute; left:450px; top:500px;" ></asp:TextBox>
         <br />

        <asp:Label ID="body" runat="server" Text="Body: " style="position:absolute; left:50px;top:550px;"></asp:Label>
        <asp:TextBox ID="txt_body" runat="server"  style="position:absolute; left:150px; top:550px;"></asp:TextBox>
         <br />

      <asp:Button ID="replyBtn" runat="server" Text="Reply"  onclick="reply"  CssClass="button"/> 
      <asp:Label ID="done" runat="server" Text="" ></asp:Label>
  


    </div>
    
<div id="copyright" class="container"">
    <ul class="contact" >
			<li><a href="#" class="icon icon-twitter" ><span>Twitter</span></a></li>
			<li><a href="#" class="icon icon-facebook"><span>facebook</span></a></li>
			<li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
			<li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
			<li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
		</ul>
	<p style="position:absolute; left:400px;">&copy; Untitled. All rights reserved.  | Design by Mary Maher, Dahlia Magdi, Basma Mohamed, Israa Ragheb. </p>
		
</div>
   
</form>
</body>
</html>