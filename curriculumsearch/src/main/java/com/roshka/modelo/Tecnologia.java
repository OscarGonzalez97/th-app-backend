package com.roshka.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import lombok.Data;


@Entity @Data
@Table(name="tecnologia")
public class Tecnologia {
   @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name="id")
	private Long id;
	
	@Column(name="nombre")
	@NotBlank(message = "Este campo no puede estar vacio")
    private String nombre;
    
}
