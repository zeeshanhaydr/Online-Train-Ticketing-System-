package onlineTrainTicketingSystem;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Table;

/**
 * Hibernate entity for updating train data
 */
@Entity
@Table(name = "UpdateTrains")
public class updateTrainData implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "train_id")
    private Long trainId;

    @Column(name = "train_name")
    private String trainName;

    @Column(name = "departure")
    private String departure;

    @Column(name = "arrival")
    private String arrival;

    public updateTrainData() {
    }

    // Constructor
    public updateTrainData(Long trainId, String trainName, String departure, String arrival) {
        this.trainId = trainId;
        this.trainName = trainName;
        this.departure = departure;
        this.arrival = arrival;
    }

    // Getter methods
    public Long getId() {
        return id;
    }

    public Long getTrainId() {
        return trainId;
    }

    public String getTrainName() {
        return trainName;
    }

    public String getDeparture() {
        return departure;
    }

    public String getArrival() {
        return arrival;
    }

    // Setter methods
    public void setId(Long id) {
        this.id = id;
    }

    public void setTrainId(Long trainId) {
        this.trainId = trainId;
    }

    public void setTrainName(String trainName) {
        this.trainName = trainName;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival;
    }
}
