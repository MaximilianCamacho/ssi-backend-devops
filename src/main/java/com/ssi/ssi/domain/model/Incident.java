package com.ssi.ssi.domain.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "incident")
public class Incident {

    @Id
    @GeneratedValue(
            strategy = GenerationType.IDENTITY
    )
    private Long id;

    @Column(name = "accident_site")
    private String accidentSite;

    @Column(name = "accident_date")
    private Date accidentDate;

    @Column(name = "accident_day")
    private String accidentDay;

    @Column(name = "accident_time")
    private String accidentTime;

    @Column(name = "affected_part")
    private String affectedPart;

    @Column(name = "is_deleted")
    private Boolean isDeleted;


    @ManyToMany
    @JoinTable(name = "incident_incident_tag",
            joinColumns = {@JoinColumn(name = "incident_id")},
            inverseJoinColumns = {@JoinColumn(name = "incident_tags_id")})
    private List<IncidentTag> incidentTags;

    @Enumerated(EnumType.STRING)
    @Column(name = "workingTurn")
    private WorkingTurn workingTurn;

    @ManyToOne
    private IncidentType incidentType;

    @ManyToOne
    private Employee employee;

    @ManyToOne
    private LesionType lesionType;

    @ManyToOne
    private IncidentAgent incidentAgent;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public IncidentType getIncidentType() {
        return incidentType;
    }

    public void setIncidentType(IncidentType incidentType) {
        this.incidentType = incidentType;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
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

    public LesionType getLesionType() {
        return lesionType;
    }

    public void setLesionType(LesionType lesionType) {
        this.lesionType = lesionType;
    }

    public IncidentAgent getIncidentAgent() {
        return incidentAgent;
    }

    public void setIncidentAgent(IncidentAgent incidentAgent) {
        this.incidentAgent = incidentAgent;
    }

    public String getAffectedPart() {
        return affectedPart;
    }

    public void setAffectedPart(String affectedPart) {
        this.affectedPart = affectedPart;
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }
}
