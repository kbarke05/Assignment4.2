<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Welcome</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2>Welcome</h2>
        <p>You have successfully logged in </p>
        <p>Thank you,
            <asp:Label ID="lblFirst" runat="server" Text="Label"></asp:Label>&nbsp;
            <asp:Label ID="lblLast" runat="server" Text="Label"></asp:Label>
        </p>
        <p>If needed we can contact you at <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label></p>
    </div>
    </form>
</body>
</html>