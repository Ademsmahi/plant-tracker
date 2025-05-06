package com.pfe.planttracker.controllers;

import com.pfe.planttracker.data.EtatRepo;
import com.pfe.planttracker.data.SerreRepo;
import com.pfe.planttracker.data.SeuilRepo;
import com.pfe.planttracker.data.UtilisateurRepo;
import com.pfe.planttracker.entities.EtatSerre;
import com.pfe.planttracker.entities.Serre;
import com.pfe.planttracker.entities.Utilisateur;
import com.pfe.planttracker.responseBeans.Greenhouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/serre")
public class SerreController {

    @Autowired
    private UtilisateurRepo utilisateurRepo;

    @Autowired
    private SerreRepo serreRepository;

    @Autowired
    private SeuilRepo seuilRepo;

    @Autowired
    private EtatRepo etatRepo;

    @PostMapping("/{managerId}/all")
    public List<Greenhouse> getSerresByManager(@PathVariable Integer managerId) {
        Utilisateur gestionnaire = utilisateurRepo.findById(managerId)
                .orElseThrow(() -> new RuntimeException("Manager not found with id: " + managerId));

        List<Serre> serres = serreRepository.findAllByGestionnaire(gestionnaire);

        ArrayList<Greenhouse> result = new ArrayList<>();

        for(Serre serre : serres) {
            Greenhouse house = new Greenhouse(serre.getNom(), 0, 0, 0, 0);

            List<EtatSerre> etats = etatRepo.findAllBySerre(serre);

            EtatSerre temp = byType(etats, "Temp");
            EtatSerre humidity = byType(etats, "Humidity");
            EtatSerre light = byType(etats, "Light");
            EtatSerre ph = byType(etats, "Ph");

            if(temp != null) {
                house.setTemperature(temp.getValeur());
            }
            if(humidity != null) {
                house.setHumidity(humidity.getValeur());
            }
            if(light != null) {
                house.setLight(light.getValeur());
            }
            if(ph != null) {
                house.setPh(ph.getValeur());
            }

            result.add(house);
        }

        return result;
    }

    private EtatSerre byType(List<EtatSerre> etats, String type) {
        for(EtatSerre etat : etats) {
            if(etat.getType().equalsIgnoreCase(type)) {
                return etat;
            }
        }
        return null;
    }

    @PostMapping("/serres")
    public List<Serre> getSerres() {
        return serreRepository.findAll();
    }

    @PostMapping("/serreByNom")
    public Serre getSerreByNom(@RequestBody String nom) {
        return serreRepository.findByNom(nom)
                .orElseThrow(() -> new RuntimeException("Serre not found with name: " + nom));
    }

    @PostMapping("/{managerId}/add")
    public Serre addSerreToManager(@PathVariable Integer managerId, @RequestBody Serre serre) {
        Utilisateur gestionnaire = utilisateurRepo.findById(managerId)
                .orElseThrow(() -> new RuntimeException("Manager not found with id: " + managerId));
        serre.setGestionnaire(gestionnaire);
        return serreRepository.save(serre);
    }
}
