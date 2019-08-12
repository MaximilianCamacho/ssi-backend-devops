package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.Employee;

import com.ssi.ssi.domain.model.Incident;
import com.ssi.ssi.domain.model.IncidentType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

/**
 * @autor Marco Herrera.
 */
@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Long> {
    @Query("SELECT employee FROM Employee employee WHERE employee.isDeleted=0 ")
    List<Employee> getAll();

    @Query("SELECT employee FROM Employee employee WHERE employee.id = :id and employee.isDeleted=0 ")
    Optional<Employee> findById(@Param("id") Long id);

    @Query("select employee from Employee employee where employee.firstName like CONCAT('%',:name,'%') or employee.email like CONCAT('%',:name,'%')")
    List<Employee> searchByText(@Param("name") String name);

    @Query("SELECT employee FROM Employee employee WHERE employee.firstName like CONCAT('%',:search,'%') OR employee.lastName like CONCAT('%',:search,'%') OR employee.ci like CONCAT('%',:search,'%')")
    List<Employee> findEmployee(@Param("search") String search);

    @Query("select incident " +
            "from Employee employee, Incident incident " +
            "where incident.employee.id = employee.id and employee.id = 1")
    List<Incident> getAlle();

    // @Procedure(procedureName = "create_employee", outputParameterName = "id")
    /*@Procedure(procedureName = "create_employee")
    Long createEmployee(String address, Date birth_date, String ci, String email, String first_name, String gender, String last_name, Long phone, Double salary, Long employee_type_id);*/

    /*@Query(nativeQuery = true, value = "exec get_employee :id")
    Optional<Employee> getEmployee(@Param("id") Long id);

    @Query(nativeQuery = true, value = "exec get_all_employee")
    List<Employee> getAll();*/

    /*@Procedure(procedureName = "delete_employee", outputParameterName = "id")
    Long deleteEmployee(Boolean isDeleted);*/

    /*@Query(nativeQuery = true, value = "exec delete_employee_Type")
    List<Employee> deleteEmployee();*/
}
