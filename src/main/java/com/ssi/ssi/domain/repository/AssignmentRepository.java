package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.Assignment;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AssignmentRepository extends CrudRepository<Assignment, Long> {

    /*@Query(nativeQuery = true, value = "exec GetAllAssignment")
    List<Assignment> getAllAssignment();*/
}
