<!--Created on Sun Apr 21 2024
   @Author Zeeshan Haider
-->

<jsp:include page="navigation.jsp" />

<form action="loginLogic.jsp" method="POST">
    <label for="name">Username:</label>
    <input type="text" id="name" name="name" required><br>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" required><br>

    <input type="submit" value="Login">
</form>
<p>Don't have an account? <a href="registration.jsp">Register here</a>.</p>
