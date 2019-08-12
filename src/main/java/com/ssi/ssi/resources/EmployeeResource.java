package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.Employee;
import com.ssi.ssi.domain.model.EmployeeType;
import com.ssi.ssi.domain.model.GenderType;

import java.util.Date;

/**
 * @autor Marco Herrera.
 */
public class EmployeeResource {

    private final Employee employee;

    private Long id;

    private String ci;

    private String firstName;

    private String lastName;

    private Date birthDate;

    private GenderType gender;

    private String email;

    private Long phone;

    private String address;

    private Double salary;

    //private Long employeeTypeId;
    private EmployeeTypeResource employeeType;

    public EmployeeResource(final Employee employee) {
        this.employee = employee;
        this.id = employee.getId();
        this.ci = employee.getCi();
        this.firstName = employee.getFirstName();
        this.lastName = employee.getLastName();
        this.birthDate = employee.getBirthDate();
        this.gender = employee.getGender();
        this.email = employee.getEmail();
        this.phone = employee.getPhone();
        this.address = employee.getAddress();
        this.salary = employee.getSalary();
        this.employeeType = build(employee.getEmployeeType());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCi() {
        return ci;
    }

    public void setCi(String ci) {
        this.ci = ci;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public GenderType getGender() {
        return gender;
    }

    public void setGender(GenderType gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public EmployeeTypeResource getEmployeeType() {
        return employeeType;
    }

    public EmployeeTypeResource build(EmployeeType employeeType){
        EmployeeTypeResource resource = new EmployeeTypeResource(employeeType);
        return resource;
    }

    public void setEmployeeType(EmployeeTypeResource employeeType) {
        this.employeeType = employeeType;
    }
}
