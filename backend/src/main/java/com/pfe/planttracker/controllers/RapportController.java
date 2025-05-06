package com.pfe.planttracker.controllers;

import com.pfe.planttracker.data.RapportRepo;
import com.pfe.planttracker.entities.Rapport;
import com.pfe.planttracker.entities.Serre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/rapport")
public class RapportController {

    @Autowired
    RapportRepo rapportRepo;

    @PostMapping("/getAllRapports")
    public List<Rapport> getAllRapports() {
        return rapportRepo.findAll();
    }

    @PostMapping("/getRapportsBySerre")
    public List<Rapport> getRapportsBySerre(@RequestBody Serre serre) {
        return rapportRepo.findAllBySerre(serre);
    }

    @PostMapping("/generateRapport")
    public Rapport generateRapport(Serre serre) {
        Rapport rapport = new Rapport();

        rapport.setContenu("content");
        rapport.setSerre(serre);
        rapport.setDate(LocalDateTime.now());

        rapportRepo.save(rapport);

        return rapport;
    }

}
