package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.IncidentType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface IncidentTypeRepository extends CrudRepository<IncidentType, Long> {

    @Query("SELECT incidentType FROM IncidentType incidentType WHERE incidentType.isDeleted=0 ")
    List<IncidentType> findAll();


    /*@Procedure(procedureName = "create_incident_type")
    Long createIncidentType(String name, String description);

    @Query(nativeQuery = true, value = "exec get_incident_type :id")
    Optional<IncidentType> getIncidentType(@Param("id") Long id);

    @Query(nativeQuery = true, value = "exec get_all_incident_type")
    List<IncidentType> getAllIncidentType();*/
}
