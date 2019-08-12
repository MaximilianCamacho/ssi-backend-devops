package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.Material;
import com.ssi.ssi.domain.model.MaterialType;
import com.ssi.ssi.domain.repository.MaterialRepository;
import com.ssi.ssi.domain.repository.MaterialTypeRepository;
import com.ssi.ssi.request.MaterialRequest;
import com.ssi.ssi.resources.MaterialResource;
import com.ssi.ssi.resources.MaterialTypeResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @autor Lidia Cussi.
 */

@Service
public class MaterialService {

    @Autowired
    private MaterialRepository materialRepository;

    @Autowired
    private MaterialTypeRepository materialTypeRepository;

    public List<Material> getAllMaterial(){
            /*return materialRepository.getAllMaterial();*/
            return (List)materialRepository.findAll();
        }

    public Optional<Material> getMaterialById(Long id){
        return materialRepository.findById(id);
    }

    public void saveMaterial(MaterialRequest materialReq){
        Optional<MaterialType> matType = materialTypeRepository.findById(materialReq.getMaterialTypeId());
        if(matType.isPresent()){
            Material material = new Material();
            material.setName(materialReq.getName());
            material.setMatDescription(materialReq.getDescription());
            material.setVidaUtil(materialReq.getVidaUtil());
            material.setMaterialType(matType.get());
            /*materialRepository.saveMaterial(material.getName(),material.getMatDescription(), material.getMaterialType().getId(),material.getVidaUtil());*/
            materialRepository.save(material);
        }
        //return materialRepository.getMaterialById(material.getId());
    }

    public Boolean updateMaterial(MaterialRequest updatedMaterial, Long id){

        Boolean wasUpdated = Boolean.FALSE;
        Optional<Material> material = getMaterialById(id);
        Optional<MaterialType> matType = materialTypeRepository.findById(updatedMaterial.getMaterialTypeId());
        if(material.isPresent()){
            material.get().setName(updatedMaterial.getName());
            material.get().setVidaUtil(updatedMaterial.getVidaUtil());
            material.get().setMatDescription(updatedMaterial.getDescription());
            material.get().setMaterialType(matType.get());
            materialRepository.save(material.get());
            wasUpdated = Boolean.TRUE;
        }
        return wasUpdated;
    }

    public void delete(Material material) {
        materialRepository.delete(material);
    }

    public Boolean deleteById(Long id) {
        Boolean wasDeleted = Boolean.FALSE;
        Optional<Material> material = getMaterialById(id);

        if (material.isPresent()){
            materialRepository.delete(material.get());
            wasDeleted = Boolean.TRUE;
        }

        return wasDeleted;
    }

    /* nombre-description-vidautil-nombre de tipo
    public Material saveMaterial(Material material) {
        MaterialType materialType = materialTypeRepository.findById(material.getMaterialType().getId()).get();
        material.setMaterialType(materialType);

        System.out.println("\n\n"+materialType.getNameType()+"\n\n");

        return materialRepository.save(material);
    } */


}
