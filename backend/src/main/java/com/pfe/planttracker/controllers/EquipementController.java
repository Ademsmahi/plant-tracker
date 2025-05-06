package com.pfe.planttracker.controllers;

import com.pfe.planttracker.data.EquipementRepo;
import com.pfe.planttracker.data.SerreRepo;
import com.pfe.planttracker.entities.Equipement;
import com.pfe.planttracker.entities.Serre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/equipement")
public class EquipementController {

    @Autowired
    EquipementRepo equipementRepo;

    @Autowired
    SerreRepo serreRepo;

    @PostMapping("/getEquipementBySerre")
    public List<Equipement> getEquipementBySerre(@RequestBody Serre serre) {
        return equipementRepo.findAllBySerre(serre);
    }

    @PostMapping("/createEquipement")
    public Equipement createEquipement(@RequestBody Equipement equipement) {
        Serre serre = serreRepo.findById(equipement.getSerre().getIdSerre()).get();
        equipement.setSerre(serre);
        return equipementRepo.save(equipement);
    }

    @PostMapping("/getAllEquipement")
    public List<Equipement> getAllEquipement() {
        return equipementRepo.findAll();
    }

    @PostMapping("/switchEquipement")
    public Equipement switchEquipement(Equipement equipement) {
        equipement = equipementRepo.findById(equipement.getIdEquipement()).get();
        equipement.setEtat(!equipement.getEtat());
        return equipement;
    }

}
