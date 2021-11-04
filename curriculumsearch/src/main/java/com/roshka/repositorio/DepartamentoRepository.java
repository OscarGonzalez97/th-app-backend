package com.roshka.repositorio;

import com.roshka.modelo.Departamento;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartamentoRepository extends JpaRepository<Departamento,Long> {
    
}
