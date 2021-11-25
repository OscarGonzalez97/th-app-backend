package com.roshka.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.roshka.DTO.ConvocatoriaDTO;
import com.roshka.DTO.PostulanteListaDTO;
import com.roshka.modelo.DBFile;
import com.roshka.modelo.EstadoPostulante;
import com.roshka.modelo.Postulante;
import com.roshka.modelo.TipoDeEstudio;
import com.roshka.repositorio.*;
import com.roshka.service.PdfGenerator;
import com.roshka.utils.PostulantesExcelExporter;
import org.hibernate.jpa.TypedParameterValue;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;


@Controller
@RequestMapping("/postulantes")
public class PostulanteRRHHController {
    PostulanteRepository post;
    TecnologiaRepository tecRepo;
    ExperienciaRepository expRepo;
    InstitucionRepository institucionRepository;
    DepartamentoRepository depRepo;
    CiudadRepository ciuRepo;
    EstudioRepository estudioRepository;
    PostulanteTecnologiaRepository postulanteTecnologiaRepository;
    ConvocatoriaRepository convRepo;
    CargoRepository carRepo;
    DBFileRepository fileRepo;

    @Autowired
    public PostulanteRRHHController(
            PostulanteRepository post, TecnologiaRepository tecRepo, ExperienciaRepository expRepo,
            InstitucionRepository institucionRepository, DepartamentoRepository depRepo,
            CiudadRepository ciuRepo, EstudioRepository estudioRepository,
            PostulanteTecnologiaRepository postulanteTecnologiaRepository,
            ConvocatoriaRepository convRepo, CargoRepository carRepo, DBFileRepository fileRepo) {
        this.post = post;
        this.tecRepo = tecRepo;
        this.expRepo = expRepo;
        this.institucionRepository = institucionRepository;
        this.depRepo = depRepo;
        this.ciuRepo = ciuRepo;
        this.estudioRepository = estudioRepository;
        this.postulanteTecnologiaRepository = postulanteTecnologiaRepository;
        this.convRepo =convRepo;
        this.carRepo=carRepo;
        this.fileRepo = fileRepo;
    }

    @RequestMapping()
    public String postulantes(HttpServletRequest request, Model model,
                            @RequestParam(required = false)Long tecId,
                            @RequestParam(required = false)String nombre,
                            @RequestParam(required = false)EstadoPostulante estado,
                            @RequestParam(required = false)Long lvlEng,
                            @RequestParam(required = false)Long lvlTec,
                            @RequestParam(required = false)TipoDeEstudio tipoest,
                            @RequestParam(required = false)String expInMonths,
                            @RequestParam(required = false)Long cargoId,
                            @RequestParam(required = false)Long convId, 
                            @RequestParam(defaultValue = "0")Integer nroPagina
                            ) throws IOException {

        final Integer CANTIDAD_POR_PAGINA = 10;
        Pageable page = PageRequest.of(nroPagina,CANTIDAD_POR_PAGINA,Sort.by("id"));
        model.addAttribute("tecnologias", tecRepo.findAll());
        model.addAttribute("tiposDeEstudios", TipoDeEstudio.values());
        model.addAttribute("estadoP", EstadoPostulante.values());

        model.addAttribute("cargos", carRepo.findAll());
        try {
            //se convierte a DTO las convocatorias
            model.addAttribute("convocatoriaC", new ObjectMapper().writeValueAsString(
                convRepo.findAll().stream().map(conv ->
                        new ConvocatoriaDTO(conv.getId(), conv.getCargoId(), conv.getEstado(), conv.getFechaInicio(), conv.getFechaFin()) )
                .collect(Collectors.toList()))
            );
        } catch (JsonProcessingException er) {
            // TODO Auto-generated catch block
            er.printStackTrace();
        }
        long infRange = 0L;
        long supRange = 1200L;
        if(expInMonths != null && !expInMonths.trim().isEmpty()){
            String[] rango = expInMonths.split("-");
            infRange = Long.parseLong(rango[0]);
            supRange = Long.parseLong(rango[1]);
        }
        Page<Postulante> postulantesPag = post.postulantesMultiFiltro(
                nombre == null || nombre.trim().isEmpty() ?
                new TypedParameterValue(StringType.INSTANCE,null) :
                new TypedParameterValue(StringType.INSTANCE,"%"+nombre+"%"),
                     lvlEng, lvlTec, tecId, tipoest,cargoId,page,estado,convId, infRange, supRange);
        model.addAttribute("numeroOcurrencias", postulantesPag.getTotalElements());
        List<Postulante> postulantes = postulantesPag.getContent();
        List<PostulanteListaDTO> postulantesDTO = new ArrayList<>();
        
        for (Postulante postulante : postulantes) {
            postulantesDTO.add(new PostulanteListaDTO(postulante.getId(), postulante.getNombre(),
                    postulante.getApellido(), postulante.getNivelIngles(),
                    postulante.getMesesDeExperiencia(), postulante.getTecnologias(),postulante.getEstadoPostulante(),
                    postulante.getPostulaciones()));
        }

        model.addAttribute("pages", postulantesPag.getTotalPages());
        model.addAttribute("postulantes", postulantesDTO);

        String query = request.getQueryString();
        model.addAttribute("query", query);

        return "postulantes";
    }


