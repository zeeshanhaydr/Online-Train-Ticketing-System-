
<%@ page import="onlineTrainTicketingSystem.selectTrainData" %>
<%@ page import="onlineTrainTicketingSystem.Utility" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<body>
    <h2>Searched Successfully!</h2>
    <%--Soruce: https://github.com/rplano/book4_internet/ --%>

    <%
        // Extract User object from request parameters
        selectTrainData usr = (selectTrainData) Utility.extractObjectFromRequest(selectTrainData.class, request);
    %>

    <p>Origin <%= usr.getTrain1Selected()%></p>
    <p>Destination: <%= usr.getTrain2Selected()%></p>
    <p>Date: <%= usr.getDate()%></p>

</body>
</html>
