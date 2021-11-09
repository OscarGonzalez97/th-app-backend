package com.roshka.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Locale;


import javax.validation.ConstraintViolationException;

import com.roshka.DTO.PostulanteListaDTO;
import com.roshka.modelo.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.roshka.modelo.Disponibilidad;
import com.roshka.modelo.EstadoCivil;
import com.roshka.modelo.Nacionalidad;
import com.roshka.modelo.Postulante;
import com.roshka.modelo.TipoExperiencia;
import com.roshka.repositorio.*;
import com.roshka.repositorio.CiudadRepository;
import com.roshka.repositorio.DepartamentoRepository;
import com.roshka.repositorio.ExperienciaRepository;
import com.roshka.repositorio.InstitucionRepository;
import com.roshka.repositorio.PostulanteRepository;
import com.roshka.repositorio.TecnologiaRepository;
import com.roshka.utils.Helper;


import org.hibernate.jpa.TypedParameterValue;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;



@Controller
public class PostulanteController {
    PostulanteRepository post;
    TecnologiaRepository tecRepo;
    ExperienciaRepository expRepo;
    InstitucionRepository institucionRepository;
    DepartamentoRepository depRepo;
    CiudadRepository ciuRepo;

    @Autowired
    public PostulanteController(
            PostulanteRepository post, TecnologiaRepository tecRepo, ExperienciaRepository expRepo,
            InstitucionRepository institucionRepository, DepartamentoRepository depRepo,
            CiudadRepository ciuRepo) {
        this.post = post;
        this.tecRepo = tecRepo;
        this.expRepo = expRepo;
        this.institucionRepository = institucionRepository;
        this.depRepo = depRepo;
        this.ciuRepo = ciuRepo;
    }

    @RequestMapping("home")
    public String index() {
      

      return "index";
    }

    @RequestMapping("/postulantes")
    public String postulantes(Model model,
                            @RequestParam(required = false)Long tecId,
                            @RequestParam(required = false)String nombre,
                            @RequestParam(required = false)Disponibilidad dispo,
                            @RequestParam(required = false)Long lvlEng,
                            @RequestParam(required = false)Long lvlTec,
                            @RequestParam(required = false)Long instId,
                            @RequestParam(required = false)Long expInMonths
                            ) {
        model.addAttribute("tecnologias", tecRepo.findAll());
        model.addAttribute("disponibilidades", Disponibilidad.values());
        model.addAttribute("institucionesEducativas", institucionRepository.findAll());
        List<Postulante> postulantes = post.postulantesMultiFiltro(nombre == null || nombre.trim().isEmpty() ? new TypedParameterValue(StringType.INSTANCE,null) : new TypedParameterValue(StringType.INSTANCE,"%"+nombre+"%"), dispo, lvlEng, lvlTec, tecId, instId);
        List<PostulanteListaDTO> postulantesDTO = new ArrayList<>();
        
        for (Postulante postulante : postulantes) {
            long expTotal = 0;
            //Sumamos el tiempo de experiencia total en meses de cada postulante
            //expTotal = postulante.getExperiencias().stream().mapToLong(e -> Helper.getMonthsDifference(e.getFechaDesde(), e.getFechaHasta())).sum();
            for (Experiencia experiencia : postulante.getExperiencias()) {
                expTotal +=  Helper.getMonthsDifference(experiencia.getFechaDesde(), experiencia.getFechaHasta());
            }
            if(expInMonths != null && expInMonths > expTotal) continue;
            postulantesDTO.add(new PostulanteListaDTO(postulante.getId(), postulante.getNombre(), postulante.getApellido(), postulante.getDisponibilidad(), postulante.getNivelIngles(), expTotal, postulante.getTecnologias()));
        }
        
        model.addAttribute("postulantes", postulantesDTO);
        return "postulantes";
    }

    @RequestMapping("/postulante")
    public String getFormPostulante(Model model){
        model.addAttribute("tecnologias", tecRepo.findAll());
        model.addAttribute("disponibilidades", Disponibilidad.values());
        model.addAttribute("tiposDeEstudio", TipoDeEstudio.values());
        model.addAttribute("estadosEstudio", EstadoEstudio.values());
        model.addAttribute("estadosCiviles", EstadoCivil.values());
        model.addAttribute("nacionalidades", Nacionalidad.values());
        model.addAttribute("tiposExperencia", TipoExperiencia.values());
        try {
            model.addAttribute("ciudades", new ObjectMapper().writeValueAsString(ciuRepo.findAll()));
        } catch (JsonProcessingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        model.addAttribute("departamentos", depRepo.findAll());

        return "postulante-form";
    }

    @PostMapping(value = "/postulante",consumes = "application/json")
    public String guardarPostulante(@RequestBody Postulante postulante){
        postulante.getTecnologias().stream().filter(
                    tec -> tec.getTecnologia().getId() != 0 
            ).forEach(
                    tec -> tec.setTecnologia(tecRepo.getById(tec.getTecnologia().getId()))
                    );
        for(Estudio estudio: postulante.getEstudios()){
            String nombreIns = "";
            nombreIns = estudio.getInstitucion().getNombre().toLowerCase();
            Institucion institucion = institucionRepository.findByNombre(nombreIns);
            if(institucion==null){
                institucionRepository.save(estudio.getInstitucion());
            }else{
                estudio.setInstitucion(institucion);
            }
        }
        post.save(postulante);
        return "redirect:/postulacion-correcta";
    }

    @GetMapping("/postulacion-correcta")
    public String successPostulation(Model model){
        model.addAttribute("mensaje1", "Tu informacion se ha recibido correctamente!");
        model.addAttribute("mensaje2", " espera por que nos pongamos en contacto!");
        return "exitoRegistro";
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler({MethodArgumentNotValidException.class})
    public ResponseEntity<String> handleValidationExceptions(
            MethodArgumentNotValidException ex) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(ex.getMessage());
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler({ConstraintViolationException.class})
    public ResponseEntity<String> handleValidationExceptions2(
            ConstraintViolationException ex) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(ex.getMessage());
    }
    


   @GetMapping({"/postulante/{postulanteId}"})
  	public String getPostulanteDetalle(Model model, @PathVariable("postulanteId") Long postulanteId) {
 		Postulante p = post.findById(postulanteId).orElse(null);
  		model.addAttribute("postulante",p);				
  		return "detallepostulante";
   
    }
   }
