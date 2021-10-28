package com.roshka.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity 
@Table(name="postulante_tecnologia")

public class PostulanteTecnologia {
   @Id 
   @GeneratedValue(strategy = GenerationType.AUTO)
   private long id ;
   @Column(name="nivel")
   private Long nivel;
   @Column(name="tecnologias")
   private long tecnologias;
   @Column(name="postulante")
   private long postulante;
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
public long getTecnologias() {
    return tecnologias;
}
public void setTecnologias(long tecnologias) {
    this.tecnologias = tecnologias;
}
public long getPostulante() {
    return postulante;
}
public void setPostulante(long postulante) {
    this.postulante = postulante;
}






}
