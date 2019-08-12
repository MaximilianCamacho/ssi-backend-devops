package com.ssi.ssi.domain.repository.exception;

public class CapacityNotFountException  extends RuntimeException {

    private final Long id;

    public CapacityNotFountException(final Long id) {
        super("Capacity could not be found with id" + id);
        this.id = id;
    }
}