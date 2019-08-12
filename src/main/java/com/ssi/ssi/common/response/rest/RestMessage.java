package com.ssi.ssi.common.response.rest;

/**
 * @autor Marco Herrera
 */
public class RestMessage {
    private String message;

    public RestMessage(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
