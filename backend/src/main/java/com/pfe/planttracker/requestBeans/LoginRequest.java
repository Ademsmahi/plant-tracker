package com.pfe.planttracker.requestBeans;

public class LoginRequest {
    private String telephone, password;

    public LoginRequest(String telephone, String password) {
        this.telephone = telephone;
        this.password = password;
    }

    public String getTelephone() {
        return telephone;
    }

    public String getPassword() {
        return password;
    }
}
