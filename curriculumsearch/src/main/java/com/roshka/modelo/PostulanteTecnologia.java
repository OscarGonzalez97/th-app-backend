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
@Entity 
@Table(name="postulante_tecnologia")

public class PostulanteTecnologia {
   @Id 
   @GeneratedValue(strategy = GenerationType.AUTO)
   @Column(name="id")
   private long id ;
   @Column(name="nivel")
   private Long nivel;
    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn
   private Tecnologia tecnologia;
   @ManyToOne()
   @JoinColumn
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
