package com.roshka.controller;

import com.roshka.modelo.Cargo;
import com.roshka.modelo.ConvocatoriaCargo;
import com.roshka.repositorio.CargoRepository;
import com.roshka.repositorio.ConvocatoriaRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CargoController {

    CargoRepository cargoRepo;
    ConvocatoriaRepository convoRepo;

    @Autowired
    public CargoController(CargoRepository cargoRepo, ConvocatoriaRepository convoRepo) {
        this.cargoRepo = cargoRepo;
        this.convoRepo = convoRepo;
    }

    @RequestMapping("/cargos")
    public String menuCargos(Model model,@RequestParam(required = false) Long cargoId) {

        model.addAttribute("cargos", cargoRepo.findAll());
        model.addAttribute("convocatorias",cargoId==null? convoRepo.findAll() : convoRepo.findByCargoId(cargoId));
        return "cargo";
    }

    @RequestMapping("/cargo")
    public String formCargo(Model model) {
        model.addAttribute("cargo", new Cargo());
        return "cargo-form";
    }

    @PostMapping("/cargo")
    public String guardarCargo(@ModelAttribute Cargo cargo, BindingResult result) {
        if(result.hasErrors()); 
        cargoRepo.save(cargo);
        System.out.println(cargo.getNombre());
        return "redirect:/cargos";
    }
    @RequestMapping("/convocatoria")
    public String formConvocatoria(Model model) {
        model.addAttribute("cargos", cargoRepo.findAll());
        model.addAttribute("convocatoria", new ConvocatoriaCargo());
        return "convocatoria-form";
    }

    @PostMapping("/convocatoria")
    public String guardarConvocatoria(@ModelAttribute ConvocatoriaCargo convocatoria, BindingResult result) {
        if(result.hasErrors()); 
        convoRepo.save(convocatoria);
        System.out.println(convocatoria.getFechaInicio());
        return "redirect:/cargos";
    }
}
