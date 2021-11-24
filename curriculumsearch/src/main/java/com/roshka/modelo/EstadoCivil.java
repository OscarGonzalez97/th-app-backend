package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonValue;

public enum EstadoCivil {
    SOLTERO("Soltero/a"),CONCUBINADO("Concubinado/a"),CASADO("Casado/a"),VIUDO("Viudo/a"),DIVORCIADO("Divorciado/a");
    private String descripcion;

    private EstadoCivil(String descripcion) {
        this.descripcion = descripcion;
    }

    @JsonValue
    public String getDescripcion() {
        return descripcion;
    }
}
