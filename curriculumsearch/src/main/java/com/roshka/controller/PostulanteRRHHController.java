package com.roshka.controller;


import java.util.ArrayList;

import java.util.List;




import com.roshka.DTO.PostulanteListaDTO;
import com.roshka.modelo.*;
import com.roshka.modelo.Disponibilidad;
import com.roshka.modelo.EstadoPostulante;
import com.roshka.modelo.Postulante;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;



@Controller
public class PostulanteRRHHController {
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
    DBFileRepository fileRepo;

    @Autowired
    public PostulanteRRHHController(
            PostulanteRepository post, TecnologiaRepository tecRepo, ExperienciaRepository expRepo,
            InstitucionRepository institucionRepository, DepartamentoRepository depRepo,
            CiudadRepository ciuRepo, EstudioRepository estudioRepository,
            PostulanteTecnologiaRepository postulanteTecnologiaRepository,
            ConvocatoriaRepository cargoRepo, CargoRepository carRepo, DBFileRepository fileRepo) {
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
        this.fileRepo = fileRepo;
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
                            @RequestParam(required = false)Long convId, 
                            @RequestParam(defaultValue = "0")Integer nroPagina
                            ) {
        final Integer CANTIDAD_POR_PAGINA = 10;
        Pageable page = PageRequest.of(nroPagina,CANTIDAD_POR_PAGINA,Sort.by("id"));
        model.addAttribute("tecnologias", tecRepo.findAll());
        model.addAttribute("disponibilidades", Disponibilidad.values());
        model.addAttribute("institucionesEducativas", institucionRepository.findAll());
        model.addAttribute("estadoP", EstadoPostulante.values());
        model.addAttribute("convocatoriaC", cargoRepo.findAll());
        Page<Postulante> postulantesPag = post.postulantesMultiFiltro(
                nombre == null || nombre.trim().isEmpty() ?
                        new TypedParameterValue(StringType.INSTANCE,null) :
                        new TypedParameterValue(StringType.INSTANCE,"%"+nombre+"%"),
                            dispo, lvlEng, lvlTec, tecId, instId,cargoId,page,estado,convId);
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
            postulantesDTO.add(new PostulanteListaDTO(postulante.getId(), postulante.getNombre(), postulante.getApellido(), postulante.getDisponibilidad(), postulante.getNivelIngles(), expTotal, postulante.getTecnologias(),postulante.getEstadoPostulante(),postulante.getPostulaciones()));
        }
        
        model.addAttribute("pages", postulantesPag.getTotalPages());
        model.addAttribute("postulantes", postulantesDTO);
        return "postulantes";
    }
    
 

    @GetMapping({"/postulantes/{postulanteId}"})
    public String getPostulanteDetalle(Model model, @PathVariable("postulanteId") Long postulanteId) {
        Postulante p = post.findById(postulanteId).orElse(null);
        model.addAttribute("postulante",p);
        model.addAttribute("cvId", fileRepo.getIdByPostulante(p));
        model.addAttribute("estadoP", EstadoPostulante.values());				
        return "detallepostulante";
        
    }

//    @GetMapping({"/pdfPostulante/{postulanteId}"})
//    public String getPostulantePdf(Model model, @PathVariable("postulanteId") Long postulanteId) {
//        Postulante p = post.findById(postulanteId).orElse(null);
//        model.addAttribute("postulante",p);
//        model.addAttribute("cvId", fileRepo.getIdByPostulante(p));
//        model.addAttribute("estadoP", EstadoPostulante.values());
//        return "detallepostulante2";
//
//    }

    @PostMapping({"/postulantes/{postulanteId}"})
    public String setPostulanteEstado(@ModelAttribute Postulante postulante, BindingResult result, @PathVariable("postulanteId") Long postulanteId) {
        //post.setPostulanteEstadoAndComentario(postulante.getEstadoPostulante(),postulante.getComentarioRRHH(), postulante.getId());
        Postulante postulanteVd = post.getById(postulanteId);
        postulanteVd.setEstadoPostulante(postulante.getEstadoPostulante());
        postulanteVd.setComentarioRRHH(postulante.getComentarioRRHH());
        post.setPostulanteEstadoAndComentario(postulante.getEstadoPostulante(), postulante.getComentarioRRHH(), postulanteId);
        //post.save(postulanteVd);
        return "redirect:/postulantes/"+postulanteId;
    }

    @GetMapping("/postulantes/cvFile/{fileId}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileId) {
        // Load file from database
        DBFile dbFile;
        try {
            dbFile = fileRepo.findById(fileId)
            .orElseThrow(() -> new Exception("File not found with id " + fileId));
            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(dbFile.getFileType()))
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + dbFile.getFileName() + "\"")
                    .body(new ByteArrayResource(dbFile.getData()));
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }

    }
}
            