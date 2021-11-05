package com.roshka.repositorio;

import com.roshka.modelo.Cargo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CargoRepository extends JpaRepository<Cargo,Long>{
    
}
