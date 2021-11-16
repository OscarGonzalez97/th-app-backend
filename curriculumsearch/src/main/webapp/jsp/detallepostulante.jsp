<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
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
                        <h6 class="mb-0">Fecha de nacimiento</h6>
                      </div>
                      <div class="col-sm-9 text-secondary">
                        ${postulante.fechaNacimiento}
                      </div>
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
                      <div class="col">
                        <a class="btn btn-link " href="#">Editar</a>
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
                                                <span class="text-secondary">${detalle_experiencia.getFechaDesde()}</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                <h6 class="mb-0">Fecha Fin</h6>
                                                <span class="text-secondary">${detalle_experiencia.getFechaHasta()}</span>
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
                                              <span class="text-secondary">${detalle_estudios.getFechaDesde()}</span>
                                          </li>
                                          <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                              <h6 class="mb-0">Fecha Fin</h6>
                                              <span class="text-secondary">${detalle_estudios.getFechaHasta()}</span>
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

        
    
        <div style="padding:10px ;margin: 5px;border: 3px solid black;">
            <h2>Cambiar Estado del Postulante y Comentario de RRHH</h2>
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
                <input type="submit" value="submit"/>
            </form:form>
        </div>  
    </layout:put>
</layout:extends>

