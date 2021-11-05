package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonValue;

public enum TipoExperiencia {
	TRABAJO_NORMAL("Trabajo Normal"), PASANTIA("Pasantia");

	private String descripcion;
	private TipoExperiencia(String descripcion){
		this.descripcion = descripcion;
	}

	@JsonValue
	public String getDescripcion() {
		return descripcion;
	}

	

}
