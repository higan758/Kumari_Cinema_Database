<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cinema.aspx.cs" Inherits="WebForm.SimpleWebform.Cinema" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cinema Management</title>
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
                    <div class="page-title">Cinema Management</div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CINEMAID" DataSourceID="SqlDataSource1" GridLines="None" CssClass="styled-grid">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn" />
                            <asp:BoundField DataField="CINEMAID" HeaderText="Cinema ID" ReadOnly="True" SortExpression="CINEMAID" />
                            <asp:BoundField DataField="CINEMANAME" HeaderText="Name" SortExpression="CINEMANAME" />
                            <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
                            <asp:BoundField DataField="CONTACT_NO" HeaderText="Contact No" SortExpression="CONTACT_NO" />
                        </Columns>
                        <AlternatingRowStyle CssClass="row-alt" />
                    </asp:GridView>
                </div>
                <div class="card-side">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CINEMAID" DataSourceID="SqlDataSource1" DefaultMode="ReadOnly" RenderOuterTable="false">
                        <EditItemTemplate>
                            <div class="form-title">Edit Cinema</div>
                            <table>
                                <tr><td class="field-label">Cinema ID:</td><td><asp:Label ID="CINEMAIDLabel1" runat="server" Text='<%# Eval("CINEMAID") %>' /></td></tr>
                                <tr><td class="field-label">Name:</td><td><asp:TextBox ID="CINEMANAMETextBox" runat="server" Text='<%# Bind("CINEMANAME") %>' /></td></tr>
                                <tr><td class="field-label">Location:</td><td><asp:TextBox ID="LOCATIONTextBox" runat="server" Text='<%# Bind("LOCATION") %>' /></td></tr>
                                <tr><td class="field-label">Contact No:</td><td><asp:TextBox ID="CONTACT_NOTextBox" runat="server" Text='<%# Bind("CONTACT_NO") %>' /></td></tr>
                            </table>
                            <div style="margin-top:16px;">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn" />
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="form-title">Add New Cinema</div>
                            <table>
                                <tr><td class="field-label">Cinema ID:</td><td><asp:TextBox ID="CINEMAIDTextBox" runat="server" Text='<%# Bind("CINEMAID") %>' /></td></tr>
                                <tr><td class="field-label">Name:</td><td><asp:TextBox ID="CINEMANAMETextBox" runat="server" Text='<%# Bind("CINEMANAME") %>' /></td></tr>
                                <tr><td class="field-label">Location:</td><td><asp:TextBox ID="LOCATIONTextBox" runat="server" Text='<%# Bind("LOCATION") %>' /></td></tr>
                                <tr><td class="field-label">Contact No:</td><td><asp:TextBox ID="CONTACT_NOTextBox" runat="server" Text='<%# Bind("CONTACT_NO") %>' /></td></tr>
                            </table>
                            <div style="margin-top:16px;">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn" />
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="form-title">Selected Cinema</div>
                            <table>
                                <tr><td class="field-label">Cinema ID:</td><td><asp:Label ID="CINEMAIDLabel" runat="server" Text='<%# Eval("CINEMAID") %>' /></td></tr>
                                <tr><td class="field-label">Name:</td><td><asp:Label ID="CINEMANAMELabel" runat="server" Text='<%# Eval("CINEMANAME") %>' /></td></tr>
                                <tr><td class="field-label">Location:</td><td><asp:Label ID="LOCATIONLabel" runat="server" Text='<%# Eval("LOCATION") %>' /></td></tr>
                                <tr><td class="field-label">Contact No:</td><td><asp:Label ID="CONTACT_NOLabel" runat="server" Text='<%# Eval("CONTACT_NO") %>' /></td></tr>
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
                SelectCommand="SELECT * FROM &quot;CINEMA&quot; ORDER BY &quot;CINEMAID&quot; ASC"
                DeleteCommand="DELETE FROM &quot;CINEMA&quot; WHERE &quot;CINEMAID&quot; = :CINEMAID"
                InsertCommand="INSERT INTO &quot;CINEMA&quot; (&quot;CINEMAID&quot;, &quot;CINEMANAME&quot;, &quot;LOCATION&quot;, &quot;CONTACT_NO&quot;) VALUES (:CINEMAID, :CINEMANAME, :LOCATION, :CONTACT_NO)"
                UpdateCommand="UPDATE &quot;CINEMA&quot; SET &quot;CINEMANAME&quot; = :CINEMANAME, &quot;LOCATION&quot; = :LOCATION, &quot;CONTACT_NO&quot; = :CONTACT_NO WHERE &quot;CINEMAID&quot; = :CINEMAID">
                <DeleteParameters><asp:Parameter Name="CINEMAID" Type="Decimal" /></DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CINEMAID" Type="Decimal" />
                    <asp:Parameter Name="CINEMANAME" Type="String" />
                    <asp:Parameter Name="LOCATION" Type="String" />
                    <asp:Parameter Name="CONTACT_NO" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CINEMANAME" Type="String" />
                    <asp:Parameter Name="LOCATION" Type="String" />
                    <asp:Parameter Name="CONTACT_NO" Type="String" />
                    <asp:Parameter Name="CINEMAID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="footer">Kumari Cinema Database Project &bull; ASP.NET WebForms &bull; Oracle</div>
    </form>
</body>
</html>