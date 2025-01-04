<%@ page import="onlineTrainTicketingSystem.LoginData" %>
<%@ page import="onlineTrainTicketingSystem.Utility" %>
<%@ page import="onlineTrainTicketingSystem.LoginDataDao" %>
<%@ page import="onlineTrainTicketingSystem.HibernateUtil" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.net.URLEncoder" %>

<%
   
    // Check if the user is already logged in
    if (session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn")) {
        response.sendRedirect("home.jsp"); // Redirect to dashboard if already logged in
    } else {
            String userName = request.getParameter("name");
            String password = request.getParameter("password");

        // Get Hibernate session factory from HibernateUtil class 
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

        // Authenticate user using the LoginDataDao with sessionFactory
        LoginDataDao loginDataDao = new LoginDataDao(sessionFactory);
        boolean isAuthenticated = loginDataDao.authenticateUser(userName, password);

        if (isAuthenticated) {
            // Set session attributes for authenticated user
            session.setAttribute("loggedIn", true);
            session.setAttribute("user", userName); // Save username in session
            
            // Redirect to appropriate dashboard based on user role
            if ("admin".equals(userName)) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("userDashboard.jsp");
            }
        } else {
            // Authentication failed, redirect back to login page with error message
            String errorMessage = URLEncoder.encode("Invalid username or password", "UTF-8");
            response.sendRedirect("login.jsp?error=" + errorMessage);
        }
    }
%>