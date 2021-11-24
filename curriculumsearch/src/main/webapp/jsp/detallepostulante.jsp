<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<layout:extends name="layouts/base.jsp">
    <layout:put block="contents" type="REPLACE">
       <div id="element-to-print">
           <h2 class="mb-3" style="text-align: center;">
               Detalle Postulante ${postulante.nombre} ${postulante.apellido}
           </h2>
           <div class="row gy-3 container">
               <div class="col-md-6">
                   <div class="card mb-3">
                       <div class="card-body">
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Nombre</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.nombre} ${postulante.apellido}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Email</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.correo}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Vive en</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.getCiudad().getNombre()}, ${postulante.getCiudad().getDepartamento().getNombre()}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Nro de Documento</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.tipoDocumento}: ${postulante.nroDocument}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Telefono</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.telefono}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Edad</h6>
                               </div>
                               <div id="edad" class="col-sm-9 text-secondary"></div>
                               <input style="display: none;" id="dob" value="${postulante.fechaNacimiento}">
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Direccion</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.direccion}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Nivel de Ingles</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.nivelIngles}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Estado Civil</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.estadoCivil.getDescripcion()}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Nacionalidad</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.nacionalidad.getDescripcion()}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Disponbilidad</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.disponibilidad.getDescripcion()}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">Estado</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.estadoPostulante.getEstado()}
                               </div>
                           </div>
                           <hr>
                           <div class="row">
                               <div class="col-sm-3">
                                   <h6 class="mb-0">ComentarioRRHH</h6>
                               </div>
                               <div class="col-sm-9 text-secondary">
                                       ${postulante.getComentarioRRHH()}
                               </div>
                           </div>
                           <hr>
                           <div id="buttonRow" style="display: block">
                               <div class="row">
                                   <div class="col-4">
                                       <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#estadoModalLong">Agregar observacion</button>
                                   </div>
                                   <div class="col-4">
                                       <div class="dropdown">
                                           <button class="dropdown-toggle btn btn-light" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                               PDF
                                           </button>
                                           <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                               <li><a id="pdf" type="button" class="dropdown-item">Imagen</a></li>
                                               <li><a class="dropdown-item" target="__blank" href="/postulantes/${postulante.id}/pdf">Info</a></li>
                                           </ul>
                                       </div>
                                   </div>
                                   <c:choose>

                                       <c:when test = "${cvId != null}">
                                           <div class="col-4">
                                               <a class="btn btn-link" target="__blank" href="/postulantes/cvFile/${cvId}">Descargar CV</a>
                                           </div>
                                       </c:when>

                                   </c:choose>


                               </div>
                           </div>
                       </div>
                   </div>

               </div>
               <div class="col-md-6">
                   <div class="row gy-3">
                       <div class="col-md-6">
                           <div class="card">
                               <div class="card-body">
                                   <div id="carouselExampleIndicators" class="carousel carousel-dark slide" data-bs-ride="carousel">

                                       <div class="carousel-inner">


                                           <h6 class="d-flex justify-content-between fw-bold px-1">
                                               <c:choose>
                                                   <c:when test="${postulante.experiencias.size() > 1}">
                                                       <i class="bi bi-arrow-left-circle-fill" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev"></i>
                                                       Experiencias
                                                       <i class="bi bi-arrow-right-circle-fill" data-bs-target="#carouselExampleIndicators" data-bs-slide="next"></i>
                                                   </c:when>
                                                   <c:otherwise>
                                                       Experiencias
                                                   </c:otherwise>

                                               </c:choose>


                                           </h6>
                                           <c:forEach items="${postulante.experiencias}" var="detalle_experiencia" varStatus="status">
                                               <div class="pdf-carousel carousel-item  ${status.first ? 'active' : ''}" data-bs-interval="false">

                                                   <ul class="list-group list-group-flush ">
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Institucion</h6>
                                                           <span class="text-secondary">${detalle_experiencia.getInstitucion()}</span>
                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Fecha Inicio</h6>
                                                           <span class="text-secondary"><fmt:formatDate value="${detalle_experiencia.getFechaDesde()}" pattern="dd-MM-yyyy" /></span>
                                                           <!--    <input style="display:none;" id="fechaInicioExp" value="${detalle_experiencia.getFechaDesde()}">

                                                <span style="display: none;" class="text-secondary" id="fechaInicioExp2">${detalle_experiencia.getFechaDesde()}</span>-->
                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Fecha Fin</h6>
                                                           <span class="text-secondary"><fmt:formatDate value="${detalle_experiencia.getFechaHasta()}" pattern="dd-MM-yyyy" /></span>
                                                           <!--    <input style="display:none;" id="fechaFinExp" value="${detalle_experiencia.getFechaHasta()}">
                                                <span style="display: none;" class="text-secondary" id="fechaFinExp2">${detalle_experiencia.getFechaHasta()}</span>-->
                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Referencia</h6>
                                                           <span class="text-secondary">${detalle_experiencia.getNombreReferencia()}</span>
                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Telefono de la referencia</h6>
                                                           <span class="text-secondary">${detalle_experiencia.getTelefonoReferencia()}</span>
                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Cargo</h6>
                                                           <span class="text-secondary">${detalle_experiencia.getCargo()}</span>
                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Motivo de salida</h6>
                                                           <span class="text-secondary">${detalle_experiencia.getMotivoSalida()}</span>
                                                       </li>

                                                       <hr class="lineas-pdf" style="display: none"/>
                                                   </ul>
                                               </div>
                                           </c:forEach>



                                       </div>


                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="col-md-6">
                           <div class="card">
                               <div class="card-body">
                                   <div id="carouselExampleIndicators1" class="carousel carousel-dark slide" data-bs-ride="carousel">

                                       <div class="carousel-inner">

                                           <h6 class="d-flex justify-content-between fw-bold px-1">

                                               <c:choose>
                                                   <c:when test="${postulante.estudios.size() > 1}">
                                                       <i class="bi bi-arrow-left-circle-fill" data-bs-target="#carouselExampleIndicators1" data-bs-slide="prev"></i>
                                                       Estudio
                                                       <i class="bi bi-arrow-right-circle-fill" data-bs-target="#carouselExampleIndicators1" data-bs-slide="next"></i>
                                                   </c:when>
                                                   <c:otherwise>
                                                       Estudios
                                                   </c:otherwise>

                                               </c:choose>
                                           </h6>
                                           <c:forEach items="${postulante.estudios}" var="detalle_estudios" varStatus="status">
                                               <div class="pdf-carousel carousel-item  ${status.first ? 'active' : ''}" data-bs-interval="false">

                                                   <ul class="list-group list-group-flush ">
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Institucion</h6>
                                                           <span class="text-secondary">${detalle_estudios.getInstitucion().getNombre()}</span>
                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Fecha Inicio</h6>
                                                           <span class="text-secondary"><fmt:formatDate value="${detalle_estudios.getFechaDesde()}" pattern="dd-MM-yyyy" /></span>

                                                           <!-- <input style="display:none;" id="fechaInicioEst" value="${detalle_estudios.getFechaDesde()}">-->

                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Fecha Fin</h6>
                                                           <span class="text-secondary"><fmt:formatDate value="${detalle_estudios.getFechaHasta()}" pattern="dd-MM-yyyy" /></span>

                                                           <!--  <input style="display:none;" id="fechaFinEst" value="${detalle_estudios.getFechaHasta()}">-->
                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Tipo de Estudio</h6>
                                                           <span class="text-secondary">${detalle_estudios.getTipoDeEstudio()}</span>
                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Tema de estudio</h6>
                                                           <span class="text-secondary">${detalle_estudios.getTemaDeEstudio()}</span>
                                                       </li>
                                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                           <h6 class="mb-0">Estado</h6>
                                                           <span class="text-secondary">${detalle_estudios.getEstado()}</span>
                                                       </li>


                                                       <hr class="lineas-pdf" style="display: none"/>
                                                   </ul>
                                               </div>
                                           </c:forEach>



                                       </div>

                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="col-md-6">
                           <div class="card h-100">
                               <div class="card-body">
                                   <h6 class="text-start fw-bold">Tecnologias</h6>
                                   <c:forEach items="${postulante.tecnologias}" var="detalle_tecnologia">
                                       <small>${detalle_tecnologia.getTecnologia().getNombre()}</small>
                                       <div class="progress mb-3" style="height: 5px">
                                           <div class="progress-bar bg-primary" role="progressbar" style="width: ${(detalle_tecnologia.getNivel() / 5) * 100}%" aria-valuenow="${detalle_tecnologia.getNivel()}" aria-valuemin="1" aria-valuemax="5"></div>
                                       </div>
                                   </c:forEach>
                                   <hr>
                                   <h6 class="text-start fw-bold">Cargos al que postula</h6>
                                   <ul class="list-group list-group-flush">
                                       <c:forEach items="${postulante.postulaciones}" var="convocatoria">

                                           <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                               <h6 class="mb-0">${convocatoria.getCargo().getNombre()}</h6>
                                               <span class="text-secondary"></span>
                                           </li>
                                       </c:forEach>

                                   </ul>

                               </div>
                           </div>
                       </div>
                       <div class="col-md-6">
                           <div class="card">
                               <div class="card-body">
                                   <h6 class="text-start fw-bold">Referencias Personales</h6>
                                   <ul class="list-group list-group-flush">
                                       <c:forEach items="${postulante.referencias}" var="referencia">

                                       <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                           <h6 class="mb-0">${referencia.nombre}, ${referencia.relacion}, ${referencia.telefono}</h6>
                                           <span class="text-secondary"></span>
                                       </li>
                                       </c:forEach>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>



           </div>
           <!-- Modal -->
           <div class="modal fade" id="estadoModalLong" tabindex="-1" role="dialog" aria-labelledby="estadorrhhModal" aria-hidden="true">
               <div class="modal-dialog" role="document">
                   <div class="modal-content">
                       <form:form class="needs-validation" method="post" modelAttribute="postulante">
                           <div class="modal-header">
                               <h5 class="modal-title" id="estadorrhhModal">Estado</h5>
                               <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                   <span aria-hidden="true">&times;</span>
                               </button>
                           </div>
                           <div class="modal-body">
                               <form:label path="estadoPostulante" class="form-label">Estado</form:label>
                               <div class="inputs">
                                   <form:select class="form-select" path="estadoPostulante" aria-label="Default select example">
                                       <c:forEach items="${estadoP}" var="estadoPostulante">
                                           <c:choose>
                                               <c:when test="${estadoPostulante.getEstado()=='Nuevo' }">
                                               </c:when>
                                               <c:otherwise>
                                                   <form:option value="${estadoPostulante}">${estadoPostulante.getEstado()}</form:option>
                                               </c:otherwise>
                                           </c:choose>
                                       </c:forEach>
                                   </form:select>
                               </div>
                               <div class="inputs">
                                   <form:label path="comentarioRRHH" class="form-label">ComentarioRRHH</form:label>
                                   <form:textarea  class="form-control" path="comentarioRRHH" id="comentarioRRHH"></form:textarea>
                               </div><br>

                           </div>
                           <div class="modal-footer">
                               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                               <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Agregar</button>
                           </div>
                       </form:form>
                   </div>
               </div>
           </div>

       </div>
  <layout:put block="scripts" type="APPEND">

    <script src="../valEdad.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <script>
          document.querySelector('#pdf').addEventListener("click", async ()=>{
              var buttonsRow = document.querySelector('#buttonRow');
              var element = document.getElementById('element-to-print');
              var carousels = document.querySelectorAll(".pdf-carousel");
              var hrs = document.querySelectorAll(".lineas-pdf");
              var opt = {
                  margin:       [1, 1, 1, 1],
                  filename:     'myfile.pdf',
                  image:        { type: 'jpeg', quality: 0.98 },
                  html2canvas:  { scale: 2 },
                  jsPDF:        { unit: 'in', format: 'a2', orientation: 'portrait' }
              };
              buttonsRow.style.display = "none";
              carousels.forEach((element)=>{
                 element.classList.remove('carousel-item')
              });
              hrs.forEach((element)=>{
                 element.style.display = "block"
              });
              await html2pdf().set(opt).from(element).toPdf().save();
              buttonsRow.style.display = "block";
              carousels.forEach((element)=>{
                  element.classList.add('carousel-item')
              });
              hrs.forEach((element)=>{
                  element.style.display = "none"
              });
          })

          <%--location.replace("/postulantes/${postulante.id}/")--%>
      </script>

  </layout:put>

            
        
    
 
    </layout:put>
</layout:extends>

