package com.ssi.ssi.domain.repository.exception;

public class MaterialTypeNotFountException extends RuntimeException {
    private final Long id;

    public MaterialTypeNotFountException(final Long id) {
        super("Material type could not be found with id" + id);
        this.id = id;
    }
}
