package com.ssi.ssi.service;

import com.ssi.ssi.domain.model.Material;
import com.ssi.ssi.domain.model.Store;
import com.ssi.ssi.domain.repository.MaterialRepository;
import com.ssi.ssi.domain.repository.StoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StoreService {

    @Autowired
    private StoreRepository storeRepository;

    @Autowired
    private MaterialService materialService;

    public List<Store> getAll(){
        return (List<Store>) storeRepository.findAll();
    }
    public Optional<Store> getById(Long id){
        return storeRepository.findById(id);
    }
    public void delete(Long id){
        storeRepository.deleteById(id);
        System.out.println("Assignment delete that code is: "+" "+id);
    }

    public void updateStock(Store store, Long id, Integer quantity){
        storeRepository.findById(id).get().setStock(store.getStock()-quantity);
    }


}
