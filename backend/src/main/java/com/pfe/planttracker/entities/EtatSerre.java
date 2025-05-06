package com.pfe.planttracker.entities;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "EtatSerre")
public class EtatSerre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idEtat")
    private Integer idEtat;

    @Column(name = "valeur")
    private Float valeur;

    @Column(name = "type")
    private String type;

    @Column(name = "date")
    private LocalDateTime date = LocalDateTime.now();

    @ManyToOne
    @JoinColumn(name = "idSerre", referencedColumnName = "idSerre")
    private Serre serre;

    public Integer getIdEtat() {
        return idEtat;
    }

    public void setIdEtat(Integer idEtat) {
        this.idEtat = idEtat;
    }

    public Float getValeur() {
        return valeur;
    }

    public void setValeur(Float valeur) {
        this.valeur = valeur;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public Serre getSerre() {
        return serre;
    }

    public void setSerre(Serre serre) {
        this.serre = serre;
    }
}
