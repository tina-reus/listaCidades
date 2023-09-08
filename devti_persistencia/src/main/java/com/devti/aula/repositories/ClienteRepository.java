package com.devti.aula.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devti.aula.model.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Integer>{
	
	public List<Cliente> findByCidade(String nome);
	
	public List<Cliente> findByNome(String nome);

}
