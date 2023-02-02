package com.roshka.controller;

import com.roshka.modelo.Birthday;
import com.roshka.repositorio.BirthdayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Date;

@Controller
@RequestMapping("/cumples")
public class BirthdayController {

    BirthdayRepository birthdayRepository;


    @Autowired
    public BirthdayController(BirthdayRepository birthdayRepository){
        this.birthdayRepository = birthdayRepository;
    }

    @GetMapping(path = {"/agregar","/modificar/{id}"})
    public String addBirthdayView(Model model, @PathVariable(required = false) Long id) {


        if(id == null) model.addAttribute("cumple", new Birthday());
        else model.addAttribute("cumple", birthdayRepository.getById(id));
        return "birthday-form";
    }

    @RequestMapping()
    public String menuBirthdays(Model model, @RequestParam(required = false) String nombre, @RequestParam(defaultValue = "0")Integer nroPagina) {
        final Integer CANTIDAD_POR_PAGINA = 10;
        Pageable page = PageRequest.of(nroPagina,CANTIDAD_POR_PAGINA,Sort.by("id"));

        if(nombre == null || nombre.trim().isEmpty()) {
            Page<Birthday> birthdayPag=birthdayRepository.findAllBirthday(page);
            model.addAttribute("cumples", birthdayPag.getContent());
            model.addAttribute("pages", birthdayPag.getTotalPages());
        }
        else {
            Page<Birthday> birthdayPag=birthdayRepository.findByNombreCompletoContainingIgnoreCase(nombre.trim(),page);
            model.addAttribute("pages", birthdayPag.getTotalPages());
            model.addAttribute("cumples", birthdayPag.getContent());
        }
        return "birthdays";
    }

    @PostMapping(path = {"/agregar","/modificar/{id}"})
    public String addBirthday(@Valid @ModelAttribute Birthday birthday, BindingResult result, @PathVariable(required = false) Long id, Model model) {
        if(result.hasErrors() || (id==null && birthdayRepository.existsByNombreCompletoIgnoreCase(birthday.getNombreCompleto()))){
            model.addAttribute("mismoNombre", true);
            return "birthday-form";
        }
        if(id != null ) birthday.setId(id);
        birthdayRepository.save(birthday);
        return "redirect:/cumples";
    }
}