package com.roshka.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.roshka.modelo.Postulante;
import com.roshka.repositorio.PostulanteRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Controller

public class PostulanteController {
    @Autowired
    PostulanteRepository post;  
    @RequestMapping("/")
    public String index(){
        
        return "home";
    }

     @PostMapping("/")
    public String guardarPostulante( @RequestParam String nombre,@RequestParam String apellido, @RequestParam 
    String ci,@RequestParam String correo,@RequestParam String ciudad,@RequestParam String telefono,
    @RequestParam String fechaNacimiento,@RequestParam String resumen,@RequestParam long nivelIngles,
    @RequestParam String curriculum, @RequestParam String modalidad,@RequestParam String disponibilidad ){
        
        try {
            Date date1=new SimpleDateFormat("yyyy-mm-dd").parse(fechaNacimiento);
            Postulante postulante= new Postulante(nombre, apellido, ci, correo, ciudad, 
            telefono,date1, resumen, 
            nivelIngles, curriculum, modalidad, disponibilidad);
            post.save(postulante);
            
        } catch (Exception e) {
            //TODO: handle exception
            System.out.println(e);
        }




       
        
        System.out.println( fechaNacimiento);
       
        return "dfg";
    }

}
