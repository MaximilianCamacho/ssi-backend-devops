package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.EmployeeType;

/**
 * @autor Marco Herrera.
 */
public class EmployeeTypeResource {

    private Long typeId;

    private String typeName;

    private String description;

    private final EmployeeType employeeType;

    public EmployeeTypeResource(final EmployeeType employeeType){
        this.employeeType = employeeType;
        this.typeId = employeeType.getId();
        this.typeName = employeeType.getName();
        this.description = employeeType.getDescription();
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
