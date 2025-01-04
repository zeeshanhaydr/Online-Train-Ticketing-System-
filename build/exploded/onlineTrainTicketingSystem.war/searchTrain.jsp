<!--Created on Sun Apr 15 2024

@Author Zeeshan Haider
-->
<jsp:include page="navigation.jsp" />
<%@ page import="onlineTrainTicketingSystem.addTrainData" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="onlineTrainTicketingSystem.TrainDao" %>
<%@ page import="onlineTrainTicketingSystem.addTrainData" %>
<%@ page import="java.util.List" %>


<h2>Search Train</h2>

<form action="searchTrainLogic.jsp" method="post">
    Train Name: <input type="text" name="trainName" required>
    <input type="submit" value="Search">
</form>


