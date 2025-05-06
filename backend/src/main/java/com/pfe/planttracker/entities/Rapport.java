package com.pfe.planttracker.entities;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "Rapport")
public class Rapport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idRapport")
    private Integer idRapport;

    @Column(name = "contenu")
    private String contenu;

    @Column(name = "date")
    private LocalDateTime date;

    @ManyToOne
    @JoinColumn(name = "idSerre", referencedColumnName = "idSerre")
    private Serre serre;

    public Integer getIdRapport() {
        return idRapport;
    }

    public void setIdRapport(Integer idRapport) {
        this.idRapport = idRapport;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
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
