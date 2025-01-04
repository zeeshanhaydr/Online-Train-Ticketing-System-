<%-- 
    Document   : contactUs
    Created on : May 2, 2024, 8:51:00 PM
    Author     : zeeshanhaider
--%>

<%@ page import="onlineTrainTicketingSystem.contactUsData" %>
<%@ page import="onlineTrainTicketing.Utility" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<body>    
      <%--Sorurce: https://github.com/rplano/book4_internet/--%>

<%
    // Extract User object from request parameters
    contactUsData usr = (contactUsData) Utility.extractObjectFromRequest(contactUsData.class, request);
%>

<p>User ID: <%= usr.getName()%></p>
<p>Password: <%= usr.getEmail()%></p>
<p>Password: <%= usr.getMessage()%></p>

</body>