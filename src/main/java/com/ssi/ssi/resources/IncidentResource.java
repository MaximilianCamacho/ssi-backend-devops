package com.ssi.ssi.resources;
import com.ssi.ssi.domain.model.WorkingTurn;

import java.util.Date;
import java.util.List;

public class IncidentResource {

    private Long id;

    private String accidentSite;

    private Date accidentDate;

    private String accidentDay;

    private String accidentTime;

    private String affectedPart;

    private Boolean isDeleted;

    private List<IncidentTagResource> incidentTagResourceList;

    private WorkingTurn workingTurn;

    private IncidentTypeResource incidentType;

    private EmployeeResource employee;

    private LesionTypeResource lesionType;

    private AccidentAgentResource accidentAgent;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccidentSite() {
        return accidentSite;
    }

    public void setAccidentSite(String accidentSite) {
        this.accidentSite = accidentSite;
    }

    public Date getAccidentDate() {
        return accidentDate;
    }

    public void setAccidentDate(Date accidentDate) {
        this.accidentDate = accidentDate;
    }

    public String getAccidentDay() {
        return accidentDay;
    }

    public void setAccidentDay(String accidentDay) {
        this.accidentDay = accidentDay;
    }

    public String getAccidentTime() {
        return accidentTime;
    }

    public void setAccidentTime(String accidentTime) {
        this.accidentTime = accidentTime;
    }

    public String getAffectedPart() {
        return affectedPart;
    }

    public void setAffectedPart(String affectedPart) {
        this.affectedPart = affectedPart;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }

    public List<IncidentTagResource> getIncidentTagResourceList() {
        return incidentTagResourceList;
    }

    public void setIncidentTagResourceList(List<IncidentTagResource> incidentTagResourceList) {
        this.incidentTagResourceList = incidentTagResourceList;
    }

    public WorkingTurn getWorkingTurn() {
        return workingTurn;
    }

    public void setWorkingTurn(WorkingTurn workingTurn) {
        this.workingTurn = workingTurn;
    }

    public IncidentTypeResource getIncidentType() {
        return incidentType;
    }

    public void setIncidentType(IncidentTypeResource incidentType) {
        this.incidentType = incidentType;
    }

    public EmployeeResource getEmployee() {
        return employee;
    }

    public void setEmployee(EmployeeResource employee) {
        this.employee = employee;
    }

    public LesionTypeResource getLesionType() {
        return lesionType;
    }

    public void setLesionType(LesionTypeResource lesionType) {
        this.lesionType = lesionType;
    }

    public AccidentAgentResource getAccidentAgent() {
        return accidentAgent;
    }

    public void setAccidentAgent(AccidentAgentResource accidentAgent) {
        this.accidentAgent = accidentAgent;
    }
}
