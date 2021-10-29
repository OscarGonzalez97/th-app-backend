package com.roshka.modelo;

import javax.persistence.*;

@Entity
@Table(name = "experiencia_reconocimiento")
public class ExperienciaReconocimiento {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(name ="experiencia_id")
    private long experienciaId;
    @Column(name = "tecnologia_id")
    private long tecnologiaId;
    @Column(name = "nivel")
    private long nivel;

    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public long getExperienciaId() {
        return experienciaId;
    }
    public void setExperienciaId(long experienciaId) {
        this.experienciaId = experienciaId;
    }
    public long getTecnologiaId() {
        return tecnologiaId;
    }
    public void setTecnologiaId(long tecnologiaId) {
        this.tecnologiaId = tecnologiaId;
    }
    public long getNivel() {
        return nivel;
    }
    public void setNivel(long nivel) {
        this.nivel = nivel;
    }
}
