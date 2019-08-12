package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.IncidentType;
import com.ssi.ssi.domain.repository.IncidentTypeRepository;
import com.ssi.ssi.resources.IncidentTypeResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class IncidentTypeService {

    @Autowired
    private IncidentTypeRepository incidentTypeRepository;

    public Optional<IncidentType> findIncidentTypeById(Long id) {
        return incidentTypeRepository.findById(id);
    }


    public IncidentType createIncidentType(IncidentTypeResource incidentTypeResource) {
        /*Long incidentTypeId = incidentTypeRepository.createIncidentType(incidentTypeResource.getName(), incidentTypeResource.getDescription());
        return incidentTypeRepository.getIncidentType(incidentTypeId).get();*/
        IncidentType incidentType = new IncidentType();
        incidentType.setName(incidentTypeResource.getName());
        incidentType.setDescription(incidentTypeResource.getDescription());
        incidentType.setIsDeleted(false);
        return incidentTypeRepository.save(incidentType);
    }
    public Optional<IncidentType> findById(Long id){
        /*return employeeTypeRepository.getEmployeeType(id);*/
        return incidentTypeRepository.findById(id);
    }
    public Boolean updateIncidentType(IncidentType incidentType, Long id) {

        Boolean wasUpdated = Boolean.FALSE;

        /*Optional<IncidentType> incidentTypeDb = findIncidentTypeById(incidentType.getId());*/
        Optional<IncidentType> incidentTypeDb = findById(id);
        if (incidentTypeDb.isPresent()) {
            incidentTypeDb.get().setName(incidentType.getName());
            incidentTypeDb.get().setDescription(incidentType.getDescription());
            incidentTypeRepository.save(incidentTypeDb.get());
            wasUpdated = Boolean.TRUE;
        }

        return wasUpdated;
    }

    public List<IncidentType> getAllIncidentType() {
        /*return incidentTypeRepository.getAllIncidentType();*/
        return incidentTypeRepository.findAll();
    }

    public void delete(Long id) {
        Optional<IncidentType> incidentTypeDb = findIncidentTypeById(id);
        /*Optional<IncidentType> incidentTypeDb = findById(id);*/
        if (incidentTypeDb.isPresent()) {
            incidentTypeDb.get().setIsDeleted(Boolean.TRUE);
            incidentTypeRepository.save(incidentTypeDb.get());
        }
    }

    public IncidentTypeResource builderIncidentTypeResource(IncidentType incidentType) {
        return new IncidentTypeResource(incidentType);
    }
}
