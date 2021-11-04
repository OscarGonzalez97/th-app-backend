package com.roshka.controller;


import java.util.List;

import javax.validation.ConstraintViolationException;

import com.roshka.modelo.*;
import com.roshka.repositorio.ExperienciaRepository;
import com.roshka.repositorio.InstitucionRepository;
import com.roshka.repositorio.PostulanteRepository;
import com.roshka.repositorio.TecnologiaRepository;

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

    @Autowired
    public PostulanteController(PostulanteRepository post, TecnologiaRepository tecRepo, ExperienciaRepository expRepo, InstitucionRepository institucionRepository) {
        this.post = post;
        this.tecRepo = tecRepo;
        this.expRepo = expRepo;
        this.institucionRepository = institucionRepository;
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
        model.addAttribute("modalidades", Modalidad.values());
        model.addAttribute("disponibilidades", Disponibilidad.values());
        model.addAttribute("tiposDeEstudio", TipoDeEstudio.values());
        model.addAttribute("estadosEstudio", EstadoEstudio.values());
        return "postulante-form";
    }

    @PostMapping(value = "/postulante",consumes = "application/json")
    public String guardarPostulante(@RequestBody Postulante postulante){
        System.out.println("hola");
        for(Estudio estudio: postulante.getEstudios()){
            if(institucionRepository.findByNombre(estudio.getInstitucion().getNombre())==null){
                institucionRepository.save(estudio.getInstitucion());
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
