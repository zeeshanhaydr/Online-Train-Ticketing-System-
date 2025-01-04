<%@ page import="onlineTrainTicketingSystem.addTrainData" %>
<%@ page import="onlineTrainTicketingSystem.TrainDao" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String trainName = request.getParameter("trainName");
    String departure = request.getParameter("departure");
    String arrival = request.getParameter("arrival");
    String priceStr = request.getParameter("price");

    if (trainName != null && departure != null && arrival != null && priceStr != null) {
        try {
            Double price = Double.parseDouble(priceStr);
            addTrainData train = new addTrainData(trainName, departure, arrival, price);
            TrainDao trainDao = new TrainDao();
            trainDao.saveTrain(train);
            out.println("<p>Train added successfully!</p>");
        } catch (NumberFormatException e) {
            out.println("<p>Invalid price. Please enter a valid number.</p>");
        }
    } else {
        out.println("<p>Please provide all train details.</p>");
    }
%>
<a href="addTrain.jsp">Go back to Add Train</a>
