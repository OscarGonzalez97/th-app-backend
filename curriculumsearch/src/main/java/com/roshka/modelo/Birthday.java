package com.roshka.modelo;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;


@Entity @Data
@Table(name="cumpleanos")
public class Birthday {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name="id")
    private Long id;
    @Column(name="nombreCompleto")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String nombreCompleto;
    @Column(name="fecha")
    @NotBlank(message = "Este campo no puede estar vacio")
    private Date fecha;
}