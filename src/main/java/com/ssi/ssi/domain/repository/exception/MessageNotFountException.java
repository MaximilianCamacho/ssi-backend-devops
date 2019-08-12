package com.ssi.ssi.domain.repository.exception;

public class MessageNotFountException  extends RuntimeException{

    private final Long id;
   // private final  String TypeMessage;

    public MessageNotFountException(final Long id) {
        super("Area could not be found with id" + id);
        this.id = id;
    }
}
