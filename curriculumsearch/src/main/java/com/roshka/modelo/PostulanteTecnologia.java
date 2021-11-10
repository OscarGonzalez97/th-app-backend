package com.roshka.modelo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;


import com.fasterxml.jackson.annotation.JsonBackReference;
@Entity 
@Table(name="postulante_tecnologia",
uniqueConstraints=@UniqueConstraint(columnNames={"postulante_id", "tecnologia_id"}))

public class PostulanteTecnologia {
   @Id 
   @GeneratedValue(strategy = GenerationType.AUTO)
   @Column(name="id")
   private long id ;

   @Column(name="nivel")
   @Min(value = 1)
   @Max(value = 5)
   private Long nivel;
    @ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE},optional = false)
    @JoinColumn
   private Tecnologia tecnologia;

    @ManyToOne()
    @JoinColumn
    @JsonBackReference(value = "postulantetecnologia-postulante")
    private Postulante postulante;
    
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public Long getNivel() {
        return nivel;
    }
    public void setNivel(Long nivel) {
        this.nivel = nivel;
    }
    public Tecnologia getTecnologia() {
        return tecnologia;
    }
    public void setTecnologia(Tecnologia tecnologia) {
        this.tecnologia = tecnologia;
    }
    public Postulante getPostulante() {
        return postulante;
    }
    public void setPostulante(Postulante postulante) {
        this.postulante = postulante;
    }


}
