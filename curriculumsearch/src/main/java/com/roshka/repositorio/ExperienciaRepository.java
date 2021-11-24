package com.roshka.repositorio;

import com.roshka.modelo.Experiencia;
import com.roshka.modelo.Postulante;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExperienciaRepository extends JpaRepository<Experiencia,Long> {
    public List<Experiencia> findByCargoLike(String cargo);

    public List<Experiencia> findByPostulante(Postulante postulante);
}
