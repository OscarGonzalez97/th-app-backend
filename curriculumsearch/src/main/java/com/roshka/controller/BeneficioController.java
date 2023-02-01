package com.roshka.controller;

import com.roshka.modelo.Beneficio;
import com.roshka.repositorio.BeneficioRepository;
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
@RequestMapping("/beneficios")
public class BeneficioController {

    BeneficioRepository beneficioRepository;


    @Autowired
    public BeneficioController(BeneficioRepository beneficioRepository){
        this.beneficioRepository = beneficioRepository;
    }

    @GetMapping(path = {"/agregar","/modificar/{id}"})
    public String addBeneficioView(Model model, @PathVariable(required = false) Long id) {


        if(id == null) model.addAttribute("beneficio", new Beneficio());
        else model.addAttribute("beneficio", beneficioRepository.getById(id));
        return "beneficio-form";
    }

    @RequestMapping()
    public String menuBeneficios(Model model,@RequestParam(required = false) String nombre,@RequestParam(defaultValue = "0")Integer nroPagina) {
        final Integer CANTIDAD_POR_PAGINA = 10;
        Pageable page = PageRequest.of(nroPagina,CANTIDAD_POR_PAGINA,Sort.by("id"));

        if(nombre == null || nombre.trim().isEmpty()) {
            Page<Beneficio> beneficioPag=beneficioRepository.findAllBeneficio(page);
            model.addAttribute("beneficios", beneficioPag.getContent());
            model.addAttribute("pages", beneficioPag.getTotalPages());
        }
        else {
            Page<Beneficio> beneficioPag=beneficioRepository.findByTituloContainingIgnoreCase(nombre.trim(),page);
            model.addAttribute("pages", beneficioPag.getTotalPages());
            model.addAttribute("beneficios", beneficioPag.getContent());
        }
        return "beneficios";
    }

    @PostMapping(path = {"/agregar","/modificar/{id}"})
    public String addBeneficio(@Valid @ModelAttribute Beneficio beneficio, BindingResult result, @PathVariable(required = false) Long id, Model model) {
        if(result.hasErrors() || (id==null && beneficioRepository.existsByTituloIgnoreCase(beneficio.getTitulo()))){
            model.addAttribute("mismoNombre", true);
            return "beneficio-form";
        }
        if(id != null ) beneficio.setId(id);
        beneficioRepository.save(beneficio);
        return "redirect:/beneficios";
    }
}