package com.pfe.planttracker.entities;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "meteo")
public class Meteo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idMeteo")
    private Integer idMeteo;

    @Column(name = "temp")
    private Float temp;

    @Column(name = "humidity")
    private Float humidity;

    @Column(name = "vent")
    private Float vent;

    @Column(name = "precipitations")
    private Float precipitations;

    @Column(name = "location")
    private String location;

    @Column(name = "date")
    private LocalDate date;

    public Integer getIdMeteo() {
        return idMeteo;
    }

    public void setIdMeteo(Integer idMeteo) {
        this.idMeteo = idMeteo;
    }

    public Float getTemp() {
        return temp;
    }

    public void setTemp(Float temp) {
        this.temp = temp;
    }

    public Float getHumidity() {
        return humidity;
    }

    public void setHumidity(Float humidity) {
        this.humidity = humidity;
    }

    public Float getVent() {
        return vent;
    }

    public void setVent(Float vent) {
        this.vent = vent;
    }

    public Float getPrecipitations() {
        return precipitations;
    }

    public void setPrecipitations(Float precipitations) {
        this.precipitations = precipitations;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}
