<%-- 
    Document   : deleteTrainLogic
    Created on : Apr 28, 2024, 3:49:09 PM
    Author     : zeeshanhaider
--%>
<%@ page import="onlineTrainTicketingSystem.TrainDao" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String trainIdParam = request.getParameter("trainId");

    if (trainIdParam != null) {
        try {
            Long trainId = Long.parseLong(trainIdParam);
            TrainDao trainDao = new TrainDao();
            trainDao.deleteTrainById(trainId);
            out.println("Train deleted successfully!");
        } catch (NumberFormatException e) {
            out.println("Invalid train ID.");
        } catch (Exception e) {
            out.println("Error deleting train: " + e.getMessage());
            PrintWriter pw = new PrintWriter(out);
            e.printStackTrace(pw);
        }
    } else {
        out.println("Please provide the train ID to delete.");
    }
%>
<a href="home.jsp">Home</a>
