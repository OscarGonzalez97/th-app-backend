package com.roshka.repositorio;

import com.roshka.modelo.DBFile;
import com.roshka.modelo.Postulante;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface DBFileRepository extends JpaRepository<DBFile, String> {

    @Query("select db.id from DBFile db where db.postulante = ?1")
    public String getIdByPostulante(Postulante postulante);
}