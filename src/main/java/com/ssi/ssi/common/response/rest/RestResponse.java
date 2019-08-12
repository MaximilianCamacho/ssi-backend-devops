package com.ssi.ssi.common.response.rest;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @autor Marco Herrera
 */
public abstract class RestResponse {
    private final String responseType;

    public RestResponse(String responseType) {
        this.responseType = responseType;
    }

    @JsonProperty("responseType")
    public String getResponseType() {
        return responseType;
    }
}
