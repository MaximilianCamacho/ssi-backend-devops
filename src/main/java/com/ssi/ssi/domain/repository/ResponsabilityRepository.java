package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.Area;
import com.ssi.ssi.domain.model.IncidentType;
import com.ssi.ssi.domain.model.Responsibility;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ResponsabilityRepository extends CrudRepository<Responsibility, Long> {
    @Query("SELECT responsibility FROM Responsibility responsibility WHERE responsibility.isDeleted=0 ")
    List<Responsibility> getAll();

}


