package com.roshka.repositorio;

import java.util.Date;
import java.util.List;

import com.roshka.modelo.ConvocatoriaCargo;

import org.hibernate.jpa.TypedParameterValue;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ConvocatoriaRepository extends JpaRepository<ConvocatoriaCargo,Long> {
    public List<ConvocatoriaCargo> findByCargoId(Long cargoId);
    //@Query(value="selec x from ConvocatoriaCargo x where (x.fechaFinal > ?1)",nativeQuery = true)
    //public List<ConvocatoriaCargo> findConvocatoriaCargoByCargo(Date fechaFinal);
    @Query("select c from ConvocatoriaCargo c where ( ?1 is null and ?3 is null) or ( ( ( (c.fechaFin > ?2 and ?3 = 1) or (c.fechaFin < ?2 and ?3 = 0)) or ?3 is null )  and (c.cargoId = ?1 or ?1 is null) )")
    public List<ConvocatoriaCargo> f1ndByCargoAndEstado(TypedParameterValue cargoId, Date fecha, TypedParameterValue isOpen);
}
