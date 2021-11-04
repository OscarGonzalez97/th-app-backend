package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity
@Table(name = "tipo_de_estudio")
public class TipoDeEstudio {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @Column(name = "nombre")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String nombre;

    @OneToMany(cascade = CascadeType.PERSIST, mappedBy = "tipoDeEstudio", fetch = FetchType.LAZY)
    @JsonManagedReference
    private List<Estudio> estudioList;

}
