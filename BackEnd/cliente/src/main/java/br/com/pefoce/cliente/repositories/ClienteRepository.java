package br.com.pefoce.cliente.repositories;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.pefoce.cliente.models.ClienteModel;

@Repository
public interface ClienteRepository extends JpaRepository<ClienteModel, UUID> {

}
