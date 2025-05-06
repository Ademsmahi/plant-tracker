package com.pfe.planttracker.requestBeans;

public class SeuilRequest {
    private Integer idSerre;
    private String type;

    public SeuilRequest(Integer idSerre, String type) {
        this.idSerre = idSerre;
        this.type = type;
    }

    public Integer getIdSerre() {
        return idSerre;
    }

    public void setIdSerre(Integer idSerre) {
        this.idSerre = idSerre;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


}
