package com.roshka.controller;



import javax.validation.ConstraintViolationException;

import com.roshka.modelo.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.roshka.modelo.Disponibilidad;
import com.roshka.modelo.EstadoCivil;
import com.roshka.modelo.Nacionalidad;
import com.roshka.modelo.Postulante;
import com.roshka.modelo.TipoExperiencia;
import com.roshka.repositorio.*;

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

    @Autowired
    public PostulanteController(
            PostulanteRepository post, TecnologiaRepository tecRepo, ExperienciaRepository expRepo,
            InstitucionRepository institucionRepository, DepartamentoRepository depRepo,
            CiudadRepository ciuRepo) {
        this.post = post;
        this.tecRepo = tecRepo;
        this.expRepo = expRepo;
        this.institucionRepository = institucionRepository;
        this.depRepo = depRepo;
        this.ciuRepo = ciuRepo;
    }

    @RequestMapping("home")
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
        try {
            model.addAttribute("ciudades", new ObjectMapper().writeValueAsString(ciuRepo.findAll()));
        } catch (JsonProcessingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
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
        return "redirect:/postulacion-correcta";
    }

    @GetMapping("/postulacion-correcta")
    public String successPostulation(Model model){
        model.addAttribute("mensaje1", "Tu informacion se ha recibido correctamente!");
        model.addAttribute("mensaje2", " espera por que nos pongamos en contacto!");
        return "exitoRegistro";
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
