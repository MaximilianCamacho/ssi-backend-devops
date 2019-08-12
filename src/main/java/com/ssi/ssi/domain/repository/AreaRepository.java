package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.Area;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface AreaRepository  extends CrudRepository <Area,Long>{

    @Query("SELECT area FROM Area area WHERE area.isDeleted='false' ")
    List<Area> getAll();

    /*@Query(nativeQuery = true, value = "exec get_all_area")
    List<Area> getAllAreas();

    @Procedure(procedureName = "create_area", outputParameterName = "id")
    Long createArea(String codigo, String description, String name, Boolean Deleted, Long area_id);

    @Query(nativeQuery = true, value = "exec get_area :id")
    Optional<Area> getArea(@Param("id") Long id);*/






}


