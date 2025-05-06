package com.pfe.planttracker.data;

import com.pfe.planttracker.entities.Capteur;
import com.pfe.planttracker.entities.Serre;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CapteurRepo extends JpaRepository<Capteur, Integer> {
    List<Capteur> findAllBySerre(Serre serre);
}
