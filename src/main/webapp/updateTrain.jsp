<!--Created on  Apr 15 2024
  
   @Author Zeeshan Haider
-->
<%@ page import="onlineTrainTicketingSystem.LoginData" %>
<%@ page import="onlineTrainTicketingSystem.updateTrainData" %>
<%@ page import="onlineTrainTicketingSystem.Utility" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<jsp:include page="navigation.jsp" />

<%
    // Check if user is logged in
    String user = (String) session.getAttribute("user");
    if (user != null && "admin".equals(user)) {
        // Extract Payment object from request parameters
        // paymentData payment = (paymentData) Utility.extractObjectFromRequest(paymentData.class, request); 
       // response.sendRedirect("payment.jsp");
%>
<form action="updateTrainLogic.jsp" method="post">
    Train ID: <input type="text" name="trainId" required><br>
    Train Name: <input type="text" name="trainName" required><br>
    Departure: <input type="text" name="departure" required><br>
    Arrival: <input type="text" name="arrival" required><br>
    <input type="submit" value="Update Train">
</form>
<%
     
   } else {
       // session.removeAttribute("loggedIn");
       // session.removeAttribute("user");
       // Invalidate the session to clear all session data
       // session.invalidate();
       // Redirect to login page if not logged in or not "zeeshan"
       response.sendRedirect("errorMessage.jsp");
       return; // Ensure no further code is executed
   }// Proceed with displaying payment details
%>
