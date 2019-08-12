package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.*;
import com.ssi.ssi.domain.repository.PersonalInformationRepository;
import com.ssi.ssi.request.PersonalInformationRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PersonalInformationService {
    @Autowired
    PersonalInformationRepository personalInformationRepository;

    @Autowired
    EmployeeService employeeService;

    @Autowired
    AreaService areaService;

    @Autowired
    CapacityService capacityService;

    public List<PersonalInformation> findAll() {

        return (List<PersonalInformation>) personalInformationRepository.findAll();
    }

    public Optional<PersonalInformation> findPersonalById(Long id) {

        return personalInformationRepository.findById(id);
    }

    public void createPersonalInformation(PersonalInformationRequest personalInformationRequest) {

        Optional<Area> areaDb = areaService.getId(personalInformationRequest.getAreaId());
        Optional<Employee> employeeDb = employeeService.findById(personalInformationRequest.getEmployeeId());


        if(areaDb.isPresent() && employeeDb.isPresent()){
            PersonalInformation personalInformation = new PersonalInformation();
            personalInformation.setArea(areaDb.get());
            personalInformation.setEmployee(employeeDb.get());
            personalInformation.setLegalName(personalInformationRequest.getLegalName());
            personalInformation.setRegistrationDate(personalInformationRequest.getRegistrationDate());
            personalInformation.setDeleted(Boolean.FALSE);
            personalInformationRepository.save(personalInformation);
        }
        else{
            System.out.println("The Employee with id " + personalInformationRequest.getEmployeeId() +
                    " and  Area with id " + personalInformationRequest.getAreaId() +" not exist.");
        }

    }


    public void updatePersonalInformation(PersonalInformationRequest personalInformationRequest, Long id) {

        Optional<PersonalInformation> personalInformationDb = findPersonalById(id);
        Optional<Employee> employeeDb = employeeService.findById(personalInformationRequest.getEmployeeId());
        Optional<Area> areaDb = areaService.findAreaById(personalInformationRequest.getAreaId());

         if (personalInformationDb.isPresent()) {
             if(areaDb.isPresent() && employeeDb.isPresent()){
                 personalInformationDb.get().setArea(areaDb.get());
                 personalInformationDb.get().setEmployee(employeeDb.get());
                 personalInformationDb.get().setLegalName(personalInformationRequest.getLegalName());
                 personalInformationDb.get().setRegistrationDate(personalInformationRequest.getRegistrationDate());
                 personalInformationDb.get().setDeleted(Boolean.FALSE);
                 personalInformationRepository.save(personalInformationDb.get());
             }
             else{
                 System.out.println("The Employee with id " + personalInformationRequest.getEmployeeId() +
                         " and  Area with id " + personalInformationRequest.getAreaId() +" not exist.");
             }

        }else{
             System.out.println("The PersonalInformation with id '" + id + "' not exist.");
         }
    }

    public void deletePersonalInformation (Long id){
        if(personalInformationRepository.existsById(id)) {
            Optional<PersonalInformation> personalInformation = findPersonalById(id);
            personalInformation.get().setDeleted(Boolean.TRUE);
            personalInformationRepository.save(personalInformation.get());
            System.out.println("The PersonalInformation with id '" + id + "' is deleted.");
        }
        else
        {
            System.out.println("No exist the PersonalInformation with id '" + id + "' for delete.");
        }
    }



}
