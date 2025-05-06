package com.pfe.planttracker.data;

import com.pfe.planttracker.entities.Serre;
import com.pfe.planttracker.entities.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SerreRepo extends JpaRepository<Serre, Integer> {
    Optional<Serre> findByNom(String nom);

    List<Serre> findAllByGestionnaire(Utilisateur gestionnaire);
}