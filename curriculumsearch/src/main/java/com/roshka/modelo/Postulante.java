package com.roshka.modelo;

import javax.persistence.*;
import javax.validation.constraints.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Entity
@Table(name="postulante")
public class Postulante {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private long id;

    @Column(name="nombre")
    @NotBlank
    @Size(max = 255)
    private String nombre;

    @Column(name = "apellido")
    @NotBlank
    @Size(max = 255)
    private String apellido;

    @Column(name = "ci")
    @NotBlank
    @Size(max = 120)
    private String ci;

    @Column(name = "correo")
    @NotBlank
    @Email(message = "Formato incorrecto de correo")
    private String correo;

    @Column(name = "ciudad")
    @NotBlank
    @Size(max = 120)
    private String ciudad;

    @Column(name = "telefono")
    @NotBlank
    private String telefono;

    @Column(name = "fecha_nacimiento")
    @NotNull
    @Past
    private Date fechaNacimiento;

    @Column(name = "resumen")
    private String resumen;

    @Column(name = "nivel_ingles")
    @Min(value = 1)
    @Max(value = 5)
    private long nivelIngles;

    @Column(name = "curriculum")
    private String curriculum;

    @Column(name = "modalidad")
    @NotNull
    private String modalidad;

    @Column(name = "disponibilidad")
    private String disponibilidad;

    @JsonManagedReference
    @OneToMany(mappedBy = "postulante",cascade = CascadeType.ALL)
    private List<PostulanteTecnologia> tecnologias;
    
    @JsonManagedReference
    @OneToMany(mappedBy = "postulante",cascade = CascadeType.ALL)
    private List<Experiencia> experiencias = new ArrayList<>();

    @JsonManagedReference
    @OneToMany(mappedBy = "postulante",cascade = CascadeType.ALL)
    private List<Estudio> estudios;


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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCi() {
        return ci;
    }

    public void setCi(String ci) {
        this.ci = ci;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        if(fechaNacimiento==null || fechaNacimiento.isEmpty()) return;
        try {

            this.fechaNacimiento = new SimpleDateFormat("yyyy-mm-dd").parse(fechaNacimiento);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            System.err.println("Error al parsear");
            e.printStackTrace();
        }
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public long getNivelIngles() {
        return nivelIngles;
    }

    public void setNivelIngles(long nivelIngles) {
        this.nivelIngles = nivelIngles;
    }

    public String getCurriculum() {
        return curriculum;
    }

    public void setCurriculum(String curriculum) {
        this.curriculum = curriculum;
    }

    public String getModalidad() {
        return modalidad;
    }

    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    public String getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(String disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    public List<PostulanteTecnologia> getTecnologias() {
        return tecnologias;
    }
    public void setTecnologias(List<PostulanteTecnologia> tecnologias) {
        this.tecnologias = tecnologias;
    }

    public List<Estudio> getEstudios() {
        return estudios;
    }
    public List<Experiencia> getExperiencias() {
        return experiencias;
    }
    public void setEstudios(List<Estudio> estudios) {
        this.estudios = estudios;
    }
    public void setExperiencias(List<Experiencia> experiencias) {
        this.experiencias = experiencias;
    }
}
