package com.ssi.ssi.request;


public class CapacityRequest {

    private Long id;
    private String name;
    private String description;
    private String capacityList;
    private Boolean isDeleted;

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

    public String getCapacityList() {
        return capacityList;
    }

    public void setCapacityList(String capacityList) {
        this.capacityList = capacityList;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }
}
