<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Ticket.aspx.cs" Inherits="WebForm.ComplexWebform.User_Ticket" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Ticket Search</title>
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
                <div class="page-title">User Ticket Search</div>
                <div class="search-section">
                    <asp:Label ID="Label1" runat="server" Text="User ID:" />
                    <asp:TextBox ID="txtUserID" runat="server" placeholder="Enter User ID" />
                    <asp:Button ID="Button1" runat="server" Text="Search" CssClass="search-btn" />
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="USERID,BOOKINGID,TICKETID" DataSourceID="Complex1" GridLines="None" CssClass="styled-grid">
                    <Columns>
                        <asp:BoundField DataField="USERID" HeaderText="User ID" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="NAME" HeaderText="Name" SortExpression="NAME" />
                        <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                        <asp:BoundField DataField="Phone Number" HeaderText="Phone" SortExpression="Phone Number" />
                        <asp:BoundField DataField="BOOKINGID" HeaderText="Booking ID" ReadOnly="True" SortExpression="BOOKINGID" />
                        <asp:BoundField DataField="BOOKINGTIME" HeaderText="Booking Time" SortExpression="BOOKINGTIME" />
                        <asp:BoundField DataField="TICKETID" HeaderText="Ticket ID" ReadOnly="True" SortExpression="TICKETID" />
                        <asp:BoundField DataField="SEATNUMBER" HeaderText="Seat" SortExpression="SEATNUMBER" />
                        <asp:BoundField DataField="SEATSTATUS" HeaderText="Status" SortExpression="SEATSTATUS" />
                        <asp:BoundField DataField="SHOWDATE" HeaderText="Show Date" SortExpression="SHOWDATE" />
                        <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" />
                        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie" SortExpression="MOVIETITLE" />
                    </Columns>
                    <AlternatingRowStyle CssClass="row-alt" />
                </asp:GridView>
                <asp:SqlDataSource ID="Complex1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                    SelectCommand="SELECT u.USERID, u.NAME, u.EMAIL, u.&quot;Phone Number&quot;, b.BOOKINGID, b.BOOKINGTIME, t.TICKETID, t.SEATNUMBER, t.SEATSTATUS, s.SHOWDATE, s.SHOWTIME, m.MOVIETITLE FROM &quot;User&quot; u, BOOKING b, TICKET t, SHOW s, MOVIE m WHERE u.USERID = b.USER_USERID AND b.BOOKINGID = t.BOOKING_BOOKINGID AND t.SHOW_SHOWID = s.SHOWID AND s.MOVIE_MOVIEID = m.MOVIEID AND (u.USERID = :UserID) AND (b.BOOKINGTIME &gt;= ADD_MONTHS(SYSDATE, - 6)) ORDER BY b.BOOKINGTIME DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtUserID" Name="UserID" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="footer">Kumari Cinema Database Project &bull; ASP.NET WebForms &bull; Oracle</div>
    </form>
</body>
</html>