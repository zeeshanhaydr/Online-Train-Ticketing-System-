package onlineTrainTicketingSystem;

public class searchTrainData {

    private String trainName;
    private String departure;
    private String arrival;

    // Constructors, getters, and setters
    public searchTrainData() {
    }

    public searchTrainData(String trainName, String departure, String arrival) {
        this.trainName = trainName;
        this.departure = departure;
        this.arrival = arrival;
    }

    public String getTrainName() {
        return trainName;
    }

    public void setTrainName(String trainName) {
        this.trainName = trainName;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getArrival() {
        return arrival;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival;
    }
}
