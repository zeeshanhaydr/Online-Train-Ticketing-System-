<!--Created on Sun Apr 25 2024
  
   @Author Zeeshan Haider
-->
<jsp:include page="navigation.jsp" />

<form action="registrationLogic.jsp" method="post">
    <label for="userName">Username:</label>
    <input type="text" id="userName" name="userName" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>

    <input type="submit" value="Register">
</form>
<p>Already have an account? <a href="login.jsp">Login here</a>.</p>
