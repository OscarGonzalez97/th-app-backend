package com.roshka.repositorio;

import com.roshka.modelo.Ciudad;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CiudadRepository extends JpaRepository<Ciudad,Long> {
    
}
