package com.roshka.controller;

import com.roshka.modelo.ConvocatoriaCargo;
import com.roshka.modelo.EstadoConvocatoria;
import com.roshka.repositorio.CargoRepository;
import com.roshka.repositorio.ConvocatoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

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
    public String menuConvocatorias(Model model,RedirectAttributes redirectAttrs,
                            @RequestParam(required = false) Long cargoId,
                            @RequestParam(required = false) EstadoConvocatoria estado,//1: true, 0: false
                            @RequestParam(defaultValue = "0")Integer nroPagina
                            ) {

        final Integer CANTIDAD_POR_PAGINA = 10;
        Pageable page = PageRequest.of(nroPagina,CANTIDAD_POR_PAGINA,Sort.by("id"));
        model.addAttribute("cargos", cargoRepo.findAll());
        Page<ConvocatoriaCargo> convoPag=convoRepo.findByCargoAndEstado(cargoId,estado,page);
        model.addAttribute("convocatorias", convoPag.getContent());
        model.addAttribute("pages", convoPag.getTotalPages());
        model.addAttribute("estados", EstadoConvocatoria.values());
        
        //model.addAttribute("convocatorias",cargoId==null? convoRepo.findAll() : convoRepo.findByCargoId(cargoId));
        return "convocatorias";
    }
    
    @RequestMapping("/convocatoria/crear/{id}")
    public String guardarConvocatoriaa(@PathVariable(required = false) Long id,RedirectAttributes redirectAttributes) {
        for (ConvocatoriaCargo conv:convoRepo.findByCargoId(id)) {
            if(conv.getEstado()==EstadoConvocatoria.abierto){
                redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", "Ya existe una convocatoria Abierta con ese cargo");
                return "redirect:/convocatorias";
           }
        }
        ConvocatoriaCargo convocatoria=new ConvocatoriaCargo();  
        convocatoria.setCargo(cargoRepo.findByIdCargo(id));
        convocatoria.setCargoId(cargoRepo.findByIdCargo(id).getId());
        convocatoria.setFechaInicio(new Date());
        convocatoria.setEstado(EstadoConvocatoria.abierto);
        convocatoria.getCargo().setExisteConvocatoria(true);
        convoRepo.save(convocatoria);
        
        
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
        if(id != null) convocatoria.setId(id);
        convocatoria=convoRepo.findByIdConvocatoriaCargo(id);
        convocatoria.setEstado(EstadoConvocatoria.cerrado);
        convocatoria.setFechaFin(new Date());
        convocatoria.getCargo().setExisteConvocatoria(false);
        convoRepo.save(convocatoria);
        

        
        return "redirect:/convocatorias";
    }
}
