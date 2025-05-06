package com.pfe.planttracker.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import jdk.jshell.execution.Util;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Serre")
public class Serre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idSerre")
    private Integer idSerre;

    @Column(name = "nom", length = 100)
    private String nom;

    @Column(name = "localisation")
    private String localisation;

    @Column(name = "conditionSerre", length = 100)
    private String conditionSerre;

    @Column(name = "materiel", length = 100)
    private String materiel;

    @Column(name = "type", length = 100)
    private String type;

    @ManyToOne
    @JoinColumn(name = "idGestionnaire", referencedColumnName = "idUtilisateur")
    private Utilisateur gestionnaire;

    @ManyToOne
    @JoinColumn(name = "idAgriculteur", referencedColumnName = "idUtilisateur")
    private Utilisateur agriculteur;

    @OneToMany(mappedBy = "serre", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonBackReference
    private List<Capteur> capteurs = new ArrayList<>();

    // Getters and Setters

    public Integer getIdSerre() {
        return idSerre;
    }

    public void setIdSerre(Integer idSerre) {
        this.idSerre = idSerre;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getLocalisation() {
        return localisation;
    }

    public void setLocalisation(String localisation) {
        this.localisation = localisation;
    }

    public String getConditionSerre() {
        return conditionSerre;
    }

    public void setConditionSerre(String conditionSerre) {
        this.conditionSerre = conditionSerre;
    }

    public String getMateriel() {
        return materiel;
    }

    public void setMateriel(String materiel) {
        this.materiel = materiel;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Utilisateur getGestionnaire() {
        return gestionnaire;
    }

    public void setGestionnaire(Utilisateur gestionnaire) {
        this.gestionnaire = gestionnaire;
    }

    public Utilisateur getAgriculteur() {
        return agriculteur;
    }

    public void setAgriculteur(Utilisateur agriculteur) {
        this.agriculteur = agriculteur;
    }

    public List<Capteur> getCapteurs() {
        return capteurs;
    }

    public void setCapteurs(List<Capteur> capteurs) {
        this.capteurs = capteurs;
    }
}
