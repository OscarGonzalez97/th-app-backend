package com.roshka.modelo;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;

@Entity @Data
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

    public Postulante getPostulante() {
        return postulante;
    }
    public void setPostulante(Postulante postulante) {
        this.postulante = postulante;
    }
}
