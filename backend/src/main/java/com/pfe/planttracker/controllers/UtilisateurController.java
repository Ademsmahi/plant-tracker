package com.pfe.planttracker.controllers;

import com.pfe.planttracker.data.UtilisateurRepo;
import com.pfe.planttracker.entities.Utilisateur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/utilisateur")
public class UtilisateurController {

    @Autowired
    private UtilisateurRepo utilisateurRepo;

    @PostMapping("/addGestionnaire")
    public Utilisateur createManager(@RequestBody Utilisateur gestionnaire) {
        gestionnaire.setRole("gestionnaire");
        return utilisateurRepo.save(gestionnaire);
    }

    @PostMapping("/addTechnicien")
    public Utilisateur createTechnician(@RequestBody Utilisateur technicien) {
        technicien.setRole("technicien");
        return utilisateurRepo.save(technicien);
    }

    @PostMapping("/addAgriculteur")
    public Utilisateur createFarmer(@RequestBody Utilisateur agriculteur) {
        agriculteur.setRole("agriculteur");
        return utilisateurRepo.save(agriculteur);
    }

    @PostMapping("/getAllUtilisateur")
    public List<Utilisateur> getAll() {
        return utilisateurRepo.findAll();
    }

    @PostMapping("/getAllGestionnaire")
    public List<Utilisateur> getManagers() {
        return utilisateurRepo.findAllByRole("gestionnaire");
    }

    @PostMapping("/getAllTechnicien")
    public List<Utilisateur> getTechnicians() {
        return utilisateurRepo.findAllByRole("technicien");
    }

    @PostMapping("/getAllAgriculteur")
    public List<Utilisateur> getFarmers() {
        return utilisateurRepo.findAllByRole("agriculteur");
    }
}