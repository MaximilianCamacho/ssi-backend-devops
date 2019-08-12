package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.*;
import com.ssi.ssi.domain.repository.IncidentRepository;
import com.ssi.ssi.resources.IncidentResource;
import com.ssi.ssi.resources.IncidentResourceCreate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class IncidentService {

    @Autowired
    private IncidentRepository incidentRepository;

    @Autowired
    private IncidentTypeService incidentTypeService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private LesionTypeService lesionTypeService;

    @Autowired
    private AccidentAgentService accidentAgentService;

    public Optional<Incident> findIncidentById(Long id) {
        return incidentRepository.findById(id);
    }


    public Incident createIncident(IncidentResourceCreate incidentResourceCreate) {
        Optional<Employee> employeeDb = employeeService.findById(incidentResourceCreate.getEmployeeId());
        Optional<IncidentType> incidentTypeDb = incidentTypeService.findIncidentTypeById(incidentResourceCreate.getIncidentTypeId());
        Optional<LesionType> lesionTypeDb = lesionTypeService.findLesionTypeById(incidentResourceCreate.getLesionTypeId());
        Optional<IncidentAgent> accidentAgentDb = accidentAgentService.findAccidentAgentById(incidentResourceCreate.getAccidentAgentId());
        if (employeeDb.isPresent() && incidentTypeDb.isPresent() && lesionTypeDb.isPresent() && accidentAgentDb.isPresent()) {
            Incident incident = new Incident();
            incident.setIncidentType(incidentTypeDb.get());
            incident.setEmployee(employeeDb.get());
            incident.setLesionType(lesionTypeDb.get());
            incident.setIncidentAgent(accidentAgentDb.get());
            incident.setAccidentDate(incidentResourceCreate.getAccidentDate());
            incident.setAccidentDay(incidentResourceCreate.getAccidentDay());
            incident.setAccidentTime(incidentResourceCreate.getAccidentTime());
            incident.setAccidentSite(incidentResourceCreate.getAccidentSite());
            incident.setWorkingTurn(incidentResourceCreate.getWorkingTurn());
            incident.setAffectedPart(incidentResourceCreate.getAffectedPart());
            incident.setIsDeleted(Boolean.FALSE);
            return incidentRepository.save(incident);
        }

        return new Incident();

    }

    public Boolean updateIncident(IncidentResourceCreate incidentResourceCreate) {

        Boolean wasUpdated = Boolean.FALSE;

        Optional<Incident> incidentDb = findIncidentById(incidentResourceCreate.getIncidentId());
        Optional<IncidentType> incidentTypeDb = incidentTypeService.findIncidentTypeById(incidentResourceCreate.getIncidentTypeId());
        Optional<IncidentAgent> accidentAgentDb = accidentAgentService.findAccidentAgentById(incidentResourceCreate.getAccidentAgentId());
        Optional<LesionType> lesionTypeDb = lesionTypeService.findLesionTypeById(incidentResourceCreate.getLesionTypeId());
        if (incidentDb.isPresent() && incidentTypeDb.isPresent() && accidentAgentDb.isPresent() && lesionTypeDb.isPresent()) {
            incidentDb.get().setIncidentType(incidentTypeDb.get());
            incidentDb.get().setAccidentDate(incidentResourceCreate.getAccidentDate());
            incidentDb.get().setAccidentDay(incidentResourceCreate.getAccidentDay());
            incidentDb.get().setAccidentTime(incidentResourceCreate.getAccidentTime());
            incidentDb.get().setAccidentSite(incidentResourceCreate.getAccidentSite());
            incidentDb.get().setWorkingTurn(incidentResourceCreate.getWorkingTurn());
            incidentDb.get().setAffectedPart(incidentResourceCreate.getAffectedPart());
            incidentRepository.save(incidentDb.get());
            wasUpdated = Boolean.TRUE;
        }

        return wasUpdated;
    }

    public Iterable<Incident> getAllIncident() {
        return incidentRepository.findAll();
    }

    public void delete(Long id) {
        Optional<Incident> incidentDb = findIncidentById(id);
        if (incidentDb.isPresent()) {
            incidentDb.get().setIsDeleted(Boolean.TRUE);
            incidentRepository.save(incidentDb.get());
        }
    }

    public List<IncidentResource> getIncidents(){
        List<IncidentResource> incidentResourceList = new ArrayList<>();
        getAllIncident().forEach(
                incident -> incidentResourceList.add(builderIncidentResource(incident))
        );
        return incidentResourceList;
    }

    private IncidentResource builderIncidentResource(Incident incident) {
        IncidentResource instance = new IncidentResource();
        instance.setId(incident.getId());
        instance.setAccidentDate(incident.getAccidentDate());
        instance.setAccidentDay(incident.getAccidentDay());
        instance.setAccidentSite(incident.getAccidentSite());
        instance.setAccidentTime(incident.getAccidentTime());
        instance.setAffectedPart(incident.getAffectedPart());
        instance.setWorkingTurn(incident.getWorkingTurn());
        instance.setAccidentAgent(accidentAgentService.builderAccidentAgentResource(incident.getIncidentAgent()));
        instance.setDeleted(incident.getIsDeleted());
        instance.setEmployee(employeeService.builderEmployeeResource(incident.getEmployee()));
        instance.setIncidentType(incidentTypeService.builderIncidentTypeResource(incident.getIncidentType()));
        instance.setLesionType(lesionTypeService.builderLesionTypeResource(incident.getLesionType()));
        return instance;
    }
}
