package com.ssi.ssi.domain.repository;


import com.ssi.ssi.domain.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByUsername(String name);
}
