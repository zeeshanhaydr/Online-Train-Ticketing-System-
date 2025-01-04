<%-- 
    Document   : logout.jsp
    Created on : May 23, 2024, 4:40:54 PM
    Author     : zeeshanhaider
--%>
<%@ page import="onlineTrainTicketingSystem.LoginData" %>
<%@ page import="onlineTrainTicketingSystem.Utility" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--<jsp:include page="paymentLogic.jsp" />--%>


<%
    // Remove the user attribute from the session
    session.removeAttribute("loggedIn");
    session.removeAttribute("user");
    
    // Invalidate the session to clear all session data
    session.invalidate();
    
    response.sendRedirect("login.jsp");
    return;
%>