package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.Area;
import com.ssi.ssi.domain.model.Capacity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface CapacityRepository extends CrudRepository<Capacity,Long> {

    @Query("SELECT capacity FROM Capacity capacity WHERE capacity.isDeleted=0 ")
    List<Capacity> getAll();

/*
    @Query(nativeQuery = true, value = "exec get_all_capacity")
    List<Capacity> getAllCapacity();

    @Procedure(procedureName = "create_capacity", outputParameterName = "id")
    Long createCapacity(String description, String name, Boolean Deleted, Long capacity_id);


    @Query(nativeQuery = true, value = "exec get_area :id")
    Optional<Capacity> getCapacity(@Param("id") Long id);



    @Procedure(procedureName = "create_area", outputParameterName = "id")
    Long createArea(String codigo, String description, String name, Boolean Deleted, Long area_id);

    @Query(nativeQuery = true, value = "exec get_area :id")
    Optional<Area> getArea(@Param("id") Long id);
*/






}
