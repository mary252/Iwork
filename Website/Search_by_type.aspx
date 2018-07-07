<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search_by_type.aspx.cs" Inherits="search_by_type" %>
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


<div id="page-wrapper" style="background-image:url('iWork.jpg'); height: 862px;">
           
         <h1 style="color:black; font-size:xx-large">Choose national or international companies view !</h1>
            <br />
           
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="national" runat="server" BorderStyle="Ridge" BackColor="#339966" Text="National" OnClick="SearchNational"  Font-Size="Larger"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="international" runat="server" BorderStyle="Ridge" BackColor="#339966" Text="International" OnClick="SearchInternational" Font-Size="Larger" />

     <br />
     <br />
        <div id="table_part">
            <asp:GridView ID="table" onrowcommand="table_RowCommand"  runat="server" AutoGenerateColumns="false"  BorderColor="Black" BorderStyle="Groove" BorderWidth="5px" >
                <Columns>
                    <asp:ButtonField ControlStyle-BorderColor="Black"  ButtonType="Link"  datatextformatstring="{0}" CommandName="Select"     
                    DataTextField="name" Text="Select"  HeaderText="Copmany Name"  >
<ControlStyle BorderColor="Black"></ControlStyle>
                    </asp:ButtonField>
                   <asp:BoundField  DataField ="email" HeaderText="Email" ItemStyle-Width="180" >
                   
<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                   
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="address" HeaderText="Address" ItemStyle-Width="180" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="type" HeaderText="Type" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="specialization" HeaderText="Specialization" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="Vision" HeaderText="Vision" ItemStyle-Width="150" >
                    
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    
                </Columns>
                           
                <EditRowStyle BorderColor="Black" BorderStyle="Groove" BorderWidth="5px" />
                           
                <RowStyle BackColor="White" BorderColor="Black" ForeColor="Black" BorderStyle="Groove" BorderWidth="5px" />
                           
            </asp:GridView>

                         <asp:Label ID="Label2" runat="server" Text="" Font-Size="X-Large" ForeColor="Red" BackColor="White"></asp:Label> 
            <asp:gridview  ID="table2"  onrowcommand="table2_RowCommand"  Visible="false" runat="server" AutoGenerateColumns="false" BorderColor="Black" BorderWidth="5px" BorderStyle="Solid"  >
                <Columns>
                    <asp:ButtonField DataTextField="Depname" HeaderText="Department Name" CommandName="Select"  Visible="true" ControlStyle-Font-Underline="true"  ItemStyle-Width="150" >
<ControlStyle Font-Underline="True"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:ButtonField>
                    <asp:BoundField DataField="name" HeaderText="Copmany Name" ItemStyle-Width="180" >
                   
<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                   
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="address" HeaderText="Address" ItemStyle-Width="180" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="type" HeaderText="Type" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="email" HeaderText="Email" ItemStyle-Width="180" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="specialization" HeaderText="Specialization" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="Vision" HeaderText="Vision" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="code" HeaderText="Code" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                </Columns>
                <RowStyle BackColor="White" />
            </asp:gridview>
   
            <asp:gridview  ID="table3"  onrowcommand="table3_RowCommand" Visible="false" runat="server" AutoGenerateColumns="false" BorderColor="Black" BorderWidth="4px" BorderStyle="Solid"  >
                <Columns>
      
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="code" HeaderText="Department code" ItemStyle-Width="180" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField  ControlStyle-BorderColor="Black" DataField="company" HeaderText="Company Email" ItemStyle-Width="180" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="Title" HeaderText="Vacancy" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:ButtonField ControlStyle-BorderColor="Black" ButtonType="Link" CommandName="Select" Text="Apply" ControlStyle-Font-Underline="true" >
<ControlStyle BorderColor="Black" Font-Underline="True"></ControlStyle>
                    </asp:ButtonField>
                </Columns>
                <RowStyle BackColor="White" />
            </asp:gridview>
    <br />
    <br />
    <asp:Button ID="Interview" runat="server" Font-Size="XX-Large" BorderStyle="Double" Text="Take Interview Now" OnClick="ViewInterview" Visible="false" />

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
