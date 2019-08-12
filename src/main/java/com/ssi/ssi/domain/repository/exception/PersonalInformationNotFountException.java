package com.ssi.ssi.domain.repository.exception;

public class PersonalInformationNotFountException extends RuntimeException{

    private final Long id;
    // private final  String TypeMessage;

    public PersonalInformationNotFountException(final Long id) {
        super("Personla Information could not be found with id" + id);
        this.id = id;
    }
}
