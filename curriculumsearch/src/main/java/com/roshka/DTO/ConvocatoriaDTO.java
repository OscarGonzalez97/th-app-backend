package com.roshka.DTO;

import java.util.Date;

import com.roshka.modelo.EstadoConvocatoria;

import lombok.Data;

@Data
public class ConvocatoriaDTO {
    private Long id;
    private Long cargoId;
    private EstadoConvocatoria estado;
    private Date fechaInicio;
    private Date fechaFin;
    public ConvocatoriaDTO(Long id, Long cargoId, EstadoConvocatoria estado, Date fechaInicio, Date fechaFin) {
        this.id = id;
        this.cargoId = cargoId;
        this.estado = estado;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
    }
    public ConvocatoriaDTO() {
        
    }
    
    
    
}
