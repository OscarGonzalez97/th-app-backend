package com.roshka.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import com.roshka.modelo.Postulante;

public interface PostulanteRepository extends JpaRepository<Postulante,Long> {

    @Query("select p from Postulante p join p.estudios e on e.institucion LIKE %?1%")
	public List<Postulante> findByInstitucionEstudio(String institucion);
    
}
