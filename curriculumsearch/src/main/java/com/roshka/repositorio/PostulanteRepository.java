package com.roshka.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import com.roshka.modelo.Postulante;

public interface PostulanteRepository extends JpaRepository<Postulante,Long> {

    @Query("select p from Postulante p join p.estudios e on e.institucion LIKE %?1%")
	public List<Postulante> findByInstitucionEstudio(String institucion);
    
    @Query("select p from Postulante p " +
            "JOIN PostulanteTecnologia pt ON pt.postulante.id = p.id " +
            "JOIN Tecnologia t ON t.id = pt.tecnologia.id " +
            "WHERE t.nombre = ?1")
	public List<Postulante> buscarPostulantesPorTecnologia(String nombre);
    
    @Query("select p from Postulante p " +
            "JOIN PostulanteTecnologia pt ON pt.postulante.id = p.id " +
            "JOIN Tecnologia t ON t.id = pt.tecnologia.id " +
            "WHERE t.id = ?1")
	public List<Postulante> buscarPostulantesPorTecnologia(long tecnologiaId);

    @Query(value = "select p" +
        "from postulante p join experiencia x on x.postulante_id= p.id" +
        "group by p.id" +
        "having sum(fecha_hasta-fecha_desde)>?1 * INTERVAL '1' month",
        nativeQuery = true )
    public List<Postulante> personasConExperienciaMayor(long meses);      
}
