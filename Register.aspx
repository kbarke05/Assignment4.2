<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Register</h1>
        
        <table>
            <tr>
                <td>Last Name</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="You must enter your last name" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                </td>
            </tr>
               <tr>
                <td>First Name</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
            </tr>
               <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="You must enter email" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="please enter valid email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   </td>
            </tr>
            <tr>
                <td>Phone Number</td>
                 <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="You must enter a phone number"                  ControlToValidate ="txtPhone"></asp:RequiredFieldValidator>
                 </td>

            </tr>
              
               <tr>
                <td>Street Address</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="You must enter your address" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                   </td>
            </tr>
               <tr>
                <td>Apartment number</td>
                <td>
                    <asp:TextBox ID="txtApartment" runat="server"></asp:TextBox></td>
            </tr>
               <tr>
                <td>City</td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="You must enter a city" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                   </td>
            </tr>
             <tr>
                <td>State</td>
                <td>
                    <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="You must enter a state" ControlToValidate="txtState"></asp:RequiredFieldValidator>
                 </td>
            </tr>
             <tr>
                <td>Zip Code</td>
                <td>
                    <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="You must enter a zip code" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                 </td>
            </tr>
             
             <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="You must enter a password" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                 </td>
            </tr>
             <tr>
                <td>Confirm Password</td>
                <td>
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="cvConfirm" runat="server" ErrorMessage="Your passwords do not match" ControlToCompare="txtPassword" ControlToValidate="txtConfirm"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ErrorMessage="You must confirm your password" ControlToValidate="txtConfirm"></asp:RequiredFieldValidator>
                 </td>
            </tr>
               <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td>
                <td>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                   </td>
            </tr>
        </table>
    <p>
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Login.aspx">Log In</asp:LinkButton>
    </p>
        
    </div>
    </form>
</body>
</html>
