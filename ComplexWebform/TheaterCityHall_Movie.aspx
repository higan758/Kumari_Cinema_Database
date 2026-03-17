<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheaterCityHall_Movie.aspx.cs" Inherits="WebForm.ComplexWebform.TheaterCityHall_Movie" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Theater CityHall Movie Search</title>
    <style>
        body { margin:0; font-family:'Segoe UI',Arial; background:#eef2f7; }
        .header { background:linear-gradient(135deg,#1e293b,#0f172a); color:#fff; padding:32px 0; text-align:center; font-size:2rem; font-weight:600; letter-spacing:1px; }
        .container { max-width:1100px; margin:36px auto; padding:0 16px; }
        .card { background:#fff; border-radius:12px; box-shadow:0 8px 20px rgba(0,0,0,0.06); padding:32px 36px; margin-bottom:32px; }
        .page-title { text-align:center; font-size:1.4rem; font-weight:600; color:#1f2937; margin-bottom:24px; }
        .back-link { display:inline-block; margin-bottom:18px; color:#2563eb; text-decoration:none; font-weight:500; }
        .back-link:hover { text-decoration:underline; }
        .search-section { display:flex; justify-content:center; align-items:center; gap:14px; margin-bottom:28px; flex-wrap:wrap; }
        .search-section label { font-weight:600; color:#334155; font-size:1rem; }
        .search-section input[type="text"] { padding:10px 14px; border:1px solid #cbd5e1; border-radius:6px; font-size:1rem; width:180px; }
        .search-btn { background:#1e293b; color:#fff; border:none; border-radius:6px; padding:10px 28px; font-size:1rem; font-weight:500; cursor:pointer; transition:background 0.2s; }
        .search-btn:hover { background:#2563eb; }
        .styled-grid { width:100%; border-collapse:collapse; }
        .styled-grid th { background:#1e293b; color:#fff; padding:12px 10px; text-align:left; font-weight:600; }
        .styled-grid td { padding:11px 10px; border-bottom:1px solid #e5e7eb; }
        .styled-grid tr.row-alt td { background:#f9fafb; }
        .styled-grid tr:hover td { background:#e8ecf3; }
        .footer { text-align:center; padding:20px; color:#94a3b8; font-size:0.85rem; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">Kumari Cinema Management System</div>
        <div class="container">
            <a href="../Home.aspx" class="back-link">&#8592; Back to Dashboard</a>
            <div class="card">
                <div class="page-title">Theater CityHall Movie Search</div>
                <div class="search-section">
                    <asp:Label ID="Label1" runat="server" Text="Cinema ID:" />
                    <asp:TextBox ID="txtCinemaID" runat="server" placeholder="Enter Cinema ID" />
                    <asp:Button ID="Button1" runat="server" Text="Search" CssClass="search-btn" />
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CINEMAID,HALLID,MOVIEID" DataSourceID="complex2" GridLines="None" CssClass="styled-grid">
                    <Columns>
                        <asp:BoundField DataField="CINEMAID" HeaderText="Cinema ID" ReadOnly="True" SortExpression="CINEMAID" />
                        <asp:BoundField DataField="CINEMANAME" HeaderText="Cinema" SortExpression="CINEMANAME" />
                        <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
                        <asp:BoundField DataField="HALLID" HeaderText="Hall ID" ReadOnly="True" SortExpression="HALLID" />
                        <asp:BoundField DataField="HALL_NAME" HeaderText="Hall" SortExpression="HALL_NAME" />
                        <asp:BoundField DataField="MOVIEID" HeaderText="Movie ID" ReadOnly="True" SortExpression="MOVIEID" />
                        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie" SortExpression="MOVIETITLE" />
                        <asp:BoundField DataField="GENRE" HeaderText="Genre" SortExpression="GENRE" />
                        <asp:BoundField DataField="LANGUAGE" HeaderText="Language" SortExpression="LANGUAGE" />
                        <asp:BoundField DataField="SHOWDATE" HeaderText="Show Date" SortExpression="SHOWDATE" />
                        <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" />
                    </Columns>
                    <AlternatingRowStyle CssClass="row-alt" />
                </asp:GridView>
                <asp:SqlDataSource ID="complex2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                    SelectCommand="SELECT c.CINEMAID, c.CINEMANAME, c.LOCATION, h.HALLID, h.HALL_NAME, m.MOVIEID, m.MOVIETITLE, m.GENRE, m.&quot;LANGUAGE&quot;, s.SHOWDATE, s.SHOWTIME FROM CINEMA c, HALL h, SHOW s, MOVIE m WHERE c.CINEMAID = h.CINEMA_CINEMAID AND h.HALLID = s.HALL_HALLID AND s.MOVIE_MOVIEID = m.MOVIEID AND (c.CINEMAID = :CinemaID) ORDER BY s.SHOWDATE, s.SHOWTIME">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtCinemaID" Name="CinemaID" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="footer">Kumari Cinema Database Project &bull; ASP.NET WebForms &bull; Oracle</div>
    </form>
</body>
</html>