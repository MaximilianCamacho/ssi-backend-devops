package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.EmployeeType;
import com.ssi.ssi.domain.repository.EmployeeTypeRepository;
import com.ssi.ssi.request.EmployeeTypeRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @autor Marco Herrera.
 */
@Service
public class EmployeeTypeService {

    @Autowired
    private EmployeeTypeRepository employeeTypeRepository;

    public List<EmployeeType> getAll(){

        /*return (List<EmployeeType>) employeeTypeRepository.getAll();*/
        return (List<EmployeeType>) employeeTypeRepository.findAll();
    }

    public Optional<EmployeeType> findById(Long id){
        /*return employeeTypeRepository.getEmployeeType(id);*/
        return employeeTypeRepository.findById(id);
    }

    public List<EmployeeType> finByName(String name){
        return employeeTypeRepository.searchByName(name);
    }

    public void addEmployeType (EmployeeTypeRequest request){
        EmployeeType employeeType = new EmployeeType();
        employeeType.setName(request.getTypeName());
        employeeType.setDescription(request.getDescription());
        /*employeeTypeRepository.createEmployeeType(employeeType.getName(), employeeType.getDescription());*/
        employeeTypeRepository.save(employeeType);
    }

    public void updateEmployeType (EmployeeTypeRequest request, Long id){
        Optional<EmployeeType> employeeType = findById(id);
        if(employeeType.isPresent()) {
            employeeType.get().setName(request.getTypeName());
            employeeType.get().setDescription(request.getDescription());
            employeeTypeRepository.save(employeeType.get());
        }
    }

    public void deleteEmployeType (Long id){
        if(employeeTypeRepository.existsById(id)) {
            employeeTypeRepository.deleteById(id);
            System.out.println("The EmployeeType with id '" + id + "' is deleted.");
        }
        else
        {
            System.out.println("No exist the EmployeeType with id '" + id + "' for delete.");
        }
    }
}
