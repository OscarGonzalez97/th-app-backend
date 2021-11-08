package com.roshka.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.roshka.modelo.ConvocatoriaCargo;
import com.roshka.repositorio.CargoRepository;
import com.roshka.repositorio.ConvocatoriaRepository;

import org.hibernate.jpa.TypedParameterValue;
import org.hibernate.type.IntegerType;
import org.hibernate.type.LongType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ConvocatoriaController {

    CargoRepository cargoRepo;
    ConvocatoriaRepository convoRepo;

    @Autowired
    public ConvocatoriaController(CargoRepository cargoRepo, ConvocatoriaRepository convoRepo) {
        this.cargoRepo = cargoRepo;
        this.convoRepo = convoRepo;
    }

    @RequestMapping("/convocatorias")
    public String menuConvocatorias(Model model,
                            @RequestParam(required = false) Long cargoId,
                            @RequestParam(required = false) Integer isOpen//1: true, 0: false
                            ) {

        model.addAttribute("cargos", cargoRepo.findAll());
        
        model.addAttribute("convocatorias", convoRepo.f1ndByCargoAndEstado(new TypedParameterValue(LongType.INSTANCE, cargoId), new Date(), new TypedParameterValue(IntegerType.INSTANCE, isOpen)));
        //model.addAttribute("convocatorias",cargoId==null? convoRepo.findAll() : convoRepo.findByCargoId(cargoId));
        return "convocatorias";
    }


    @RequestMapping(path = {"/convocatoria","/convocatoria/{id}"})
    public String formConvocatoria(Model model,@PathVariable(required = false) Long id) {
        model.addAttribute("cargos", cargoRepo.findAll());
        if(id == null) model.addAttribute("convocatoria", new ConvocatoriaCargo());
        else {
            ConvocatoriaCargo cc = convoRepo.getById(id);
            cc.setFechaFinS(new SimpleDateFormat("yyyy-MM-dd").format((cc.getFechaFin())));
            cc.setFechaInicioS(new SimpleDateFormat("yyyy-MM-dd").format((cc.getFechaInicio())));
            
            model.addAttribute("convocatoria", cc);
        }
        
        return "convocatoria-form";
    }

    @PostMapping(path = {"/convocatoria","/convocatoria/{id}"})
    public String guardarConvocatoria(@ModelAttribute ConvocatoriaCargo convocatoria, BindingResult result, @PathVariable(required = false) Long id) {
        if(result.hasErrors()); 
        if(id != null) convocatoria.setId(id);
        convoRepo.save(convocatoria);
        System.out.println(convocatoria.getFechaInicio());
        return "redirect:/convocatorias";
    }
}
