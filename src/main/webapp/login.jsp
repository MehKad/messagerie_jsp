<%@ page errorPage = "/WEB-INF/erreur.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="bd.ConnexionBD" %>
<%@ page import="bd.Personne" %>
<%@ page import="bd.ListeMessages" %>
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
        String sql = "SELECT idPersonne FROM personne WHERE nom = ? AND prenom = ? AND motDePasse = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, utilisateur.getNom());
        statement.setString(2, utilisateur.getPrenom());
        statement.setString(3, utilisateur.getMotDePasse());
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            int userId = resultSet.getInt("idPersonne");
            response.sendRedirect("Bienvenue.jsp?userId=" + userId);
        } else {
            response.sendRedirect("connexion.jsp");
        }

        resultSet.close();
        statement.close();
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
