<!--Created on Sun Apr 15 2024
        @Author Zeeshan Haider
-->

<jsp:include page="navigation.jsp" />



<form action="selectTrainLogic.jsp" method="post">
    <legend>Train Options</legend>
    <input type="checkbox" id="train1Selected" name="train1Selected" value="train1">
    <label for="train1Selected">Train 1 - Departing at 2 O'clock</label><br>
    <input type="checkbox" id="train2Selected" name="train2Selected" value="train2">
    <label for="train2Selected">Train 2 - Departing at 12 O'clock</label><br>

    <label for="date">Select Date:</label><br>
    <input type="date" id="date" name="date" required><br>

    <input type="submit" value="Proceed">
</form>

