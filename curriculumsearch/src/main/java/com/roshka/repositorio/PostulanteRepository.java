package com.roshka.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.roshka.modelo.Postulante;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PostulanteRepository extends JpaRepository<Postulante,Long> {

    @Query("select p from Postulante p " +
            "JOIN PostulanteTecnologia pt ON pt.postulante.id = p.id " +
            "JOIN Tecnologia t ON t.id = pt.tecnologia.id " +
            "WHERE t.nombre = ?1")
	public List<Postulante> buscarPostulantesPorTecnologia(String nombre);

}
