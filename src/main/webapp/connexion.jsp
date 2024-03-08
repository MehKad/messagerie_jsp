<%@ page errorPage = "/WEB-INF/erreur.jsp"%>
<%@ include file="/WEB-INF/jspf/navigation.jspf" %>

   <h3 align="center" >Connexion</h3>

   <form action="login.jsp" methode="post" >
      <p><table border="1" cellpadding="3" cellspacing="2" width="90%" align="center">
         <tr>
            <td bgcolor="#FF9900" width="100"><b>Nom</b></td>
            <td><input type="text" name="nom"></td>
         </tr>
         <tr>
            <td bgcolor="#FF9900" width="100"><b>Prenom</b></td>
            <td><input type="text" name="prenom"></td>
         </tr>
         <tr>
            <td bgcolor="#FF9900" width="100"><b>Mot de Passe</b></td>
            <td><input type="password" name="motDePasse"></td>
         </tr>
      </table></p>
      <p align="center"><input type="submit" value="connexion utilisateur"></p>
   </form>

<%@ include file="/WEB-INF/jspf/pied.jspf" %>