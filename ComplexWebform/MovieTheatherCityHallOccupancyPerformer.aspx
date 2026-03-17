<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieTheatherCityHallOccupancyPerformer.aspx.cs" Inherits="WebForm.ComplexWebform.MovieTheatherCityHallOccupancyPerformer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Occupancy Performer Search</title>
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
                <div class="page-title">Movie Occupancy Performer</div>
                <div class="search-section">
                    <asp:Label ID="Label1" runat="server" Text="Movie ID:" />
                    <asp:TextBox ID="txtMovieID" runat="server" placeholder="Enter Movie ID" />
                    <asp:Button ID="Button1" runat="server" Text="Search" CssClass="search-btn" />
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="complex3" GridLines="None" CssClass="styled-grid">
                    <Columns>
                        <asp:BoundField DataField="CINEMANAME" HeaderText="Cinema" SortExpression="CINEMANAME" />
                        <asp:BoundField DataField="HALL_NAME" HeaderText="Hall" SortExpression="HALL_NAME" />
                        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie" SortExpression="MOVIETITLE" />
                        <asp:BoundField DataField="TICKETSSOLD" HeaderText="Tickets Sold" SortExpression="TICKETSSOLD" />
                        <asp:BoundField DataField="HALLCAPACITY" HeaderText="Capacity" SortExpression="HALLCAPACITY" />
                        <asp:BoundField DataField="OCCUPANCYPERCENTAGE" HeaderText="Occupancy %" SortExpression="OCCUPANCYPERCENTAGE" />
                    </Columns>
                    <AlternatingRowStyle CssClass="row-alt" />
                </asp:GridView>
                <asp:SqlDataSource ID="complex3" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                    SelectCommand="SELECT c.CINEMANAME, h.HALL_NAME, m.MOVIETITLE, COUNT(t.TICKETID) AS TicketsSold, h.HALLCAPACITY, ROUND(COUNT(t.TICKETID) / h.HALLCAPACITY * 100, 2) AS OccupancyPercentage FROM MOVIE m, SHOW s, HALL h, CINEMA c, TICKET t, BOOKING b, PAYMENT p WHERE m.MOVIEID = s.MOVIE_MOVIEID AND s.HALL_HALLID = h.HALLID AND h.CINEMA_CINEMAID = c.CINEMAID AND s.SHOWID = t.SHOW_SHOWID AND t.BOOKING_BOOKINGID = b.BOOKINGID AND b.BOOKINGID = p.BOOKING_BOOKINGID AND (m.MOVIEID = :MovieID) AND (p.PAYMENTSTATUS = 'Completed') GROUP BY c.CINEMANAME, h.HALL_NAME, m.MOVIETITLE, h.HALLCAPACITY ORDER BY OccupancyPercentage DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtMovieID" Name="MovieID" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="footer">Kumari Cinema Database Project &bull; ASP.NET WebForms &bull; Oracle</div>
    </form>
</body>
</html>