package com.roshka.repositorio;

import com.roshka.modelo.Postulante;
import org.springframework.data.jpa.repository.JpaRepository;

import com.roshka.modelo.Estudio;

import java.util.List;

public interface EstudioRepository extends JpaRepository<Estudio,Long>{

    public List<Estudio> findByPostulante(Postulante postulante);
	
}
