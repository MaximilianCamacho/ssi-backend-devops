package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.IncidentAgent;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IncidentAgentRepository extends CrudRepository<IncidentAgent, Long> {

    @Query("SELECT incidentAgent FROM IncidentAgent incidentAgent WHERE incidentAgent.isDeleted=0 ")
    List<IncidentAgent> findAll();

    /*@Query(nativeQuery = true, value = "exec get_all_incident_agent")
    List<IncidentAgent> findAll();*/
}
