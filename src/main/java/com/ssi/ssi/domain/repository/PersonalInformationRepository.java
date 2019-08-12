package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.Area;
import com.ssi.ssi.domain.model.Capacity;
import com.ssi.ssi.domain.model.PersonalInformation;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface PersonalInformationRepository extends CrudRepository<PersonalInformation,Long> {

    @Query("SELECT personalInformation FROM PersonalInformation personalInformation WHERE personalInformation.isDeleted=0 ")
    List<PersonalInformation> getAll();


/*    @Query(nativeQuery = true, value = "exec get_all_personal_information")
    List<PersonalInformation> getPersonalInformationFull();

    @Procedure(procedureName = "create_personal_information", outputParameterName = "id")
    Long createPersonalInformation(String legal_name, Long area_id, Long employee_id, Date registration_date,Boolean  is_deleted ,Long id );

    @Query(nativeQuery = true, value = "exec get_personal_information :id")
    Optional<PersonalInformation> getPersonalInformation(@Param("id") Long id);*/






}
