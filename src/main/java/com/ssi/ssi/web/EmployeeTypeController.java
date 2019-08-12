package com.ssi.ssi.web;

import com.ssi.ssi.common.response.rest.ListRestResponse;
import com.ssi.ssi.common.response.rest.SingleRestResponse;
import com.ssi.ssi.common.response.rest.SuccessRestResponse;
import com.ssi.ssi.request.EmployeeTypeRequest;
import com.ssi.ssi.resources.EmployeeTypeResource;
import com.ssi.ssi.security.Constants;
import com.ssi.ssi.service.EmployeeTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @autor Marco Herrera.
 */
@Api(
        tags = "EmployeeType",
        description = "Available operations over EmployeeType"
)
@RequestMapping(value = Constants.EMPLOYEE_TYPE_BASE_PATH)
@RestController
public class EmployeeTypeController {

    @Autowired
    private EmployeeTypeService service;
    @ApiOperation(value = "Get all Type employee")
    @RequestMapping(
            method = RequestMethod.GET
    )
    public ListRestResponse<EmployeeTypeResource> getAll(){
        final List<EmployeeTypeResource> collection = service.getAll().stream().map(EmployeeTypeResource :: new).collect(Collectors.toList());
        return new ListRestResponse<>(collection);
    }

    @ApiOperation(value = "Get Type Employee by Id")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.GET
    )
    public SingleRestResponse<EmployeeTypeResource> getById(@PathVariable Long id){
        final EmployeeTypeResource resource = service.findById(id).map(EmployeeTypeResource :: new).get();
        return new SingleRestResponse<>(resource);
    }

    @ApiOperation(value = "Search Type Employee by name")
    @RequestMapping(value = "/search",
            method = RequestMethod.GET
    )
    public ListRestResponse<EmployeeTypeResource> fingByName(@RequestParam String text){
        final List<EmployeeTypeResource> collection = service.finByName(text).stream().map(EmployeeTypeResource::new).collect(Collectors.toList());;
        return new ListRestResponse<>(collection);
    }

    @ApiOperation(value = "Create new Type Employee")
    @RequestMapping(
            method = RequestMethod.POST)
    public SuccessRestResponse createEmployeeType(@RequestBody EmployeeTypeRequest typeRequest){
        service.addEmployeType(typeRequest);
        return new SuccessRestResponse();
    }

    @ApiOperation(value = "Update Type Employee")
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public SuccessRestResponse upDateEmployeeType(@RequestBody EmployeeTypeRequest typeRequest, @PathVariable Long id){
        service.updateEmployeType(typeRequest, id);
        return new SuccessRestResponse();
    }

    @ApiOperation(value = "Delete Type Employee")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public SuccessRestResponse removeEmployeeType(@PathVariable Long id){
        service.deleteEmployeType(id);
        return new SuccessRestResponse();
    }
}
