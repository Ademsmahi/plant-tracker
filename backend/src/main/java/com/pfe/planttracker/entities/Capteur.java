package com.pfe.planttracker.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "Capteur")
public class Capteur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCapteur")
    private Integer idCapteur;

    @Column(name = "type")
    private String type;

    @Column(name = "nom")
    private String nom;

    @ManyToOne
    @JoinColumn(name = "idSerre", referencedColumnName = "idSerre")
    private Serre serre;

    // Getters and Setters

    public Integer getIdCapteur() {
        return idCapteur;
    }

    public void setIdCapteur(Integer idCapteur) {
        this.idCapteur = idCapteur;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Serre getSerre() {
        return serre;
    }

    public void setSerre(Serre serre) {
        this.serre = serre;
    }
}
