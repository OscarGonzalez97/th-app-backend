package com.roshka.modelo;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity @Data
@Table(name = "cargo")
public class Cargo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(name = "nombre")
    private String nombre;

    @OneToMany(mappedBy = "cargo")
    @JsonManagedReference
    private List<ConvocatoriaCargo> convocatorias;

    @Column(name = "existe_convocatoria")
    private boolean existeConvocatoria=false;

    public List<ConvocatoriaCargo> getConvocatorias() {
        return convocatorias;
    }
    public void setConvocatorias(List<ConvocatoriaCargo> convocatorias) {
        this.convocatorias = convocatorias;
    }
    public static Object values() {
        return null;
    }

    public boolean isExisteConvocatoria() {
        return this.existeConvocatoria;
    }

    public void setExisteConvocatoria(boolean existeConvocatoria) {
        this.existeConvocatoria = existeConvocatoria;
    }

}
