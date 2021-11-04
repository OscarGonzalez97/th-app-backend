package com.roshka.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;

import com.roshka.modelo.Experiencia;

public interface ExperienciaRepository extends JpaRepository<Experiencia,Long> {
    public List<Experiencia> findByCargoLike(String cargo);
}
