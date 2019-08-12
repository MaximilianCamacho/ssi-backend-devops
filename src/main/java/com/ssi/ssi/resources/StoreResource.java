package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.Material;

import java.util.List;

public class StoreResource {

    private Long id;
    private String name;
    private Integer stock;

    private List<Material> matereal;

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

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public List<Material> getMatereal() {
        return matereal;
    }

    public void setMatereal(List<Material> matereal) {
        this.matereal = matereal;
    }
}
