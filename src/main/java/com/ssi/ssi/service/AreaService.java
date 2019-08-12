package com.ssi.ssi.service;


import com.ssi.ssi.domain.model.Area;
import com.ssi.ssi.domain.repository.AreaRepository;
import com.ssi.ssi.request.AreaRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AreaService {


    @Autowired
    private  AreaRepository areaRepository;


    public Area createArea(Area area) {
        area.setDeleted(false);
        return areaRepository.save(area);
    }

    public Optional<Area> findAreaById(Long id) {
        return areaRepository.findById(id);
    }

    public  List<Area> getAll(){
        return (List<Area>) areaRepository.findAll();
    }

    public Optional<Area> getId(Long id){
        return  areaRepository.findById(id);
    }



    public Area save(Area area){
        return  areaRepository.save(area);
    }

    public  void delete(Area area){
        areaRepository.delete(area);
    }

    public void  deleteById(Long id){
        //areaRepository.deleteById(id);

        Optional<Area> areaDb = findAreaById(id);
        if (areaDb.isPresent()) {
            areaDb.get().setDeleted(Boolean.TRUE);
            areaRepository.save(areaDb.get());
        }


    }


    public  boolean isValidateArea( Area area){
        boolean isValidate = Boolean.FALSE;
        if(null != area.getName()){
            isValidate = Boolean.TRUE;
        }
        return isValidate;

    }

    public Optional<Area> findById(Long id) {
        /*Optional<Area> area = areaRepository.getArea(id);*/
        Optional<Area> area = areaRepository.findById(id);
        if(area.isPresent() && area.get().getDeleted().equals(Boolean.FALSE)){
            return area;
        }else {
            return null;
        }
    }


    public List<Area> getAllAreas(){
        /*return areaRepository.getAllAreas();*/
        return (List)areaRepository.findAll();
    }

    public void addArea(AreaRequest areaRequest){
        if(areaRepository.existsById(areaRequest.getId())) {
            Optional<Area> employeeType = areaRepository.findById(areaRequest.getId());
            Area area = new Area();
            area.setCodigo(area.getCodigo());
            area.setDescription(area.getDescription());
            area.setName(area.getName());
            area.setDeleted(false);
            /*areaRepository.createArea(area.getCodigo(),area.getDescription(),area.getName(),area.getDeleted(),area.getId());*/
            areaRepository.save(area);

        }else{
            System.out.println("The Area Type Id, not exist for a valid registry.");
        }
    }


}
