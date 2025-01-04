package onlineTrainTicketingSystem;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class DeleteTrainDao {

    public void deleteTrainById(Long id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            deleteTrainData trainToDelete = session.get(deleteTrainData.class, id);

            if (trainToDelete != null) {
                session.delete(trainToDelete);
                transaction.commit();
            } else {
                System.out.println("Train not found with ID: " + id);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
