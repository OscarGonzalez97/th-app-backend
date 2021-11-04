package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity
@Table(name = "institucion")
public class Institucion {
    @Id
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
}
