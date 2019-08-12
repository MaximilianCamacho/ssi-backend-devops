package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.WorkingTurn;

import java.util.Date;

public class IncidentResourceCreate {

    private Long incidentId;
    private Long employeeId;
    private Long incidentTypeId;
    private Long accidentAgentId;
    private Long lesionTypeId;
    private String accidentSite;
    private WorkingTurn workingTurn;
    private Date accidentDate;
    private String accidentDay;
    private String accidentTime;
    private String affectedPart;

    public Long getIncidentId() {
        return incidentId;
    }

    public void setIncidentId(Long incidentId) {
        this.incidentId = incidentId;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Long getIncidentTypeId() {
        return incidentTypeId;
    }

    public void setIncidentTypeId(Long incidentTypeId) {
        this.incidentTypeId = incidentTypeId;
    }

    public Long getAccidentAgentId() {
        return accidentAgentId;
    }

    public void setAccidentAgentId(Long accidentAgentId) {
        this.accidentAgentId = accidentAgentId;
    }

    public Long getLesionTypeId() {
        return lesionTypeId;
    }

    public void setLesionTypeId(Long lesionTypeId) {
        this.lesionTypeId = lesionTypeId;
    }

    public String getAccidentSite() {
        return accidentSite;
    }

    public void setAccidentSite(String accidentSite) {
        this.accidentSite = accidentSite;
    }

    public WorkingTurn getWorkingTurn() {
        return workingTurn;
    }

    public void setWorkingTurn(WorkingTurn workingTurn) {
        this.workingTurn = workingTurn;
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
}
