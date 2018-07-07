<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Job_Seeker.aspx.cs" Inherits="Job_seeker" %>

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
                    <li class="current_page_item"><asp:button onclick="home" accesskey="2" runat="server"  Text="Homepage" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="GreenYellow" Font-Bold="true" Font-Size="25px" ForeColor="White"
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

             <asp:Button onclick="search_comp" runat="server" Text="Search Companies" BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:11px; top:178px; height: 49px; width: 337px; font-size:23px; margin-top: 11px;" />  <%--to add onclick method--%>


            <asp:Button  onclick="Search_by_type" runat="server" Text="Search by type" BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:307px; top:188px; height: 50px; width: 204px; font-size:23px; right: 468px;" />

<%--            <asp:Button ID="apply" onclick="apply_for_job" runat="server" Text="Search for vacancies" BorderStyle="Groove" ForeColor="Black" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:-2px; top:500px; height: 50px; width: 372px; font-size:23px;" />  
--%>
<%--            <asp:Button ID="choose" onclick="choose_job" runat="server" Text="GO!" BorderStyle="Groove" ForeColor="Black" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:735px; top:500px; height: 50px; width: 300px; font-size:60px; color:black" />--%>

            <asp:Button ID="stat" onclick="view_status" runat="server" Text="My Applications' status" BorderStyle="Groove" ForeColor="Black" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:462px; top:500px; height: 50px; width: 342px; font-size:23px;" />
       <asp:Button  onclick="view_accepted" runat="server" Text="View My Accepted Applications"  BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:509px; top:189px; height: 49px; width: 327px; font-size:23px;" />
                 <asp:Button onclick="Viewvacancy" runat="server" Text="View Vacancies" BorderStyle="None" ForeColor="White" BackColor="Transparent"
                 onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"
            style="position:absolute; left:835px; top:192px; height: 50px; width: 186px; font-size:23px;" />

            </div>
        </div>
    </div>
</div>


<div id="page-wrapper" style="background-image:url('iWork.jpg'); height: 862px;">
       <asp:Label runat="server" ID="Label2" Text="" ForeColor="Red"></asp:Label>   

                <asp:GridView ID="table" onrowcommand="table_RowCommand" runat="server" AutoGenerateColumns="false"  BorderColor="Black" BorderStyle="Groove" BorderWidth="5px" BackColor="#FFFFCC" >
                <Columns>
                    <asp:BoundField  DataField ="job" HeaderText="Job Title" ItemStyle-Width="180" >
                   
<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                   <asp:BoundField  DataField ="department" HeaderText="Department Code" ItemStyle-Width="180" >
                   
<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                   
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="company" HeaderText="Company Email" ItemStyle-Width="180" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="Status" HeaderText="Status" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="score" HeaderText="Score" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:ButtonField runat="server" ButtonType="Button" Text="Delete" CommandName="Select" />
                </Columns>
</asp:GridView>
    
                <asp:GridView ID="table2" onrowcommand="table2_RowCommand" runat="server" AutoGenerateColumns="false"  BorderColor="Black" BorderStyle="Groove" BorderWidth="5px" BackColor="#FFFFCC" >
                <Columns>
                    <asp:BoundField  DataField ="job" HeaderText="Job Title" ItemStyle-Width="180" >
                   
<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                   <asp:BoundField  DataField ="department" HeaderText="Department Code" ItemStyle-Width="180" >
                   
<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                   
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="company" HeaderText="Company Email" ItemStyle-Width="180" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="180px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="Status" HeaderText="Status" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ControlStyle-BorderColor="Black" DataField="score" HeaderText="Score" ItemStyle-Width="150" >
<ControlStyle BorderColor="Black"></ControlStyle>

<ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:ButtonField runat="server" ButtonType="Button" Text="Choose" CommandName="Select" />
                </Columns>
</asp:GridView>
    

      <asp:GridView ID="table3" onrowcommand="choose_job" runat="server" AutoGenerateColumns="false"  BorderColor="Black" BorderStyle="Groove" BorderWidth="5px" BackColor="#FFFFCC" >
                <Columns>
                    <asp:ButtonField ControlStyle-Font-Underline="true" CommandName="Select" DataTextField ="dayo" HeaderText="Choose one Day OFF " ItemStyle-Width="180" >
                   
<ItemStyle Width="180px"></ItemStyle>
                    </asp:ButtonField>
                </Columns>
</asp:GridView>
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
