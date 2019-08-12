package com.ssi.ssi.web;

import com.ssi.ssi.common.response.rest.SuccessRestResponse;
import com.ssi.ssi.domain.model.Assignment;
import com.ssi.ssi.request.AssignmentRequest;
import com.ssi.ssi.resources.AssignmentResource;
import com.ssi.ssi.service.AssignmentService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/assignment")
@Api(value="assignment", description="assignments")
public class AssignmentController {
    @Autowired
    private AssignmentService assignmentService;

    @RequestMapping(method = RequestMethod.POST)
    private ResponseEntity<Assignment> createAssignment(@RequestBody AssignmentRequest assignmentNew) {
        return new ResponseEntity<Assignment>(assignmentService.createAssignment(assignmentNew), HttpStatus.CREATED);
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<AssignmentResource> getAllAssignment(){
        List<AssignmentResource> materialResources = new ArrayList<>();
        assignmentService.getAllAssignment().forEach(
                assignment -> materialResources.add(new AssignmentResource(assignment)) );
        return materialResources;
    }

    @RequestMapping( value = "/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Assignment> updateAssignment(@PathVariable Long id, @RequestBody AssignmentRequest updatedAssign){
        Boolean wasUpdated = assignmentService.updateAssignment(updatedAssign.getId(), updatedAssign);
        if (wasUpdated) {
            Optional<Assignment> assignmentNew = assignmentService.getAssignmentById(updatedAssign.getId());
            return new ResponseEntity<Assignment>(assignmentNew.get(), HttpStatus.OK);
        }
        return new ResponseEntity<Assignment>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping( value = "/{id}",method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteAssignment(@PathVariable Long id) {

        Boolean wasDeleted = assignmentService.deleteById(id);
        HttpStatus responseStatus = wasDeleted ? HttpStatus.NO_CONTENT : HttpStatus.NOT_FOUND;
        return new ResponseEntity<>(responseStatus);
    }

    /*@RequestMapping(method = RequestMethod.POST, value = "/{id}")
    public SingleRestResponse<AssignmentResource> getById(Long id) {
        final AssignmentResource assignmentResource = assignmentService.getAssignmentById(id).map(AssignmentResource::new).get();
        return new SingleRestResponse<>(assignmentResource);
        return null;
    }*/
}
