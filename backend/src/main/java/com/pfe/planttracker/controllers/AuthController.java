package com.pfe.planttracker.controllers;

import com.pfe.planttracker.data.UtilisateurRepo;
import com.pfe.planttracker.entities.Utilisateur;
import com.pfe.planttracker.requestBeans.LoginRequest;
import com.pfe.planttracker.requestBeans.LoginResponse;
import com.pfe.planttracker.services.JwtService;
import com.pfe.planttracker.services.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private AuthenticationManager authManager;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private UtilisateurRepo userRepo;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request) {
        System.out.println(request.getTelephone() + " : " + request.getPassword());
        Authentication auth = authManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getTelephone(), request.getPassword())
        );

        User user = (User) auth.getPrincipal();
        Utilisateur utilisateur = userRepo.findByTelephone(request.getTelephone()).get();
        String token = jwtService.generateToken(user);
        return ResponseEntity.ok(new LoginResponse(token,
                utilisateur.getRole(),
                utilisateur.getIdUtilisateur() + ""));
    }
}
