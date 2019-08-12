package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.Employee;
import com.ssi.ssi.domain.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssi.ssi.domain.model.Person;
import com.ssi.ssi.domain.repository.PersonRepository;
import com.ssi.ssi.resources.AutoCompleteResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
public class AutoCompleteService {

    @Autowired
    private EmployeeRepository employeeRepository;


    public Iterable<Employee> findAllEmployeeByParameter(String search) {
        return employeeRepository.findEmployee(search);
    }
}
