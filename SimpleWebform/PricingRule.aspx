<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PricingRule.aspx.cs" Inherits="WebForm.SimpleWebform.PricingRule" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pricing Rule Management</title>
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
        .chart-card { background:#fff; border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,0.06); padding:28px 32px; margin-bottom:32px; text-align:center; }
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
                    <div class="page-title">Pricing Rule Management</div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PRICINGID" DataSourceID="SqlDataSource1" GridLines="None" CssClass="styled-grid">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn" />
                            <asp:BoundField DataField="PRICINGID" HeaderText="Pricing ID" ReadOnly="True" SortExpression="PRICINGID" />
                            <asp:BoundField DataField="ISPUBLICHOLIDAY" HeaderText="Public Holiday" SortExpression="ISPUBLICHOLIDAY" />
                            <asp:BoundField DataField="PRICEMULTIPLIER" HeaderText="Multiplier" SortExpression="PRICEMULTIPLIER" />
                            <asp:BoundField DataField="ISRELEASEWEEK" HeaderText="Release Week" SortExpression="ISRELEASEWEEK" />
                            <asp:BoundField DataField="THEATRE_THEATREID" HeaderText="Theatre ID" SortExpression="THEATRE_THEATREID" />
                            <asp:BoundField DataField="MOVIE_MOVIEID1" HeaderText="Movie ID" SortExpression="MOVIE_MOVIEID1" />
                            <asp:BoundField DataField="SHOW_SHOWID" HeaderText="Show ID" SortExpression="SHOW_SHOWID" />
                        </Columns>
                        <AlternatingRowStyle CssClass="row-alt" />
                    </asp:GridView>
                </div>
                <div class="card-side">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PRICINGID" DataSourceID="SqlDataSource1" DefaultMode="ReadOnly" RenderOuterTable="false">
                        <EditItemTemplate>
                            <div class="form-title">Edit Pricing Rule</div>
                            <table>
                                <tr><td class="field-label">Pricing ID:</td><td><asp:Label ID="PRICINGIDLabel1" runat="server" Text='<%# Eval("PRICINGID") %>' /></td></tr>
                                <tr><td class="field-label">Public Holiday:</td><td><asp:TextBox ID="ISPUBLICHOLIDAYTextBox" runat="server" Text='<%# Bind("ISPUBLICHOLIDAY") %>' /></td></tr>
                                <tr><td class="field-label">Multiplier:</td><td><asp:TextBox ID="PRICEMULTIPLIERTextBox" runat="server" Text='<%# Bind("PRICEMULTIPLIER") %>' /></td></tr>
                                <tr><td class="field-label">Release Week:</td><td><asp:TextBox ID="ISRELEASEWEEKTextBox" runat="server" Text='<%# Bind("ISRELEASEWEEK") %>' /></td></tr>
                                <tr><td class="field-label">Theatre ID:</td><td><asp:TextBox ID="THEATRE_THEATREIDTextBox" runat="server" Text='<%# Bind("THEATRE_THEATREID") %>' /></td></tr>
                                <tr><td class="field-label">Movie ID:</td><td><asp:TextBox ID="MOVIE_MOVIEID1TextBox" runat="server" Text='<%# Bind("MOVIE_MOVIEID1") %>' /></td></tr>
                                <tr><td class="field-label">Show ID:</td><td><asp:TextBox ID="SHOW_SHOWIDTextBox" runat="server" Text='<%# Bind("SHOW_SHOWID") %>' /></td></tr>
                            </table>
                            <div style="margin-top:16px;">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn" />
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="form-title">Add New Pricing Rule</div>
                            <table>
                                <tr><td class="field-label">Pricing ID:</td><td><asp:TextBox ID="PRICINGIDTextBox" runat="server" Text='<%# Bind("PRICINGID") %>' /></td></tr>
                                <tr><td class="field-label">Public Holiday:</td><td><asp:TextBox ID="ISPUBLICHOLIDAYTextBox" runat="server" Text='<%# Bind("ISPUBLICHOLIDAY") %>' /></td></tr>
                                <tr><td class="field-label">Multiplier:</td><td><asp:TextBox ID="PRICEMULTIPLIERTextBox" runat="server" Text='<%# Bind("PRICEMULTIPLIER") %>' /></td></tr>
                                <tr><td class="field-label">Release Week:</td><td><asp:TextBox ID="ISRELEASEWEEKTextBox" runat="server" Text='<%# Bind("ISRELEASEWEEK") %>' /></td></tr>
                                <tr><td class="field-label">Theatre ID:</td><td><asp:TextBox ID="THEATRE_THEATREIDTextBox" runat="server" Text='<%# Bind("THEATRE_THEATREID") %>' /></td></tr>
                                <tr><td class="field-label">Movie ID:</td><td><asp:TextBox ID="MOVIE_MOVIEID1TextBox" runat="server" Text='<%# Bind("MOVIE_MOVIEID1") %>' /></td></tr>
                                <tr><td class="field-label">Show ID:</td><td><asp:TextBox ID="SHOW_SHOWIDTextBox" runat="server" Text='<%# Bind("SHOW_SHOWID") %>' /></td></tr>
                            </table>
                            <div style="margin-top:16px;">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn" />
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="form-title">Selected Pricing Rule</div>
                            <table>
                                <tr><td class="field-label">Pricing ID:</td><td><asp:Label ID="PRICINGIDLabel" runat="server" Text='<%# Eval("PRICINGID") %>' /></td></tr>
                                <tr><td class="field-label">Public Holiday:</td><td><asp:Label ID="ISPUBLICHOLIDAYLabel" runat="server" Text='<%# Eval("ISPUBLICHOLIDAY") %>' /></td></tr>
                                <tr><td class="field-label">Multiplier:</td><td><asp:Label ID="PRICEMULTIPLIERLabel" runat="server" Text='<%# Eval("PRICEMULTIPLIER") %>' /></td></tr>
                                <tr><td class="field-label">Release Week:</td><td><asp:Label ID="ISRELEASEWEEKLabel" runat="server" Text='<%# Eval("ISRELEASEWEEK") %>' /></td></tr>
                                <tr><td class="field-label">Theatre ID:</td><td><asp:Label ID="THEATRE_THEATREIDLabel" runat="server" Text='<%# Eval("THEATRE_THEATREID") %>' /></td></tr>
                                <tr><td class="field-label">Movie ID:</td><td><asp:Label ID="MOVIE_MOVIEID1Label" runat="server" Text='<%# Eval("MOVIE_MOVIEID1") %>' /></td></tr>
                                <tr><td class="field-label">Show ID:</td><td><asp:Label ID="SHOW_SHOWIDLabel" runat="server" Text='<%# Eval("SHOW_SHOWID") %>' /></td></tr>
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
            <div class="chart-card">
                <div class="page-title">Pricing Chart</div>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="PRICINGID" YValueMembers="SHOW_SHOWID" />
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" />
                    </ChartAreas>
                </asp:Chart>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;PRICINGRULE&quot; ORDER BY &quot;PRICINGID&quot; ASC"
                DeleteCommand="DELETE FROM &quot;PRICINGRULE&quot; WHERE &quot;PRICINGID&quot; = :PRICINGID"
                InsertCommand="INSERT INTO &quot;PRICINGRULE&quot; (&quot;PRICINGID&quot;, &quot;ISPUBLICHOLIDAY&quot;, &quot;PRICEMULTIPLIER&quot;, &quot;ISRELEASEWEEK&quot;, &quot;THEATRE_THEATREID&quot;, &quot;MOVIE_MOVIEID1&quot;, &quot;SHOW_SHOWID&quot;) VALUES (:PRICINGID, :ISPUBLICHOLIDAY, :PRICEMULTIPLIER, :ISRELEASEWEEK, :THEATRE_THEATREID, :MOVIE_MOVIEID1, :SHOW_SHOWID)"
                UpdateCommand="UPDATE &quot;PRICINGRULE&quot; SET &quot;ISPUBLICHOLIDAY&quot; = :ISPUBLICHOLIDAY, &quot;PRICEMULTIPLIER&quot; = :PRICEMULTIPLIER, &quot;ISRELEASEWEEK&quot; = :ISRELEASEWEEK, &quot;THEATRE_THEATREID&quot; = :THEATRE_THEATREID, &quot;MOVIE_MOVIEID1&quot; = :MOVIE_MOVIEID1, &quot;SHOW_SHOWID&quot; = :SHOW_SHOWID WHERE &quot;PRICINGID&quot; = :PRICINGID">
                <DeleteParameters>
                    <asp:Parameter Name="PRICINGID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PRICINGID" Type="Decimal" />
                    <asp:Parameter Name="ISPUBLICHOLIDAY" Type="String" />
                    <asp:Parameter Name="PRICEMULTIPLIER" Type="Decimal" />
                    <asp:Parameter Name="ISRELEASEWEEK" Type="Decimal" />
                    <asp:Parameter Name="THEATRE_THEATREID" Type="Decimal" />
                    <asp:Parameter Name="MOVIE_MOVIEID1" Type="Decimal" />
                    <asp:Parameter Name="SHOW_SHOWID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ISPUBLICHOLIDAY" Type="String" />
                    <asp:Parameter Name="PRICEMULTIPLIER" Type="Decimal" />
                    <asp:Parameter Name="ISRELEASEWEEK" Type="Decimal" />
                    <asp:Parameter Name="THEATRE_THEATREID" Type="Decimal" />
                    <asp:Parameter Name="MOVIE_MOVIEID1" Type="Decimal" />
                    <asp:Parameter Name="SHOW_SHOWID" Type="Decimal" />
                    <asp:Parameter Name="PRICINGID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="footer">Kumari Cinema Database Project &bull; ASP.NET WebForms &bull; Oracle</div>
    </form>
</body>
</html>