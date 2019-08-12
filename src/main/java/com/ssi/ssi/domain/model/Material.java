package com.ssi.ssi.domain.model;

import javax.persistence.*;

@Entity
@Table(name = "material")
public class Material {

    @Id
    @GeneratedValue(
            strategy = GenerationType.IDENTITY
    )
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "vida_util")
    private Long vidaUtil;

    @Column(name = "material_description")
    private String matDescription;

    @ManyToOne
    @JoinColumn(name = "material_type_id")
    private MaterialType materialType;

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

    public Long getVidaUtil() {
        return vidaUtil;
    }

    public void setVidaUtil(Long vidaUtil) {
        this.vidaUtil = vidaUtil;
    }

    public MaterialType getMaterialType() {
        return materialType;
    }

    public void setMaterialType(MaterialType materialType) {
        this.materialType = materialType;
    }

    public String getMatDescription() {
        return matDescription;
    }

    public void setMatDescription(String matDescription) {
        this.matDescription = matDescription;
    }
}
