package com.roshka.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.roshka.modelo.Postulante;

public interface PostulanteRepository extends JpaRepository<Postulante,Long> {

	
}
