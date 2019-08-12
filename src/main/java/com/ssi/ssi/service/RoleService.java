package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.Area;
import com.ssi.ssi.domain.model.Role;
import com.ssi.ssi.domain.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoleService {

    @Autowired
    private RoleRepository roleRepository;

    public List<Role> getAll(){
        return (List<Role>) roleRepository.findAll();
    }

    public Optional<Role> getId(Long id){
        return  roleRepository.findById(id);
    }


    public Role save(Role role){
        return  roleRepository.save(role);
    }

    public  void delete(Role role){
        roleRepository.delete(role);
    }
    public void  deleteById(Long id){
        roleRepository.deleteById(id);
    }

    public  boolean isValidateRole( Role role){
        boolean isValidate = Boolean.FALSE;
        if(null != role.getRoleName()){
            isValidate = Boolean.TRUE;
        }
        return isValidate;

    }
}
