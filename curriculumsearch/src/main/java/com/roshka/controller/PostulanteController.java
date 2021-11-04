package com.roshka.controller;


import javax.validation.ConstraintViolationException;

import com.roshka.modelo.Disponibilidad;
import com.roshka.modelo.Modalidad;
import com.roshka.modelo.Postulante;
import com.roshka.repositorio.PostulanteRepository;
import com.roshka.repositorio.TecnologiaRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLOutput;
import java.util.List;
import java.util.Locale;


@Controller
public class PostulanteController {
    @Autowired
    PostulanteRepository post;  

    @Autowired
    TecnologiaRepository tecRepo;

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
