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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.roshka.utils.Helper;

@Entity
@Table(name = "convocatoria_cargo")
public class ConvocatoriaCargo {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @ManyToOne()
    @JoinColumn
    @JsonBackReference
    private Cargo cargo;

    @Column(name = "fecha_inicio")
    private Date fechaInicio;

    @Column(name = "fecha_fin")
    private Date fechaFin;

    @Column(name = "cupos")
    private int cupos;

    @ManyToMany(mappedBy = "postulaciones")
    private List<Postulante> postulantes;

    public long getId() {
        return id;
    }
    public Cargo getCargo() {
        return cargo;
    }
    public int getCupos() {
        return cupos;
    }
    public Date getFechaFin() {
        return fechaFin;
    }
    public Date getFechaInicio() {
        return fechaInicio;
    }
    public void setId(long id) {
        this.id = id;
    }
    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }
    public void setCupos(int cupos) {
        this.cupos = cupos;
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

}
