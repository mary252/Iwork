<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Regular_Homepage.aspx.cs" Inherits="Regular_Homepage" %>

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
                    <li class="current_page_item"><asp:button accesskey="2" runat="server"  Text="Homepage" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                           ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server" OnClick="signout"  Text="logout" CssClass="button-list" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                            onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"></asp:button></li>
                    <li><asp:button accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                </ul>
                 <br />
               <asp:label id="hello" runat="server" style="position:absolute; left:650px; top:200px; font-size:25px;" Text=""></asp:label>

            </div>
        </div>
    </div>
</div>
<div id="page-wrapper">
    <asp:Button onclick="view_projects" runat="server" Text="My Projects" BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:-2px; top:188px; height: 50px; width: 337px; font-size:23px;" />  <%--to add onclick method--%>

<div id="page">

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