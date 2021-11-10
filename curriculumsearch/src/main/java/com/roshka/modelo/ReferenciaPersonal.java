package com.roshka.modelo;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "referencia_personal")
public class ReferenciaPersonal {   
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(name = "nombre")
    private String nombre;

    @NotBlank
    @Column(name = "telefono")
    private String telefono;

    @NotBlank
    @Column(name = "relacion")
    private String relacion;

    @ManyToOne(cascade = CascadeType.ALL, optional = false)
    @JoinColumn
    @JsonBackReference
    private Postulante postulante;

    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getRelacion() {
        return relacion;
    }

    public String getTelefono() {
        return telefono;
    }

    public Postulante getPostulante() {
        return postulante;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setRelacion(String relacion) {
        this.relacion = relacion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setPostulante(Postulante postulante) {
        this.postulante = postulante;
    }
}
