package com.pfe.planttracker.data;

import com.pfe.planttracker.entities.Rapport;
import com.pfe.planttracker.entities.Serre;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RapportRepo extends JpaRepository<Rapport, Integer> {
    List<Rapport> findAllBySerre(Serre serre);
}
