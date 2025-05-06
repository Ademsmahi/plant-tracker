package com.pfe.planttracker.data;

import com.pfe.planttracker.entities.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UtilisateurRepo extends JpaRepository<Utilisateur, Integer> {

    Optional<Utilisateur> findByTelephone(String telephone);

    List<Utilisateur> findAllByRole(String role);

}