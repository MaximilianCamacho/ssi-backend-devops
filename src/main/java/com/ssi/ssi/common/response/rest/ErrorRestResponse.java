package com.ssi.ssi.common.response.rest;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @autor Marco Herrera
 */
public class ErrorRestResponse<T> extends RestResponse {

    private static final String TYPE = "ErrorResponse";

    private final List<RestMessage> messages;

    private T content;

    private final Integer status;

    public ErrorRestResponse(Integer status, String message) {
        super(TYPE);
        this.status = status;

        RestMessage restMessage = new RestMessage(message);
        messages = new ArrayList<>();
        messages.add(restMessage);
    }

    public ErrorRestResponse(Integer status, RestMessage restMessage) {
        super(TYPE);
        this.status = status;
        messages = new ArrayList<>();
        messages.add(restMessage);
    }

    public ErrorRestResponse(Integer status, List<RestMessage> messages) {
        super(TYPE);
        this.status = status;
        this.messages = messages;
    }

    public Integer getStatus() {
        return status;
    }

    @JsonProperty("messages")
    public List<RestMessage> getMessages() {
        return messages;
    }

    @JsonProperty("data")
    public T getContent() {
        return this.content;
    }

    public void setContent(T content) {
        this.content = content;
    }
}
