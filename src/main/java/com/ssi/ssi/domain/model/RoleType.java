package com.ssi.ssi.domain.model;

public enum RoleType {
    STANDARD_USER("STANDARD_USER"),
    ADMIN_USER("ADMIN_USER");

    private String name;

    private RoleType(String name){
        this.name = name;
    }

    public String getName(){
        return name;
    }
}
