package com.ssi.ssi.web;

import com.ssi.ssi.common.response.rest.SuccessRestResponse;
import com.ssi.ssi.domain.model.IncidentAgent;
import com.ssi.ssi.service.AccidentAgentService;
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
@RequestMapping("/accidentAgent")
@Api(value = "IncidentAgent", description = "create a accident agent")
public class AccidentAgentController {

    @Autowired
    private AccidentAgentService accidentAgentService;

    @RequestMapping(
            method = RequestMethod.POST
    )
    private ResponseEntity<IncidentAgent> createAccidentAgent(@RequestBody IncidentAgent incidentAgent) {
        return new ResponseEntity<IncidentAgent>(accidentAgentService.createAccidentAgent(incidentAgent), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}",
            method = RequestMethod.PUT
    )
    public ResponseEntity<IncidentAgent> updateAccidentAgent(@RequestBody IncidentAgent incidentAgent, @PathVariable Long id) {

        Boolean wasUpdated = accidentAgentService.updateAccidentAgent(incidentAgent, id);
        if (wasUpdated) {
            Optional<IncidentAgent> accidentAgentDb = accidentAgentService.findAccidentAgentById(incidentAgent.getId());
            return new ResponseEntity<IncidentAgent>(accidentAgentDb.get(), HttpStatus.OK);
        }

        return new ResponseEntity<IncidentAgent>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(
            method = RequestMethod.GET
    )
    public List<IncidentAgent> getAllAccidentAgents() {

        List<IncidentAgent> incidentAgents = new ArrayList<>();

        accidentAgentService.getAllAccidentAgents().forEach(
                accidentAgent -> incidentAgents.add(accidentAgent)
        );

        return incidentAgents;

    }

    @ApiOperation(value = "Delete Accident Agent")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.DELETE
    )
    public SuccessRestResponse remove(@PathVariable Long id) {
        accidentAgentService.delete(id);
        return new SuccessRestResponse();
    }

    @ApiOperation(value = "Get accident agent by Id")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.GET
    )
    public ResponseEntity<IncidentAgent> getById(@PathVariable Long id) {
        Optional<IncidentAgent> accidentAgent = accidentAgentService.findAccidentAgentById(id);
        if (accidentAgent.isPresent()) {
            return new ResponseEntity<IncidentAgent>(accidentAgent.get(), HttpStatus.OK);
        }

        return new ResponseEntity<IncidentAgent>(HttpStatus.NOT_FOUND);
    }
}
