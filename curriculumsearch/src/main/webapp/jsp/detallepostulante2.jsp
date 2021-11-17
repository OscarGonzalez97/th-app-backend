
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curriculum vitae</title>
    <link href="../css/detallePostulantestyle.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body class="container">
    <header>
        <div>
            <br>
            <h2>&nbsp;&nbsp;&nbsp;&nbsp; ${postulante.nombre} ${postulante.apellido}</h2>    
            <h3>&nbsp;&nbsp;&nbsp;&nbsp; ${postulante.tipoDocumento}: ${postulante.nroDocument}</h3>
            <h3>&nbsp;&nbsp;&nbsp;&nbsp; Correo: ${postulante.correo}</h3>
            <br>
        </div>
    </header>
    <section>
        <article>
            <br>
            <h2>&nbsp;&nbsp;Informacion Personal</h2>
            <ul>
                <li>
                    Direccion: ${postulante.getCiudad().getDepartamento().getNombre()},${postulante.getCiudad().getNombre()}
                </li>
                <li>
                    Telefono: ${postulante.telefono}
                </li>
                <li>
                    Fecha de nacimiento: ${postulante.fechaNacimiento}
                </li>
                <li>
                    Nivel de ingles:&nbsp;&nbsp;<progress value="${postulante.nivelIngles}" max="5"> 
                </li>
                <li>
                    Estado civil: ${postulante.estadoCivil}
                </li>
                <li>
                    Nacionalidad: ${postulante.nacionalidad}
                </li>
                <li>
                    Disponibilidad: ${postulante.disponibilidad}
                </li>
                <li>
                    Resumen: ${postulante.resumen}
                </li>
            </ul>
            <br>
            <h2>&nbsp;&nbsp;TECNOLOGIAS</h2>
            <ul>
                <c:forEach items="${postulante.tecnologias}" var="detalle_tecnologia">
                    <label>Tecnologias: ${detalle_tecnologia.getTecnologia().getNombre()} &nbsp;&nbsp;<progress value="${detalle_tecnologia.getNivel()}" max="5"></progress></label><br>
                </c:forEach>
            </ul>
            <br>
            <h2>&nbsp;&nbsp;Cargo al que Postula</h2>
            <ul>
                <c:forEach items="${postulante.postulaciones}" var="convocatoria">
                    <li>Nombre: ${convocatoria.getCargo().getNombre()}</li><br>
                </c:forEach>
            </ul>
            <br>
            <h2>&nbsp;&nbsp;Estado RRHH</h2>
            <ul>
                <li>Estado del Postulante: ${postulante.estadoPostulante.getEstado()}</li>
                <li>Comentario RRHH: ${postulante.getComentarioRRHH()}</li>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">Cambiar</button>
                  
            </ul>
        </article>
        <aside>
            <br>
            <h2>Informacion Academica</h2>
            <ul>
                <c:forEach items="${postulante.estudios}" var="detalle_estudios">
                    <label>Institucion: ${detalle_estudios.getInstitucion().getNombre()}</label><br>
                    <label>Tipo de estudio: ${detalle_estudios.getTipoDeEstudio()}</label><br>  
                    <label>Tema de estudio: ${detalle_estudios.getTemaDeEstudio()}</label><br>     
                    <label>Fecha Inicio: ${detalle_estudios.getFechaDesde()}</label><br>
                    <label>Fecha Fin: ${detalle_estudios.getFechaHasta()}</label><br>
                    <label>Estado: ${detalle_estudios.getEstado()}</label><br>
                    <br><br>
                </c:forEach>
            </ul>
            <br>
            <h2>EXPERIENCIAS</h2>
            <ul>
                <c:forEach items="${postulante.experiencias}" var="detalle_experiencia">
                    <label>Institucion: ${detalle_experiencia.getInstitucion()}</label><br>
                    <label>Fecha Inicio: ${detalle_experiencia.getFechaDesde()}</label><br>
                    <label>Fecha Fin: ${detalle_experiencia.getFechaHasta()}</label><br>
                    <label>Referencia: ${detalle_experiencia.getNombreReferencia()}</label><br>
                    <label>Telefono de la referencia: ${detalle_experiencia.getTelefonoReferencia()}</label><br>
                    <label>Cargo: ${detalle_experiencia.getCargo()}</label><br>
                    <label>Motivo de salida: ${detalle_experiencia.getMotivoSalida()}</label><br>
                    </c:forEach>
            </ul>
            <br> 
            <h2>Referencias</h2>
            <ul>
                <c:forEach items="${postulante.referencias}" var="detalle_referencias">
                    <label>Nombre: ${detalle_referencias.getNombre()}</label><br>
                    <label>Relacion: ${detalle_referencias.getRelacion()}</label><br>
                    <label>Telefono: ${detalle_referencias.getTelefono()}</label><br>
                </c:forEach>
            </ul>   
        </aside>
        
    </section>
    <!-- Modal -->
    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
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
      
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
</body>
  
</html>