<%@ page errorPage="/WEB-INF/erreur.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="bd.ConnexionBD" %>
<%@ page import="bd.Personne" %>
<%@ include file="/WEB-INF/jspf/navigation.jspf" %>

<%
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String motDePasse = request.getParameter("motDePasse");

    Personne utilisateur = new Personne(nom, prenom, motDePasse);

    Connection connection = null;
    boolean utilisateurEnregistre = false;

    try {
        connection = ConnexionBD.getConnection();
        
        // Check if the user already exists
        String checkSql = "SELECT * FROM personne WHERE nom = ? AND prenom = ?";
        PreparedStatement checkStatement = connection.prepareStatement(checkSql);
        checkStatement.setString(1, utilisateur.getNom());
        checkStatement.setString(2, utilisateur.getPrenom());
        ResultSet resultSet = checkStatement.executeQuery();
        
        if (!resultSet.next()) {
            // If the user doesn't exist, proceed with the insertion
            String insertSql = "INSERT INTO personne (nom, prenom, motDePasse) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(insertSql);
            statement.setString(1, utilisateur.getNom());
            statement.setString(2, utilisateur.getPrenom());
            statement.setString(3, utilisateur.getMotDePasse());
            utilisateurEnregistre = statement.executeUpdate() > 0;
            statement.close();
        }
        
        resultSet.close();
        checkStatement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<h3 align="center">Confirmation de votre demande d'inscription</h3>

<p>Informations enregistrees :</p>
<table border="1" cellpadding="3" cellspacing="2" width="90%" align="center">
    <tr>
        <td bgcolor="#FF9900" width="100"><b>Nom</b></td>
        <td><%= utilisateur.getNom() %></td>
    </tr>
    <tr>
        <td bgcolor="#FF9900" width="100"><b>Prenom</b></td>
        <td><%= utilisateur.getPrenom() %></td>
    </tr>
    <tr>
        <td bgcolor="#FF9900" width="100"><b>Mot de passe</b></td>
        <td><%= utilisateur.getMotDePasse() %></td>
    </tr>
</table>

<h3 align="center">
    <% if (!utilisateurEnregistre) { %>
        <font color="red">ATTENTION: L'utilisateur n'a pas pu etre enregistre</font>
    <% } else { %>
        <font color="green">Nouvel utilisateur enregistre</font>
    <% } %>
</h3>

<%@ include file="/WEB-INF/jspf/pied.jspf" %>
