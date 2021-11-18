package com.roshka.modelo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

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