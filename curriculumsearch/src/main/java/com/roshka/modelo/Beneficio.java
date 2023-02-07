package com.roshka.modelo;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;


@Entity @Data
@Table(name="beneficio")
public class Beneficio {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name="id")
    private Long id;
    @Column(name="titulo")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String titulo;

    @Column(name="descripcion", length = 2000)
    @NotBlank(message = "Este campo no puede estar vacio")
    private String descripcion;
}
