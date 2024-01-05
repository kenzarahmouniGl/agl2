package models;

public class Emprunt {
    private String id;
    private String idOuvrage;
    private String dateEmprunt;
    private String dateRetour;

    // Constructeur par défaut
    public Emprunt() {
    }

    // Constructeur avec tous les champs
    public Emprunt(String id, String idOuvrage, String dateEmprunt, String dateRetour) {
        this.id = id;
        this.idOuvrage = idOuvrage;
        this.dateEmprunt = dateEmprunt;
        this.dateRetour = dateRetour;
    }

    // Méthodes getters et setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdOuvrage() {
        return idOuvrage;
    }

    public void setIdOuvrage(String idOuvrage) {
        this.idOuvrage = idOuvrage;
    }

    public String getDateEmprunt() {
        return dateEmprunt;
    }

    public void setDateEmprunt(String dateEmprunt) {
        this.dateEmprunt = dateEmprunt;
    }

    public String getDateRetour() {
        return dateRetour;
    }

    public void setDateRetour(String dateRetour) {
        this.dateRetour = dateRetour;
    }
}