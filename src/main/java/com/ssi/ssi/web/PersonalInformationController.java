package com.ssi.ssi.web;

import com.ssi.ssi.common.response.rest.ListRestResponse;
import com.ssi.ssi.common.response.rest.SingleRestResponse;
import com.ssi.ssi.common.response.rest.SuccessRestResponse;
import com.ssi.ssi.request.PersonalInformationRequest;
import com.ssi.ssi.resources.PersonalImformationResource;
import com.ssi.ssi.service.PersonalInformationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Api(value = "personalInformation" , description = "personalInformation")
@RestController
@RequestMapping(value = "/personalInformation")
public class PersonalInformationController {
    @Autowired
    PersonalInformationService personalInformationService;

    @RequestMapping(
            method = RequestMethod.GET
    )
    public ListRestResponse<PersonalImformationResource> getAll(){
        final List<PersonalImformationResource> collection = personalInformationService.findAll().stream()
                .map(PersonalImformationResource::new).collect(Collectors.toList());
        return new ListRestResponse<>(collection);
    }

    @ApiOperation(value = "Get PersonalImformation by Id")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.GET
    )
    public SingleRestResponse<PersonalImformationResource> getById(@PathVariable Long id){
        final PersonalImformationResource resource = personalInformationService.findPersonalById(id)
                .map(PersonalImformationResource::new).get();
        return new SingleRestResponse<>(resource);
    }

    @RequestMapping(
            method = RequestMethod.POST,
            value = "/createPersonalInformation"
    )
    public SuccessRestResponse createPersonalInformation(@RequestBody PersonalInformationRequest personalInformationRequest) {
        personalInformationService.createPersonalInformation(personalInformationRequest);
        return new SuccessRestResponse();
        //return new SuccessRestResponse(personalInformationService.createPersonalInformation(personalInformationRequest), HttpStatus.CREATED);
    }

    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/updatePersonalInformation/{id}"
    )
    public SuccessRestResponse updatePersonalInformation(@RequestBody PersonalInformationRequest personalInformationRequest,
                                                         @PathVariable Long id) {
        personalInformationService.updatePersonalInformation(personalInformationRequest, id);
        return new SuccessRestResponse();
    }

    @ApiOperation(value = "Delete PersonalInformation")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.DELETE)
    public SuccessRestResponse removePersonalInformation(@PathVariable Long id){
        personalInformationService.deletePersonalInformation(id);
        return new SuccessRestResponse();
    }

    /*

    @GetMapping
    public ResponseEntity<List<PersonalInformationRequest>> getAllPersonal() {
        final List<PersonalInformationRequest> collection = personalInformationService.getAllPersonal().stream().map(PersonalInformationRequest::new).collect(Collectors.toList());
        return ResponseEntity.ok(collection);
    }

    @GetMapping("/{id}")
    public ResponseEntity<PersonalInformationRequest> get(@PathVariable final long id) {
        return personalInformationService.getId(id).map(p -> ResponseEntity.ok(new PersonalInformationRequest(p))).orElseThrow(() -> new MessageNotFountException(id));
    }

    @PostMapping
    public ResponseEntity<PersonalInformationRequest> post(@RequestBody final PersonalInformation personalInformationFromRequest) {
        final PersonalInformation personalInformation = personalInformationService.save(personalInformationFromRequest);
        return ResponseEntity.ok(new PersonalInformationRequest(personalInformation));
    }

    @PutMapping("/{id}")
    public ResponseEntity<PersonalInformationRequest> put(@PathVariable("id") final long id, @RequestBody PersonalInformation personalInformationFromRequest) {
        final PersonalInformation personalInformation = personalInformationFromRequest;
        final PersonalInformationRequest resource;
        boolean isvalidate = personalInformationService.isValidatePersonalInformation(personalInformation);
        if(isvalidate){
            personalInformationService.save(personalInformation);
            resource = new PersonalInformationRequest(personalInformation);
            return ResponseEntity.ok(resource);
        }

        return new ResponseEntity(personalInformation,HttpStatus.NOT_FOUND);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable("id") final long id) {
        return personalInformationService.getId(id).map(p -> {
            personalInformationService.deleteById(id);
            return ResponseEntity.noContent().build();
        }).orElseThrow(() -> new MessageNotFountException(id));
    }

*/
}
