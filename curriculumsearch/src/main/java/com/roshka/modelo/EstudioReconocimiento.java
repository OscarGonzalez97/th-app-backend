package com.roshka.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="estudio_reconocimiento")
public class EstudioReconocimiento {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    private Long id;
    @Column(name="nombre")
    private String nombre;
    @Column(name="certificado")
    private String certificado;
    @ManyToOne
    @JoinColumn
    private Estudio estudio;
    

	public EstudioReconocimiento(Long id, String nombre, String certificado) {
        this.id = id;
        this.nombre = nombre;
        this.certificado = certificado;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCertificado() {
        return this.certificado;
    }

    public void setCertificado(String certificado) {
        this.certificado = certificado;
    }
    public Estudio getEstudio() {
        return estudio;
    }
    public void setEstudio(Estudio estudio) {
        this.estudio = estudio;
    }
}
