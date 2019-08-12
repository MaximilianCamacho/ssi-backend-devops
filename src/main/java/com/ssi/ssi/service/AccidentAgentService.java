package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.IncidentAgent;
import com.ssi.ssi.domain.repository.IncidentAgentRepository;
import com.ssi.ssi.resources.AccidentAgentResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AccidentAgentService {

    @Autowired
    private IncidentAgentRepository incidentAgentRepository;

    public Optional<IncidentAgent> findAccidentAgentById(Long id) {
        return incidentAgentRepository.findById(id);
    }


    public IncidentAgent createAccidentAgent(IncidentAgent incidentAgent) {
        incidentAgent.setIsDeleted(false);
        return incidentAgentRepository.save(incidentAgent);
    }

    public Boolean updateAccidentAgent(IncidentAgent incidentAgent, Long id) {

        Boolean wasUpdated = Boolean.FALSE;

        /*Optional<IncidentAgent> accidentAgentDb = findAccidentAgentById(incidentAgent.getId());*/
        Optional<IncidentAgent> accidentAgentDb = findAccidentAgentById(id);
        if (accidentAgentDb.isPresent()) {
            accidentAgentDb.get().setName(incidentAgent.getName());
            incidentAgentRepository.save(accidentAgentDb.get());
            wasUpdated = Boolean.TRUE;
        }

        return wasUpdated;
    }

    public List<IncidentAgent> getAllAccidentAgents() {
        return incidentAgentRepository.findAll();
    }

    public void delete(Long id) {
        Optional<IncidentAgent> accidentAgentDb = findAccidentAgentById(id);
        if (accidentAgentDb.isPresent()) {
            accidentAgentDb.get().setIsDeleted(Boolean.TRUE);
            incidentAgentRepository.save(accidentAgentDb.get());
        }
    }

    public AccidentAgentResource builderAccidentAgentResource (IncidentAgent incidentAgent) {
        AccidentAgentResource instance = new AccidentAgentResource(incidentAgent);
        instance.setId(incidentAgent.getId());
        instance.setName(incidentAgent.getName());
        instance.setDeleted(incidentAgent.getIsDeleted());
        return instance;
    }
}
