package com.pfe.planttracker.entities;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "ImagePlante")
public class ImagePlante {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idImage")
    private Integer idImage;

    @Column(name = "date")
    private LocalDateTime date;

    @Column(name = "cheminFichier")
    private String cheminFichier;

    @ManyToOne
    @JoinColumn(name = "idAgriculteur", referencedColumnName = "idUtilisateur")
    private Utilisateur agriculteur;

    public int getIdImage() {
        return idImage;
    }

    public void setIdImage(int idImage) {
        this.idImage = idImage;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getCheminFichier() {
        return cheminFichier;
    }

    public void setCheminFichier(String cheminFichier) {
        this.cheminFichier = cheminFichier;
    }

    public Utilisateur getAgriculteur() {
        return agriculteur;
    }

    public void setAgriculteur(Utilisateur agriculteur) {
        this.agriculteur = agriculteur;
    }
}
