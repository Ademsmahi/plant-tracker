package com.pfe.planttracker.data;

import com.pfe.planttracker.entities.ImagePlante;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepo extends JpaRepository<ImagePlante, Integer> {
}
