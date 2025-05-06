package com.pfe.planttracker.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "SeuilDalert")
public class SeuilDalerte {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idSeuil")
    private Integer idSeuil;

    @Column(name = "min")
    private Float min;

    @Column(name = "max")
    private Float max;

    @Column(name = "type")
    private String type;

    @ManyToOne
    @JoinColumn(name = "idSerre", referencedColumnName = "idSerre")
    private Serre serre;

    public Integer getIdSeuil() {
        return idSeuil;
    }

    public void setIdSeuil(Integer idSeuil) {
        this.idSeuil = idSeuil;
    }

    public Float getMin() {
        return min;
    }

    public void setMin(Float min) {
        this.min = min;
    }

    public Float getMax() {
        return max;
    }

    public void setMax(Float max) {
        this.max = max;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Serre getSerre() {
        return serre;
    }

    public void setSerre(Serre serre) {
        this.serre = serre;
    }
}
