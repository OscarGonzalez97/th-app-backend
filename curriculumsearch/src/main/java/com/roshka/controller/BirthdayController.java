package com.roshka.controller;

import com.roshka.modelo.Birthday;
import com.roshka.repositorio.BirthdayRepository;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    public String addBirthday(@RequestPart(name = "file") MultipartFile file,
                              @RequestPart(name = "nombreCompleto") String nombreCompleto,
                              @RequestPart(name = "idSlack") String idSlack,
                              @RequestPart(name = "fecha") String fecha,
                              @PathVariable(required = false) Long id,
                              Model model) {
        if((id==null && birthdayRepository.existsByNombreCompletoIgnoreCase(nombreCompleto))){
            model.addAttribute("mismoNombre", true);
            return "birthday-form";
        }
        Birthday birthday = new Birthday();
        if (id != null) {
            birthday = birthdayRepository.getById(id);
        }
        birthday.setNombreCompleto(nombreCompleto);
        birthday.setIdSlack(idSlack);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = formatter.parse(fecha);
            birthday.setFecha(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        if(!file.isEmpty()) {
            Path directorioImagenes= Paths.get("images/"+ DigestUtils.md5Hex(file.getOriginalFilename()) + ".jpg");
            String rutaAbsoluta = directorioImagenes.toFile().getAbsolutePath();
            try {
                byte[] bytesImg=file.getBytes();
                Path rutaCompleta=Paths.get(rutaAbsoluta);
                Files.write(rutaCompleta, bytesImg);
                // si todo salio bien guardamos la foto en la base de datos
                birthday.setFoto("http://localhost:8080/images/"+ DigestUtils.md5Hex(file.getOriginalFilename()) + ".jpg");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        if(id != null ) birthday.setId(id);
        birthdayRepository.save(birthday);
        return "redirect:/cumples";
    }
}