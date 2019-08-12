package com.ssi.ssi.request;

/**
 * @autor Marco Herrera.
 */
public class ResponsibilityRequest {

    private String name;

    private String description;

    private Long employeeTypeId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getEmployeeTypeId() {
        return employeeTypeId;
    }

    public void setEmployeeTypeId(Long employeeTypeId) {
        this.employeeTypeId = employeeTypeId;
    }
}
