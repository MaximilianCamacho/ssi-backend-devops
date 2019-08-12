package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.EmployeeType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * @autor Marco Herrera.
 */
@Repository
public interface EmployeeTypeRepository extends CrudRepository<EmployeeType, Long>{
    @Query("select empType from EmployeeType empType where lower(empType.name) like CONCAT('%',:name,'%')")
    List<EmployeeType> searchByName(@Param("name") String name);

    // @Procedure(procedureName = "create_employee_type", outputParameterName = "id")
/*    @Procedure(procedureName = "create_employee_type")
    Long createEmployeeType(String name, String description);

    @Query(nativeQuery = true, value = "exec get_employee_type :id")
    Optional<EmployeeType> getEmployeeType(@Param("id") Long id);

    @Query(nativeQuery = true, value = "exec get_all_employee_type")
    List<EmployeeType> getAll();*/
}
