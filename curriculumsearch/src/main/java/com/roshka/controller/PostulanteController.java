package com.roshka.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolationException;
import javax.validation.Valid;

import com.roshka.modelo.Experiencia;
import com.roshka.modelo.Postulante;
import com.roshka.repositorio.PostulanteRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostulanteController {
    @Autowired
    PostulanteRepository post;  

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/postulante")
    public String getFormPostulante(){
        
        return "postulante-form";
    }

    @PostMapping(value = "/postulante",consumes = "application/json")
    public String guardarPostulante(@RequestBody Postulante postulante){
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
