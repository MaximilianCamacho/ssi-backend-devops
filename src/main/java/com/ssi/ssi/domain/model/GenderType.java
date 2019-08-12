package com.ssi.ssi.domain.model;

public enum GenderType {
    FEMALE("female"),
    MALE("male");

    private String name;

    private GenderType(String name){
        this.name = name;
    }

    public String getName(){
        return name;
    }
}
