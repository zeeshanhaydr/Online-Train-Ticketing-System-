package onlineTrainTicketingSystem;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    // Define a constant for the strength of BCrypt hashing
    private static final int BCRYPT_WORKLOAD = 12; // Workload factor (higher is slower but more secure)

    /**
     * Hashes a password using BCrypt.
     *
     * @param password the password to hash
     * @return hashed password string
     */
    public static String hashPassword(String password) {
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(BCRYPT_WORKLOAD));
        return hashedPassword;
    }

    /**
     * Verifies a password against a hashed password using BCrypt.
     *
     * @param password           the password to verify
     * @param hashedPasswordFromDB the hashed password stored in the database
     * @return true if the password matches the hashed password, false otherwise
     */
    public static boolean verifyPassword(String password, String hashedPasswordFromDB) {
        return BCrypt.checkpw(password, hashedPasswordFromDB);
    }
}
