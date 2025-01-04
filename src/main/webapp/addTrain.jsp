<!-- Created on: April 15, 2024 -->
<!-- Author: Zeeshan Haider -->

<jsp:include page="navigation.jsp" />


<%
    // Check if user is logged in
    String user = (String) session.getAttribute("user");
    if (user != null && "admin".equals(user)) {
%>

<form action="addTrainLogic.jsp" method="post">
    Train Name: <input type="text" name="trainName" required><br>
    Departure: <input type="text" name="departure" required><br>
    Arrival: <input type="text" name="arrival" required><br>
    Price: <input type="text" name="price" required><br>
    <input type="submit" value="Add Train">
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