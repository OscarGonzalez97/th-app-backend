package com.roshka.repositorio;

import com.roshka.modelo.Postulante;
import org.springframework.data.jpa.repository.JpaRepository;

import com.roshka.modelo.PostulanteTecnologia;

import java.util.List;

public interface PostulanteTecnologiaRepository extends JpaRepository<PostulanteTecnologia,Long>{

    public List<PostulanteTecnologia> findByPostulante(Postulante postulante);
	
	
}
