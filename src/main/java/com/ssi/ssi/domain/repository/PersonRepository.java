package com.ssi.ssi.domain.repository;

import com.ssi.ssi.domain.model.Person;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface PersonRepository extends CrudRepository<Person, Long> {


    @Query("SELECT p FROM Person p WHERE p.firstName like :search1 OR p.lastName like :search2 OR p.ci like :search3")
    public List<Person> findByFirstNameLikeAndCiLike(@Param("search1") String search1, @Param("search2") String search2, @Param("search3") String search3);
}
