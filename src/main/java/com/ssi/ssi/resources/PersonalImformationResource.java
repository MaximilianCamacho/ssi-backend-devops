package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.Area;
import com.ssi.ssi.domain.model.Employee;
import com.ssi.ssi.domain.model.PersonalInformation;

import java.util.Date;

/**
 * @autor Marco Herrera.
 */
public class PersonalImformationResource {

    private final PersonalInformation personalInformation;
    private Long id;
    private AreaResource area;
    private EmployeeResource employee;
    private String legalName;
    private Date registrationDate;

    public PersonalImformationResource(final PersonalInformation personalInformation) {
        this.personalInformation = personalInformation;
        this.id = personalInformation.getId();
        this.area = buildArea(personalInformation.getArea());
        this.employee = buildEmployee(personalInformation.getEmployee());
        this.legalName = personalInformation.getLegalName();
        this.registrationDate = personalInformation.getRegistrationDate();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLegalName() {
        return legalName;
    }

    public void setLegalName(String legalName) {
        this.legalName = legalName;
    }

    public AreaResource getArea() {
        return area;
    }

    public void setArea(AreaResource area) {
        this.area = area;
    }

    public EmployeeResource getEmployee() {
        return employee;
    }

    public void setEmployee(EmployeeResource employee) {
        this.employee = employee;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public EmployeeResource buildEmployee(Employee employee){
        EmployeeResource resource = new EmployeeResource(employee);
        return resource;
    }

    public AreaResource buildArea(Area area){
        AreaResource resource = new AreaResource(area);
        return resource;
    }
}
