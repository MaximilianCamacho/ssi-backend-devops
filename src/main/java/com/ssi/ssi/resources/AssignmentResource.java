package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.Assignment;
import com.ssi.ssi.domain.model.Employee;
import com.ssi.ssi.domain.model.Material;

import java.util.Date;

public class AssignmentResource {

    private Long id;
    private final Assignment assignment;
    private Material material;
    private Employee employee;
    private Date assignmentDate;
    private Integer quantity;

    public AssignmentResource (Assignment assignment){
        this.assignment = assignment;
        this.id = assignment.getId();
        this.quantity = assignment.getQuantity();
        this.assignmentDate = assignment.getAssignmentDate();
        this.material = assignment.getMaterial();
        this.employee = assignment.getEmployee();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Material getMaterial() {
        return material;
    }

    public void setMaterial(Material material) {
        this.material = material;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Date getAssignmentDate() {
        return assignmentDate;
    }

    public void setAssignmentDate(Date assignmentDate) {
        this.assignmentDate = assignmentDate;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }


}
