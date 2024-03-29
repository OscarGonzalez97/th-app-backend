package com.roshka.controller;

import com.roshka.modelo.Tecnologia;
import com.roshka.repositorio.TecnologiaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/tecnologias")
public class TecnologiaController {
 
    TecnologiaRepository tecRepo;


@Autowired 
public TecnologiaController(TecnologiaRepository tecRepo){
   this.tecRepo = tecRepo;

}

@GetMapping(path = {"/agregar","/modificar/{id}"})
public String addtecnologiaView(Model model,@PathVariable(required = false) Long id) {
    
    
    if(id == null) model.addAttribute("tecnologia", new Tecnologia());
    else model.addAttribute("tecnologia", tecRepo.getById(id));
    return "tecnologia-form";
}

@RequestMapping()
    public String menuTecnologias(Model model,@RequestParam(required = false) String nombre,@RequestParam(defaultValue = "0")Integer nroPagina) {
        final Integer CANTIDAD_POR_PAGINA = 10;
        Pageable page = PageRequest.of(nroPagina,CANTIDAD_POR_PAGINA,Sort.by("id"));
        
        if(nombre == null || nombre.trim().isEmpty()) {
            Page<Tecnologia> tecnologiaPag=tecRepo.findAllTecnologia(page);
            model.addAttribute("tecnologias", tecnologiaPag.getContent());
            model.addAttribute("pages", tecnologiaPag.getTotalPages());
        }
        else {
            Page<Tecnologia> tecnologiaPag=tecRepo.findByNombreContainingIgnoreCase(nombre.trim(),page);    
            model.addAttribute("pages", tecnologiaPag.getTotalPages());
            model.addAttribute("tecnologias", tecnologiaPag.getContent());
        }
        return "tecnologias";
    }

@PostMapping(path = {"/agregar","/modificar/{id}"})
    public String addtecnologia(@Valid @ModelAttribute Tecnologia tecnologia, BindingResult result, @PathVariable(required = false) Long id, Model model) {
        if(result.hasErrors() || (id==null && tecRepo.existsByNombreIgnoreCase(tecnologia.getNombre()))){
            model.addAttribute("mismoNombre", true);
            return "tecnologia-form";
        } 
        if(id != null ) tecnologia.setId(id);
        tecRepo.save(tecnologia);
        return "redirect:/tecnologias";
    } 




}
