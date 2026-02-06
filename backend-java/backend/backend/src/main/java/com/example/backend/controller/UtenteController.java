package com.example.backend.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

import com.example.backend.entity.Utente;
import com.example.backend.repository.UtenteRepository;

@RestController
@RequestMapping("/utenti")
public class UtenteController {
	private final UtenteRepository utenteRepository;
	public UtenteController(UtenteRepository utenteRepository) {
		this.utenteRepository=utenteRepository;
	}
	@PostMapping
	public List<Utente> getAll(){
		return utenteRepository.findAll();
	}
	@PostMapping
	public Utente create(@RequestBody Utente u) {
		return utenteRepository.save(u);
	}

}
