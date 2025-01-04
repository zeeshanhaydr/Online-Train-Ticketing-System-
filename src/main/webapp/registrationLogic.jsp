<%@ page import="onlineTrainTicketingSystem.RegistrationData" %>
<%@ page import="onlineTrainTicketingSystem.RegistrationDataDao" %>
<%@ page import="onlineTrainTicketingSystem.Utility" %>
<%@ page import="onlineTrainTicketingSystem.PasswordUtil" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    Logger logger = LoggerFactory.getLogger("registrationLogic.jsp");
    logger.info("Registration form submission received.");

    // Proceed with processing registration information
    RegistrationData user = null;
    try {
        user = (RegistrationData) Utility.extractObjectFromRequest(RegistrationData.class, request);
        logger.info("Extracted user from request: " + user);
    } catch (Exception e) {
        logger.error("Failed to extract registration data from request.", e);
        response.sendRedirect("registration.jsp?error=" + URLEncoder.encode("Invalid registration data.", "UTF-8"));
        return;
    }

    // Validate input data
    if (user.getUserName() == null || user.getUserName().isEmpty() ||
        user.getPassword() == null || user.getPassword().isEmpty() ||
        user.getEmail() == null || user.getEmail().isEmpty()) {
        logger.info("Validation failed: Missing required fields.");
        response.sendRedirect("registration.jsp?error=" + URLEncoder.encode("All fields are required.", "UTF-8"));
        return;
    }

    // Hash the user's password before saving
    String hashedPassword = PasswordUtil.hashPassword(user.getPassword());
    user.setPassword(hashedPassword);
    logger.info("User password hashed.");

    // Use DAO to save the registration data
    RegistrationDataDao registrationDataDao = new RegistrationDataDao();
    boolean isRegistered = false;
    try {
        isRegistered = registrationDataDao.saveUser(user);
        logger.info("User registration status: " + isRegistered);
    } catch (Exception e) {
        logger.error("Registration failed.", e);
        response.sendRedirect("registration.jsp?error=" + URLEncoder.encode("Registration failed. Please try again later.", "UTF-8"));
        return;
    }

    if (isRegistered) {
        logger.info("Registration successful. Redirecting to login page.");
        response.sendRedirect("login.jsp");
    } else {
        // Redirect back to registration page with error message
        logger.info("Registration failed. Redirecting to registration page with error message.");
        response.sendRedirect("registration.jsp?error=" + URLEncoder.encode("Registration failed. Please try again.", "UTF-8"));
    }
%>
