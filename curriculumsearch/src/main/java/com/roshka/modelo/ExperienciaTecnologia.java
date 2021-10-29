package com.roshka.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "experiencia_tecnologia")
public class ExperienciaTecnologia {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn
    private Experiencia experencia;

    @ManyToOne
    @JoinColumn
    private Tecnologia tecnologia;

    private Long nivel;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Experiencia getExperencia() {
        return experencia;
    }

    public void setExperencia(Experiencia experencia) {
        this.experencia = experencia;
    }

    public Tecnologia getTecnologia() {
        return tecnologia;
    }

    public void setTecnologia(Tecnologia tecnologia) {
        this.tecnologia = tecnologia;
    }

    public Long getNivel() {
        return nivel;
    }

    public void setNivel(Long nivel) {
        this.nivel = nivel;
    }

    
}
