package com.roshka.modelo;

public enum EstadoConvocatoria {
    abierto("abierto"), cerrado("cerrado");
    private String descripcion;
    private EstadoConvocatoria(String descripcion){
        this.descripcion = descripcion;
    }
    public String getDescripcion() {
        return descripcion;
    }
}
