package com.pfe.planttracker.data;

import com.pfe.planttracker.entities.Problem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProblemRepo extends JpaRepository<Problem, Integer> {
}
