package com.pfe.planttracker.responseBeans;

public class Greenhouse {
    private String name;
    private float temperature;
    private float humidity;
    private float light;
    private float ph;

    public Greenhouse(String name, float temperature, float humidity, float light, float ph) {
        this.name = name;
        this.temperature = temperature;
        this.humidity = humidity;
        this.light = light;
        this.ph = ph;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getTemperature() {
        return temperature;
    }

    public void setTemperature(float temperature) {
        this.temperature = temperature;
    }

    public float getHumidity() {
        return humidity;
    }

    public void setHumidity(float humidity) {
        this.humidity = humidity;
    }

    public float getLight() {
        return light;
    }

    public void setLight(float light) {
        this.light = light;
    }

    public float getPh() {
        return ph;
    }

    public void setPh(float ph) {
        this.ph = ph;
    }
}
