package com.ssi.ssi.request;

public class MaterialRequest {

    /*private Long id;*/
    private String name;
    private Long vidaUtil;
    private String description;
    private Long materialTypeId;

    /*public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }*/

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getVidaUtil() {
        return vidaUtil;
    }

    public void setVidaUtil(Long vidaUtil) {
        this.vidaUtil = vidaUtil;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getMaterialTypeId() {
        return materialTypeId;
    }

    public void setMaterialTypeId(Long materialTypeId) {
        this.materialTypeId = materialTypeId;
    }
}
