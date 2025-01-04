<%@ page import="onlineTrainTicketingSystem.ChangePasswordData" %>
<%@ page import="onlineTrainTicketingSystem.Utility" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<jsp:include page="navigation.jsp" />

<%
    // Check if user is logged in
    if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
        // Redirect to login page if not logged in
        response.sendRedirect("login.jsp");
        return; // Ensure no further code is executed
    } else {
        // Retrieve the user object from the session
        Object userObj = session.getAttribute("user");
        if (userObj instanceof ChangePasswordData) {
            ChangePasswordData usr = (ChangePasswordData) userObj;
            // Proceed with displaying protected content

            // Extract ChangePasswordData object from request parameters
 
            
            ChangePasswordData changePasswordData = (ChangePasswordData) Utility.extractObjectFromRequest(ChangePasswordData.class, request);
%>

<!-- HTML content -->
<p>Current Password: <%= changePasswordData.getPassword() %></p>
<p>New Password: <%= changePasswordData.getNewPassword1() %></p>
<p>Repeat Password: <%= changePasswordData.getNewPassword2() %></p>

<%
        } else {
  
             // Handle error: User object in session is not of type ChangePasswordData
            // You can redirect to an error page or handle it as per your application's logic 
                        response.sendRedirect("changePassword.jsp");
                        return;    
        }
    }
%>
