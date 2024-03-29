package com.roshka.repositorio;

import com.roshka.modelo.ConvocatoriaCargo;
import com.roshka.modelo.EstadoConvocatoria;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ConvocatoriaRepository extends JpaRepository<ConvocatoriaCargo,Long> {
    @Query(value = "SELECT c FROM ConvocatoriaCargo c WHERE c.id=?1")
    public ConvocatoriaCargo findByIdConvocatoriaCargo(Long id);
    public List<ConvocatoriaCargo> findByCargoId(Long cargoId);
    //@Query(value="selec x from ConvocatoriaCargo x where (x.fechaFinal > ?1)",nativeQuery = true)
    //public List<ConvocatoriaCargo> findConvocatoriaCargoByCargo(Date fechaFinal);
    /* @Query("select c from ConvocatoriaCargo c where ( ?1 is null and ?3 is null) or ( ( ( ((c.fechaFin > ?2 or  c.fechaFin=null) and ?3 = 1) or ((c.fechaFin < ?2  ) and ?3 = 0)) or ?3 is null )  and (c.cargoId = ?1 or ?1 is null) )")
    public Page<ConvocatoriaCargo> f1ndByCargoAndEstado(TypedParameterValue cargoId, Date fecha, TypedParameterValue isOpen, Pageable page); */

    @Query("select c from ConvocatoriaCargo c "+ 
    "where (c.cargoId = ?1 or ?1 is null) and "+
    "(c.estado = ?2 or ?2 is null)")
    public Page<ConvocatoriaCargo> findByCargoAndEstado(Long cargoId, EstadoConvocatoria estado, Pageable page);
    @Query("SELECT c FROM ConvocatoriaCargo c WHERE (cargoId=?1)")
    public List<ConvocatoriaCargo> filtrarConvocatoriasPorCargo(Long cargoId);

}
