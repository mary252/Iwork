﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_hr_job.aspx.cs" Inherits="add_hr_job" %>

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
                    <li><asp:button  accesskey="2" runat="server"  Text="login" CssClass="button-list" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                           ></asp:button></li>
                    <li><asp:button accesskey="2" runat="server"  Text="Signup" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="About us" CssClass="buttonlist" Height="56px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White" 
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'" ></asp:button></li>
                    <li><asp:button  accesskey="2" runat="server"  Text="contact us" CssClass="buttonlist" Height="57px" BorderStyle="None" BackColor="Transparent" Font-Bold="true" Font-Size="25px" ForeColor="White"
                          onMouseOver="this.style.color='#0F0'" onMouseOut="this.style.color='#FFF'"  ></asp:button></li>
                </ul>
                 <br />
            </div>
        </div>
    </div>
</div>

<div id="page-wrapper">
	<div id="page">
        <div id="body">
			<br/>
            <asp:Label ID="department" runat="server" Text="Depatment:"></asp:Label>
            <asp:TextBox ID="txt_department" runat="server"></asp:TextBox>

				
            <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
            ControlToValidate="txt_department"
            ErrorMessage="Department is a required field."
            ForeColor="Red">
            </asp:RequiredFieldValidator>

			<br/>
            <asp:Label ID="company" runat="server" Text="Company name:"></asp:Label>
            <asp:TextBox ID="txt_company" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
            ControlToValidate="txt_company"
            ErrorMessage="Comapny name is a required field."
            ForeColor="Red">
            </asp:RequiredFieldValidator>
        
            <br />
            <asp:Label ID="dep_role" runat="server" Text="Department role:"></asp:Label>
            <asp:TextBox ID="txt_dep_role" runat="server"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator4"
            ControlToValidate="txt_dep_role" runat="server"
            ErrorMessage="Only String are allowed"
            ValidationExpression="^[^\W\d_]+$">
            </asp:RegularExpressionValidator>
  
    
            <br/>
		    <asp:Label ID="title1" runat="server" Text="Job title:"></asp:Label>
            <asp:TextBox ID="txt_title" runat="server"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator5"
            ControlToValidate="txt_title" runat="server"
            ErrorMessage="Only String are allowed"
            ValidationExpression="^[^\W\d_]+$">
		    </asp:RegularExpressionValidator>
  

			

			<br/>         
            <asp:Label ID="short_discrip" runat="server" Text="short discription:"></asp:Label>
            <asp:TextBox ID="txt_short_discrip" runat="server"></asp:TextBox>
		

			<br/>
            <asp:Label ID="long_discrip" runat="server" Text="Detailed discription:"></asp:Label>
            <asp:TextBox ID="txt_long_discrip" runat="server"></asp:TextBox>
	

            <br/>
			<asp:Label ID="min_exp" runat="server" Text="Mininumu Years of experiance:"></asp:Label>
            <asp:TextBox ID="txt_min_exp" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator8"
            ControlToValidate="txt_min_exp" runat="server"
            ErrorMessage="Only Numbers are allowed"
            ValidationExpression="\d+">
            </asp:RegularExpressionValidator>

            <br/>
		    <asp:Label ID="salary" runat="server" Text="Salary:"></asp:Label>
            <asp:TextBox ID="txt_salary" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator9"
            ControlToValidate="txt_salary" runat="server"
            ErrorMessage="Only Numbers are allowed"
            ValidationExpression="\d+">
		   </asp:RegularExpressionValidator>

			<br/>
            <asp:Label ID="deadline" runat="server" Text="Submition deadline:"></asp:Label>
            <asp:TextBox ID="txt_deadline" runat="server"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator10"
            ControlToValidate="txt_deadline" runat="server"
            ErrorMessage="Date format in DD/MM/YYYY"
            ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$">
            </asp:RegularExpressionValidator>

			<br/>
            <asp:Label ID="vaccancies" runat="server" Text="Number of avaliable vaccancies:"></asp:Label>
            <asp:TextBox ID="txt_vaccancies" runat="server"></asp:TextBox>
		    <asp:RegularExpressionValidator ID="RegularExpressionValidator11"
            ControlToValidate="txt_vaccancies" runat="server"
            ErrorMessage="Only Numbers are allowed"
            ValidationExpression="\d+">
		   </asp:RegularExpressionValidator>

			<br/>
            <asp:Label ID="workingh" runat="server" Text="Working Hours:"></asp:Label>
            <asp:TextBox ID="txt_workingh" runat="server"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator12"
            ControlToValidate="txt_workingh" runat="server"
            ErrorMessage="Only Numbers are allowed"
            ValidationExpression="\d+">
			</asp:RegularExpressionValidator>

			<br/>
            <asp:Label ID="Qnumber" runat="server" Text="Application question number:"></asp:Label>
            <asp:TextBox ID="txt_Qnumber" runat="server"></asp:TextBox>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator13"
            ControlToValidate="txt_Qnumber" runat="server"
            ErrorMessage="Only Numbers are allowed"
            ValidationExpression="\d+">
            </asp:RegularExpressionValidator>
		    
				
            <br/>
            <asp:Label ID="question" runat="server" Text="Question:"></asp:Label>
            <asp:TextBox ID="txt_question" runat="server"></asp:TextBox>
           
			<br/>
            <asp:Label ID="answer" runat="server" Text="Answer:"></asp:Label>
            <asp:DropDownList ID="Ddanswer" runat="server">
            <asp:ListItem Enabled="true" Text="Select the answer" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
            <asp:ListItem Text="No" Value="1"></asp:ListItem>
            </asp:DropDownList>

		
			<br/>
            <asp:Button ID="btn_submit" runat="server" Text="Submit" onclick="submit"/>
					
				
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