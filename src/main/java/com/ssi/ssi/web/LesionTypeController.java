package com.ssi.ssi.web;

import com.ssi.ssi.common.response.rest.SuccessRestResponse;
import com.ssi.ssi.domain.model.LesionType;
import com.ssi.ssi.service.LesionTypeService;
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
@RequestMapping("/lesionType")
@Api(value = "LesionType", description = "Lesion Types")
public class LesionTypeController {

    @Autowired
    private LesionTypeService lesionTypeService;

    @RequestMapping(
            method = RequestMethod.POST
    )
    private ResponseEntity<LesionType> createLesionType(@RequestBody LesionType lesionType) {
        return new ResponseEntity<LesionType>(lesionTypeService.createLesionType(lesionType), HttpStatus.CREATED);
    }

    @RequestMapping(
            method = RequestMethod.PUT
    )
    public ResponseEntity<LesionType> updateLesionType(@RequestBody LesionType lesionType) {

        Boolean wasUpdated = lesionTypeService.updateLesionType(lesionType);
        if (wasUpdated) {
            Optional<LesionType> lesionTypeDb = lesionTypeService.findLesionTypeById(lesionType.getId());
            return new ResponseEntity<LesionType>(lesionTypeDb.get(), HttpStatus.OK);
        }

        return new ResponseEntity<LesionType>(HttpStatus.NOT_FOUND);
    }

    @RequestMapping(
            method = RequestMethod.GET
    )
    public List<LesionType> getAllLesionTypes() {

        List<LesionType> lesionTypeList = new ArrayList<>();

        lesionTypeService.getAllLesionTypes().forEach(
                lesionType -> lesionTypeList.add(lesionType)
        );

        return lesionTypeList;
    }

    @ApiOperation(value = "Delete Lesion type")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.DELETE
    )
    public SuccessRestResponse remove(@PathVariable Long id) {
        lesionTypeService.delete(id);
        return new SuccessRestResponse();
    }

    @ApiOperation(value = "Get lesionType by Id")
    @RequestMapping(value = "/{id}",
            method = RequestMethod.GET
    )
    public ResponseEntity<LesionType> getById(@PathVariable Long id) {
        Optional<LesionType> lesionTypeDb = lesionTypeService.findLesionTypeById(id);
        if (lesionTypeDb.isPresent()) {
            return new ResponseEntity<LesionType>(lesionTypeDb.get(), HttpStatus.OK);
        }

        return new ResponseEntity<LesionType>(HttpStatus.NOT_FOUND);
    }
}
