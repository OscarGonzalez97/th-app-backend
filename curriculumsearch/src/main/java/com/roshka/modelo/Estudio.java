package com.roshka.modelo;

import java.util.Date;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.roshka.utils.Helper;
@Entity
@Table(name="estudio")
public class Estudio {  
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO) 
    @Column(name="id")   
    private long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @NotNull(message = "Este campo no puede ser null")
    @JsonBackReference
    private TipoDeEstudio tipoDeEstudio;

    @NotNull(message = "Este campo no puede estar vacio")
    @ManyToOne(fetch = FetchType.EAGER)
    @JsonBackReference
    private Institucion institucion;

    @Column(name = "estado")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String estado;

    //Carrera, Bachiller
    @Column(name="tema_de_estudio")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String temaDeEstudio;

    @Column(name="fecha_desde")
    @NotNull(message = "Este campo no puede estar vacio")
    @Past(message = "Este campo no puede estar en el futuro")
    private Date fechaDesde;

    @Column(name="fecha_hasta")
    private Date fechaHasta;

    
    @ManyToOne
    @JoinColumn
    @JsonBackReference
    private Postulante postulante;

	public Postulante getPostulante() {
		return postulante;
	}

	public void setPostulante(Postulante postulante) {
		this.postulante = postulante;
	}

    public void setFechaDesde(String fechaDesde) {
        this.fechaDesde = Helper.convertirFecha(fechaDesde);
    }
    public void setFechaHasta(String fechaHasta) {
        this.fechaHasta = Helper.convertirFecha(fechaHasta);
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setTipoDeEstudio(TipoDeEstudio tipoDeEstudio) {
        this.tipoDeEstudio = tipoDeEstudio;
    }

    public void setInstitucion(Institucion institucion) {
        this.institucion = institucion;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setTemaDeEstudio(String temaDeEstudio) {
        this.temaDeEstudio = temaDeEstudio;
    }

    public long getId() {
        return id;
    }

    public TipoDeEstudio getTipoDeEstudio() {
        return tipoDeEstudio;
    }

    public Institucion getInstitucion() {
        return institucion;
    }

    public String getEstado() {
        return estado;
    }

    public String getTemaDeEstudio() {
        return temaDeEstudio;
    }

    public Date getFechaDesde() {
        return fechaDesde;
    }

    public Date getFechaHasta() {
        return fechaHasta;
    }
}
