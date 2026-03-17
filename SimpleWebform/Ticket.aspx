<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="WebForm.SimpleWebform.Ticket" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Management</title>
    <style>
        body { margin:0; font-family:'Segoe UI',Arial; background:#eef2f7; }
        .header { background:linear-gradient(135deg,#1e293b,#0f172a); color:#fff; padding:32px 0; text-align:center; font-size:2rem; font-weight:600; letter-spacing:1px; }
        .container { max-width:1280px; margin:36px auto; padding:0 16px; }
        .back-link { display:inline-block; margin-bottom:18px; color:#2563eb; text-decoration:none; font-weight:500; }
        .back-link:hover { text-decoration:underline; }
        .content-row { display:flex; gap:28px; align-items:flex-start; }
        .card { background:#fff; border-radius:12px; box-shadow:0 8px 20px rgba(0,0,0,0.06); padding:32px 36px; margin-bottom:32px; flex:1; min-width:0; }
        .card-side { background:#fff; border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,0.06); padding:28px 32px; margin-bottom:32px; width:340px; flex-shrink:0; position:sticky; top:36px; }
        .page-title { text-align:center; font-size:1.4rem; font-weight:600; color:#1f2937; margin-bottom:24px; }
        .styled-grid { width:100%; border-collapse:collapse; }
        .styled-grid th { background:#1e293b; color:#fff; padding:12px 10px; text-align:left; font-weight:600; }
        .styled-grid td { padding:11px 10px; border-bottom:1px solid #e5e7eb; }
        .styled-grid tr.row-alt td { background:#f9fafb; }
        .styled-grid tr:hover td { background:#e8ecf3; }
        .styled-grid a, .styled-grid input[type="submit"] { background:#1e293b; color:#fff; border:none; border-radius:5px; padding:6px 16px; font-size:0.95rem; cursor:pointer; text-decoration:none; display:inline-block; margin:2px; transition:background 0.2s; }
        .styled-grid a:hover, .styled-grid input[type="submit"]:hover { background:#2563eb; }
        .styled-grid input[type="text"] { padding:6px 8px; border:1px solid #cbd5e1; border-radius:4px; font-size:0.95rem; }
        .form-title { font-size:1.15rem; font-weight:600; color:#1e293b; margin-bottom:16px; }
        .card-side td { padding:8px 6px; vertical-align:middle; }
        .card-side .field-label { font-weight:600; color:#334155; min-width:110px; white-space:nowrap; }
        .card-side input[type="text"] { width:100%; padding:8px 10px; border:1px solid #cbd5e1; border-radius:6px; font-size:1rem; box-sizing:border-box; }
        .btn { background:#1e293b; color:#fff; border:none; border-radius:6px; padding:8px 22px; font-size:1rem; cursor:pointer; transition:background 0.2s; text-decoration:none; display:inline-block; margin:4px 4px 4px 0; }
        .btn:hover { background:#2563eb; }
        .btn-secondary { background:#64748b; }
        .btn-secondary:hover { background:#475569; }
        .btn-danger { background:#dc2626; }
        .btn-danger:hover { background:#b91c1c; }
        .footer { text-align:center; padding:20px; color:#94a3b8; font-size:0.85rem; }
        @media (max-width: 900px) {
            .content-row { flex-direction:column; }
            .card-side { width:100%; position:static; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">Kumari Cinema Management System</div>
        <div class="container">
            <a href="../Home.aspx" class="back-link">&#8592; Back to Dashboard</a>
            <div class="content-row">
                <div class="card">
                    <div class="page-title">Ticket Management</div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" GridLines="None" CssClass="styled-grid">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn" />
                            <asp:BoundField DataField="TICKETID" HeaderText="Ticket ID" ReadOnly="True" SortExpression="TICKETID" />
                            <asp:BoundField DataField="SEATNUMBER" HeaderText="Seat No" SortExpression="SEATNUMBER" />
                            <asp:BoundField DataField="SEATSTATUS" HeaderText="Seat Status" SortExpression="SEATSTATUS" />
                            <asp:BoundField DataField="SHOW_SHOWID" HeaderText="Show ID" SortExpression="SHOW_SHOWID" />
                            <asp:BoundField DataField="DISCOUNTEDPRICE" HeaderText="Disc. Price" SortExpression="DISCOUNTEDPRICE" />
                            <asp:BoundField DataField="BOOKING_BOOKINGID" HeaderText="Booking ID" SortExpression="BOOKING_BOOKINGID" />
                        </Columns>
                        <AlternatingRowStyle CssClass="row-alt" />
                    </asp:GridView>
                </div>
                <div class="card-side">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" DefaultMode="ReadOnly" RenderOuterTable="false">
                        <EditItemTemplate>
                            <div class="form-title">Edit Ticket</div>
                            <table>
                                <tr><td class="field-label">Ticket ID:</td><td><asp:Label ID="TICKETIDLabel1" runat="server" Text='<%# Eval("TICKETID") %>' /></td></tr>
                                <tr><td class="field-label">Seat No:</td><td><asp:TextBox ID="SEATNUMBERTextBox" runat="server" Text='<%# Bind("SEATNUMBER") %>' /></td></tr>
                                <tr><td class="field-label">Seat Status:</td><td><asp:TextBox ID="SEATSTATUSTextBox" runat="server" Text='<%# Bind("SEATSTATUS") %>' /></td></tr>
                                <tr><td class="field-label">Show ID:</td><td><asp:TextBox ID="SHOW_SHOWIDTextBox" runat="server" Text='<%# Bind("SHOW_SHOWID") %>' /></td></tr>
                                <tr><td class="field-label">Disc. Price:</td><td><asp:TextBox ID="DISCOUNTEDPRICETextBox" runat="server" Text='<%# Bind("DISCOUNTEDPRICE") %>' /></td></tr>
                                <tr><td class="field-label">Booking ID:</td><td><asp:TextBox ID="BOOKING_BOOKINGIDTextBox" runat="server" Text='<%# Bind("BOOKING_BOOKINGID") %>' /></td></tr>
                            </table>
                            <div style="margin-top:16px;">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn" />
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="form-title">Add New Ticket</div>
                            <table>
                                <tr><td class="field-label">Ticket ID:</td><td><asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' /></td></tr>
                                <tr><td class="field-label">Seat No:</td><td><asp:TextBox ID="SEATNUMBERTextBox" runat="server" Text='<%# Bind("SEATNUMBER") %>' /></td></tr>
                                <tr><td class="field-label">Seat Status:</td><td><asp:TextBox ID="SEATSTATUSTextBox" runat="server" Text='<%# Bind("SEATSTATUS") %>' /></td></tr>
                                <tr><td class="field-label">Show ID:</td><td><asp:TextBox ID="SHOW_SHOWIDTextBox" runat="server" Text='<%# Bind("SHOW_SHOWID") %>' /></td></tr>
                                <tr><td class="field-label">Disc. Price:</td><td><asp:TextBox ID="DISCOUNTEDPRICETextBox" runat="server" Text='<%# Bind("DISCOUNTEDPRICE") %>' /></td></tr>
                                <tr><td class="field-label">Booking ID:</td><td><asp:TextBox ID="BOOKING_BOOKINGIDTextBox" runat="server" Text='<%# Bind("BOOKING_BOOKINGID") %>' /></td></tr>
                            </table>
                            <div style="margin-top:16px;">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn" />
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="form-title">Selected Ticket</div>
                            <table>
                                <tr><td class="field-label">Ticket ID:</td><td><asp:Label ID="TICKETIDLabel" runat="server" Text='<%# Eval("TICKETID") %>' /></td></tr>
                                <tr><td class="field-label">Seat No:</td><td><asp:Label ID="SEATNUMBERLabel" runat="server" Text='<%# Eval("SEATNUMBER") %>' /></td></tr>
                                <tr><td class="field-label">Seat Status:</td><td><asp:Label ID="SEATSTATUSLabel" runat="server" Text='<%# Eval("SEATSTATUS") %>' /></td></tr>
                                <tr><td class="field-label">Show ID:</td><td><asp:Label ID="SHOW_SHOWIDLabel" runat="server" Text='<%# Eval("SHOW_SHOWID") %>' /></td></tr>
                                <tr><td class="field-label">Disc. Price:</td><td><asp:Label ID="DISCOUNTEDPRICELabel" runat="server" Text='<%# Eval("DISCOUNTEDPRICE") %>' /></td></tr>
                                <tr><td class="field-label">Booking ID:</td><td><asp:Label ID="BOOKING_BOOKINGIDLabel" runat="server" Text='<%# Eval("BOOKING_BOOKINGID") %>' /></td></tr>
                            </table>
                            <div style="margin-top:16px;">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn" />
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn" />
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;TICKET&quot; ORDER BY &quot;TICKETID&quot; ASC"
                DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKETID&quot; = :TICKETID"
                InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKETID&quot;, &quot;SEATNUMBER&quot;, &quot;SEATSTATUS&quot;, &quot;SHOW_SHOWID&quot;, &quot;DISCOUNTEDPRICE&quot;, &quot;BOOKING_BOOKINGID&quot;) VALUES (:TICKETID, :SEATNUMBER, :SEATSTATUS, :SHOW_SHOWID, :DISCOUNTEDPRICE, :BOOKING_BOOKINGID)"
                UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;SEATNUMBER&quot; = :SEATNUMBER, &quot;SEATSTATUS&quot; = :SEATSTATUS, &quot;SHOW_SHOWID&quot; = :SHOW_SHOWID, &quot;DISCOUNTEDPRICE&quot; = :DISCOUNTEDPRICE, &quot;BOOKING_BOOKINGID&quot; = :BOOKING_BOOKINGID WHERE &quot;TICKETID&quot; = :TICKETID">
                <DeleteParameters><asp:Parameter Name="TICKETID" Type="Decimal" /></DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TICKETID" Type="Decimal" />
                    <asp:Parameter Name="SEATNUMBER" Type="String" />
                    <asp:Parameter Name="SEATSTATUS" Type="String" />
                    <asp:Parameter Name="SHOW_SHOWID" Type="Decimal" />
                    <asp:Parameter Name="DISCOUNTEDPRICE" Type="Decimal" />
                    <asp:Parameter Name="BOOKING_BOOKINGID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SEATNUMBER" Type="String" />
                    <asp:Parameter Name="SEATSTATUS" Type="String" />
                    <asp:Parameter Name="SHOW_SHOWID" Type="Decimal" />
                    <asp:Parameter Name="DISCOUNTEDPRICE" Type="Decimal" />
                    <asp:Parameter Name="BOOKING_BOOKINGID" Type="Decimal" />
                    <asp:Parameter Name="TICKETID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="footer">Kumari Cinema Database Project &bull; ASP.NET WebForms &bull; Oracle</div>
    </form>
</body>
</html>