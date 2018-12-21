<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchProduct.aspx.cs" Inherits="WebPrac4Exer1.DataBound" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <b><u><asp:Label ID="Label1" runat="server" Text="Search Product Information Based On Category Name"></asp:Label></u></b>
            
        </div>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Select a category name : "></asp:Label>
        <asp:DropDownList ID="ddlCatName" runat="server" DataSourceID="category" DataTextField="CategoryName" DataValueField="CategoryName">
        </asp:DropDownList>
        <asp:Button ID="btnFind" runat="server" Text="Find" OnClick="btnFind_Click" />
        <asp:SqlDataSource ID="category" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]" OnSelecting="category_Selecting"></asp:SqlDataSource>
        <br /> Your search return :
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
&nbsp;record.<br />
        <asp:SqlDataSource ID="matchedProduct" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT P.UnitPrice, P.ProductName FROM Products AS P INNER JOIN Categories AS C ON P.CategoryID = C.CategoryID WHERE (C.CategoryName = @CategoryName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCatName" Name="CategoryName" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="matchedProduct">
            <ItemTemplate>
                <table>
                   <tr>
                       <td>
                           Product Name : <%# Eval("ProductName") %>
                       </td>

                   </tr>
                   <tr>
                       <td>
                           Unit Price : <%# Eval("UnitPrice") %>
                       </td>

                   </tr>
                   
                    <tr><td></td></tr>
               </table>
            </ItemTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
