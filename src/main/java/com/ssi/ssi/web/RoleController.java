package com.ssi.ssi.web;

import com.ssi.ssi.domain.model.Role;
import com.ssi.ssi.domain.repository.exception.MessageNotFountException;
import com.ssi.ssi.resources.RoleResource;
import com.ssi.ssi.service.RoleService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Api(value = "role" , description = "role")
@RestController
@RequestMapping(value = "/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @GetMapping
    public ResponseEntity<List<RoleResource>> getAllRoles(){
        final List<RoleResource> collection = roleService.getAll().stream().map(RoleResource::new).collect(Collectors.toList());
        return ResponseEntity.ok(collection);
    }


    @GetMapping("/{id}")
    public ResponseEntity<RoleResource> get(@PathVariable final long id) {
        return roleService.getId(id).map(p -> ResponseEntity.ok(new RoleResource(p))).orElseThrow(() -> new MessageNotFountException(id));
    }

    @PostMapping
    public ResponseEntity<RoleResource> post(@RequestBody final Role roleFromRequest) {
        final Role role = roleService.save(roleFromRequest);
        return ResponseEntity.ok(new RoleResource(role));
    }


    @PutMapping("/{id}")
    public ResponseEntity<RoleResource> put(@PathVariable("id") final long id, @RequestBody Role roleFromRequest) {
        final Role role = roleFromRequest;
        final RoleResource resource;
        boolean isvalidate = roleService.isValidateRole(role);
        if(isvalidate){
            roleService.save(role);
            resource = new RoleResource(role);
            return ResponseEntity.ok(resource);
        }

        return new ResponseEntity(role, HttpStatus.NOT_FOUND);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable("id") final long id) {
        return roleService.getId(id).map(p -> {
            roleService.deleteById(id);
            return ResponseEntity.noContent().build();
        }).orElseThrow(() -> new MessageNotFountException(id));
    }



}