    @RequestMapping("/excel")
    public void exportPostulantesExcel(HttpServletResponse response, Model model,
                                       @RequestParam(required = false)Long tecId,
                                       @RequestParam(required = false)String nombre,
                                       @RequestParam(required = false)EstadoPostulante estado,
                                       @RequestParam(required = false)Long lvlEng,
                                       @RequestParam(required = false)Long lvlTec,
                                       @RequestParam(required = false)TipoDeEstudio tipoest,
                                       @RequestParam(required = false)String expInMonths,
                                       @RequestParam(required = false)Long cargoId,
                                       @RequestParam(required = false)Long convId,
                                       @RequestParam(defaultValue = "0")Integer nroPagina
    ) throws IOException {
        Pageable page = PageRequest.of(0,Integer.MAX_VALUE,Sort.by("id"));
        long infRange = 0L;
        long supRange = 1200L;
        if(expInMonths != null && !expInMonths.trim().isEmpty()){
            String[] rango = expInMonths.split("-");
            infRange = Long.parseLong(rango[0]);
            supRange = Long.parseLong(rango[1]);
        }
        Page<Postulante> postulantesPag = post.postulantesMultiFiltro(
                nombre == null || nombre.trim().isEmpty() ?
                        new TypedParameterValue(StringType.INSTANCE,null) :
                        new TypedParameterValue(StringType.INSTANCE,"%"+nombre+"%"),
                        lvlEng, lvlTec, tecId, tipoest,cargoId,page,estado,convId, infRange, supRange);
        List<Postulante> postulantes = postulantesPag.getContent();
        List<PostulanteListaDTO> postulantesDTO = new ArrayList<>();

        for (Postulante postulante : postulantes) {
            postulantesDTO.add(new PostulanteListaDTO(postulante.getId(), postulante.getNombre(),
                    postulante.getApellido(), postulante.getNivelIngles(),
                    postulante.getMesesDeExperiencia(), postulante.getTecnologias(),postulante.getEstadoPostulante(),
                    postulante.getPostulaciones()));
        }

        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=postulantes_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);

        HashMap<String, String> filtros = new HashMap<String, String>();
        filtros.put("nombre", nombre == null ? "-":nombre);
        filtros.put("nivelIngles", lvlEng == null ? "-" : lvlEng.toString());
        filtros.put("tecnologia", tecId == null ? "-" : tecRepo.findById(tecId).get().getNombre());
        filtros.put("nivelTecnologia", lvlTec == null ? "-" : lvlTec.toString());
        filtros.put("tipoDeEstudio", tipoest == null ? "-" : tipoest.getName());
    filtros.put("estado", estado == null ? "-" : estado.getEstado());
        filtros.put("experienciaEnMeses", expInMonths == null ? "-" : expInMonths.toString());
        filtros.put("convocatoria", convId == null ? "-" : convRepo.findById(convId).get().getCargo().getNombre());
        filtros.put("convocatoriaFecha", convId == null ? "-" : convRepo.findById(convId).get().getFechaInicio().toString());

        PostulantesExcelExporter excelExporter = new PostulantesExcelExporter(postulantesDTO, filtros);

        excelExporter.export(response);
    }
 

    @GetMapping({"/{postulanteId}"})
    public String getPostulanteDetalle(Model model, @PathVariable("postulanteId") Long postulanteId) {
        Postulante p = post.findById(postulanteId).orElse(null);
        model.addAttribute("postulante",p);
        model.addAttribute("cvId", fileRepo.getIdByPostulante(p));
        model.addAttribute("estadoP", EstadoPostulante.values());				
        return "detallepostulante";
        
    }


    @PostMapping({"/{postulanteId}"})
    public String setPostulanteEstado(@ModelAttribute Postulante postulante, BindingResult result, @PathVariable("postulanteId") Long postulanteId) {
        //post.setPostulanteEstadoAndComentario(postulante.getEstadoPostulante(),postulante.getComentarioRRHH(), postulante.getId());
        Postulante postulanteVd = post.getById(postulanteId);
        postulanteVd.setEstadoPostulante(postulante.getEstadoPostulante());
        //si se le contrata, actualizar la fecha actual
        if(postulanteVd.getEstadoPostulante() == EstadoPostulante.CONTRATADO){
            postulanteVd.setFechaContratado(new Date());
        }
        postulanteVd.setComentarioRRHH(postulante.getComentarioRRHH());
        post.setPostulanteEstadoAndComentario(postulante.getEstadoPostulante(), postulante.getComentarioRRHH(), postulanteId);
        //post.save(postulanteVd);
        return "redirect:/postulantes/"+postulanteId;
    }

    @GetMapping("/cvFile/{fileId}")
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

    @GetMapping("/{id}/pdf")
    public ResponseEntity<Resource> downloadPDF(@PathVariable Long id) {
        // Load file from database
        PdfGenerator pdf =  new PdfGenerator();
        
        
        try {
            Postulante postulante = post.findById(id)
            .orElseThrow(() -> new Exception("Postulante no encontrado"));
            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType("application/pdf"))
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + postulante.getNroDocument() + ".pdf" + "\"")
                    .body(new ByteArrayResource(pdf.generatePdfReport(postulante)));
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }

    }
}
            