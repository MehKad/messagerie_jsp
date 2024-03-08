<%@page isErrorPage="true"%>

<%@ include file="/WEB-INF/jspf/navigation.jspf" %>

<center>
   <h1><font color="red">Erreur...</font></h1>
   <p>Votre demande n'a pu aboutir.</p>
   <p>Merci de signaler les circonstances de cet incident au webmaster
   <br>de ce siteen luitransmettant me texte d'erreur qui suit :</p>
   <p><b><%= exception %></p>
</center>

<%@ include file="/WEB-INF/jspf/pied.jspf" %>