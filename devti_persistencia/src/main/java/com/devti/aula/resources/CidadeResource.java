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
import com.devti.aula.services.CidadeService;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/cidade")
public class CidadeResource {

	@Autowired
	CidadeService service;
	
	@ApiOperation(value = "Excluir uma cidade")
	@DeleteMapping("/{id}")
	public void excluir(@PathVariable("id") int id) {
		service.excluir(id);
	}
		
	@ApiOperation(value = "Alterar uma cidade")
	@PutMapping
	public Cidade alterar(@RequestBody Cidade c, @RequestParam("id") int id) {
		c.setId(id);
		return service.alterar(c);
	}
	
	
	@ApiOperation(value = "Inserir uma cidade")
	@PostMapping
	public Cidade inserirCidade(@RequestBody Cidade c) {
		return service.incluir(c);
	}
	
	@GetMapping("/buscauf/{uf}")
	@ApiOperation(value = "Buscar uma cidade por estado")
	public List<Cidade> buscarPorUf(@PathVariable("uf") String uf) {
		return service.buscarPorUf(uf);
	}
	
	@GetMapping
	@ApiOperation(value = "Listar todas as cidade")
	public List<Cidade> listarTodas(){
		return service.listarTodas();
	}
}
