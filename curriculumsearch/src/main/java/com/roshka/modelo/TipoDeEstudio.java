package com.roshka.modelo;



public enum TipoDeEstudio {
    TERCIARIO("Terciario"),
    SECUNDARIO("Secundario"),
    CURSO("Curso"),
    POSTGRADO("Post Grado"),
    OTRO("Otro");

    private final String name;

    TipoDeEstudio(String name){
        this.name = name;
    }

    public String getName(){
        return this.name;
    }

}
