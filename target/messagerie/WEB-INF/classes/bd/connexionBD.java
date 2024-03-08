package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexionBD {
   private static final String JDBC_URL = "jdbc:mysql://localhost:3306/messagerie";
   private static final String USERNAME = "root";
   private static final String PASSWORD = "";

   public static Connection getConnection() throws SQLException {
      return DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
   }
}
