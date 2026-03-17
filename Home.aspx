<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebForm.Home" %>--%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<title>Kumari Cinema Database System </title>

<style>

body{
    margin:0;
    font-family:'Segoe UI', Arial;
    background:#eef2f7;
}

.header{
    background:linear-gradient(135deg,#1e293b,#0f172a);
    color:white;
    padding:40px;
    text-align:center;
    font-size:32px;
    font-weight:600;
    letter-spacing:1px;
}

.container{
    max-width:1100px;
    margin:auto;
    margin-top:40px;
}

.section{
    background:white;
    border-radius:12px;
    padding:35px;
    margin-bottom:35px;
    box-shadow:0 8px 20px rgba(0,0,0,0.06);
}

.section-title{
    text-align:center;
    font-size:22px;
    font-weight:600;
    margin-bottom:25px;
    color:#1f2937;
}

.button-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:18px;
}

.nav-btn{
    background:#1e293b;
    color:white;
    border:none;
    padding:16px;
    font-size:16px;
    border-radius:8px;
    cursor:pointer;
    transition:all 0.25s ease;
}

.nav-btn:hover{
    background:#2563eb;
    transform:translateY(-3px);
    box-shadow:0 6px 14px rgba(0,0,0,0.15);
}

.footer{
    text-align:center;
    margin-top:30px;
    padding:20px;
    color:#666;
    font-size:14px;
}

</style>

</head>

<body>

<form runat="server">

<div class="header">
Kumari Cinema Management System
</div>

<div class="container">

<!-- SIMPLE TABLES -->

<div class="section">

<div class="section-title">
Simple Webforms
</div>

<div class="button-grid">

<asp:Button CssClass="nav-btn" runat="server" Text="Users" PostBackUrl="~/SimpleWebform/User.aspx"/>
<asp:Button CssClass="nav-btn" runat="server" Text="Movies" PostBackUrl="~/SimpleWebform/Movie.aspx"/>
<asp:Button CssClass="nav-btn" runat="server" Text="Cinema" PostBackUrl="~/SimpleWebform/Cinema.aspx"/>
<asp:Button CssClass="nav-btn" runat="server" Text="Halls" PostBackUrl="~/SimpleWebform/Hall.aspx"/>
<asp:Button CssClass="nav-btn" runat="server" Text="Shows" PostBackUrl="~/SimpleWebform/Show.aspx"/>
<asp:Button CssClass="nav-btn" runat="server" Text="Bookings" PostBackUrl="~/SimpleWebform/Booking.aspx"/>
<asp:Button CssClass="nav-btn" runat="server" Text="Tickets" PostBackUrl="~/SimpleWebform/Ticket.aspx"/>
<asp:Button CssClass="nav-btn" runat="server" Text="Payments" PostBackUrl="~/SimpleWebform/Payment.aspx"/>
<asp:Button CssClass="nav-btn" runat="server" Text="Pricing Rules" PostBackUrl="~/SimpleWebform/PricingRule.aspx"/>

</div>

</div>

<!-- cpmple -->

<div class="section">

<div class="section-title">
Complex Webforms
</div>

<div class="button-grid">

<asp:Button CssClass="nav-btn" runat="server"
    Text="User Tickets"
    PostBackUrl="~/ComplexWebform/User_Ticket.aspx"/>

<asp:Button CssClass="nav-btn" runat="server"
    Text="Theater CityHall Movies"
    PostBackUrl="~/ComplexWebform/TheaterCityHall_Movie.aspx"/>

<asp:Button CssClass="nav-btn" runat="server"
    Text="Occupancy Performer"
    PostBackUrl="~/ComplexWebform/MovieTheatherCityHallOccupancyPerformer.aspx"/>

</div>

</div>

</div>

<div class="footer">
Movie Theater Database Project • ASP.NET WebForms • Oracle
</div>

</form>

</body>
</html>