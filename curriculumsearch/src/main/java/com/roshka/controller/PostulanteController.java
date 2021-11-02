package com.roshka.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.roshka.modelo.Postulante;
import com.roshka.repositorio.PostulanteRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
