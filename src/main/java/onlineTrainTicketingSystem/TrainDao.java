package onlineTrainTicketingSystem;

import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;
import org.hibernate.query.Query;


public class TrainDao {

    public void saveTrain(addTrainData train) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(train);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
// admin add train dao
    public addTrainData getTrainById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(addTrainData.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    // admin update train dao
    public void updateTrain(addTrainData train) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(train);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
   //admin delete train dao
    public void deleteTrainById(Long id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            addTrainData train = session.get(addTrainData.class, id);
            if (train != null) {
                session.delete(train);
                transaction.commit();
            } else {
                if (transaction != null) {
                    transaction.rollback();
                }
                System.out.println("Train not found with ID: " + id);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    
  
  //user seach train dao
   public List<addTrainData> searchTrainByName(String trainName) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM addTrainData WHERE trainName = :trainName";
            Query<addTrainData> query = session.createQuery(hql, addTrainData.class);
            query.setParameter("trainName", trainName);
            List<addTrainData> results = query.list();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
