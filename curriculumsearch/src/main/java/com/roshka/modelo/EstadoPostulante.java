package com.roshka.modelo;

public enum EstadoPostulante {
    NUEVO("Nuevo"), CONTACTADO("Contactado"), RECHAZADO("Rechazado"), CONTRATADO("Contratado"), VOLVERLLAMAR ("Volver a llamar");
    private final String estado;

    EstadoPostulante(String estado){
        this.estado=estado;
    }

    public String getEstado(){
        return this.estado;
    }
}
