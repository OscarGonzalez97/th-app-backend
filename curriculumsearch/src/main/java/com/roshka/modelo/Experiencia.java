package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.roshka.utils.Helper;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import java.util.Date;

@Entity @Data
@Table(name = "experiencia")
public class Experiencia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "institucion")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String institucion;

    @Column(name = "fecha_desde")
    @Past(message = "Este campo no puede estar en el futuro")
    @NotNull(message = "Este campo no puede estar vacio")
    private Date fechaDesde;

    @Column(name = "fecha_hasta")
    private Date fechaHasta;
    @Column(name = "nombre_referencia")
    private String nombreReferencia;
    @Column(name = "telefono_referencia")
    private String telefonoReferencia;
    @Column(name = "cargo")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String cargo;

    @Column(name="motivo_salida")
    private String motivoSalida;

    @JsonBackReference(value = "experiencia-postulante")
    @ManyToOne(optional = false)
    @JoinColumn
    private Postulante postulante;

    @Column(name = "tipo_experiencia")
    @NotNull
    private TipoExperiencia tipoExperiencia;

    @Column(name = "descripcion")
    @NotBlank
    private String descripcion;

    public Date getFechaDesde() {
        return fechaDesde;
    }
    public TipoExperiencia getTipoExperiencia() {
        return tipoExperiencia;
    }
    

    public void setTipoExperiencia(TipoExperiencia tipoExperiencia) {
        this.tipoExperiencia = tipoExperiencia;
    }
    public void setFechaDesde(String fechaDesde) {
        this.fechaDesde = Helper.convertirFecha(fechaDesde);
    }
    public Date getFechaHasta() {
        return fechaHasta;
    }
    public void setFechaHasta(Date fechaHasta) {
        this.fechaHasta = fechaHasta;
    }
    public void setFechaHasta(String fechaHasta) {
        this.fechaHasta = Helper.convertirFecha(fechaHasta);
    }
    public void setPostulante(Postulante postulante) {
        this.postulante = postulante;
    }
    public Postulante getPostulante() {
        return postulante;
    }

}
