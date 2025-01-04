<!--Created on  Apr 15 2024
  
   @Author Zeeshan Haider
-->

<jsp:include page="navigation.jsp" />

        
        <form action="contactUs.jsp" method="post">
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name" required><br><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="message">Message:</label><br>
            <textarea id="message" name="message" rows="4" cols="50" required></textarea><br><br>

            <input type="submit" value="Submit">
        </form>
