package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonValue;

public enum Disponibilidad {
    TIEMPO_COMPLETO("C","Tiempo Completo"), PARCIAL("P","Parcial");

    private String code;
    private String descripcion;

    private Disponibilidad(String code, String descripcion) {
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
