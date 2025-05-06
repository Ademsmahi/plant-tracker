package com.pfe.planttracker.data;

import com.pfe.planttracker.entities.EtatSerre;
import com.pfe.planttracker.entities.Serre;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EtatRepo extends JpaRepository<EtatSerre, Integer> {

    List<EtatSerre> findAllBySerre(Serre serre);
}
