package com.roshka.modelo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="estudio")
public class Estudio {  
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)    
    private long id;
    @Column(name="tipo_de_studio")
    private String tipoDeEstudio;
    @Column(name="institucion")
    private String institucion;
    @Column(name="fecha_desde")
    private Date fechaDesde;
    @Column(name="fecha_hasta")
    private Date fechaHasta;
    @Column(name="referencias")
    private String referencias;
    @Column(name="titulo")
    private String titulo;


    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTipoDeEstudio() {
        return this.tipoDeEstudio;
    }

    public void setTipoDeEstudio(String tipoDeEstudio) {
        this.tipoDeEstudio = tipoDeEstudio;
    }

    public String getInstitucion() {
        return this.institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    public Date getFechaDesde() {
        return this.fechaDesde;
    }

    public void setFechaDesde(Date fechaDesde) {
        this.fechaDesde = fechaDesde;
    }

    public Date getFechaHasta() {
        return this.fechaHasta;
    }

    public void setFechaHasta(Date fechaHasta) {
        this.fechaHasta = fechaHasta;
    }

    public String getReferencias() {
        return this.referencias;
    }

    public void setReferencias(String referencias) {
        this.referencias = referencias;
    }

    public String getTitulo() {
        return this.titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
}
