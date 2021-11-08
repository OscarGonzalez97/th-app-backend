package com.roshka.repositorio;

import java.util.List;

import com.roshka.modelo.Cargo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CargoRepository extends JpaRepository<Cargo,Long>{
    public List<Cargo> findByNombreContainingIgnoreCase(String nombre);
}
