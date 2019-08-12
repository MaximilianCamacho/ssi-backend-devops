package com.ssi.ssi.web;

import com.ssi.ssi.common.response.rest.ListRestResponse;
import com.ssi.ssi.common.response.rest.SuccessRestResponse;
import com.ssi.ssi.domain.repository.exception.MaterialTypeNotFountException;
import com.ssi.ssi.request.MaterialTypeRequest;
import com.ssi.ssi.resources.MaterialTypeResource;
import com.ssi.ssi.service.MaterialTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Api(value = "materialType", description = "materialType")
@RestController
@RequestMapping(value = "/materialType")
public class MaterialTypeController {

    @Autowired
    private MaterialTypeService materialTypeService;

   /* @PostMapping("/materialType")
    public ResponseEntity<MaterialTypeResource> createMaterialType(@RequestBody final MaterialType materialTypeFromRequest) {
        final MaterialType materialType = materialTypeService.save(materialTypeFromRequest);
        return ResponseEntity.ok(new MaterialTypeResource(materialType));
    }*/

    @GetMapping("/materialType")
    public ResponseEntity<List<MaterialTypeResource>> getAllMaterialType() {
        final List<MaterialTypeResource> collection = materialTypeService.getAll().stream().map(
                MaterialTypeResource::new).collect(Collectors.toList());
        return ResponseEntity.ok(collection);
    }
    /*@ApiOperation(value = "Get all Type material")
    @RequestMapping(value="/materialType",
            method = RequestMethod.GET
    )*/
    public ListRestResponse<MaterialTypeResource> getAll(){
        final List<MaterialTypeResource> collection = materialTypeService.getAll().stream().map(MaterialTypeResource :: new).collect(Collectors.toList());
        return new ListRestResponse<>(collection);
    }
    @GetMapping("/materialType/{id}")
    public ResponseEntity<MaterialTypeResource> getByIdMaterialType(@PathVariable final long id) {
        return materialTypeService.getById(id).map(p -> ResponseEntity.ok(new MaterialTypeResource(p))).orElseThrow(() -> new MaterialTypeNotFountException(id));
    }

    /*@DeleteMapping("/materialType/{id}")
    public ResponseEntity<?> deleteMaterialType(@PathVariable("id") final long id) {
        return materialTypeService.getById(id).map(p -> {
            materialTypeService.deleteById(id);
            return ResponseEntity.noContent().build();
        }).orElseThrow(() -> new MaterialTypeNotFountException(id));
    }*/

    /*=============================================================================================
     **	Name: createMaterialType
     **	Desc: Method for Created Material Type
     **
     **	Author: Maximiliano Casto Camacho Hidalgo
     **
     **	Date: 25/05/2018
     =============================================================================================*/
    @ApiOperation(value = "Create new materialType")
    @RequestMapping(
            method = RequestMethod.POST, value="/")
    public SuccessRestResponse createMaterialType(@RequestBody MaterialTypeRequest materialTypeRequest){
        materialTypeService.addMaterialType(materialTypeRequest);
        return new SuccessRestResponse();
    }

    /*=============================================================================================
     **	Name: updateMaterialType
     **	Desc: Method for Update Material Type
     **
     **	Author: Maximiliano Casto Camacho Hidalgo
     **
     **	Date: 25/05/2018
     =============================================================================================*/
    @ApiOperation(value = "Update MaterialType")
    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public SuccessRestResponse updateMaterialType(@RequestBody MaterialTypeRequest materialTypeRequest, @PathVariable Long id){
        materialTypeService.updateMaterialType(materialTypeRequest, id);
        return new SuccessRestResponse();
    }

    /*=============================================================================================
     **	Name: removeMaterialType
     **	Desc: Method for Delete Material Type
     **
     **	Author: Maximiliano Casto Camacho Hidalgo
     **
     **	Date: 25/05/2018
     =============================================================================================*/
    @ApiOperation(value = "Delete MaterialType")
    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public SuccessRestResponse removeMaterialType(@PathVariable Long id){

        materialTypeService.deleteById(id);
        return new SuccessRestResponse();
    }

    public Boolean isRelation (Long id) {
        Boolean relation = Boolean.FALSE;

        return relation;
    }
}
