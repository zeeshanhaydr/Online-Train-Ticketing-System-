package onlineTrainTicketingSystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseConnectionTest {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/onlineTrainTicketSystem";
        String dbUsername = "root"; // Update with your database username
        String password = ""; // Update with your database password
        
        String query = "SELECT * FROM LoginData WHERE = ?"; // Updated column name
        
        try (Connection conn = DriverManager.getConnection(url, dbUsername, password);
             PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, "user");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String username = resultSet.getString("name"); // Updated column name
                String userPassword = resultSet.getString("password");
                String role = resultSet.getString("role");
                
                System.out.println("User ID: " + id);
                System.out.println("Username: " + username);
                System.out.println("Password: " + userPassword);
                System.out.println("Role: " + role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
