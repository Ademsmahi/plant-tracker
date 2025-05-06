package com.pfe.planttracker.data;

import com.pfe.planttracker.entities.Serre;
import com.pfe.planttracker.entities.SeuilDalerte;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SeuilRepo extends JpaRepository<SeuilDalerte, Integer> {

    List<SeuilDalerte> findAllBySerre(Serre serre);

    Optional<SeuilDalerte> findBySerreAndType(Serre serre, String type);

}
