package com.example.backend.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.backend.entity.Utente;
import com.example.backend.repository.UtenteRepository;

@Service
public class UtenteService {
	public final UtenteRepository utenteRepo;
	
	public UtenteService (UtenteRepository utenteRepo) {
		this.utenteRepo=utenteRepo;
	}
	public List<Utente>findAll(){
		return utenteRepo.findAll();
	}
	public Utente save(Utente u) {
		return utenteRepo.save(u);
	}
}
