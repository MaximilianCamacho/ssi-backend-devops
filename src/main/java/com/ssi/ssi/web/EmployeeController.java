package com.ssi.ssi.web;

import com.ssi.ssi.common.response.rest.ListRestResponse;
import com.ssi.ssi.common.response.rest.SingleRestResponse;
import com.ssi.ssi.common.response.rest.SuccessRestResponse;
import com.ssi.ssi.request.EmployeeRequest;
import com.ssi.ssi.resources.EmployeeResource;
import com.ssi.ssi.service.EmployeeService;
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
        tags = AbstractEmployeeController.TAG_NAME,
        description = AbstractEmployeeController.DESCRIPTION
)
@RestController
public class EmployeeController extends AbstractEmployeeController {

    @Autowired
    private EmployeeService service;

    @ApiOperation(value = "Get all employee")
    @RequestMapping(
            method = RequestMethod.GET
    )
    public ListRestResponse<EmployeeResource> getAll(){
        final List<EmployeeResource> collection = service.getAll().stream().map(EmployeeResource::new).collect(Collectors.toList());
        return new ListRestResponse<>(collection);
    }

    @ApiOperation(value = "Get employee by Id")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.GET
    )
    public SingleRestResponse<EmployeeResource> getById(@PathVariable Long id){
        final EmployeeResource resource = service.findById(id).map(EmployeeResource::new).get();
        return new SingleRestResponse<>(resource);
    }

    @ApiOperation(value = "Search employee by name")
    @RequestMapping(value = "/search",
            method = RequestMethod.GET
    )
    public ListRestResponse<EmployeeResource> fingByName(@RequestParam String text){
        final List<EmployeeResource> collection = service.findByText(text).stream().map(EmployeeResource::new).collect(Collectors.toList());;
        return new ListRestResponse<>(collection);
    }

    @ApiOperation(value = "Create new employee")
    @RequestMapping(
            method = RequestMethod.POST)
    public SuccessRestResponse createEmployee(@RequestBody EmployeeRequest employeeRequest){
        service.addEmployee(employeeRequest);
        return new SuccessRestResponse();
    }

    @ApiOperation(value = "Update employee")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.PUT)
    public SuccessRestResponse upDateEmployee(@RequestBody EmployeeRequest employeeRequest, @PathVariable Long id){
        service.upDateEmployee(employeeRequest, id);
        return new SuccessRestResponse();
    }

    @ApiOperation(value = "Delete employee")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.DELETE)
    public SuccessRestResponse removeEmployee(@PathVariable Long id){
        service.deleteEmployeeById(id);
        return new SuccessRestResponse();
    }
}
