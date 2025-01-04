<!--Created on Sun Apr 21 2024
 @Author Zeeshan Haider
-->
<%@ page import="onlineTrainTicketingSystem.LoginData" %>
<%@ page import="onlineTrainTicketingSystem.PaymentData" %>
<%@ page import="onlineTrainTicketingSystem.Utility" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<jsp:include page="navigation.jsp" />


<h2>Payment Page</h2>    
<%
    String trainId = request.getParameter("trainId");
    String trainName = request.getParameter("trainName");
    String departure = request.getParameter("departure");
    String arrival = request.getParameter("arrival");
%>

<form action="paymentLogic.jsp" method="post">
    <input type="hidden" name="trainId" value="<%= trainId %>">
    <input type="hidden" name="trainName" value="<%= trainName %>">
    <input type="hidden" name="departure" value="<%= departure %>">
    <input type="hidden" name="arrival" value="<%= arrival %>">

    <!-- Add payment details here -->
    Card Number: <input type="text" name="cardNumber" required><br>
    Expiry Date: <input type="text" name="expiryDate" required><br>
    CVV: <input type="text" name="cvv" required><br>
    Amount <input type="text" name="amount" required><br>
    <input type="submit" value="Pay Now">
</form>


<%--
<%
    // Check if user is logged in
    String user = (String) session.getAttribute("user");
    if (user != null && "zeeshan".equals(user)) {
        // Extract Payment object from request parameters
        // paymentData payment = (paymentData) Utility.extractObjectFromRequest(paymentData.class, request); 
       // response.sendRedirect("payment.jsp");
%>
    <form action="payment.jsp" method="post">
    <label for="cardNumber">Card Number:</label>
    <input type="text" id="cardNumber" name="cardNumber" required><br>

    <label for="expiryDate">Expiry Date:</label>
    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required><br>

    <label for="cvv">CVV:</label>
    <input type="password" id="cvv" name="cvv" required><br>

    <label for="amount">Amount:</label>
    <input type="text" id="amount" name="amount" required><br>

    <input type="submit" value="Pay Now">
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

--%>