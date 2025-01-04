<%-- 
    Document   : paymentLogic
    Created on : Apr 29, 2024, 10:16:17 PM
--%>
<%@ page import="onlineTrainTicketingSystem.PaymentData" %>
<%@ page import="onlineTrainTicketingSystem.PaymentDao" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String cardNumber = request.getParameter("cardNumber");
    String expiryDate = request.getParameter("expiryDate");
    String cvv = request.getParameter("cvv");
    String amount = request.getParameter("amount");

    if (cardNumber != null && expiryDate != null && cvv != null && amount != null) {
        PaymentData payment = new PaymentData(cardNumber, expiryDate, cvv, amount);
        PaymentDao paymentDao = new PaymentDao(); // Instantiate PaymentDao
        paymentDao.savePayment(payment); // Call savePayment method
        out.println("Payment processed successfully!");
    } else {
        out.println("Select Train First.");
    }
%>
<a href="searchTrain.jsp">Search Train</a>
<%--
<%
    
    String user = (String) session.getAttribute("user");
    if (user != null && "zeeshan".equals(user)) {  
    // paymentData payment = (paymentData) Utility.extractObjectFromRequest(paymentData.class, request); 
        response.sendRedirect("payment.jsp");
    } else {
      
        response.sendRedirect("login.jsp");
        return; 
    }
   
%>


<%-- 
<html>
    <body>        
        <p>User ID: <%= usr.getCardNumber() %></p>
        <p>Expiry Date: <%= usr.getExpiryDate() %></p>
        <p>CVV: <%= usr.getCvv() %></p>
        <p>Amount: <%= usr.getAmount() %></p>
        
        <!-- You can include additional logic here, such as processing the payment -->
    </body>
</html>
--%>