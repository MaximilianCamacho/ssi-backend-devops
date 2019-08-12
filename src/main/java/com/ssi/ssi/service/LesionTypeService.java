package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.LesionType;
import com.ssi.ssi.domain.repository.LesionTypeRepository;
import com.ssi.ssi.resources.LesionTypeResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LesionTypeService {

    @Autowired
private LesionTypeRepository lesionTypeRepository;

    public Optional<LesionType> findLesionTypeById(Long id) {
        return lesionTypeRepository.findById(id);
    }


    public LesionType createLesionType(LesionType lesionType) {
        lesionType.setIsDeleted(false);
        return lesionTypeRepository.save(lesionType);
    }

    public Boolean updateLesionType(LesionType lesionType) {

        Boolean wasUpdated = Boolean.FALSE;

        Optional<LesionType> lesionTypeDb = findLesionTypeById(lesionType.getId());
        if (lesionTypeDb.isPresent()) {
            lesionTypeDb.get().setType(lesionType.getType());
            lesionTypeDb.get().setDescription(lesionType.getDescription());
            lesionTypeRepository.save(lesionTypeDb.get());
            wasUpdated = Boolean.TRUE;
        }

        return wasUpdated;
    }

    public List<LesionType> getAllLesionTypes() {
        return lesionTypeRepository.findAll();
    }

    public void delete(Long id) {
        Optional<LesionType> lesionTypeDb = findLesionTypeById(id);
        if (lesionTypeDb.isPresent()) {
            lesionTypeDb.get().setIsDeleted(Boolean.TRUE);
            lesionTypeRepository.save(lesionTypeDb.get());
        }
    }

    public LesionTypeResource builderLesionTypeResource(LesionType lesionType) {
        return new LesionTypeResource(lesionType);
    }
}
