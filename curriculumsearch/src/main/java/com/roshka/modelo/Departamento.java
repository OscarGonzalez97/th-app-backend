package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity @Data
@Table(name="departamento")
public class Departamento {
    @Id
    private Long id;
    
    @Column(name="nombre")
    private String nombre;
    
    @OneToMany(mappedBy = "departamento",cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Ciudad> ciudad;



    public List<Ciudad> getCiudad() {
        return this.ciudad;
    }

    public void setCiudad(List<Ciudad> ciudad) {
        this.ciudad = ciudad;
    }




    
}