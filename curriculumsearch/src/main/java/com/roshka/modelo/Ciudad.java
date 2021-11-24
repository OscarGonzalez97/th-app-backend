package com.roshka.modelo;


import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

import javax.persistence.*;


@Entity @Data
@Table(name="ciudad")
public class Ciudad{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY) 
    public Long id;

    @Column(name="nombre")
    public String nombre;
    @Column(name="departamento_id")
    private Long departamentoId;

    public Long getDepartamentoId() {
        return this.departamentoId;
    }

    public void setDepartamentoId(Long departamentoId) {
        this.departamentoId = departamentoId;
    }

    @ManyToOne(targetEntity = Departamento.class,fetch = FetchType.EAGER)
    @JoinColumn(name="departamento_id",insertable = false, updatable = false)
    @JsonBackReference
    private Departamento departamento;

/*
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
*/
    public Departamento getDepartamento() {
        return this.departamento;
    }

    public void setDepartamento(Departamento departamento) {
        this.departamento = departamento;
    }





}
