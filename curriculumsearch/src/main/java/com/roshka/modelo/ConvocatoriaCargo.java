package com.roshka.modelo;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.roshka.utils.Helper;

import lombok.Data;

@Entity
@Table(name = "convocatoria_cargo") @Data
@JsonIdentityInfo(generator = ObjectIdGenerators.UUIDGenerator.class, property="@UUID")
public class ConvocatoriaCargo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne()
    @JoinColumn(name = "cargo_id",insertable = false, updatable = false)
    @JsonBackReference
    private Cargo cargo;

    @Column(name = "cargo_id")
    private Long cargoId;

    @Column(name = "fecha_inicio")
    private Date fechaInicio;

    @Column(name = "fecha_fin")
    private Date fechaFin;

    @Column(name = "cupos")
    private int cupos;

    //para deserializar desde el form como string
    @Transient
    private String fechaFinS;
    
    //para deserializar desde el form como string
    @Transient
    private String fechaInicioS;

    @ManyToMany(mappedBy = "postulaciones")
    private List<Postulante> postulantes;

    
    public Date getFechaFin() {
        return fechaFin;
    }
    public Date getFechaInicio() {
        return fechaInicio;
    }
   
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }
    public void setFechaFin(String fechaFin) {
        this.fechaFin = Helper.convertirFecha(fechaFin);
    }
    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = Helper.convertirFecha(fechaInicio);
    }
    public List<Postulante> getPostulantes() {
        return postulantes;
    }
    public void setPostulantes(List<Postulante> postulantes) {
        this.postulantes = postulantes;
    }
    public Long getCargoId() {
        return cargoId;
    }
    public void setCargoId(Long cargoId) {
        this.cargoId = cargoId;
    }
    public String getFechaFinS() {
        return fechaFinS;
    }
    public String getFechaInicioS() {
        return fechaInicioS;
    }
    public void setFechaFinS(String fechaFinS) {
        this.fechaFinS = fechaFinS;
        setFechaFin(fechaFinS);
    }
    public void setFechaInicioS(String fechaInicioS) {
        this.fechaInicioS = fechaInicioS;
        setFechaInicio(fechaInicioS);
    }

}
