package com.roshka.modelo;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
@Entity
@Table(name="estudio")
public class Estudio {  
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY) 
    @Column(name="id")   
    private long id;

    @Column(name="tipo_de_studio")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String tipoDeEstudio;

    @Column(name="institucion")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String institucion;

    @Column(name="fecha_desde")
    @NotNull(message = "Este campo no puede estar vacio")
    @Past(message = "Este campo no puede estar en el futuro")
    private Date fechaDesde;

    @Column(name="fecha_hasta")
    private Date fechaHasta;

    @Column(name="referencias")
    private String referencias;

    @Column(name="titulo")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String titulo;
    
    @ManyToOne
    @JoinColumn
    @JsonBackReference
    private Postulante postulante;
    
    @JsonManagedReference
    @OneToMany(mappedBy = "estudio")
    private List<EstudioReconocimiento> estudioReconocimiento;
    
    
    
    public List<EstudioReconocimiento> getEstudioReconocimiento() {
		return estudioReconocimiento;
	}

	public void setEstudioReconocimiento(List<EstudioReconocimiento> estudioReconocimiento) {
		this.estudioReconocimiento = estudioReconocimiento;
	}

	public Postulante getPostulante() {
		return postulante;
	}

	public void setPostulante(Postulante postulante) {
		this.postulante = postulante;
	}

	

	public long getId() {
        return this.id;
    }

 
	public void setId(long id) {
        this.id = id;
    }

    public String getTipoDeEstudio() {
        return this.tipoDeEstudio;
    }

    public void setTipoDeEstudio(String tipoDeEstudio) {
        this.tipoDeEstudio = tipoDeEstudio;
    }

    public String getInstitucion() {
        return this.institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    public Date getFechaDesde() {
        return this.fechaDesde;
    }

    public void setFechaDesde(Date fechaDesde) {
        this.fechaDesde = fechaDesde;
    }

    public Date getFechaHasta() {
        return this.fechaHasta;
    }

    public void setFechaHasta(Date fechaHasta) {
        this.fechaHasta = fechaHasta;
    }

    public String getReferencias() {
        return this.referencias;
    }

    public void setReferencias(String referencias) {
        this.referencias = referencias;
    }

    public String getTitulo() {
        return this.titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
}
