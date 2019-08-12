package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.Area;

public class AreaResource {
    private final Area area;
    private Long id;
    private String name;
    private String description;
    private  String codigo;
    private Boolean isDeleted;


    public AreaResource(final Area area) {
       this.area = area;
       this.id = area.getId();
       this.name = area.getName();
       this.description = area.getDescription();
       this.codigo = area.getCodigo();
       this.isDeleted = area.getDeleted();
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }



}
