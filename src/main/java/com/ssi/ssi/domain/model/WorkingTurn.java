package com.ssi.ssi.domain.model;

public enum WorkingTurn {

    EXTRA_HOURS("extra hours"),
    LABOR_HOURS("labor hours");

    private String name;

    private WorkingTurn(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
