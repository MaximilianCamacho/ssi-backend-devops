package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.Employee;
import com.ssi.ssi.domain.model.EmployeeType;
import com.ssi.ssi.domain.repository.EmployeeRepository;
import com.ssi.ssi.domain.repository.EmployeeTypeRepository;
import com.ssi.ssi.request.EmployeeRequest;
import com.ssi.ssi.resources.EmployeeResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @autor Marco Herrera.
 */
@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private EmployeeTypeRepository employeeTypeRepository;

    /*public List<Employee> findAll() {
        return (List<Employee>) employeeRepository.findAll();
    }*/

    public List<Employee> getAll() {
        return (List<Employee>) employeeRepository.getAll();
    }

    public Optional<Employee> findById(Long id) {
        /*Optional<Employee> employee = employeeRepository.getEmployee(id);*/
        Optional<Employee> employee = employeeRepository.findById(id);
        if(employee.isPresent() && employee.get().getDeleted().equals(Boolean.FALSE)){
            return employee;
        }else {
            return null;
        }
    }

    public List<Employee> findByText(String name){
        return (List<Employee>) employeeRepository.searchByText(name);
    }

    public void addEmployee(EmployeeRequest employeeRequest){
        if(employeeTypeRepository.existsById(employeeRequest.getEmployeeTypeId())) {

            Optional<EmployeeType> employeeType = employeeTypeRepository.findById(employeeRequest.getEmployeeTypeId());

            Employee employee = new Employee();
            employee.setFirstName(employeeRequest.getFirstName());
            employee.setLastName(employeeRequest.getLastName());
            employee.setCi(employeeRequest.getCi());
            employee.setGender(employeeRequest.getGender());
            employee.setAddress(employeeRequest.getAddress());
            employee.setPhone(employeeRequest.getPhone());
            employee.setBirthDate(employeeRequest.getBirthDate());
            employee.setSalary(employeeRequest.getSalary());
            employee.setEmail(employeeRequest.getEmail());
            employee.setEmployeeType(employeeType.get());
            employee.setDeleted(false);
            /*employeeRepository.createEmployee(employee.getAddress(),employee.getBirthDate(),employee.getCi(),employee.getEmail(),employee.getFirstName(),employee.getGender().toString(),employee.getLastName(),employee.getPhone(),employee.getSalary(),employee.getEmployeeType().getId());*/
            employeeRepository.save(employee);
        }else{
            System.out.println("The Employe Type Id, not exist for a valid registry.");
        }
    }

    public void upDateEmployee(EmployeeRequest employeeRequest, Long id){
        Optional<Employee> employee = findById(id);
        if (employeeRepository.existsById(id) && employee.get().getDeleted().equals(false)) {
            if(employeeTypeRepository.existsById(employeeRequest.getEmployeeTypeId())) {
                Optional<EmployeeType> employeeType = employeeTypeRepository.findById(employeeRequest.getEmployeeTypeId());

                //Optional<Employee> employee = findById(id);

                employee.get().setFirstName(employeeRequest.getFirstName());
                employee.get().setLastName(employeeRequest.getLastName());
                employee.get().setCi(employeeRequest.getCi());
                employee.get().setGender(employeeRequest.getGender());
                employee.get().setAddress(employeeRequest.getAddress());
                employee.get().setPhone(employeeRequest.getPhone());
                employee.get().setBirthDate(employeeRequest.getBirthDate());
                employee.get().setSalary(employeeRequest.getSalary());
                employee.get().setEmail(employeeRequest.getEmail());
                employee.get().setEmployeeType(employeeType.get());
                employeeRepository.save(employee.get());
            } else {
                System.out.println("The Employe Type Id, not exist for a valid registry.");
            }
        } else {
            System.out.println("No exist the Employee with id '" + id + "' for upDate.");
        }
    }

    public void deleteEmployeeById(Long id){
        if(employeeRepository.existsById(id)) {
            Optional<Employee> employee = findById(id);
            employee.get().setDeleted(Boolean.TRUE);
            employeeRepository.save(employee.get());
            System.out.println("The Employee with id '" + id + "' is deleted.");
        }
        else
        {
            System.out.println("No exist the Employee with id '" + id + "' for delete.");
        }
    }

    public EmployeeResource builderEmployeeResource(Employee employee) {
        EmployeeResource instance = new EmployeeResource(employee);
        instance.setEmployeeType(instance.build(employee.getEmployeeType()));
        return instance;
    }
}
