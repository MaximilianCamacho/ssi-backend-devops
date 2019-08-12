package com.ssi.ssi.service;


import com.ssi.ssi.domain.model.Assignment;
import com.ssi.ssi.domain.model.Employee;
import com.ssi.ssi.domain.model.Material;
import com.ssi.ssi.domain.repository.AssignmentRepository;
import com.ssi.ssi.domain.repository.EmployeeRepository;
import com.ssi.ssi.domain.repository.MaterialRepository;
import com.ssi.ssi.request.AssignmentRequest;
import com.ssi.ssi.resources.AssignmentResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AssignmentService {
    @Autowired
    private AssignmentRepository assignmentRepository;
    @Autowired
    private MaterialRepository materialRepository;
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private MaterialService materialService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private StoreService storeService;

    public Optional<Assignment> getAssignmentById(Long id){
        return assignmentRepository.findById(id);
    }

    public Boolean stockCheck(Long id, Integer quantity){
        Boolean checkStock = Boolean.FALSE;
        //Material mat = storeRepository.;
        if(storeService.getById(id).get().getStock()>=quantity){
            checkStock = Boolean.TRUE;
        }
        //storeService.getById(id).get().getStock()>=quantity
        return checkStock;
    }
    public Assignment createAssignment(AssignmentRequest assignmentReq){
        Optional<Material> materialId = materialService.getMaterialById(assignmentReq.getMaterialId());
        Optional<Employee> employeeId = employeeService.findById(assignmentReq.getEmployeeId());

        if(materialId.isPresent()&& employeeId.isPresent()){
            Assignment assignment = new Assignment();
            assignment.setEmployee(employeeId.get());
            assignment.setMaterial(materialId.get());
            assignment.setAssignmentDate(assignmentReq.getAssignmentDate());
            assignment.setQuantity(assignmentReq.getQuantity());
            return assignmentRepository.save(assignment);
        }
        return new Assignment();
    }

    public Boolean updateAssignment(Long id, AssignmentRequest updatedAssign){

        Boolean wasUpdated = Boolean.FALSE;
        Optional<Assignment> assignment = getAssignmentById(id);
        Optional<Employee> employeeId = employeeService.findById(updatedAssign.getEmployeeId());
        Optional<Material> materialId = materialService.getMaterialById(updatedAssign.getMaterialId());
        if(materialId.isPresent() && employeeId.isPresent()){
            assignment.get().setEmployee(employeeId.get());
            assignment.get().setMaterial(materialId.get());
            assignment.get().setAssignmentDate(updatedAssign.getAssignmentDate());
            assignment.get().setQuantity(updatedAssign.getQuantity());
            assignmentRepository.save(assignment.get());
            wasUpdated = Boolean.TRUE;
        }
        return wasUpdated;
    }

    public void delete(Assignment assignment) {
        assignmentRepository.delete(assignment);
    }

    public Boolean deleteById(Long id) {
        Boolean wasDeleted = Boolean.FALSE;
        Optional<Assignment> assignment = getAssignmentById(id);
        if (assignment.isPresent()) {
            assignmentRepository.delete(assignment.get());
            wasDeleted = Boolean.TRUE;
        }
        return wasDeleted;
    }

    public List<Assignment> getAllAssignment(){
        /*return assignmentRepository.getAllAssignment();*/
        return (List)assignmentRepository.findAll();
    }

    /*
    public Assignment saveAssignment(Assignment assignment) {
        Material material = materialRepository.findById(assignment.getMaterial().getId()).get();
        assignment.setMaterial(material);
        Employee employee = employeeRepository.findById(assignment.getEmployee().getId()).get();
        assignment.setEmployee(employee);

        return assignmentRepository.save(assignment);
    }*/
}
