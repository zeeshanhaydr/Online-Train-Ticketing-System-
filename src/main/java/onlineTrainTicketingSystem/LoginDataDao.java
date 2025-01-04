package onlineTrainTicketingSystem;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.mindrot.jbcrypt.BCrypt;

public class LoginDataDao {

    private final SessionFactory sessionFactory;

    public LoginDataDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public boolean authenticateUser(String name, String password) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();

            // Retrieve user by username from RegistrationData table
            Query<RegistrationData> query = session.createQuery("FROM RegistrationData R WHERE R.userName = :userName", RegistrationData.class);
            query.setParameter("userName", name);
            RegistrationData user = query.uniqueResult();

            if (user != null) {
                // Verify hashed password using BCrypt
                String hashedPasswordFromDB = user.getPassword();
                if (BCrypt.checkpw(password, hashedPasswordFromDB)) {
                    transaction.commit();
                    return true; // Passwords match, authentication successful
                }
            }

            transaction.commit(); // Commit transaction if not returned early
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Authentication failed
    }
}
