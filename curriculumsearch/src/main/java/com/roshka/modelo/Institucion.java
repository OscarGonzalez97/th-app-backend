package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity
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

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSubNombre() {
        return subNombre;
    }

    public void setSubNombre(String subNombre) {
        this.subNombre = subNombre;
    }

    public List<Estudio> getEstudioList() {
        return estudioList;
    }

    public void setEstudioList(List<Estudio> estudioList) {
        this.estudioList = estudioList;
    }
}
