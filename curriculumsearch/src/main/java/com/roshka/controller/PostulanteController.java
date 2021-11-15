package com.roshka.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;


import javax.validation.ConstraintViolationException;

import com.roshka.DTO.PostulanteListaDTO;
import com.roshka.modelo.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.roshka.modelo.Disponibilidad;
import com.roshka.modelo.EstadoPostulante;
import com.roshka.modelo.EstadoCivil;
import com.roshka.modelo.Nacionalidad;
import com.roshka.modelo.Postulante;
import com.roshka.modelo.TipoExperiencia;
import com.roshka.repositorio.*;
import com.roshka.repositorio.CiudadRepository;
import com.roshka.repositorio.ConvocatoriaRepository;
import com.roshka.repositorio.DepartamentoRepository;
import com.roshka.repositorio.ExperienciaRepository;
import com.roshka.repositorio.InstitucionRepository;
import com.roshka.repositorio.PostulanteRepository;
import com.roshka.repositorio.TecnologiaRepository;
import com.roshka.utils.Helper;


import org.hibernate.jpa.TypedParameterValue;
import org.hibernate.type.StringType;
import org.hibernate.type.IntegerType;
import org.hibernate.type.LongType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
    EstudioRepository estudioRepository;
    PostulanteTecnologiaRepository postulanteTecnologiaRepository;
    ConvocatoriaRepository cargoRepo;
    CargoRepository carRepo;

    @Autowired
    public PostulanteController(
            PostulanteRepository post, TecnologiaRepository tecRepo, ExperienciaRepository expRepo,
            InstitucionRepository institucionRepository, DepartamentoRepository depRepo,
            CiudadRepository ciuRepo, EstudioRepository estudioRepository,
            PostulanteTecnologiaRepository postulanteTecnologiaRepository,
            ConvocatoriaRepository cargoRepo, CargoRepository carRepo) {
        this.post = post;
        this.tecRepo = tecRepo;
        this.expRepo = expRepo;
        this.institucionRepository = institucionRepository;
        this.depRepo = depRepo;
        this.ciuRepo = ciuRepo;
        this.estudioRepository = estudioRepository;
        this.postulanteTecnologiaRepository = postulanteTecnologiaRepository;
        this.cargoRepo =cargoRepo;
        this.carRepo=carRepo;
    }

    @RequestMapping("/postulantes")
    public String postulantes(Model model,
                            @RequestParam(required = false)Long tecId,
                            @RequestParam(required = false)String nombre,
                            @RequestParam(required = false)EstadoPostulante estado,
                            @RequestParam(required = false)Disponibilidad dispo,
                            @RequestParam(required = false)Long lvlEng,
                            @RequestParam(required = false)Long lvlTec,
                            @RequestParam(required = false)Long instId,
                            @RequestParam(required = false)Long expInMonths,
                            @RequestParam(required = false)Long cargoId,
                            @RequestParam(defaultValue = "0")Integer nroPagina
                            ) {
        final Integer CANTIDAD_POR_PAGINA = 5;
        Pageable page = PageRequest.of(nroPagina,CANTIDAD_POR_PAGINA,Sort.by("id"));
        model.addAttribute("tecnologias", tecRepo.findAll());
        model.addAttribute("disponibilidades", Disponibilidad.values());
        model.addAttribute("institucionesEducativas", institucionRepository.findAll());
        model.addAttribute("estadoP", EstadoPostulante.values());
        Page<Postulante> postulantesPag = post.postulantesMultiFiltro(nombre == null || nombre.trim().isEmpty() ? new TypedParameterValue(StringType.INSTANCE,null) : new TypedParameterValue(StringType.INSTANCE,"%"+nombre+"%"),dispo, lvlEng, lvlTec, tecId, instId,cargoId,page,estado);
        List<Postulante> postulantes = postulantesPag.getContent();
        List<PostulanteListaDTO> postulantesDTO = new ArrayList<>();
        
        for (Postulante postulante : postulantes) {
            long expTotal = 0;
            //Sumamos el tiempo de experiencia total en meses de cada postulante
            //expTotal = postulante.getExperiencias().stream().mapToLong(e -> Helper.getMonthsDifference(e.getFechaDesde(), e.getFechaHasta())).sum();
            for (Experiencia experiencia : postulante.getExperiencias()) {
                expTotal +=  Helper.getMonthsDifference(experiencia.getFechaDesde(), experiencia.getFechaHasta());
            }
            if(expInMonths != null && expInMonths > expTotal) continue;
            postulantesDTO.add(new PostulanteListaDTO(postulante.getId(), postulante.getNombre(), postulante.getApellido(), postulante.getDisponibilidad(), postulante.getNivelIngles(), expTotal, postulante.getTecnologias(),postulante.getEstadoPostulante()));
        }
        
        model.addAttribute("pages", postulantesPag.getTotalPages());
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
        model.addAttribute("CargosDisponibles", cargoRepo.f1ndByCargoAndEstado(new TypedParameterValue(LongType.INSTANCE, null), new Date(), new TypedParameterValue(IntegerType.INSTANCE, 1)));
        try {
            model.addAttribute("ciudades", new ObjectMapper().writeValueAsString(ciuRepo.findAll()));
        } catch (JsonProcessingException er) {
            // TODO Auto-generated catch block
            er.printStackTrace();
        }
        model.addAttribute("departamentos", depRepo.findAll());
        
        return "postulante-form";
    }
    
    @PostMapping(value = "/postulante",consumes = "application/json")
    public String guardarPostulante(@RequestBody Postulante postulante){
        //Codigo encargado de modificar postulacion si se envia mismo CI
        Postulante postulantex = post.findByNroDocument(postulante.getnroDocument());
        if(postulantex != null){
            estudioRepository.findByPostulante(postulantex).forEach(x -> estudioRepository.delete(x));
            expRepo.findByPostulante(postulantex).forEach(x -> expRepo.delete(x));
            postulanteTecnologiaRepository.findByPostulante(postulantex).forEach(x -> postulanteTecnologiaRepository.delete(x));
            postulante.setId(postulantex.getId());
        }
        postulante.getTecnologias().stream().filter(
            tec -> tec.getTecnologia().getId() != 0 
            ).forEach(
                tec -> tec.setTecnologia(tecRepo.getById(tec.getTecnologia().getId()))
                );
                /* for (int i = 0; i < postulante.getPostulaciones().size(); i++) {
                    postulante.getPostulaciones().set(i, cargoRepo.getById(postulante.getPostulaciones().get(i).getId()));
                }
                */
                
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
        model.addAttribute("estadoP", EstadoPostulante.values());				
        return "detallepostulante";
        
    }
    @PostMapping({"/postulante/{postulanteId}"})
    public String setPostulanteEstado(@ModelAttribute Postulante postulante, BindingResult result, @PathVariable("postulanteId") Long postulanteId) {
        //post.setPostulanteEstadoAndComentario(postulante.getEstadoPostulante(),postulante.getComentarioRRHH(), postulante.getId());
        Postulante postulanteVd = post.getById(postulanteId);
        postulanteVd.setEstadoPostulante(postulante.getEstadoPostulante());
        postulanteVd.setComentarioRRHH(postulante.getComentarioRRHH());
        post.setPostulanteEstadoAndComentario(postulante.getEstadoPostulante(), postulante.getComentarioRRHH(), postulanteId); 
        //post.save(postulanteVd);
        return "redirect:/postulante/"+postulanteId;
    }
}
            