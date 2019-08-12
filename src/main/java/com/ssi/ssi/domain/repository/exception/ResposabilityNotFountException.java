package com.ssi.ssi.domain.repository.exception;

public class ResposabilityNotFountException extends RuntimeException {

    private final Long id;

    public ResposabilityNotFountException(final Long id) {
        super("Resposability could not be found with id" + id);
        this.id = id;
    }
}
