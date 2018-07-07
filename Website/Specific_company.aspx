<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Specific_company.aspx.cs" Inherits="Specific_company" %>

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
        .label {}
    </style>

     

</head>
<body>
    <form id="form1" runat="server">


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
                    <li><asp:button   onclick= "register" accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="53px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                </ul>
            </div>
        </div>
    </div>
</div>


        <div>
         <h1 style="color:white;"" >  Enter the company's name carefully!</h1>

            <br />

             <asp:TextBox ID="compname_box" runat="server" BorderColor="#000000" MaxLength="200" Height="33px" Width="331px" style="margin-left: 136px"></asp:TextBox>
            <br />
            <br />
             <asp:Label ID="msg" runat="server" CssClass="label" ForeColor="Red" Width="864px"></asp:Label>
            <br />          
            <asp:Button ID="search" runat="server" Text="Go!" BorderColor="White" BorderStyle="Double" Font-Bold="true" Font-Size="Larger" onclick="Search" CssClass="button"/>



             <div id="table_part">
            <asp:GridView ID="table2" runat="server" AutoGenerateColumns="false" BorderColor="Black" BorderWidth="4px" BorderStyle="Solid"  OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged">
                <Columns>
                    <asp:ButtonField CommandName="Select"  Visible="true" ControlStyle-Font-Underline="true"  
                    DataTextField="name" Text="name" HeaderText="Copmany Name" ItemStyle-Width="250" />
                    <asp:BoundField DataField="address" HeaderText="Address" ItemStyle-Width="180" />
                    <asp:BoundField DataField="type" HeaderText="Type" ItemStyle-Width="150" />
                    <asp:BoundField DataField="email" HeaderText="Email" ItemStyle-Width="180" />
                    <asp:BoundField DataField="specialization" HeaderText="Specialization" ItemStyle-Width="150" />
                    <asp:BoundField DataField="Vision" HeaderText="Vision" ItemStyle-Width="150" />
                    <asp:BoundField DataField="code" HeaderText="Code" ItemStyle-Width="150" />
                    <asp:BoundField DataField="Depname" HeaderText="Department Name" ItemStyle-Width="150" />
                </Columns>
            </asp:GridView>
                 
            </div>

        </div>
    </form>
</body>
</html>
