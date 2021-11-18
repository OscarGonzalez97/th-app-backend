package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity @Data
@Table(name = "institucion")
public class Institucion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "nombre")
    @NotBlank
    private String nombre;

    //Facultades
    @Column(name = "sub_nombre")
    private String subNombre;

    @OneToMany(cascade = CascadeType.PERSIST, mappedBy = "institucion", fetch = FetchType.LAZY)
    @JsonManagedReference
    private List<Estudio> estudioList;

    public List<Estudio> getEstudioList() {
        return estudioList;
    }

    public void setEstudioList(List<Estudio> estudioList) {
        this.estudioList = estudioList;
    }
}
