<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interview.aspx.cs" Inherits="Interview" %>

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

    <style type="text/css">
        #welcomepic {
            width: 1035px;
            height: 379px;
            margin-top: 0px;
            margin-left: 0px;
        }
    </style>

</head>

<body>
    <form runat="server">

<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><span class="icon icon-cog"></span><a href="#">iWork</a></h1>
            <div id="menu">
                <ul>
                    <li class="current_page_item">
                        <asp:button accesskey="2" OnClick="home" runat="server"  Text="Homepage" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="GreenYellow" Font-Bold="true" Font-Size="25px" ForeColor="White"
                            ></asp:button></li>
                    <li><asp:button OnClick= "signin" accesskey="2" runat="server"  Text="login" CssClass="button-list" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                           onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                    <li><asp:button  onclick= "register"  accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="53px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                </ul>
                   <br />
                <%--<asp:Button   runat="server" Text="search for a company" BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:30px; top:195px; height: 50px; width: 250px; font-size:23px;" />--%>

             <asp:Button onclick="search_comp" runat="server" Text="view all available companies" BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:-2px; top:188px; height: 50px; width: 300px; font-size:23px;" />  <%--to add onclick method--%>

             <asp:Button onclick="ViewSalary" runat="server" Text="view salary of all companies" BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:309px; top:189px; height: 50px; width: 300px; font-size:23px;" />

            <asp:Button  onclick="Search_by_type" runat="server" Text="Search by type" BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:561px; top:188px; height: 50px; width: 300px; font-size:23px;" />
       <asp:Button  onclick="Specific_company" runat="server" Text="A specific company's Depatments"  BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:812px; top:186px; height: 50px; width: 300px; font-size:23px;" />

            </div>
        </div>
    </div>
</div>


<div id="page-wrapper" style="background-image:url('background.jpg'); height: 862px;">
              <asp:Label ID="Label2" runat="server" Text="" Font-Size="XX-Large" ForeColor="Red" BackColor="White"></asp:Label> 
    <br />
    <br />
                <asp:GridView onrowcommand="table_RowCommand" ID="table" Visible="true" runat="server" AutoGenerateColumns="false"  BorderColor="Black" BorderStyle="Groove" BorderWidth="5px" Width="409px"  >
                <Columns>
                    
                   <asp:BoundField ControlStyle-BorderColor="Black" DataField="Question" HeaderText="Address" ItemStyle-Width="180" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="180px"></ItemStyle></asp:BoundField>
         <asp:ButtonField runat="server" ButtonType="Link" CommandName="True" Text="True" ControlStyle-Font-Underline="true" />
                    <asp:ButtonField runat="server" ButtonType="Link" CommandName="False" Text="False" ControlStyle-Font-Underline="true" />

                     </Columns>
                   </asp:GridView> 
    <asp:Label ID="finish1" runat="server" Text="" Font-Bold="true" Font-Size="XX-Large" ForeColor="Red"></asp:Label>
  <br />
    <br />
    <asp:Button id="finish" runat="server" Text="Finish" OnClick="view_score" />
    
</div>
    
<div id="copyright" class="container" >
    <ul class="contact" style="position:static; margin-left:400px; margin-bottom:100px; width: 500px;" >
			<li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
			<li><a href="#" class="icon icon-facebook"><span></span></a></li>
			<li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
			<li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
			<li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
		</ul>
     <br />
     <br />
	<p style="position:static; margin-left:400px; margin-bottom:110px; width:500px">&copy; Untitled. All rights reserved.  | Design by Mary Maher, Dahlia Magdi, Basma Mohamed, Israa Ragheb. </p>
		
</div>
   
</form>
</body>
</html>
