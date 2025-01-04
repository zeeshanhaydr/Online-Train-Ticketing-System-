package onlineTrainTicketingSystem;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RegistrationDataDao {

    private static final Logger logger = LoggerFactory.getLogger(RegistrationDataDao.class);

    public boolean saveUser(RegistrationData registrationData) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(registrationData);
            transaction.commit();
            logger.info("User saved successfully, User Details=" + registrationData);
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                try {
                    transaction.rollback();
                } catch (RuntimeException re) {
                    logger.error("Could not roll back transaction", re);
                }
            }
            logger.error("Error saving RegistrationData", e);
            return false;
        }
    }
}