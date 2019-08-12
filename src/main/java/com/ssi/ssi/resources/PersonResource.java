package com.ssi.ssi.resources;

import com.ssi.ssi.domain.model.GenderType;
import com.ssi.ssi.domain.model.Person;

import java.util.Date;

public class PersonResource {

    private final Person person;

    private Long id;

    private String firstName;

    private String lastName;

    private GenderType gender;

    private Date birthDate;

    public PersonResource(final Person person) {
        this.person = person;
        this.id = person.getId();
        this.firstName = person.getFirstName();
        this.lastName = person.getLastName();
        this.birthDate = person.getBirthDate();
        this.gender = person.getGender();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public GenderType getGender() {
        return gender;
    }

    public void setGender(GenderType gender) {
        this.gender = gender;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }
}
