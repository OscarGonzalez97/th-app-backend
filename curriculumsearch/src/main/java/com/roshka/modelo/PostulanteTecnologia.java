package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
@Entity @Data
@Table(name="postulante_tecnologia",
uniqueConstraints=@UniqueConstraint(columnNames={"postulante_id", "tecnologia_id"}))

public class PostulanteTecnologia {
   @Id 
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(name="id")
   private long id ;

   @Column(name="nivel")
   @Min(value = 1)
   @Max(value = 5)
   private Long nivel;
    @ManyToOne()
    @JoinColumn
   private Tecnologia tecnologia;


    @ManyToOne()
    @JoinColumn
    @JsonBackReference(value = "postulantetecnologia-postulante")
    private Postulante postulante;
    
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
