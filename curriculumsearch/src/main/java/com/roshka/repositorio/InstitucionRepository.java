package com.roshka.repositorio;

import com.roshka.modelo.Institucion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InstitucionRepository extends JpaRepository<Institucion, Long> {
    public Institucion findByNombre(String nombre);
}
