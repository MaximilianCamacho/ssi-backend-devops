package com.ssi.ssi.domain.repository.exception;


public class EmployeeNotFountException extends RuntimeException {

    private final Long id;

    public EmployeeNotFountException(final Long id) {
        super("Person could not be found with id" + id);
        this.id = id;
    }
}
