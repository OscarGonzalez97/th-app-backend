package com.roshka.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.roshka.modelo.Postulante;
import com.roshka.modelo.PostulanteTecnologia;

public interface PostulanteRepository extends JpaRepository<Postulante,Long> {

	@Query("select pos from Postulante pos join PostulanteTecnologia pt on pt.postulante.id=pos.id "+
			"join Tecnologia tec on pt.tecnologia.id=tec.id "+
			 "where tec.nombre=?1 and pt.nivel=?2")
	public List<Postulante> findByPostulanteTecnologiaM(String tecno,long idt);
}
