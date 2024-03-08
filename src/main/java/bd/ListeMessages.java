package bd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ListeMessages {
   private Connection connection;
   private PreparedStatement statement;
   private ResultSet resultSet;

   public ListeMessages(int userId) throws ClassNotFoundException {
      try {
         Class.forName("com.mysql.jdbc.Driver");
         connection = ConnexionBD.getConnection();
         statement = connection.prepareStatement("SELECT * FROM message WHERE idPersonne = ?");
         statement.setInt(1, userId);
         resultSet = statement.executeQuery();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   public boolean suivant() {
      try {
         return resultSet.next();
      } catch (SQLException e) {
         e.printStackTrace();
         return false;
      }
   }

   public String sujet() {
      try {
         return resultSet.getString("sujet");
      } catch (SQLException e) {
         e.printStackTrace();
         return "";
      }
   }

   public String texte() {
      try {
         return resultSet.getString("texte");
      } catch (SQLException e) {
         e.printStackTrace();
         return "";
      }
   }

   public void arret() {
      try {
         if (resultSet != null)
            resultSet.close();
         if (statement != null)
            statement.close();
         if (connection != null)
            connection.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
}
