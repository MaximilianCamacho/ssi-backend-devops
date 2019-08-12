package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.MaterialType;

public class MaterialTypeResource {

    private final MaterialType materialType;

    private Long id;

    private String nameType;

    public MaterialTypeResource(final MaterialType materialType) {
        this.materialType = materialType;
        this.id = materialType.getId();
        this.nameType = materialType.getNameType();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNameType() {
        return nameType;
    }

    public void setNameType(String nameTyp) {
        this.nameType = nameTyp;
    }
}
