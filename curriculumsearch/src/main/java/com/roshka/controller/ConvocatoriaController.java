package com.roshka.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.roshka.modelo.Cargo;
import com.roshka.modelo.ConvocatoriaCargo;
import com.roshka.modelo.EstadoConvocatoria;
import com.roshka.modelo.EstadoConvocatoriaConverter;
import com.roshka.repositorio.CargoRepository;
import com.roshka.repositorio.ConvocatoriaRepository;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.dom4j.Branch;
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
    @RequestMapping("/convocatoria")
    public String formConvocatoria(Model model) {
        model.addAttribute("cargos", cargoRepo.findAll());
        model.addAttribute("convocatoria", new ConvocatoriaCargo());
        return "convocatoria-form";
    }

    @PostMapping("/convocatoria")
    public String guardarConvocatoria(@ModelAttribute ConvocatoriaCargo convocatoria, BindingResult result) {
        if(result.hasErrors()); 
        convocatoria.setFechaInicio(new Date());
        convocatoria.setEstado(EstadoConvocatoria.abierto);
        convoRepo.save(convocatoria);
        System.out.println(convocatoria.getFechaInicio());
        return "redirect:/convocatorias";
    }


   /* @RequestMapping("/convocatoria/{id}")
    public String formConvocatoria(Model model,@PathVariable(required = false) Long id) {
        model.addAttribute("cargos", cargoRepo.findAll());
        if(id == null){
             model.addAttribute("convocatoria", new ConvocatoriaCargo());
             model.addAttribute("listaConvocatoria", convoRepo.findAll());
        }
        else {
            ConvocatoriaCargo cc = convoRepo.getById(id);
            cc.setFechaFinS(new SimpleDateFormat("yyyy-MM-dd").format((cc.getFechaFin())));
            cc.setFechaInicioS(new SimpleDateFormat("yyyy-MM-dd").format((cc.getFechaInicio())));
            
            model.addAttribute("convocatoria", cc);
            model.addAttribute("listaConvocatoria", convoRepo.findAll());
        }
        
        return "convocatoria-form";
    }*/

    @RequestMapping("/convocatoria/{id}")
    public String guardarConvocatoria(@ModelAttribute ConvocatoriaCargo convocatoria, BindingResult result, @PathVariable(required = false) Long id,Model model) {
        if(result.hasErrors()); 
        if(id != null) convocatoria.setId(id);
        convocatoria=convoRepo.findByIdConvocatoriaCargo(id);
        convocatoria.setEstado(EstadoConvocatoria.cerrado);
        convocatoria.setFechaFin(new Date());
        convoRepo.save(convocatoria);
        /*if(id != null) convocatoria.setId(id);
        //System.out.println(convoRepo.filtrarConvocatoriasPorCargo(convocatoria.getCargoId()));
        for(ConvocatoriaCargo c: convoRepo.filtrarConvocatoriasPorCargo(convocatoria.getCargoId())){
            
           
            if(result.hasErrors() || c.getCargoId()==convocatoria.getCargoId() &&   c.getFechaFin().after(convocatoria.getFechaInicio()) )
            {           
                
                model.addAttribute("existeFecha", true);
                System.out.println("no debe");
                return "convocatoria-form";
                             
            }
            else{
                convoRepo.save(convocatoria);
                System.out.println("si anda");
                break;

            }
        }*/

        
        return "redirect:/convocatorias";
    }
}
