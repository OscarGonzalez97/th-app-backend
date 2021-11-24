package com.roshka.repositorio;

import java.util.List;

import com.roshka.modelo.Cargo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CargoRepository extends JpaRepository<Cargo,Long>{
    public Page<Cargo> findByNombreContainingIgnoreCase(String nombre, Pageable pageable);
    @Query(value = "SELECT c FROM Cargo c WHERE c.id=?1")
    public Cargo findByIdCargo(Long id);
    public boolean existsByNombreIgnoreCase(String nombre);
    public List<Cargo> findByexisteConvocatoriaFalse();
    @Query(value = "SELECT * FROM cargo",nativeQuery = true)
	public Page<Cargo> findAllCargo(Pageable pageable );
}
