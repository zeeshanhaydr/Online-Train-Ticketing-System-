package onlineTrainTicketingSystem;



public class selectTrainData {

    private String train1Selected;
    private String train2Selected;
    private String date;

    public selectTrainData() {

    }

    // Constructor
    public selectTrainData(String train1Selected, String train2Selected, String  Date) {
        this.train1Selected = train1Selected;
        this.train2Selected = train2Selected;
        this.date = Date;
    }

    // Getter and setter methods for train1Selected
    public String getTrain1Selected() {
        return train1Selected;
    }

    public void setTrain1Selected(String train1Selected) {
        this.train1Selected = train1Selected;
    }

    // Getter and setter methods for train2Selected
    public String getTrain2Selected() {
        return train2Selected;
    }

    public void setTrain2Selected(String train2Selected) {
        this.train2Selected = train2Selected;
    }

    // Getter and setter methods for selectedDate
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
