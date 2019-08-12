package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.IncidentAgent;

public class AccidentAgentResource {

    private final IncidentAgent incidentAgent;

    private Long id;

    private String name;

    private Boolean isDeleted;

    public AccidentAgentResource(final IncidentAgent incidentAgent) {
        this.incidentAgent = incidentAgent;
        this.id = incidentAgent.getId();
        this.name = incidentAgent.getName();
        this.isDeleted = incidentAgent.getIsDeleted();

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

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }
}
