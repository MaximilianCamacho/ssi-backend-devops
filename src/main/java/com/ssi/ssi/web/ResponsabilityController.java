package com.ssi.ssi.web;


import com.ssi.ssi.common.response.rest.ListRestResponse;
import com.ssi.ssi.common.response.rest.SuccessRestResponse;
import com.ssi.ssi.domain.model.Capacity;
import com.ssi.ssi.domain.model.Responsibility;
import com.ssi.ssi.request.ResponsibilityRequest;
import com.ssi.ssi.resources.CapacityResource;
import com.ssi.ssi.resources.ResponsabilityResource;
import com.ssi.ssi.service.ResposabilityService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;


@Api(value = "responsibility" , description = "responsibility")
@RestController
@RequestMapping(value = "/responsibility")
public class ResponsabilityController {
    @Autowired
    private ResposabilityService resposabilityService;

    @ApiOperation(value = "Get all Responsabilidad")
    @RequestMapping(
            method = RequestMethod.GET
    )
    public ListRestResponse<ResponsabilityResource> getAll(){
        final List<ResponsabilityResource> collection = resposabilityService.getAllResponsability()
                                                     .stream().map(ResponsabilityResource::new)
                                                     .collect(Collectors.toList());;
        return new ListRestResponse<>(collection);
    }


    @RequestMapping(
            method = RequestMethod.POST
    )
    private SuccessRestResponse createResposability(@RequestBody ResponsibilityRequest responsibility) {
        resposabilityService.createResponsabilit(responsibility);
        return new SuccessRestResponse();
    }
}
