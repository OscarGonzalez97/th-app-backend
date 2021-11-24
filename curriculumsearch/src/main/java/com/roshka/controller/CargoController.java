package com.roshka.controller;


import com.roshka.modelo.Cargo;
import com.roshka.repositorio.CargoRepository;
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
public class CargoController {

    CargoRepository cargoRepo;

    @Autowired
    public CargoController(CargoRepository cargoRepo) {
        this.cargoRepo = cargoRepo;
    }

    @RequestMapping("/cargos")
    public String menuCargos(Model model,@RequestParam(required = false) String nombre,@RequestParam(defaultValue = "0")Integer nroPagina) {
        final Integer CANTIDAD_POR_PAGINA = 10;
        Pageable page = PageRequest.of(nroPagina,CANTIDAD_POR_PAGINA,Sort.by("id"));
        if(nombre == null || nombre.trim().isEmpty()) {
            Page<Cargo> CargoPag=cargoRepo.findAll(page);
            model.addAttribute("cargos", CargoPag.getContent());
            model.addAttribute("pages", CargoPag.getTotalPages());
        }
        else {
            Page<Cargo> CargoPag=cargoRepo.findByNombreContainingIgnoreCase(nombre,page);    
            model.addAttribute("pages", CargoPag.getTotalPages());
            model.addAttribute("cargos", CargoPag.getContent());
        }
        return "cargos";
    }

    @RequestMapping(path = {"/cargo","/cargo/{id}"}, method = RequestMethod.GET)
    public String formCargo(Model model,@PathVariable(required = false) Long id) {

        if(id == null) model.addAttribute("cargo", new Cargo());
        else model.addAttribute("cargo", cargoRepo.getById(id));
        return "cargo-form";
    }

    @PostMapping(path = {"/cargo","/cargo/{id}"})
    public String guardarCargo(@Valid @ModelAttribute Cargo cargo, BindingResult result, @PathVariable(required = false) Long id, Model model) {
        if(result.hasErrors() || (id==null && cargoRepo.existsByNombreIgnoreCase(cargo.getNombre())  )){
            model.addAttribute("mismoNombre", true);
            return "cargo-form";
        }; 
        if(id != null ){
            cargo.setId(id);
            cargo.setExisteConvocatoria(cargoRepo.getById(id).isExisteConvocatoria());
        } 
        cargoRepo.save(cargo);
        return "redirect:/cargos";
    }

}
