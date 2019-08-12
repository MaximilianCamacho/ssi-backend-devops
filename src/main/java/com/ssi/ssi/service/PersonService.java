package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.Person;
import com.ssi.ssi.domain.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PersonService {

    @Autowired
    private PersonRepository personRepository;

    public List<Person> getAll(){
        return (List<Person>) personRepository.findAll();
    }

    public Optional<Person> get(Long id){
        return personRepository.findById(id);
    }

    public Person save(Person personRequest) {
        Person person = new Person();
        person.setFirstName(personRequest.getFirstName());
        person.setLastName(personRequest.getLastName());
        return personRepository.save(person);
    }

    public void delete (Person person) {
        personRepository.delete(person);
    }

    public void deleteById (Long id) {
        personRepository.deleteById(id);
    }
}
