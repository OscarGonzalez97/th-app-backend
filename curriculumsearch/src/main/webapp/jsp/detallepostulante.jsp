<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<layout:extends name="layouts/base.jsp">
    <layout:put block="contents" type="REPLACE">
        <h2 style="text-align: center;">
            DETALLE POSTULANTE        
        </h2>
        <div class="row gy-3">
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
                        <h6 class="mb-0">Resumen</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                        ${postulante.resumen}
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
                    <div class="row">
                      <div class="col">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#estadoModalLong">actualizar</button>
                      </div>
                      <div class="col">
                        <a class="btn btn-link " href="#">Descargar CV</a>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <div class="col-md-6">
                <div class="row gy-3">
                    <div class="col-md-6">
                        <div class="card h-100">
                            <div class="card-body">
                              <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">Tecnologias</i></h6>
                                <c:forEach items="${postulante.tecnologias}" var="detalle_tecnologia">
                                    <small>${detalle_tecnologia.getTecnologia().getNombre()}</small>
                                    <div class="progress mb-3" style="height: 5px">
                                      <div class="progress-bar bg-primary" role="progressbar" style="width: ${(detalle_tecnologia.getNivel() / 5) * 100}%" aria-valuenow="${detalle_tecnologia.getNivel()}" aria-valuemin="1" aria-valuemax="5"></div>
                                    </div>
                                </c:forEach>
                                <hr>
                                <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">Cargos al que postula</i></h6>
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
                            <div id="carouselExampleIndicators" class="carousel carousel-dark slide" data-bs-ride="carousel">
                            
                            <div class="carousel-inner">
                                
                                
                                <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">Experiencias</i></h6>
                                <c:forEach items="${postulante.experiencias}" var="detalle_experiencia" varStatus="status">
                                    <div class="carousel-item  ${status.first ? 'active' : ''}" data-bs-interval="false">

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
                                            
                                            
                                        </ul>
                                    </div>
                                </c:forEach>
                                        
                                    
                              
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                              <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                              <span class="carousel-control-next-icon" aria-hidden="true"></span>
                              <span class="visually-hidden">Next</span>
                            </button>
                          </div>
                           </div>
                          </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                          <div id="carouselExampleIndicators" class="carousel carousel-dark slide" data-bs-ride="carousel">
                          
                          <div class="carousel-inner">
                              
                              
                              <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">Estudios</i></h6>
                              <c:forEach items="${postulante.estudios}" var="detalle_estudios" varStatus="status">
                                  <div class="carousel-item  ${status.first ? 'active' : ''}" data-bs-interval="false">

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
                                          <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                              <h6 class="mb-0">SubNombre</h6>
                                              <span class="text-secondary">${detalle_estudios.getInstitucion().getSubNombre()}</span>
                                          </li>
                                          
                                          
                                      </ul>
                                  </div>
                              </c:forEach>
                                      
                                  
                            
                          </div>
                          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                          </button>
                          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                          </button>
                        </div>
                         </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">Referencias Personales</i></h6>
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
          <div class="modal-header">
          <h5 class="modal-title" id="estadorrhhModal">Estado</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
          </button>
          </div>
          <div class="modal-body">
              <form:form class="needs-validation" method="post" modelAttribute="postulante">
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
                  </div>
                  <input type="submit" value="Guardar"/>
              </form:form> 
          </div>
          <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
      </div>
      </div>
  </div>  
  <layout:put block="scripts" type="APPEND">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="../valEdad.js"></script>

  </layout:put>

            
        
    
 
    </layout:put>
</layout:extends>

