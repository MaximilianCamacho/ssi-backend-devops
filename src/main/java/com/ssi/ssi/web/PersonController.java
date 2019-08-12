package com.ssi.ssi.web;

import com.ssi.ssi.domain.model.Person;
import com.ssi.ssi.domain.repository.exception.PersonNotFountException;
import com.ssi.ssi.resources.PersonResource;
import com.ssi.ssi.service.PersonService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Api(value = "person", description = "person")
@RestController
@RequestMapping(value = "/person")
public class PersonController {

    @Autowired
    private  PersonService personService;

    @GetMapping()
    public ResponseEntity<List<PersonResource>> getAllPersons() {
        final List<PersonResource> collection = personService.getAll()
                .stream()
                .map(PersonResource::new)
                .collect(Collectors.toList());
        return ResponseEntity.ok(collection);
    }

    @GetMapping("/{id}")
    public ResponseEntity<PersonResource> get (@PathVariable final long id) {
        return personService.get(id).map(p -> ResponseEntity.ok(new PersonResource(p))).orElseThrow(() -> new PersonNotFountException(id));
    }

    @PostMapping
    public ResponseEntity<PersonResource> post(@RequestBody final Person personFromRequest) {
        final Person person = personService.save(personFromRequest);
        return ResponseEntity.ok(new PersonResource(person));
    }

    @PutMapping("/{id}")
    public ResponseEntity<PersonResource> put(@PathVariable("id") final long id, @RequestBody Person personFromRequest) {
        final Person person = personFromRequest;
        personService.save(person);
        final PersonResource resource = new PersonResource(person);
        return ResponseEntity.ok(resource);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable("id") final long id) {
        return personService.get(id).map(p -> {
           personService.deleteById(id);
           return ResponseEntity.noContent().build();
        }).orElseThrow(() -> new PersonNotFountException(id));
    }
}
