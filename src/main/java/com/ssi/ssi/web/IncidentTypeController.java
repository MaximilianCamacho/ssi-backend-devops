package com.ssi.ssi.web;

import com.ssi.ssi.common.response.rest.SuccessRestResponse;
import com.ssi.ssi.domain.model.IncidentType;
import com.ssi.ssi.resources.IncidentTypeResource;
import com.ssi.ssi.service.IncidentTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/IncidentType")
@Api(value = "IncidentType", description = "create incident type")
public class IncidentTypeController {

    @Autowired
    private IncidentTypeService incidentTypeService;


    @RequestMapping(
            method = RequestMethod.POST
    )
    private ResponseEntity<IncidentType> createIncidentType(@RequestBody IncidentTypeResource incidentTypeResource) {
        return new ResponseEntity<IncidentType>(incidentTypeService.createIncidentType(incidentTypeResource), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public ResponseEntity<IncidentType> updateCustomer(@RequestBody IncidentType incidentType, @PathVariable Long id) {

        Boolean wasUpdated = incidentTypeService.updateIncidentType(incidentType, id);
        if (wasUpdated) {
            /*Optional<IncidentType> incidentTypeDb = incidentTypeService.findIncidentTypeById(incidentType.getId());*/
            Optional<IncidentType> incidentTypeDb = incidentTypeService.findById(id);
            return new ResponseEntity<IncidentType>(incidentTypeDb.get(), HttpStatus.OK);
        }

        return new ResponseEntity<IncidentType>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(
            method = RequestMethod.GET
    )
    public List<IncidentType> findAllIncidentType() {

        List<IncidentType> incidentTypeList = new ArrayList<>();

        incidentTypeService.getAllIncidentType().forEach(
                incidentType -> incidentTypeList.add(incidentType)
        );

        return incidentTypeList;
    }

    @ApiOperation(value = "Delete incident type")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.DELETE
    )
    public SuccessRestResponse remove(@PathVariable Long id) {
        incidentTypeService.delete(id);
        return new SuccessRestResponse();
    }

    @ApiOperation(value = "Get incidentType by Id")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.GET
    )
    public ResponseEntity<IncidentType> getById(@PathVariable Long id) {
        Optional<IncidentType> incidentTypeDb = incidentTypeService.findIncidentTypeById(id);
        if (incidentTypeDb.isPresent()) {
            return new ResponseEntity<IncidentType>(incidentTypeDb.get(), HttpStatus.OK);
        }

        return new ResponseEntity<IncidentType>(HttpStatus.NOT_FOUND);
    }
}
