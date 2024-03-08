package bd;

public class Personne {
   private String nom, prenom, motDePasse;

   public Personne() {
   }

   public Personne(String nom, String prenom, String motDePasse) {
      this.nom = nom;
      this.prenom = prenom;
      this.motDePasse = motDePasse;
   }

   public String getMotDePasse() {
      return motDePasse;
   }

   public void setMotDePasse(String motDePasse) {
      this.motDePasse = motDePasse;
   }

   public String getNom() {
      return nom;
   }

   public void setNom(String nom) {
      this.nom = nom;
   }

   public String getPrenom() {
      return prenom;
   }

   public void setPrenom(String prenom) {
      this.prenom = prenom;
   }

}
