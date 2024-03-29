package com.roshka.repositorio;

import com.roshka.modelo.Tecnologia;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TecnologiaRepository extends JpaRepository<Tecnologia,Long> {

	public Page<Tecnologia> findByNombreContainingIgnoreCase(String nombre, Pageable pageable);

	public boolean existsByNombreIgnoreCase(String nombre);
	

	@Query(value = "SELECT * FROM tecnologia",nativeQuery = true)
	public Page<Tecnologia> findAllTecnologia(Pageable pageable );
}
