<%-- 
    Document   : updateTrainLogic
    Created on : Apr 28, 2024, 3:49:09 PM
    Author     : zeeshanhaider
--%>

<%@ page import="onlineTrainTicketingSystem.addTrainData" %>
<%@ page import="onlineTrainTicketingSystem.TrainDao" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String trainIdParam = request.getParameter("trainId");
    String trainName = request.getParameter("trainName");
    String departure = request.getParameter("departure");
    String arrival = request.getParameter("arrival");

    if (trainIdParam != null && trainName != null && departure != null && arrival != null) {
        try {
            Long trainId = Long.parseLong(trainIdParam);
            TrainDao trainDao = new TrainDao();
            addTrainData train = trainDao.getTrainById(trainId);

            if (train != null) {
                train.setTrainName(trainName);
                train.setDeparture(departure);
                train.setArrival(arrival);
                trainDao.updateTrain(train);
                out.println("Train details updated successfully!");
            } else {
                out.println("Train not found with ID: " + trainId);
            }
        } catch (NumberFormatException e) {
            out.println("Invalid train ID.");
        } catch (Exception e) {
            out.println("Error updating train: " + e.getMessage());
        }
    } else {
        out.println("Please provide all train details.");
    }
%>

<%--
<%
    // Check if user is logged in
    
    String user = (String) session.getAttribute("user");
    if (user != null && "admin".equals(user)) {
        // Extract Payment object from request parameters
        // paymentData payment = (paymentData) Utility.extractObjectFromRequest(paymentData.class, request); 
        response.sendRedirect("deleteTrain.jsp");
    } else {
        // Redirect to login page if not logged in or not "zeeshan"
        response.sendRedirect("login.jsp");
        return; // Ensure no further code is executed
    }// Proceed with displaying payment details
   
%>

--%>