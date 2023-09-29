package br.com.pefoce.cliente.dtos;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record ClienteRecordDto(@NotBlank String nome, @NotBlank String email, @NotBlank String cpf, @NotNull BigDecimal renda, String telefone, LocalDateTime data_criacao) {

}
