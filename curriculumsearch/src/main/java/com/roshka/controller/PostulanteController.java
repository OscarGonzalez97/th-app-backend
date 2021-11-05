package com.roshka.controller;


import java.util.List;

import javax.validation.ConstraintViolationException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.roshka.modelo.Disponibilidad;
import com.roshka.modelo.EstadoCivil;
import com.roshka.modelo.Nacionalidad;
import com.roshka.modelo.Postulante;
import com.roshka.modelo.TipoExperiencia;
import com.roshka.repositorio.CiudadRepository;
import com.roshka.repositorio.DepartamentoRepository;
import com.roshka.repositorio.ExperienciaRepository;
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
    @Autowired
    PostulanteRepository post;  

    @Autowired
    TecnologiaRepository tecRepo;

    @Autowired
    ExperienciaRepository expRepo;

    @Autowired
    CiudadRepository ciuRepo;

    @Autowired
    DepartamentoRepository depRepo;

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
        //TODO: 
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
        //se obtiene referencia de todas las tecnologias existentes
        postulante.getTecnologias().stream().filter(
                    tec -> tec.getTecnologia().getId() != 0 
            ).forEach(
                    tec -> tec.setTecnologia(tecRepo.getById(tec.getTecnologia().getId()))
                    );
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
