<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="WebForm.SimpleWebform.Movie" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Management</title>
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
                    <div class="page-title">Movie Management</div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" GridLines="None" CssClass="styled-grid">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn" />
                            <asp:BoundField DataField="MOVIEID" HeaderText="Movie ID" ReadOnly="True" SortExpression="MOVIEID" />
                            <asp:BoundField DataField="MOVIETITLE" HeaderText="Title" SortExpression="MOVIETITLE" />
                            <asp:BoundField DataField="DURATION" HeaderText="Duration" SortExpression="DURATION" />
                            <asp:BoundField DataField="LANGUAGE" HeaderText="Language" SortExpression="LANGUAGE" />
                            <asp:BoundField DataField="GENRE" HeaderText="Genre" SortExpression="GENRE" />
                            <asp:BoundField DataField="RELEASEDATE" HeaderText="Release Date" SortExpression="RELEASEDATE" />
                            <asp:BoundField DataField="HALL_HALLID" HeaderText="Hall ID" SortExpression="HALL_HALLID" />
                        </Columns>
                        <AlternatingRowStyle CssClass="row-alt" />
                    </asp:GridView>
                </div>
                <div class="card-side">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" DefaultMode="ReadOnly" RenderOuterTable="false">
                        <EditItemTemplate>
                            <div class="form-title">Edit Movie</div>
                            <table>
                                <tr><td class="field-label">Movie ID:</td><td><asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' /></td></tr>
                                <tr><td class="field-label">Title:</td><td><asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' /></td></tr>
                                <tr><td class="field-label">Duration:</td><td><asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' /></td></tr>
                                <tr><td class="field-label">Language:</td><td><asp:TextBox ID="LANGUAGETextBox" runat="server" Text='<%# Bind("LANGUAGE") %>' /></td></tr>
                                <tr><td class="field-label">Genre:</td><td><asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' /></td></tr>
                                <tr><td class="field-label">Release Date:</td><td><asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' /></td></tr>
                                <tr><td class="field-label">Hall ID:</td><td><asp:TextBox ID="HALL_HALLIDTextBox" runat="server" Text='<%# Bind("HALL_HALLID") %>' /></td></tr>
                            </table>
                            <div style="margin-top:16px;">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn" />
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="form-title">Add New Movie</div>
                            <table>
                                <tr><td class="field-label">Movie ID:</td><td><asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' /></td></tr>
                                <tr><td class="field-label">Title:</td><td><asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' /></td></tr>
                                <tr><td class="field-label">Duration:</td><td><asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' /></td></tr>
                                <tr><td class="field-label">Language:</td><td><asp:TextBox ID="LANGUAGETextBox" runat="server" Text='<%# Bind("LANGUAGE") %>' /></td></tr>
                                <tr><td class="field-label">Genre:</td><td><asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' /></td></tr>
                                <tr><td class="field-label">Release Date:</td><td><asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' /></td></tr>
                                <tr><td class="field-label">Hall ID:</td><td><asp:TextBox ID="HALL_HALLIDTextBox" runat="server" Text='<%# Bind("HALL_HALLID") %>' /></td></tr>
                            </table>
                            <div style="margin-top:16px;">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn" />
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="form-title">Selected Movie</div>
                            <table>
                                <tr><td class="field-label">Movie ID:</td><td><asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Eval("MOVIEID") %>' /></td></tr>
                                <tr><td class="field-label">Title:</td><td><asp:Label ID="MOVIETITLELabel" runat="server" Text='<%# Eval("MOVIETITLE") %>' /></td></tr>
                                <tr><td class="field-label">Duration:</td><td><asp:Label ID="DURATIONLabel" runat="server" Text='<%# Eval("DURATION") %>' /></td></tr>
                                <tr><td class="field-label">Language:</td><td><asp:Label ID="LANGUAGELabel" runat="server" Text='<%# Eval("LANGUAGE") %>' /></td></tr>
                                <tr><td class="field-label">Genre:</td><td><asp:Label ID="GENRELabel" runat="server" Text='<%# Eval("GENRE") %>' /></td></tr>
                                <tr><td class="field-label">Release Date:</td><td><asp:Label ID="RELEASEDATELabel" runat="server" Text='<%# Eval("RELEASEDATE") %>' /></td></tr>
                                <tr><td class="field-label">Hall ID:</td><td><asp:Label ID="HALL_HALLIDLabel" runat="server" Text='<%# Eval("HALL_HALLID") %>' /></td></tr>
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
                SelectCommand="SELECT * FROM &quot;MOVIE&quot; ORDER BY &quot;MOVIEID&quot; ASC"
                DeleteCommand="DELETE FROM &quot;MOVIE&quot; WHERE &quot;MOVIEID&quot; = :MOVIEID"
                InsertCommand="INSERT INTO &quot;MOVIE&quot; (&quot;MOVIEID&quot;, &quot;MOVIETITLE&quot;, &quot;DURATION&quot;, &quot;LANGUAGE&quot;, &quot;GENRE&quot;, &quot;RELEASEDATE&quot;, &quot;HALL_HALLID&quot;) VALUES (:MOVIEID, :MOVIETITLE, :DURATION, :LANGUAGE, :GENRE, :RELEASEDATE, :HALL_HALLID)"
                UpdateCommand="UPDATE &quot;MOVIE&quot; SET &quot;MOVIETITLE&quot; = :MOVIETITLE, &quot;DURATION&quot; = :DURATION, &quot;LANGUAGE&quot; = :LANGUAGE, &quot;GENRE&quot; = :GENRE, &quot;RELEASEDATE&quot; = :RELEASEDATE, &quot;HALL_HALLID&quot; = :HALL_HALLID WHERE &quot;MOVIEID&quot; = :MOVIEID">
                <DeleteParameters>
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="MOVIETITLE" Type="String" />
                    <asp:Parameter Name="DURATION" Type="String" />
                    <asp:Parameter Name="LANGUAGE" Type="String" />
                    <asp:Parameter Name="GENRE" Type="String" />
                    <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
                    <asp:Parameter Name="HALL_HALLID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MOVIETITLE" Type="String" />
                    <asp:Parameter Name="DURATION" Type="String" />
                    <asp:Parameter Name="LANGUAGE" Type="String" />
                    <asp:Parameter Name="GENRE" Type="String" />
                    <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
                    <asp:Parameter Name="HALL_HALLID" Type="Decimal" />
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="footer">Kumari Cinema Database Project &bull; ASP.NET WebForms &bull; Oracle</div>
    </form>
</body>
</html>