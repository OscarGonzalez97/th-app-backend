<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tecnologia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <jsp:include page="alerts.jsp"/>
    <div class="container-xxl my-md-4 bd-layout">
        <h2 style="text-align: center;">DETALLE POSTULANTE</h2>
        <div style="padding: 10px;margin: 3px;border: 1px solid black;">
       
            <br><b><i><label>INFORMACION GENERAL</label></i></b><br>     
            <label>Id: ${postulante.id}</label><br>
            <label>Nombre: ${postulante.nombre}</label><br>
            <label>Apellido ${postulante.apellido}</label><br>
            <label>${postulante.tipoDocumento}: ${postulante.nroDocument} </label><br>
            <label>Correo: ${postulante.correo}</label><br>
            <label>Departamento: ${postulante.getCiudad().getDepartamento().getNombre()}</label><br>
            <label>Ciudad: ${postulante.getCiudad().getNombre()}</label><br>
            <label>Telefono: ${postulante.telefono}</label><br><label>
            <label>Fecha de nacimiento: ${postulante.fechaNacimiento}</label><br>
            <label>Resumen: ${postulante.resumen}</label><br>
            <label>Nivel de ingles: ${postulante.nivelIngles}</label><br>
            <label>Curriculum: ${postulante.curriculum}</label><br>
            <label>Estado civil: ${postulante.estadoCivil}</label><br>
            <label>Nacionalidad: ${postulante.nacionalidad}</label><br>
            <label>Disponibilidad: ${postulante.disponibilidad}</label><br>
            <label>Estado del Postulante: ${postulante.estadoPostulante.getEstado()}</label><br>
            <label>Comentario RRHH: ${postulante.getComentarioRRHH()}</label><br>   
            <br><b><i><label>TECNOLOGIAS</label></b></i><br>
            <c:forEach items="${postulante.tecnologias}" var="detalle_tecnologia">
                <label>Tecnologias: ${detalle_tecnologia.getTecnologia().getNombre()} -</label>
                <label>Nivel de Tecnologia: ${detalle_tecnologia.getNivel()}</label><br>
            </c:forEach>

            <br><b><i><label>EXPERIENCIAS</label></b></i><br>
           
            <c:forEach items="${postulante.experiencias}" var="detalle_experiencia">
                <label>Institucion: ${detalle_experiencia.getInstitucion()}</label><br>
                <label>Fecha Inicio: ${detalle_experiencia.getFechaDesde()}</label><br>
                <label>Fecha Fin: ${detalle_experiencia.getFechaHasta()}</label><br>
                <label>Referencia: ${detalle_experiencia.getNombreReferencia()}</label><br>
                <label>Telefono de la referencia: ${detalle_experiencia.getTelefonoReferencia()}</label><br>
                <label>Cargo: ${detalle_experiencia.getCargo()}</label><br>
                <label>Motivo de salida: ${detalle_experiencia.getMotivoSalida()}</label><br>
            </c:forEach>

            <br><b><i><label>ESTUDIOS</label></b></i><br>

            <c:forEach items="${postulante.estudios}" var="detalle_estudios">
                <label>Institucion: ${detalle_estudios.getInstitucion().getNombre()}</label><br>
                <label>SubNombre: ${detalle_estudios.getInstitucion().getSubNombre()}</label><br>
                <label>Tipo de estudio: ${detalle_estudios.getTipoDeEstudio()}</label><br>  
                <label>Tema de estudio: ${detalle_estudios.getTemaDeEstudio()}</label><br>     
                <label>Fecha Inicio: ${detalle_estudios.getFechaDesde()}</label><br>
                <label>Fecha Fin: ${detalle_estudios.getFechaHasta()}</label><br>
                <label>Estado: ${detalle_estudios.getEstado()}</label><br>
            </c:forEach>

            <br><b><i><label>REFERENCIA PERSONAL</label></b></i><br>

            <c:forEach items="${postulante.referencias}" var="detalle_referencias">
                <label>Nombre: ${detalle_referencias.getNombre()}</label>
                <label>Relacion: ${detalle_referencias.getRelacion()}</label><br>
                <label>Telefono: ${detalle_referencias.getTelefono()}</label><br>
            </c:forEach>
           
            <br><b><i><label>CARGOS AL CUAL POSTULA</label></b></i><br>

            <c:forEach items="${postulante.postulaciones}" var="convocatoria">
                <label>Nombre: ${convocatoria.getCargo().getNombre()}</label><br>
            </c:forEach>
           

        </div>     
        <div style="padding:10px ;margin: 5px;border: 3px solid black;">
            <b><i><h2>Cambiar Estado del Postulante y Comentario de RRHH</h2></b></i>
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
    </div>     
        
</body>

</html>