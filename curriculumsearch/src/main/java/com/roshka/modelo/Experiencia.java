package com.roshka.modelo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.roshka.utils.Helper;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

@Entity
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

    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }



    public Date getFechaDesde() {
        return fechaDesde;
    }
    public String getMotivoSalida() {
        return motivoSalida;
    }
    public TipoExperiencia getTipoExperiencia() {
        return tipoExperiencia;
    }
    
    public void setMotivoSalida(String motivoSalida) {
        this.motivoSalida = motivoSalida;
    }
    public void setTipoExperiencia(TipoExperiencia tipoExperiencia) {
        this.tipoExperiencia = tipoExperiencia;
    }
    
	
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public String getInstitucion() {
        return institucion;
    }
    public void setInstitucion(String institucion) {
        this.institucion = institucion;
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
    public String getNombreReferencia() {
        return nombreReferencia;
    }
    public String getTelefonoReferencia() {
        return telefonoReferencia;
    }
    public void setNombreReferencia(String nombreReferencia) {
        this.nombreReferencia = nombreReferencia;
    }
    public void setTelefonoReferencia(String telefonoReferencia) {
        this.telefonoReferencia = telefonoReferencia;
    }
    public String getCargo() {
        return cargo;
    }
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    public void setPostulante(Postulante postulante) {
        this.postulante = postulante;
    }
    public Postulante getPostulante() {
        return postulante;
    }

}
