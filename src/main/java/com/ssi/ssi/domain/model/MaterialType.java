package com.ssi.ssi.domain.model;

import javax.persistence.*;

@Entity
@Table(name = "material_type")
public class MaterialType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name_type")
    private String nameType;

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
