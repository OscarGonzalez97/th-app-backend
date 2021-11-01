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
  
    @Column(name="nombre")
    private String nombre;

    @Column(name="certificado")
    private String certificado;

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
    public String getCertificado() {
        return certificado;
    }
    public String getNombre() {
        return nombre;
    }
    public void setCertificado(String certificado) {
        this.certificado = certificado;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
