package com.roshka.modelo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
    @ManyToOne
    @JoinColumn
    private Postulante postulante;

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
    public void setFechaDesde(String fechaDesde) {
        if(fechaDesde==null || fechaDesde.isEmpty()) return;

        try {
            this.fechaDesde = new SimpleDateFormat("yyyy-mm-dd").parse(fechaDesde);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public Date getFechaHasta() {
        return fechaHasta;
    }
    public void setFechaHasta(Date fechaHasta) {
        this.fechaHasta = fechaHasta;
    }
    public void setFechaHasta(String fechaHasta) {
        if(fechaHasta==null || fechaHasta.isEmpty()) return;

        try {
            this.fechaHasta = new SimpleDateFormat("yyyy-mm-dd").parse(fechaHasta);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
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
    public void setPostulante(Postulante postulante) {
        this.postulante = postulante;
    }
    public Postulante getPostulante() {
        return postulante;
    }
}
