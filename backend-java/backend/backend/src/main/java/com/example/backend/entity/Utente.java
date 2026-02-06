package com.example.backend.entity;


import jakarta.persistence.*;

@Entity
@Table(name="utenti")

public class Utente {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private Long id;
@Column(nullable=false)
private String nome;
@Column(nullable=false,unique=true)
private String email;
public Utente() {}//costruttore vuoto x la JPA

public Utente(String nome, String email) {
	this.nome=nome;
	this.email=email;
}
//Getter e Setter
public Long getId() {
	return id;
}
public void setNome(String s) {
	this.nome=s;					
}
public String getNome() {
	return nome;
}
public void setEmail(String s) {
	this.email=s;
}
}
