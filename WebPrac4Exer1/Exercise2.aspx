<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exercise2.aspx.cs" Inherits="WebPrac4Exer1.Exercise2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 287px;
        }
        .auto-style2 {
            width: 187px;
        }
        .auto-style3 {
            width: 323px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Sales Order Information By Staff.<br />
        <br />
    <table>
        <tr>
            <td>Please select staff name :</td>
            <td>Please select a year :</td>
        </tr>

        <tr>
            <td>
                <asp:DropDownList ID="ddlStaffName" runat="server" Height="24px" Width="218px" DataSourceID="SqlDataSource3" DataTextField="StaffName" DataValueField="EmployeeID">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RadioButtonList ID="rblYear" runat="server" DataSourceID="SqlDataSource2" DataTextField="OrderYear" DataValueField="OrderYear">
                </asp:RadioButtonList>
            </td>
        </tr>

        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT FirstName + ' ' + LastName AS StaffName, EmployeeID FROM Employees"></asp:SqlDataSource>


                    </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />


                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT DISTINCT YEAR (OrderDate) AS OrderYear FROM ORDERS,EMPLOYEES WHERE ORDERS.EmployeeID = EMPLOYEES.EmployeeID ORDER BY OrderYear ASC "></asp:SqlDataSource>


            </td>
        </tr>

    </table>


    </div>

        <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="lblTitleGridView" runat="server" Text=""></asp:Label>
        <table>
            <tr>
                <td class="auto-style3" rowspan="2" >
                    <asp:GridView ID="GridView1" runat="server" Height="189px" Width="293px" AutoGenerateColumns="False" DataKeyNames="OrderID,EmployeeID" DataSourceID="SqlDataSource4">
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                        </Columns>
                    </asp:GridView>
                </td>

                <td class="auto-style1">
                    <asp:Label ID="lblOldSales" runat="server" Text=""></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT Orders.OrderID, Orders.OrderDate, Employees.EmployeeID FROM Employees INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID WHERE (Orders.EmployeeID = @EmployeeID) AND (YEAR(Orders.OrderDate) = @year)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlStaffName" Name="EmployeeID" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="rblYear" Name="year" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <asp:DataList ID="DataList1" runat="server" Width="175px">
                        <ItemTemplate>
                            Product Name :<br /> Unit Price :<br /> Quantity :<br /> Discount :<br /> Sales :
                        </ItemTemplate>
                    </asp:DataList></td>
            </tr>
        </table>
        </asp:Panel>
    </form>
</body>
</html>
