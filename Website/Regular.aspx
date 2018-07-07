<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Regular.aspx.cs" Inherits="Regular" %>

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
                    <li class="current_page_item"><asp:button onclick="home" accesskey="2" runat="server"  Text="Homepage" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                           onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button onclick="signout" accesskey="2" runat="server"  Text="logout" CssClass="button-list" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                           onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button onclick="register" accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                           onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"></asp:button></li>
                    <li><asp:button   accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                </ul>
                 <br />
<%--                <h1 visible="false"; id="pro" style="position:absolute; left:650px; top:200px; font-size:25px;">Choose your company domain!</h1>
                <asp:label runat="server" visible="false"; id="task" style="position:absolute; left:650px; top:200px; font-size:25px;">Choose your company domain!</asp:label>--%>

                </div>
        </div>
    </div>
</div>
 <div>
     <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
  <asp:GridView ID="table" onrowcommand="table_RowCommand"  runat="server" AutoGenerateColumns="false"  BorderColor="Black" BorderStyle="Groove" BorderWidth="5px" >
    <Columns>
     <asp:ButtonField ControlStyle-BorderColor="Black"  ButtonType="Link"  datatextformatstring="{0}" CommandName="Select"  DataTextField="project_name"  HeaderText="Project Name"  ><ControlStyle BorderColor="Black"></ControlStyle></asp:ButtonField>
     <asp:BoundField ControlStyle-BorderColor="Black" DataField="start__date" HeaderText="Starts" ItemStyle-Width="180" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="180px"></ItemStyle> </asp:BoundField>
     <asp:BoundField ControlStyle-BorderColor="Black" DataField="end_date" HeaderText="Ends" ItemStyle-Width="150" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="150px"></ItemStyle></asp:BoundField>
     <asp:BoundField ControlStyle-BorderColor="Black" DataField="company" HeaderText="Company Email" ItemStyle-Width="150" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="150px"></ItemStyle></asp:BoundField>
     <asp:BoundField ControlStyle-BorderColor="Black" DataField="manager" HeaderText="Assigned by" ItemStyle-Width="150" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="150px"></ItemStyle></asp:BoundField>
    </Columns>
  <EditRowStyle BorderColor="Black" BorderStyle="Groove" BorderWidth="5px" />
  <RowStyle BackColor="White" BorderColor="Black" ForeColor="Black" BorderStyle="Groove" BorderWidth="5px" />
 </asp:GridView>

     <asp:GridView ID="table2" onrowcommand="table2_RowCommand"  runat="server" AutoGenerateColumns="false"  BorderColor="Black" BorderStyle="Groove" BorderWidth="5px" Width="1167px" >
    <Columns>
     <asp:BoundField  DataField ="task_name" HeaderText="Task Name" ItemStyle-Width="180" ><ItemStyle Width="180px"></ItemStyle> </asp:BoundField>
     <asp:BoundField  DataField ="project_name" HeaderText="Project Name" ItemStyle-Width="180" ><ItemStyle Width="180px"></ItemStyle> </asp:BoundField>
     <asp:BoundField ControlStyle-BorderColor="Black" DataField="company" HeaderText="Company Emial" ItemStyle-Width="180" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="180px"></ItemStyle> </asp:BoundField>
     <asp:BoundField ControlStyle-BorderColor="Black" DataField="deadline" HeaderText="Deadline" ItemStyle-Width="150" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="150px"></ItemStyle></asp:BoundField>
     <asp:BoundField ControlStyle-BorderColor="Black" DataField="task_status" HeaderText="Your Status" ItemStyle-Width="150" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="150px"></ItemStyle></asp:BoundField>
          <asp:BoundField ControlStyle-BorderColor="Black" DataField="task_description" HeaderText="Your Status" ItemStyle-Width="150" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="150px"></ItemStyle></asp:BoundField>
     <asp:BoundField ControlStyle-BorderColor="Black" DataField="regular_employee" HeaderText="Your Status" ItemStyle-Width="150" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="150px"></ItemStyle></asp:BoundField>

        <asp:BoundField ControlStyle-BorderColor="Black" DataField="manager" HeaderText="Assigned by" ItemStyle-Width="150" ><ControlStyle BorderColor="Black"></ControlStyle><ItemStyle Width="150px"></ItemStyle></asp:BoundField>
        <asp:ButtonField Text="Edit Status" ControlStyle-BorderColor="Black"  ButtonType="Link"   CommandName="Select" HeaderText=""  ><ControlStyle width="150px" BorderColor="Black"></ControlStyle></asp:ButtonField>

        </Columns>
  <EditRowStyle BorderColor="Black" BorderStyle="Groove" BorderWidth="5px" />
  <RowStyle BackColor="White" BorderColor="Black" ForeColor="Black" BorderStyle="Groove" BorderWidth="5px" />
 </asp:GridView>
     <asp:Label ID="Label1" runat="server" Text="" Font-Size="XX-Large"></asp:Label>
     <br />
     <br />
      <asp:Button runat="server" ID="Fixed" BackColor="Transparent" onMouseOver="this.style.color='#0F0'" ForeColor="White" OnClick="Finalizing_Task" Visible="false" Text="Fixed" BorderStyle="Double" Font-Size="X-Large" Width="293px"/>
     <asp:Button runat="server" ID="Assign" BackColor="Transparent" onMouseOver="this.style.color='#0F0'" ForeColor="White" OnClick="Update_Task" Visible="false" Text="Assigned" BorderStyle="Double" Font-Size="X-Large" Width="337px"/>

</div>
      

    </form>
</body>
</html>
