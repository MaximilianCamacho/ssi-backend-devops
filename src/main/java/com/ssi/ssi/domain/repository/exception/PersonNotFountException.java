package com.ssi.ssi.domain.repository.exception;

public class PersonNotFountException extends RuntimeException {

    private final Long id;

    public PersonNotFountException(final Long id) {
        super("Person could not be found with id" + id);
        this.id = id;
    }
}
