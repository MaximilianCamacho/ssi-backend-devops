package com.ssi.ssi.common.exception;

/**
 * @autor Marco Herrera
 */
public class DefaultMessagingException extends Exception {

    public DefaultMessagingException() {
        super();
    }

    public DefaultMessagingException(String message) {
        super(message);
    }

    public DefaultMessagingException(String message, Throwable cause) {
        super(message, cause);
    }
}
