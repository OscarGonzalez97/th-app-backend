package com.roshka.controller;

import com.roshka.modelo.Tecnologia;
import com.roshka.repositorio.TecnologiaRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TecnologiaController {
 
    TecnologiaRepository tecRepo;


@Autowired 
public TecnologiaController(TecnologiaRepository tecRepo){
   this.tecRepo = tecRepo;

}

@GetMapping(path = {"/tecnologia","/tecnologia/{id}"})
public String addtecnologiaView(Model model,@PathVariable(required = false) Long id) {
    
    
    if(id == null) model.addAttribute("tecnologia", new Tecnologia());
    else model.addAttribute("tecnologia", tecRepo.getById(id));
    return "tecnologia-form";
}

@RequestMapping("/tecnologias")
    public String menuTecnologias(Model model,
                            @RequestParam(required = false) String nombre
                            ) {
        if(nombre == null || nombre.trim().isEmpty()) model.addAttribute("tecnologias", tecRepo.findAll());
        else model.addAttribute("tecnologias", tecRepo.findByNombreContainingIgnoreCase(nombre));
        return "tecnologias";
    }

@PostMapping(path = {"/tecnologia","/tecnologia/{id}"})
    public String addtecnologia(@ModelAttribute Tecnologia tecnologia, BindingResult result, @PathVariable(required = false) Long id) {
        if(result.hasErrors()); 
        if(id != null ) tecnologia.setId(id);
        tecRepo.save(tecnologia);
        System.out.println(tecnologia.getNombre());
        return "redirect:/tecnologias";
    } 




}
