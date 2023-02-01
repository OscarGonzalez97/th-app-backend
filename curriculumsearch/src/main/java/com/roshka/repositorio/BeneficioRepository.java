package com.roshka.repositorio;

import com.roshka.modelo.Beneficio;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface BeneficioRepository extends JpaRepository<Beneficio,Long> {

    public Page<Beneficio> findByTituloContainingIgnoreCase(String nombre, Pageable pageable);

    public boolean existsByTituloIgnoreCase(String nombre);


    @Query(value = "SELECT * FROM beneficio", nativeQuery = true)
    public Page<Beneficio> findAllBeneficio(Pageable pageable);
}
