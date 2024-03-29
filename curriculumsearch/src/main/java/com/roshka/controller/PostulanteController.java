package com.roshka.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.roshka.modelo.*;
import com.roshka.repositorio.*;
import com.roshka.utils.Helper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.validation.ConstraintViolationException;

@Controller
@RequestMapping("/work-with-us")
public class PostulanteController {
    PostulanteRepository post;
    TecnologiaRepository tecRepo;
    ExperienciaRepository expRepo;
    InstitucionRepository institucionRepository;
    DepartamentoRepository depRepo;
    CiudadRepository ciuRepo;
    EstudioRepository estudioRepository;
    PostulanteTecnologiaRepository postulanteTecnologiaRepository;
    ConvocatoriaRepository convoRepo;
    CargoRepository carRepo;

    @Autowired
    public PostulanteController(
            PostulanteRepository post, TecnologiaRepository tecRepo, ExperienciaRepository expRepo,
            InstitucionRepository institucionRepository, DepartamentoRepository depRepo,
            CiudadRepository ciuRepo, EstudioRepository estudioRepository,
            PostulanteTecnologiaRepository postulanteTecnologiaRepository,
            ConvocatoriaRepository convoRepo, CargoRepository carRepo) {
        this.post = post;
        this.tecRepo = tecRepo;
        this.expRepo = expRepo;
        this.institucionRepository = institucionRepository;
        this.depRepo = depRepo;
        this.ciuRepo = ciuRepo;
        this.estudioRepository = estudioRepository;
        this.postulanteTecnologiaRepository = postulanteTecnologiaRepository;
        this.convoRepo =convoRepo;
        this.carRepo=carRepo;
    }

    
    @RequestMapping(method = RequestMethod.GET)
    public String getFormPostulante(Model model){
        model.addAttribute("tecnologias", tecRepo.findAll());
        model.addAttribute("tiposDeEstudio", TipoDeEstudio.values());
        model.addAttribute("estadosEstudio", EstadoEstudio.values());
        model.addAttribute("estadosCiviles", EstadoCivil.values());
        model.addAttribute("nacionalidades", Nacionalidad.values());
        model.addAttribute("tiposExperencia", TipoExperiencia.values());
        model.addAttribute("CargosDisponibles", 
                convoRepo.findByCargoAndEstado(null, EstadoConvocatoria.abierto, PageRequest.of(0,Integer.MAX_VALUE,Sort.by("id"))).getContent());
        try {
            model.addAttribute("ciudades", new ObjectMapper().writeValueAsString(ciuRepo.findAll()));
        } catch (JsonProcessingException er) {
            // TODO Auto-generated catch block
            er.printStackTrace();
        }
        model.addAttribute("departamentos", depRepo.findAll());
        
        return "postulante-form";
    }

    
    @PostMapping(consumes = "multipart/form-data")
    public RedirectView guardarPostulante(@RequestPart(name = "file",required = false) MultipartFile file,@RequestPart("postulante") Postulante postulante, RedirectAttributes redirectAttributes){
        //Codigo encargado de modificar postulacion si se envia mismo CI
        //Codigo encargado de modificar postulacion si se envia mismo CI
        RedirectView redirectView = new RedirectView("/work-with-us/postulacion-correcta",true);
        Postulante postulantex = post.findByNroDocument(postulante.getNroDocument());
        if(postulantex != null){
            postulante.setEstadoPostulante(postulantex.getEstadoPostulante());
            postulante.setComentarioRRHH(postulantex.getComentarioRRHH()); 
            estudioRepository.findByPostulante(postulantex).forEach(x -> estudioRepository.delete(x));
            expRepo.findByPostulante(postulantex).forEach(x -> expRepo.delete(x));
            postulanteTecnologiaRepository.findByPostulante(postulantex).forEach(x -> postulanteTecnologiaRepository.delete(x));
            postulante.setId(postulantex.getId());
            postulante.setFechaCreacion((postulantex.getFechaCreacion())); 
            //postulante.setMesesDeExperiencia(postulantex.getMesesDeExperiencia());
            ArrayList<ConvocatoriaCargo> postulaciones = new ArrayList<>();
            Set<Long> indices = new HashSet<>();
            for (ConvocatoriaCargo convocatoriaCargo : postulante.getPostulaciones()) {
                indices.add(convocatoriaCargo.getId());
                postulaciones.add(convocatoriaCargo);
            }
            for (ConvocatoriaCargo convocatoriaCargo : postulantex.getPostulaciones()) {
                if(indices.contains(convocatoriaCargo.getId())) continue;
                postulaciones.add(convocatoriaCargo);
            }
            postulante.setPostulaciones(postulaciones);
            
        }
        if(file!=null){
            DBFile cv = Helper.createFile(file);
            if(cv!=null) cv.setPostulante(postulante);
            postulante.setCvFile(cv);
        }        
        for(Estudio estudio: postulante.getEstudios()){
            String nombreIns = estudio.getInstitucion().getNombre();
            
            Institucion institucion = institucionRepository.findByNombreIgnoreCase(nombreIns);
            if(institucion==null){
                institucionRepository.save(estudio.getInstitucion());
            }else{
                estudio.setInstitucion(institucion);
            }
        }
        if(postulante.getPostulaciones().isEmpty() || postulante.getTecnologias().isEmpty()){
            redirectView.setUrl("/postulante");
            redirectAttributes.addFlashAttribute("error", "Datos invalidos");
            return redirectView;
        }
        post.save(postulante);
        return redirectView;
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



    
}
            