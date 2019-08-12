package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.Role;
import com.ssi.ssi.domain.model.RoleType;

public class RoleResource {
    private final Role role;
    private Long id;
    private RoleType roleName;
    private String description;

    public RoleResource(final Role role) {
        this.role = role;
        this.id = role.getId();
        this.roleName = role.getRoleName();
        this.description = role.getDescription();
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public RoleType getRoleName() {
        return roleName;
    }

    public void setRoleName(RoleType roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
