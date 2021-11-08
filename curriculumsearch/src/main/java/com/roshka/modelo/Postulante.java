package com.roshka.modelo;

import javax.persistence.*;
import javax.validation.constraints.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.roshka.utils.Helper;

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
    @NotBlank(message = "Este campo no puede estar vacio")
    @Size(max = 255)
    private String nombre;

    @Column(name = "apellido")
    @NotBlank(message = "Este campo no puede estar vacio")
    @Size(max = 255)
    private String apellido;

    @Column(name = "nro_document")
    @NotBlank(message = "Este campo no puede estar vacio")
    @Size(max = 120)
    private String nroDocument;

    @Column(name = "correo")
    @NotBlank(message = "Este campo no puede estar vacio")
    @Email(message = "Formato incorrecto de correo")
    private String correo;

    @ManyToOne(targetEntity = Ciudad.class,fetch = FetchType.EAGER)
    @JoinColumn(name="ciudad_id",insertable = false, updatable = false)
    private Ciudad ciudad;
    @Column(name="ciudad_id")
    private Long ciudadId;

    @Column(name = "telefono")
    @NotBlank(message = "Este campo no puede estar vacio")
    private String telefono;

    @Column(name = "fecha_nacimiento")
    @NotNull(message = "Este campo no puede estar vacio")
    @Past(message = "Este campo no puede estar en el futuro")
    private Date fechaNacimiento;

    @Column(name = "resumen")
    private String resumen;

    @Column(name = "nivel_ingles")
    @Min(value = 1)
    @Max(value = 5)
    private long nivelIngles;

    @Column(name = "curriculum")
    private String curriculum;

    @Column(name="estado_civil")
    @NotNull
    private EstadoCivil estadoCivil;
   
    @Column(name="nacionalidad", length = 2)
    @NotNull
    private Nacionalidad nacionalidad;

    @Column(name = "tipo_documento",length = 3)
    @NotNull
    private TipoDocumento tipoDocumento;


    @Column(name = "disponibilidad", length = 2)
    private Disponibilidad disponibilidad;

    @JsonManagedReference(value = "postulantetecnologia-postulante")
    @OneToMany(mappedBy = "postulante",cascade = CascadeType.ALL)
    private List<PostulanteTecnologia> tecnologias;
    
    @JsonManagedReference(value = "experiencia-postulante")
    @OneToMany(mappedBy = "postulante",cascade = CascadeType.ALL)
    private List<Experiencia> experiencias = new ArrayList<>();

    @JsonManagedReference(value = "estudio-postulante")
    @OneToMany(mappedBy = "postulante",cascade = CascadeType.ALL)
    private List<Estudio> estudios;

    @JsonManagedReference
    @OneToMany(mappedBy = "postulante",cascade = CascadeType.ALL)
    private List<ReferenciaPersonal> referencias;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(uniqueConstraints = @UniqueConstraint(columnNames = {"postulante_id","convocatoria_cargo_id"}),
                joinColumns = @JoinColumn(name="postulante_id", referencedColumnName="id"),
                inverseJoinColumns= @JoinColumn(name="convocatoria_cargo_id", referencedColumnName="id")
    )
    @JsonIgnore
    private List<ConvocatoriaCargo> postulaciones;


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

    public String getnroDocument() {
        return nroDocument;
    }

    public void setnroDocument(String nroDocument) {
        this.nroDocument = nroDocument;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
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
        this.fechaNacimiento = Helper.convertirFecha(fechaNacimiento);
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

    

    public Disponibilidad getDisponibilidad() {
        return disponibilidad;
    }

    public Ciudad getCiudad() {
        return this.ciudad;
    }

    public void setCiudad(Ciudad ciudad) {
        this.ciudad = ciudad;
    }

    public Long getCiudadId() {
        return this.ciudadId;
    }

    public void setCiudadId(Long ciudadId) {
        this.ciudadId = ciudadId;
    }
    public void setEstadoCivil(EstadoCivil estadoCivil) {
        this.estadoCivil = estadoCivil;
    }
    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }
    public EstadoCivil getEstadoCivil() {
        return estadoCivil;
    }
    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }
    public Nacionalidad getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(Nacionalidad nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public void setDisponibilidad(Disponibilidad disponibilidad) {
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
    public List<ConvocatoriaCargo> getPostulaciones() {
        return postulaciones;
    }
    public void setPostulaciones(List<ConvocatoriaCargo> postulaciones) {
        this.postulaciones = postulaciones;
    }

    public void setReferencias(List<ReferenciaPersonal> referencias) {
        this.referencias = referencias;
    }

    public List<ReferenciaPersonal> getReferencias() {
        return referencias;
    }
}
