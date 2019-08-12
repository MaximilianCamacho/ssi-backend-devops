package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.LesionType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface LesionTypeRepository extends CrudRepository<LesionType, Long> {
    @Query("SELECT lesionType FROM LesionType lesionType WHERE lesionType.isDeleted=0 ")
    List<LesionType> findAll();

    /*@Query(nativeQuery = true, value = "exec get_all_lesion_type")
    List<LesionType> findAll();

    @Query(nativeQuery = true, value = "exec get_lesion_type")
    Optional<LesionType> findById(Long id);*/
}
