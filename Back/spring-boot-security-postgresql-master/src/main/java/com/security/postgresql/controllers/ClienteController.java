package com.security.postgresql.controllers;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.security.postgresql.cliente.dtos.ClienteRecordDto;
import com.security.postgresql.models.ClienteModel;
import com.security.postgresql.repository.ClienteRepository;

import jakarta.validation.Valid;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class ClienteController {
	
	@Autowired
	ClienteRepository clienteRepository;
	
	@PreAuthorize("hasRole('USER') or hasRole('MODERATOR') or hasRole('ADMIN')")
	@PostMapping("/clientes")
	public ResponseEntity<ClienteModel> saveCliente(@RequestBody @Valid ClienteRecordDto clienteRecordDto){
		var clienteModel = new ClienteModel();
		BeanUtils.copyProperties(clienteRecordDto, clienteModel);
		return ResponseEntity.status(HttpStatus.CREATED).body(clienteRepository.save(clienteModel));
	}
	
	@PreAuthorize("hasRole('USER') or hasRole('MODERATOR') or hasRole('ADMIN')")
	@GetMapping("/clientes")
	public ResponseEntity<List<ClienteModel>> getAllClientes(){
		List<ClienteModel> clientesList = clienteRepository.findAll();
		if(!clientesList.isEmpty()) {
			for(ClienteModel cliente : clientesList) {
				UUID id = cliente.getId();
				cliente.add(linkTo(methodOn(ClienteController.class).getOneCliente(id)).withSelfRel());
			}
		}
		return ResponseEntity.status(HttpStatus.OK).body(clientesList);
	}

	@PreAuthorize("hasRole('USER') or hasRole('MODERATOR') or hasRole('ADMIN')")
	@GetMapping("/clientes/{id}")
	public ResponseEntity<Object> getOneCliente(@PathVariable(value="id") UUID id){
		Optional<ClienteModel> cliente0 = clienteRepository.findById(id);
		if(cliente0.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Cliente não encontrado");
		}
		cliente0.get().add(linkTo(methodOn(ClienteController.class).getAllClientes()).withSelfRel());
		return ResponseEntity.status(HttpStatus.OK).body(cliente0.get());
	}
	
	@PreAuthorize("hasRole('USER') or hasRole('MODERATOR') or hasRole('ADMIN')")
	@PutMapping("/clientes/{id}")
	public ResponseEntity<Object> updateCliente(@PathVariable(value="id") UUID id, @RequestBody @Valid ClienteRecordDto clienteRecordDto){
		Optional<ClienteModel> cliente0 = clienteRepository.findById(id);
		if(cliente0.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Cliente não encontrado");
		}
		var clienteModel = cliente0.get();
		BeanUtils.copyProperties(clienteRecordDto, clienteModel);
		return ResponseEntity.status(HttpStatus.OK).body(clienteRepository.save(clienteModel));
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@DeleteMapping("/clientes/{id}")
	public ResponseEntity<Object> deleteCliente(@PathVariable(value="id") UUID id){
		Optional<ClienteModel> cliente0 = clienteRepository.findById(id);
		if(cliente0.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Cliente não encontrado");
		}
		clienteRepository.delete(cliente0.get());
		return ResponseEntity.status(HttpStatus.OK).body("Cliente deletado com sucesso.");
	}

	@PreAuthorize("hasRole('ADMIN')")
	@DeleteMapping("/clientes")
	public ResponseEntity<Object> deleteAllClientes(){
		clienteRepository.deleteAll();
		List<ClienteModel> clientesList = clienteRepository.findAll();
		if(clientesList.isEmpty()) {
			return ResponseEntity.status(HttpStatus.OK).body("Clientes deletados com sucesso.");
		}
		return ResponseEntity.status(HttpStatus.FOUND).body("Ainda constam clientes.");
	}
}
