package com.pfe.planttracker.services;

import com.pfe.planttracker.data.UtilisateurRepo;
import com.pfe.planttracker.entities.Utilisateur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UtilisateurRepo userRepo;

    @Override
    public UserDetails loadUserByUsername(String telephone) throws UsernameNotFoundException {
        Utilisateur user = userRepo.findByTelephone(telephone)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
        return new User(user);
    }
}