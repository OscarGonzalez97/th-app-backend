package com.roshka.repositorio;

import com.roshka.modelo.Birthday;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface BirthdayRepository extends JpaRepository<Birthday,Long> {

    public Page<Birthday> findByNombreCompletoContainingIgnoreCase(String nombre, Pageable pageable);

    public boolean existsByNombreCompletoIgnoreCase(String nombre);


    @Query(value = "SELECT * FROM cumpleanos", nativeQuery = true)
    public Page<Birthday> findAllBirthday(Pageable pageable);
}
