package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.IncidentType;

public class IncidentTypeResource {

    private IncidentType incidentType = null;

    private Long id;

    private String name;

    private String description;

    public IncidentTypeResource() {
        super();
    }
    public IncidentTypeResource (final IncidentType incidentType) {
        this.incidentType = incidentType;
        this.id = incidentType.getId();
        this.name = incidentType.getName();
        this.description = incidentType.getDescription();

    }

    public String getName() {
        return name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
}
