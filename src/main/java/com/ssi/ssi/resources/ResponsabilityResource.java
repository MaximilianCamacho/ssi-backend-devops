package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.EmployeeType;
import com.ssi.ssi.domain.model.Responsibility;


public class ResponsabilityResource {

    final Responsibility responsibility;
    private Long id;
    private String name;
    private String description;
    private Boolean isDeleted;
    private EmployeeTypeResource employeeType;

    public ResponsabilityResource(final Responsibility responsibility) {
        this.responsibility = responsibility;
        this.id = responsibility.getId();
        this.name = responsibility.getName();
        this.description =responsibility.getDescription();
        this.isDeleted = responsibility.getIsDeleted();
        this.employeeType = build(responsibility.getEmployeeType());

    }


    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public EmployeeTypeResource getEmployeeType() {
        return employeeType;
    }

    public void setEmployeeType(EmployeeTypeResource employeeType) {
        this.employeeType = employeeType;
    }

    public EmployeeTypeResource build(EmployeeType employeeType){
        EmployeeTypeResource resource = new EmployeeTypeResource(employeeType);
        return resource;
    }

}
