package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.Area;
import com.ssi.ssi.domain.model.Capacity;
import com.ssi.ssi.domain.model.Employee;

import javax.persistence.Column;
import javax.persistence.ManyToMany;
import java.util.List;

public class CapacityResource {

    private final Capacity capacity;
    private Long id;
    private String name;
    private String description;
    private List<Employee> employeeList;
    private Boolean isDeleted;


    public CapacityResource(final Capacity capacity) {
        this.capacity = capacity;
        this.id = capacity.getId();
        this.name = capacity.getName();
        this.description =capacity.getDescription();
        /*this.employeeList =capacity.getEmployeeList();*/
        this.isDeleted = capacity.getDeleted();

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

    public List<Employee> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }
}
