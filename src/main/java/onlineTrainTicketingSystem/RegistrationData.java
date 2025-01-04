package onlineTrainTicketingSystem;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.*;
import org.mindrot.jbcrypt.BCrypt;


@Entity
@Table(name = "RegistrationData")
public class RegistrationData implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_name", nullable = false, length = 50)
    @NotNull
    @Size(max = 50)
    private String userName;

    @Column(nullable = false, length = 100)
    @NotNull
    @Size(max = 100)
    private String password;

    @Column(nullable = false, length = 100)
    @NotNull
    @Email
    @Size(max = 100)
    private String email;

    // Constructors
    public RegistrationData() {
    }

    public RegistrationData(String userName, String password, String email) {
        this.userName = userName;
        this.password = password;
        this.email = email;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // toString method
    @Override
    public String toString() {
        return "RegistrationData{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

}