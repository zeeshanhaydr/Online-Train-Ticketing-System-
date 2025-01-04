package onlineTrainTicketingSystem;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Table;

/**
 * Hibernate entity for train deletion data
 */
@Entity
@Table(name = "DeleteTrains")
public class deleteTrainData implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "delete_id")
    private Long id;

    @Column(name = "train_name")
    private String deleteTrain;

    public deleteTrainData() {
    }

    // Constructor
    public deleteTrainData(String deleteTrain) {
        this.deleteTrain = deleteTrain;
    }

    // Getter methods
    public Long getId() {
        return id;
    }

    public String getDeleteTrain() {
        return deleteTrain;
    }

    // Setter methods
    public void setId(Long id) {
        this.id = id;
    }

    public void setDeleteTrain(String deleteTrain) {
        this.deleteTrain = deleteTrain;
    }
}
