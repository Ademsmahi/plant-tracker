package com.pfe.planttracker.data;

import com.pfe.planttracker.entities.Alert;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlertRepo extends JpaRepository<Alert, Integer> {
}
