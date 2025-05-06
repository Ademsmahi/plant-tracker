package com.pfe.planttracker.controllers;

import com.pfe.planttracker.data.CapteurRepo;
import com.pfe.planttracker.data.EtatRepo;
import com.pfe.planttracker.data.SerreRepo;
import com.pfe.planttracker.data.SeuilRepo;
import com.pfe.planttracker.entities.Capteur;
import com.pfe.planttracker.entities.EtatSerre;
import com.pfe.planttracker.entities.Serre;
import com.pfe.planttracker.entities.SeuilDalerte;
import com.pfe.planttracker.requestBeans.SeuilRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/capteur")
public class CapteurController {

    @Autowired
    EtatRepo etatRepo;

    @Autowired
    CapteurRepo capteurRepo;

    @Autowired
    SerreRepo serreRepo;

    @Autowired
    SeuilRepo seuilRepo;

    @PostMapping("/getEtatBySerre")
    public List<EtatSerre> getBySerre(@RequestBody Serre serre) {
        return etatRepo.findAllBySerre(serre);
    }

    @PostMapping("/createEtat")
    public EtatSerre createEtat(@RequestBody EtatSerre etat) {
        return etatRepo.save(etat);
    }

    @PostMapping("/createCapteur")
    public Capteur createCapteur(@RequestBody Capteur capteur) {
        Serre serre = serreRepo.findById(capteur.getSerre().getIdSerre()).get();
        capteur.setSerre(serre);
        return capteurRepo.save(capteur);
    }

    @PostMapping("/getAllCapteurs")
    public List<Capteur> getAllCapteurs() {
        return capteurRepo.findAll();
    }

    @PostMapping("/getCapteurBySerre")
    public List<Capteur> getCapteurBySerre(@RequestBody Serre serre) {
        return capteurRepo.findAllBySerre(serre);
    }

    @PostMapping("/createSeuil")
    public SeuilDalerte createSeuil(@RequestBody SeuilDalerte seuil) {
        return seuilRepo.save(seuil);
    }

    @PostMapping("/getSeuils")
    public List<SeuilDalerte> getSeuils(@RequestBody Serre serre) {
        return seuilRepo.findAllBySerre(serre);
    }

    @PostMapping("/getSeuilByType")
    public SeuilDalerte getSeuilByType(@RequestBody SeuilRequest by) {
        Serre serre = serreRepo.findById(by.getIdSerre())
                .orElseThrow(() -> new RuntimeException("Serre not found"));

        return seuilRepo.findBySerreAndType(serre, by.getType())
                .orElseThrow(() -> new RuntimeException("Seuil not found"));
    }
}
