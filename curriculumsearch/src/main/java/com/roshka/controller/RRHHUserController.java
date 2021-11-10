package com.roshka.controller;

import com.roshka.modelo.RRHHUser;
import com.roshka.repositorio.RRHHUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RRHHUserController {
    private static final long REGISTER_CODE = 1234;
    RRHHUserRepository rrhhUserRepository;

    @Autowired
    public RRHHUserController(RRHHUserRepository rrhhUserRepository){
        this.rrhhUserRepository = rrhhUserRepository;
    }

    @GetMapping("/")
    public String redirectOnHome(){
        return "redirect:/home";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new RRHHUser());

        return "registration";
    }

    @GetMapping("/login")
    public String getLogin(Model model, HttpServletRequest request) {
        if(request.getParameter("error")!=null){
            model.addAttribute("error", "Credenciales Incorrectas");
        }
        return "login";
    }

    @PostMapping("/process_register")
    public String processRegister(HttpServletRequest request, RRHHUser user) {
        if(Long.parseLong(request.getParameter("registrationCode")) != REGISTER_CODE){
            return "redirect:/register";
        }
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);

        rrhhUserRepository.save(user);

        return "register_success";
    }
}
