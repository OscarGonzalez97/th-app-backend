package com.roshka.modelo;

public enum EstadoEstudio {
    CURSANDO("Cursando"),
    FINALIZADO("Finalizado"),
    SUSPENDIDO("Suspendido"),
    TESIS("En Proceso de Tesis");

    private final String name;

    EstadoEstudio(String name){
        this.name = name;
    }

    public String getName(){
        return this.name;
    }
}
