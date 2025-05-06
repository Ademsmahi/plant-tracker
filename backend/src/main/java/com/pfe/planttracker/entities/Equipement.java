package com.pfe.planttracker.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "equipement")
public class Equipement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idEquipement")
    private Integer idEquipement;

    @Column(name = "nom")
    private String nom;

    @Column(name = "etat")
    private Boolean etat;

    @ManyToOne
    @JoinColumn(name = "idSerre", referencedColumnName = "idSerre")
    private Serre serre;

    public Integer getIdEquipement() {
        return idEquipement;
    }

    public void setIdEquipement(Integer idEquipement) {
        this.idEquipement = idEquipement;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Boolean getEtat() {
        return etat;
    }

    public void setEtat(Boolean etat) {
        this.etat = etat;
    }

    public Serre getSerre() {
        return serre;
    }

    public void setSerre(Serre serre) {
        this.serre = serre;
    }
}
