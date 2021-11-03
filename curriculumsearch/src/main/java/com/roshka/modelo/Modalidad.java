package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonValue;

public enum Modalidad {
    PRESENCIAL("P","Presencial"), SEMIPRESENCIAL("S","Semi Presencial"), REMOTO("R","Remoto");

    private String code;
    private String descripcion;

    private Modalidad(String code, String descripcion) {
        this.code = code;
        this.descripcion = descripcion;
    }

    @JsonValue
    public String getCode() {
        return code;
    }

    public String getDescripcion() {
        return descripcion;
    }
}
