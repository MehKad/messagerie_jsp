<%@ page errorPage="/WEB-INF/erreur.jsp" %>
<%@ page import="bd.ListeMessages" %>
<%@ include file="/WEB-INF/jspf/navigation.jspf" %>
<font face="Arial">

   <p><table border="1" cellpadding="3" cellspacing="2" width="90%" align="center">
      <tr bgcolor="#FF6600">
         <th>Sujet</th>
         <th>Message</th>
      </tr>

      <%
         int userId = Integer.parseInt(request.getParameter("userId"));

         ListeMessages listeMessages = new ListeMessages(userId);
         int ligne = 0;
         while (listeMessages.suivant()) {
      %>
      <tr bgcolor="<%= ligne++ % 2 == 0 ? "#FFFF66" : "#FFCC00" %>">
         <td><b><%= listeMessages.sujet() %></b></td>
         <td><%= listeMessages.texte() %></td> 
      </tr>
      <%
         }
         listeMessages.arret();
      %>

   </table></p>

</font>
<%@ include file="/WEB-INF/jspf/pied.jspf" %>
