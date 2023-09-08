package com.devti.aula.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.devti.aula.model.Cidade;
import com.devti.aula.model.Cliente;
import com.devti.aula.services.ClienteService;

import io.swagger.annotations.ApiOperation;


@RestController
@RequestMapping("/cliente")
public class ClienteResource {

	@Autowired
	ClienteService service;
	
	@DeleteMapping("/{id}")
	public void excluir(@PathVariable("id") int id) {
		service.excluir(id);
	}
	
	@PutMapping
	public Cliente alterar(@RequestBody Cliente c, @RequestParam("id") int id) {
		c.setId(id);
		return service.alterar(c);
	}
	
	@PostMapping
	public Cliente inserirCliente(@RequestBody Cliente c) {
		return service.incluir(c);
	}
	
	@ApiOperation(value = "Buscar um cliente por cidade")
	@GetMapping("/buscarporcidade/{cidade}")
	public List<Cliente> buscarPorNome(@PathVariable("cidade") String cidade) {
		return service.buscarPorCidade(cidade);
	}
		
	@GetMapping
	public List<Cliente> listarTodas(){
		return service.listarTodas();
	}
}
