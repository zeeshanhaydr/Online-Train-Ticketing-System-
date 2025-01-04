package onlineTrainTicketingSystem;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Table;

/**
 * Hibernate entity for payment data
 */
@Entity
@Table(name = "PaymentData")
public class PaymentData implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_id")
    private Long id;

    @Column(name = "card_number", nullable = false)
    private String cardNumber;

    @Column(name = "expiry_date", nullable = false)
    private String expiryDate;

    @Column(name = "cvv", nullable = false)
    private String cvv;

    @Column(name = "amount", nullable = false)
    private String amount;

    public PaymentData() {
    }

    // Constructor
    public PaymentData(String cardNumber, String expiryDate, String cvv, String amount) {
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.cvv = cvv;
        this.amount = amount;
    }

    // Getter and Setter methods for id
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    // Getter and Setter methods for cardNumber
    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    // Getter and Setter methods for expiryDate
    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    // Getter and Setter methods for cvv
    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    // Getter and Setter methods for amount
    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }
}
