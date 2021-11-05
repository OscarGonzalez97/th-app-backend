package com.roshka.controller;

import com.roshka.modelo.Tecnologia;
import com.roshka.repositorio.TecnologiaRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TecnologiaController {
 
    TecnologiaRepository tecRepo;


@Autowired 
public TecnologiaController(TecnologiaRepository tecRepo){
   this.tecRepo = tecRepo;

}

@GetMapping("/tecnologia")
public String addtecnologiaView(Model model) {
    model.addAttribute("tecnologia", new Tecnologia());
    return "tecnologia-form";
}
@PostMapping("/tecnologia")
    public String addtecnologia(@ModelAttribute("tecnologia") Tecnologia tecnologia) {
      tecRepo.save(tecnologia);
        
        return "redirect:/";
    } 




}
