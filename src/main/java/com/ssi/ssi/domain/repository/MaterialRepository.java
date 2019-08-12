package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.Material;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaterialRepository extends CrudRepository<Material, Long>{

/*    @Query(nativeQuery = true, value = "exec get_all_material")
    List<Material> getAllMaterial();

    @Procedure(procedureName = "exec CreateMaterial")
    Long saveMaterial(String name, String description_material, Long material_type_id, Long vida_util);

    @Query(nativeQuery = true, value  = "exec get_material:id")
    Material getMaterialById(@Param("id") Long id);*/



}
