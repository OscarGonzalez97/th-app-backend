package com.roshka.controller;


import java.util.Date;
import java.util.List;

import javax.validation.ConstraintViolationException;

import com.roshka.modelo.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.roshka.modelo.Disponibilidad;
import com.roshka.modelo.EstadoCivil;
import com.roshka.modelo.Nacionalidad;
import com.roshka.modelo.Postulante;
import com.roshka.modelo.TipoExperiencia;
import com.roshka.repositorio.CargoRepository;
import com.roshka.repositorio.CiudadRepository;
import com.roshka.repositorio.ConvocatoriaRepository;
import com.roshka.repositorio.DepartamentoRepository;
import com.roshka.repositorio.ExperienciaRepository;
import com.roshka.repositorio.InstitucionRepository;
import com.roshka.repositorio.PostulanteRepository;
import com.roshka.repositorio.TecnologiaRepository;

import org.hibernate.jpa.TypedParameterValue;
import org.hibernate.type.IntegerType;
import org.hibernate.type.LongType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;



@Controller
public class PostulanteController {
    PostulanteRepository post;
    TecnologiaRepository tecRepo;
    ExperienciaRepository expRepo;
    InstitucionRepository institucionRepository;
    DepartamentoRepository depRepo;
    CiudadRepository ciuRepo;
    ConvocatoriaRepository cargoRepo;
    CargoRepository carRepo;

    @Autowired
    public PostulanteController(PostulanteRepository post, TecnologiaRepository tecRepo, ExperienciaRepository expRepo, InstitucionRepository institucionRepository, DepartamentoRepository depRepo, CiudadRepository ciuRepo,ConvocatoriaRepository cargoRepo, CargoRepository carRepo) {
        this.post = post;
        this.tecRepo = tecRepo;
        this.expRepo = expRepo;
        this.institucionRepository = institucionRepository;
        this.depRepo = depRepo;
        this.ciuRepo = ciuRepo;
        this.cargoRepo =cargoRepo;
        this.carRepo=carRepo;
    }


    @RequestMapping("/")
    public String index() {
      

      return "index";
    }

    @RequestMapping("/postulantes")
    public String postulantes(Model model,
                            @RequestParam(required = false,name = "tec")Long tecnologidaId) {
        model.addAttribute("tecnologias", tecRepo.findAll());
        if(tecnologidaId==null) model.addAttribute("postulantes", post.findAll());
        else model.addAttribute("postulantes", post.buscarPostulantesPorTecnologia(tecnologidaId));
        return "postulantes";
    }

    @RequestMapping("/postulante")
    public String getFormPostulante(Model model){
        model.addAttribute("tecnologias", tecRepo.findAll());
        model.addAttribute("disponibilidades", Disponibilidad.values());
        model.addAttribute("tiposDeEstudio", TipoDeEstudio.values());
        model.addAttribute("estadosEstudio", EstadoEstudio.values());
        model.addAttribute("estadosCiviles", EstadoCivil.values());
        model.addAttribute("nacionalidades", Nacionalidad.values());
        model.addAttribute("tiposExperencia", TipoExperiencia.values());
        model.addAttribute("CargosDisponibles", cargoRepo.f1ndByCargoAndEstado(new TypedParameterValue(LongType.INSTANCE, null), new Date(), new TypedParameterValue(IntegerType.INSTANCE, 1)));
        try {
            model.addAttribute("ciudades", new ObjectMapper().writeValueAsString(ciuRepo.findAll()));
        } catch (JsonProcessingException er) {
            // TODO Auto-generated catch block
            er.printStackTrace();
        }
        model.addAttribute("departamentos", depRepo.findAll());

        return "postulante-form";
    }

    @PostMapping(value = "/postulante",consumes = "application/json")
    public String guardarPostulante(@RequestBody Postulante postulante){
        System.out.println("hola");
        postulante.getTecnologias().stream().filter(
                    tec -> tec.getTecnologia().getId() != 0 
            ).forEach(
                    tec -> tec.setTecnologia(tecRepo.getById(tec.getTecnologia().getId()))
                    );

        
        for (int i = 0; i < postulante.getPostulaciones().size(); i++) {
            postulante.getPostulaciones().set(i, cargoRepo.getById(postulante.getPostulaciones().get(i).getId()));
        }
        
        for(Estudio estudio: postulante.getEstudios()){
            Institucion institucion = institucionRepository.findByNombre(estudio.getInstitucion().getNombre());
            if(institucion==null){
                institucionRepository.save(estudio.getInstitucion());
            }else{
                estudio.setInstitucion(institucion);
            }
        }
        System.out.println("hola");
        post.save(postulante);
        return "redirect:/";
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler({MethodArgumentNotValidException.class})
    public ResponseEntity<String> handleValidationExceptions(
            MethodArgumentNotValidException ex) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(ex.getMessage());
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler({ConstraintViolationException.class})
    public ResponseEntity<String> handleValidationExceptions2(
            ConstraintViolationException ex) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(ex.getMessage());
    }
    



}
