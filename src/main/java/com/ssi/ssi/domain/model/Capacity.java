package com.ssi.ssi.domain.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "capacity")
public class Capacity {

    @Id
    @GeneratedValue(
            strategy = GenerationType.IDENTITY
    )
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    /*@ManyToMany(mappedBy = "capacities")
    private List<Employee> employeeList;*/

    public Long getId() {
        return id;
    }

    @Column(name = "is_deleted")
    private Boolean isDeleted;


    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
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

    /*public List<Employee> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }*/
}
