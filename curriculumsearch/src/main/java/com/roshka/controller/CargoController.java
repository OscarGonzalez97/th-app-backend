package com.roshka.controller;


import com.roshka.modelo.Cargo;
import com.roshka.repositorio.CargoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CargoController {

    CargoRepository cargoRepo;

    @Autowired
    public CargoController(CargoRepository cargoRepo) {
        this.cargoRepo = cargoRepo;
    }

    @RequestMapping("/cargos")
    public String menuCargos(Model model,
                            @RequestParam(required = false) String nombre
                            ) {
        if(nombre == null || nombre.trim().isEmpty()) model.addAttribute("cargos", cargoRepo.findAll());
        else model.addAttribute("cargos", cargoRepo.findByNombreContainingIgnoreCase(nombre));
        return "cargos";
    }

    @RequestMapping(path = {"/cargo","/cargo/{id}"}, method = RequestMethod.GET)
    public String formCargo(Model model,@PathVariable(required = false) Long id) {

        if(id == null) model.addAttribute("cargo", new Cargo());
        else model.addAttribute("cargo", cargoRepo.getById(id));
        return "cargo-form";
    }

    @PostMapping(path = {"/cargo","/cargo/{id}"})
    public String guardarCargo(@ModelAttribute Cargo cargo, BindingResult result, @PathVariable(required = false) Long id) {
        if(result.hasErrors()); 
        if(id != null ) cargo.setId(id);
        cargoRepo.save(cargo);
        System.out.println(cargo.getNombre());
        return "redirect:/cargos";
    }

}
