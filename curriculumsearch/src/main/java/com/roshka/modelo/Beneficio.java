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
    @Column(name="beneficio")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String beneficio;
}
