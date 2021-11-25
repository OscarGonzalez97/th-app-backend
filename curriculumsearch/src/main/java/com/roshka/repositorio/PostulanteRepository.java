package com.roshka.repositorio;

import com.roshka.modelo.EstadoPostulante;
import com.roshka.modelo.Postulante;
import com.roshka.modelo.TipoDeEstudio;

import org.hibernate.jpa.TypedParameterValue;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;


public interface PostulanteRepository extends JpaRepository<Postulante,Long> {

    public Postulante findByNroDocument(String ci);

    @Query("select p from Postulante p join p.estudios e on e.institucion.nombre LIKE %?1%")
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
    
	@Query("select pos from Postulante pos join PostulanteTecnologia pt on pt.postulante.id=pos.id "+
			"join Tecnologia tec on pt.tecnologia.id=tec.id "+
			 "where tec.nombre=?1 and pt.nivel=?2")
	public List<Postulante> findByPostulanteTecnologiaM(String tecno,long idt);


    @Query(value = "select DISTINCT p " +
    "from Postulante p left join p.experiencias x " +
    "left join p.estudios e " +
    "left join p.tecnologias pt " +
    "left join p.postulaciones conv " +
    "where (?1 is null or lower(p.nombre) LIKE lower(?1) or lower(p.apellido) LIKE lower(?1) ) " +
    "and (p.nivelIngles >= ?2 or ?2 is null) "+
    "and (pt.nivel >= ?3 or ?3 is null) "+
    "and (pt.tecnologia.id = ?4 or ?4 is null) "+
   // " and (e.institucion.id = ?5 or ?5 is null ) "+
   " and (e.tipoDeEstudio = ?5 or ?5 is null ) "+
    " and (conv.cargoId = ?6 or ?6 is null ) "+
    "and (p.estadoPostulante = ?7 or ?7 is null) "+
    " and (conv.id=?8 or ?8 is null ) " +
            "and (p.mesesDeExperiencia >= ?9 and p.mesesDeExperiencia <= ?10 ) ")
    public Page<Postulante> postulantesMultiFiltro(TypedParameterValue nombre, Long nivelInges, Long nivel, Long tecnoId,
                                                   TipoDeEstudio tipoDeEstudio,Long cargoId, Pageable pageable, EstadoPostulante estado,
                                                   Long convo, Long infRangeExp, Long supRangeExp);
    
    @Transactional      
    @Modifying
    @Query("UPDATE Postulante p SET p.estadoPostulante = ?1 , p.comentarioRRHH = ?2 WHERE p.id = ?3")
    void setPostulanteEstadoAndComentario(EstadoPostulante eP, String comentario, Long Id);
    
    /*@Transactional      
    @Modifying
    @Query("UPDATE Postulante p SET p.estadoPostulante = ?1  WHERE p.id = ?2")
    void setPostulanteEstadoPostulante(EstadoPostulante eP, Long Id);
    
    @Transactional      
    @Modifying
    @Query("UPDATE Postulante p SET p.comentarioRRHH = ?1 WHERE p.id = ?2")
    void setPostulanteEstadoComentario( String comentario, Long Id);*/

    @Query("SELECT p FROM Postulante p JOIN Estudio e ON p.id=e.postulante.id "+
    "where e.temaDeEstudio=?1")
    public List<Postulante> obtenerPostulantesPorCarrera(String carrera);

}
