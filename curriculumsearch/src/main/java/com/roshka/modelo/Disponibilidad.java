package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonValue;

public enum Disponibilidad {
    TIEMPO_COMPLETO("C"), PARCIAL("P");

    private String code;

    private Disponibilidad(String code) {
        this.code = code;
    }

    @JsonValue
    public String getCode() {
        return code;
    }
}
