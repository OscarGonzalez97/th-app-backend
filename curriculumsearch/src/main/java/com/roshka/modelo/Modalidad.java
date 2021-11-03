package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonValue;

public enum Modalidad {
    PRESENCIAL("P"), SEMIPRESENCIAL("S"), REMOTO("R");

    private String code;

    private Modalidad(String code) {
        this.code = code;
    }

    @JsonValue
    public String getCode() {
        return code;
    }
}
