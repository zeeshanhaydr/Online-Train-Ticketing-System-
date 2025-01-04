package onlineTrainTicketingSystem;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Table;

@Entity
@Table(name = "AddTrains")
public class addTrainData implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "train_id")
    private Long id;

    @Column(name = "train_name")
    private String trainName;

    @Column(name = "departure")
    private String departure;

    @Column(name = "arrival")
    private String arrival;

    @Column(name = "price")
    private Double price;

    public addTrainData() {
    }

    // Constructor
    public addTrainData(String trainName, String departure, String arrival, Double price) {
        this.trainName = trainName;
        this.departure = departure;
        this.arrival = arrival;
        this.price = price;
    }

    // Getter methods for add train
    public Long getId() {
        return id;
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

    public Double getPrice() {
        return price;
    }

    // Setter methods for add train
    public void setId(Long id) {
        this.id = id;
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

    public void setPrice(Double price) {
        this.price = price;
    }
}
