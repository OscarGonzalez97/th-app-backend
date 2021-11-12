package com.roshka.DTO;

import java.util.List;

import com.roshka.modelo.Disponibilidad;
import com.roshka.modelo.EstadoPostulante;
import com.roshka.modelo.PostulanteTecnologia;

public class PostulanteListaDTO {
    private Long id;
    private String nombre;
    private String apellido;
    private Disponibilidad disponibilidad;
    private Long nivelIngles;
    private Long experienciaMeses;
    private List<PostulanteTecnologia> tecnologias;
    private EstadoPostulante estado;
    public PostulanteListaDTO(Long id, String nombre, String apellido, Disponibilidad disponibilidad,
    Long nivelIngles, Long experienciaMeses, List<PostulanteTecnologia> tecnologias,EstadoPostulante estado) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.disponibilidad = disponibilidad;
        this.nivelIngles = nivelIngles;
        this.experienciaMeses = experienciaMeses;
        this.tecnologias = tecnologias;
        this.estado=estado;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellido() {
        return apellido;
    }
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    public Disponibilidad getDisponibilidad() {
        return disponibilidad;
    }
    public void setDisponibilidad(Disponibilidad disponibilidad) {
        this.disponibilidad = disponibilidad;
    }
    public Long getNivelIngles() {
        return nivelIngles;
    }
    public void setNivelIngles(Long nivelIngles) {
        this.nivelIngles = nivelIngles;
    }
    public Long getExperienciaMeses() {
        return experienciaMeses;
    }
    public void setExperienciaMeses(Long experienciaMeses) {
        this.experienciaMeses = experienciaMeses;
    }
    public List<PostulanteTecnologia> getTecnologias() {
        return tecnologias;
    }
    public void setTecnologias(List<PostulanteTecnologia> tecnologias) {
        this.tecnologias = tecnologias;
    }
    public EstadoPostulante getEstado(){
        return estado;
    }
    public void setEstado(EstadoPostulante estado){
        this.estado=estado;
    }
    
    
}
