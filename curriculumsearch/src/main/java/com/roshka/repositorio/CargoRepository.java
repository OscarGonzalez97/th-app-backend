package com.roshka.repositorio;

import java.util.List;

import com.roshka.modelo.Cargo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CargoRepository extends JpaRepository<Cargo,Long>{
    public Page<Cargo> findByNombreContainingIgnoreCase(String nombre, Pageable pageable);
    
    public boolean existsByNombreIgnoreCase(String nombre);

    @Query(value = "SELECT * FROM cargo",nativeQuery = true)
	public Page<Cargo> findAllCargo(Pageable pageable );
}
