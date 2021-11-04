package com.roshka.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import java.util.Locale;

@Entity
@Table(name="tecnologia")
public class Tecnologia {
   @GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	@Column(name="id")
	private long id;
	
	@Column(name="nombre")
	@NotBlank(message = "Este campo no puede estar vacio")
    private String nombre;
    
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre.toLowerCase();
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
    
	
	
}
