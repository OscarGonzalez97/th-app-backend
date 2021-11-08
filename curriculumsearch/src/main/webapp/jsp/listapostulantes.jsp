<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>

</head>

<body>
    <div>
        ${postulante.id}<br>
        ${postulante.nombre}<br>
        ${postulante.apellido}<br>
        ${postulante.ci}<br>
        ${postulante.correo}<br>
        ${postulante.ciudadId}<br>
        ${postulante.telefono}<br>
        ${postulante.fechaNacimiento}<br>
        ${postulante.resumen}<br>
        ${postulante.nivelIngles}<br>
        ${postulante.curriculum}<br>
        ${postulante.estadoCivil}<br>
        ${postulante.nacionalidad}<br>
        ${postulante.tipoDocumento}<br>
        ${postulante.disponibilidad}<br><br><br>

        ${postulante.getCiudad().getNombre()}<br>



       

        <c:forEach items="${postulante.tecnologias}" var="detalle_tecnologia" >
            ${detalle_tecnologia.getTecnologia().getNombre()}
        </c:forEach>

    </div>     
    
    

</body>

</html>