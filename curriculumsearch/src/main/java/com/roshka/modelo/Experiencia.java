package com.roshka.modelo;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.*;

@Entity
@Table(name = "experiencia")
public class Experiencia {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(name = "institucion")
    private String institucion;
    @Column(name = "fecha_desde")
    private Date fechaDesde;
    @Column(name = "fecha_hasta")
    private Date fechaHasta;
    @Column(name = "referencias")
    private String referencias;
    @Column(name = "cargo")
    private String cargo;

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
    public Date getFechaDesde() {
        return fechaDesde;
    }
    public void setFechaDesde(Date fechaDesde) {
        this.fechaDesde = fechaDesde;
    }
    public Date getFechaHasta() {
        return fechaHasta;
    }
    public void setFechaHasta(Date fechaHasta) {
        this.fechaHasta = fechaHasta;
    }
    public String getReferencias() {
        return referencias;
    }
    public void setReferencias(String referencias) {
        this.referencias = referencias;
    }
    public String getCargo() {
        return cargo;
    }
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

}
