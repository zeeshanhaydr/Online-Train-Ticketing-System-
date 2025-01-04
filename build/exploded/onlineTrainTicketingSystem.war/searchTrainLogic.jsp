<%-- 
    Document   : search.jsp
    Created on : Apr 26, 2024, 9:35:21 PM
    Author     : zeeshanhaider
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="onlineTrainTicketingSystem.TrainDao" %>
<%@ page import="onlineTrainTicketingSystem.searchTrainData" %>
<%@ page import="onlineTrainTicketingSystem.addTrainData" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h2>Search Results</h2>

<% 
    String trainName = request.getParameter("trainName");
    TrainDao trainDao = new TrainDao();
    List<addTrainData> trainList = trainDao.searchTrainByName(trainName);
        
    if (trainList != null && !trainList.isEmpty()) {
%>
<table border="1">
    <thead>
        <tr>
            <th>Train ID</th>
            <th>Train Name</th>
            <th>Departure</th>
            <th>Arrival</th>
            <th>Price</th>
            <th>Select</th>
        </tr>
    </thead>
    <tbody>
        <% for (addTrainData train : trainList) { %>
        <tr>
            <td><%= train.getId() %></td>
            <td><%= train.getTrainName() %></td>
            <td><%= train.getDeparture() %></td>
            <td><%= train.getArrival() %></td>
            <td><%= train.getPrice() %></td>
            <td>
                <form action="payment.jsp" method="post">
                    <input type="hidden" name="trainId" value="<%= train.getId() %>">
                    <input type="hidden" name="trainName" value="<%= train.getTrainName() %>">
                    <input type="hidden" name="departure" value="<%= train.getDeparture() %>">
                    <input type="hidden" name="arrival" value="<%= train.getArrival() %>">
                    <input type="hidden" name="arrival" value="<%= train.getPrice() %>">
                    <input type="submit" value="Proceed to Payment">
                </form>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>
<a href="home.jsp">Home</a>

<% } else { %>
<p>No trains found.</p>
<% } %>
