package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonValue;

public enum EstadoCivil {
    SOLTERO("Soltero"),CONCUBINADO("Concubinado"),CASADO("Casado"),VIUDO("Viudo"),DIVORCIADO("Divorciado");
    private String descripcion;

    private EstadoCivil(String descripcion) {
        this.descripcion = descripcion;
    }

    @JsonValue
    public String getDescripcion() {
        return descripcion;
    }
}
