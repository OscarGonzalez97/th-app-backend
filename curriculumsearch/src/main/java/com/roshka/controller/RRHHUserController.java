package com.roshka.controller;

import com.roshka.modelo.RRHHUser;
import com.roshka.repositorio.RRHHUserRepository;
import com.roshka.service.EmailAsyncService;
import com.roshka.service.RRHHUserService;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

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

    @Autowired
    private RRHHUserService userService;

    @Autowired
    private EmailAsyncService emailAsyncService;

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm(HttpServletRequest request, Model model) {
        model.addAttribute("error", request.getParameter("error"));
//        if(request.getParameter("error")!=null){
//
//        }
        return "forgot_password_form";
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(HttpServletRequest request, Model model) {
        String email = request.getParameter("email");
        String token = RandomString.make(30);

        try {
            userService.updateResetPasswordToken(token, email);
        }catch (UsernameNotFoundException e){
            model.addAttribute("error", "Error al enviar el mail. Checkee sus credenciales " +
                    "y intentelo de nuevo.");
            return "forgot_password_form";
        }
        String resetPasswordLink = Utility.getSiteURL(request) + "/reset-password?token=" + token;
        ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
        emailExecutor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    emailAsyncService.sendEmail(email, resetPasswordLink);
                } catch (IOException | MessagingException e) {
                    e.printStackTrace();
                }
            }
        });
        emailExecutor.shutdown();

        return "forgot_password_form";
    }



    @GetMapping("/reset-password")
    public String showResetPasswordForm(@Param(value = "token") String token, Model model) {
        RRHHUser user = userService.getByResetPasswordToken(token);
        model.addAttribute("token", token);

        if (user == null) {
            model.addAttribute("error", "Invalid Token");
            return "error";
        }

        return "reset_password_form";
    }

    @PostMapping("/reset-password")
    public String processResetPassword(HttpServletRequest request, Model model) {
        String token = request.getParameter("token");
        String password = request.getParameter("password");

        RRHHUser user = userService.getByResetPasswordToken(token);
        model.addAttribute("title", "Reset your password");

        if (user == null) {
            model.addAttribute("error", "Invalid Token");
            return "message";
        } else {
            userService.updatePassword(user, password);

            model.addAttribute("success", "You have successfully changed your password.");
        }

        return "redirect:/";
    }

    @ResponseStatus(HttpStatus.PERMANENT_REDIRECT)
    @ExceptionHandler({UsernameNotFoundException.class})
    public RedirectView handleValidationExceptions(
            RedirectAttributes redir, UsernameNotFoundException ex) {
        RedirectView redirectView = new RedirectView("/forgot-password", true);
        redir.addAttribute("error", "Error al enviar el mail. Checkee sus credenciales" +
                " y intentelo de nuevo");
        return redirectView;
    }
}

class Utility {
    public static String getSiteURL(HttpServletRequest request) {
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), "");
    }
}