package com.roshka.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

import com.roshka.modelo.Tecnologia;

public interface TecnologiaRepository extends JpaRepository<Tecnologia,Long> {

	public List<Tecnologia> findByNombreContainingIgnoreCase(String nombre);

	public boolean existsByNombreIgnoreCase(String nombre);
}
