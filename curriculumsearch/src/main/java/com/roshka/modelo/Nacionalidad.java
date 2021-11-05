package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonValue;

public enum Nacionalidad {
    PY("Paraguayo"),EX("Extranjero");

    private String descripcion;

    private Nacionalidad(String descripcion) {
        this.descripcion = descripcion;
    }

    @JsonValue
    public String getDescripcion() {
        return descripcion;
    }
}
