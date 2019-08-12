package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.LesionType;

public class LesionTypeResource {

    private final LesionType lesionType;

    private Long id;

    private String type;

    private String description;

    private Boolean isDeleted;

    public LesionTypeResource(final LesionType lesionType) {
        this.lesionType = lesionType;
        this.id = lesionType.getId();
        this.type = lesionType.getType();
        this.description = lesionType.getDescription();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }
}
