<%@ Page Language="C#" AutoEventWireup="true" CodeFile="General.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Label ID="lbl_search" runat="server" Text="Enter the name or the city or the type(National/International) of the company : "></asp:Label>
        
        <br />

        <asp:TextBox ID="txt_search" runat="server"></asp:TextBox>
    
        <br />
        </div>
    </form>
</body>
</html>
