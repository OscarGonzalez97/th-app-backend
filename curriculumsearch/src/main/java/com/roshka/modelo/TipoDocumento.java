package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonValue;

public enum TipoDocumento {
    CI("CI","Cedula de identidad"),
    DNI("PAS","Pasaporte"),
    Otro("Otro","Otro");
    private String code;
    private String descripcion;

    private TipoDocumento(String code, String descripcion) {
        this.code = code;
        this.descripcion = descripcion;
    }
    public void setDescripcion(String descripcion){
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
