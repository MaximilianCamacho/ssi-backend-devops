package com.ssi.ssi.common.response.rest;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @autor Marco Herrera
 */
public class SuccessRestResponse extends RestResponse {

    private static final String TYPE = "SuccessResponse";

    private static final String DEFAULT_CONTENT = "SUCCESS";

    public SuccessRestResponse() {
        super(TYPE);
    }

    @JsonProperty("data")
    public String getContent() {
        return DEFAULT_CONTENT;
    }
}
