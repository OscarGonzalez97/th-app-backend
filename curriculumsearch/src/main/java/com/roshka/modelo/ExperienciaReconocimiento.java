package com.roshka.modelo;

import javax.persistence.*;

@Entity
@Table(name = "experiencia_reconocimiento")
public class ExperienciaReconocimiento {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private long id;
    
    @ManyToOne
    @JoinColumn
    private Experiencia experiencia;
  
    @Column(name = "nivel")
    private long nivel;

    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public Experiencia getExperiencia() {
        return experiencia;
    }
    public void setExperiencia(Experiencia experiencia) {
        this.experiencia = experiencia;
    }
    public long getNivel() {
        return nivel;
    }
    public void setNivel(long nivel) {
        this.nivel = nivel;
    }
}
