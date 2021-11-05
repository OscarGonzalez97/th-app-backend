package com.roshka.repositorio;

import java.util.List;

import com.roshka.modelo.ConvocatoriaCargo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ConvocatoriaRepository extends JpaRepository<ConvocatoriaCargo,Long> {
    public List<ConvocatoriaCargo> findByCargoId(Long cargoId);
}
