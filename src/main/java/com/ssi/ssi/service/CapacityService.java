package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.Area;
import com.ssi.ssi.domain.model.Capacity;
import com.ssi.ssi.domain.repository.AreaRepository;
import com.ssi.ssi.domain.repository.CapacityRepository;
import com.ssi.ssi.request.AreaRequest;
import com.ssi.ssi.request.CapacityRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CapacityService {

    @Autowired
    private CapacityRepository capacityRepository;

    public Capacity createCapacity(Capacity capacity) {
        capacity.setDeleted(false);
        return capacityRepository.save(capacity);
    }

    public List<Capacity> getAll(){
        return (List<Capacity>) capacityRepository.findAll();
    }

    public Optional<Capacity> getId(Long id){
        return  capacityRepository.findById(id);
    }


    public Capacity save(Capacity capacity){
        return  capacityRepository.save(capacity);
    }

    public  void delete(Capacity capacity){
        capacityRepository.delete(capacity);
    }
    public void  deleteById(Long id){
        capacityRepository.deleteById(id);
    }


    public  boolean isValidateArea( Capacity capacity){
        boolean isValidate = Boolean.FALSE;
        if(null != capacity.getName()){
            isValidate = Boolean.TRUE;
        }
        return isValidate;

    }

    public List<Capacity> getAllCapacity(){
        /*return capacityRepository.getAllCapacity();*/
        return (List)capacityRepository.findAll();
    }

    public void addCapacity(CapacityRequest capacityRequest){

        if(capacityRepository.existsById(capacityRequest.getId())) {
            Capacity capacity = new Capacity();
            capacity.setDescription(capacity.getDescription());
            capacity.setName(capacity.getName());
            capacity.setDeleted(false);
            /*capacityRepository.createCapacity(capacity.getDescription(),capacity.getName(),capacity.getDeleted(),capacity.getId());*/
            capacityRepository.save(capacity);

        }else{
            System.out.println("The Capacity Type Id, not exist for a valid registry.");
        }
    }
    public Optional<Capacity> findById(Long id) {
        /*Optional<Capacity> capacity =  capacityRepository.getCapacity(id);*/
        Optional<Capacity> capacity =  capacityRepository.findById(id);
        if(capacity.isPresent() && capacity.get().getDeleted().equals(Boolean.FALSE)){
            return capacity;
        }else {
            return null;
        }
    }


}
