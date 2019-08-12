package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.Incident;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IncidentRepository extends CrudRepository<Incident, Long> {

    @Query("SELECT incident FROM Incident incident WHERE incident.isDeleted=0 ")
    List<Incident> findAll();

    /*@Query(nativeQuery = true, value = "exec get_all_incident")
    List<Incident> findAll();*/
}
