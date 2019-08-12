package com.ssi.ssi.resources;


import com.ssi.ssi.domain.model.Material;
import com.ssi.ssi.domain.model.MaterialType;


public class MaterialResource {

    private final Material material;

    private Long id;
    private String name;
    private Long vidaUtil;
    private String description;
    private MaterialTypeResource materialType;


    public MaterialResource(final Material material) {
        this.material = material;
        this.id = material.getId();
        this.name = material.getName();
        this.vidaUtil = material.getVidaUtil();
        this.description = material.getMatDescription();
        this.materialType = build(material.getMaterialType());
    }

    public Long getVidaUtil() {
        return vidaUtil;
    }

    public void setVidaUtil(Long vidaUtil) {
        this.vidaUtil = vidaUtil;
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

    public void setName(String matName) {
        this.name = matName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    /*public MaterialType getMatType() {
        return matType;
    }

    public void setMatType(MaterialType matType) {
        this.matType = matType;
    }*/

    public MaterialTypeResource build(MaterialType materialType){
        MaterialTypeResource resource = new MaterialTypeResource(materialType);
        return resource;
    }

    public MaterialTypeResource getMatType() {
        return materialType;
    }

    public void setMatType(MaterialTypeResource matType) {
        this.materialType = matType;
    }
}
