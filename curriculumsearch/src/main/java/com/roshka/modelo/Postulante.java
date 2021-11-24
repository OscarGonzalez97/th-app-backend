package com.roshka.modelo;

import javax.persistence.*;
import javax.validation.constraints.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.roshka.utils.Helper;

import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Entity
@Table(name="postulante")
@JsonIdentityInfo(generator = ObjectIdGenerators.UUIDGenerator.class, property="@UUID")
@Data
public class Postulante {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    @Column(name = "direccion")
    private String direccion;

    @Column(name = "nivel_ingles")
    @Min(value = 1)
    @Max(value = 5)
    private Long nivelIngles;


    @Column(name="estado_civil")
    @NotNull
    private EstadoCivil estadoCivil;

    @Column(name="estado_postulante")
    @NotNull
    private EstadoPostulante estadoPostulante;
    @Column(name="comentario_rrhh")
    private String comentarioRRHH;    

   
    @Column(name="nacionalidad", length = 2)
    @NotNull
    private Nacionalidad nacionalidad;

    @Column(name = "tipo_documento",length = 3)
    @NotNull
    private TipoDocumento tipoDocumento;



    @Column(name = "tecnologia_otros")
    private String tecnologiaOtros;

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

    @ManyToMany()
    @JoinTable(uniqueConstraints = @UniqueConstraint(columnNames = {"postulante_id","convocatoria_cargo_id"}),
                joinColumns = @JoinColumn(name="postulante_id", referencedColumnName="id"),
                inverseJoinColumns= @JoinColumn(name="convocatoria_cargo_id", referencedColumnName="id")
    )
    private List<ConvocatoriaCargo> postulaciones;

    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "cvfile_id",referencedColumnName = "id")
    @JsonIgnore
    private DBFile cvFile;
   
    @Column(name = "fecha_creacion")
    private Date fechaCreacion;

    @Column(name = "fecha_actualizacion")
    private Date fechaActualizacion;

    @Column(name = "fecha_contratado")
    private Date fechaContratado;

    @Column(name = "meses_de_exp")
    private Long mesesDeExperiencia;
    
    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = Helper.convertirFecha(fechaNacimiento);
    }



    @PrePersist
    public void precargarFechas(){
        this.fechaCreacion = new Date();
        this.fechaActualizacion = this.fechaCreacion;
        this.estadoPostulante = EstadoPostulante.NUEVO;
        this.comentarioRRHH = null;
    }

    @PostPersist
    private void calcularExperienciaEnMese(){
        long expTotal = 0;
        //expTotal = postulante.getExperiencias().stream().mapToLong(e -> Helper.getMonthsDifference(e.getFechaDesde(), e.getFechaHasta())).sum();
        for (Experiencia experiencia : this.experiencias) {
            expTotal +=  Helper.getMonthsDifference(experiencia.getFechaDesde(), experiencia.getFechaHasta());
        }
        this.mesesDeExperiencia = expTotal;
    }

    @PreUpdate
    public void actualizarFecha(){
        this.fechaActualizacion= new Date();
    }
  
   
}
