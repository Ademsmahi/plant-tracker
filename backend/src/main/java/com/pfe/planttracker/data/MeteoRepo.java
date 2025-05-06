package com.pfe.planttracker.data;

import com.pfe.planttracker.entities.Meteo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MeteoRepo extends JpaRepository<Meteo, Integer> {
}
