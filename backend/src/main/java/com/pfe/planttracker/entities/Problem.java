package com.pfe.planttracker.entities;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "problem")
public class Problem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idProblem")
    private Integer idProblem;

    @Column(name = "description")
    private String description;

    @Column(name = "niveau")
    private Integer niveau;

    @Column(name = "date")
    private LocalDate date;

    @ManyToOne
    @JoinColumn(name = "idSerre", referencedColumnName = "idSerre")
    private Serre serre;

    public Integer getIdProblem() {
        return idProblem;
    }

    public void setIdProblem(Integer idProblem) {
        this.idProblem = idProblem;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getNiveau() {
        return niveau;
    }

    public void setNiveau(Integer niveau) {
        this.niveau = niveau;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Serre getSerre() {
        return serre;
    }

    public void setSerre(Serre serre) {
        this.serre = serre;
    }
}
