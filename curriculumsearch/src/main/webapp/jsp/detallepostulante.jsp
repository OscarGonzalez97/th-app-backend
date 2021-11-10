<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>

</head>

<body>
     <h2 style="text-align: center;">DETALLE POSTULANTE</h2>
    <div style="padding: 10px;margin: 3px;border: 1px solid black;">
       
            <br><label>INFORMACION GENERAL</label><br>     
            <label>Id: ${postulante.id}</label><br>
            <label>Nombre: ${postulante.nombre}</label><br>
            <label>Apellido ${postulante.apellido}</label><br>
            <label>Tipo de documento: ${postulante.tipoDocumento}</label><br>
            <label>Cedula: ${postulante.nroDocument}</label><br>
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

            <br><label>TECNOLOGIAS</label><br>
            <c:forEach items="${postulante.tecnologias}" var="detalle_tecnologia">
                <label>Tecnologias: ${detalle_tecnologia.getTecnologia().getNombre()} -</label>
                <label>Nivel de Tecnologia: ${detalle_tecnologia.getNivel()}</label><br>
            </c:forEach>

            <br><label>EXPERIENCIAS</label><br>
           
            <c:forEach items="${postulante.experiencias}" var="detalle_experiencia">
                <label>Institucion: ${detalle_experiencia.getInstitucion()}</label><br>
                <label>Fecha Inicio: ${detalle_experiencia.getFechaDesde()}</label><br>
                <label>Fecha Fin: ${detalle_experiencia.getFechaHasta()}</label><br>
                <label>Referencia: ${detalle_experiencia.getNombreReferencia()}</label><br>
                <label>Telefono de la referencia: ${detalle_experiencia.getTelefonoReferencia()}</label><br>
                <label>Cargo: ${detalle_experiencia.getCargo()}</label><br>
                <label>Motivo de salida: ${detalle_experiencia.getMotivoSalida()}</label><br>
            </c:forEach>

            <br><label>ESTUDIOS</label><br>

            <c:forEach items="${postulante.estudios}" var="detalle_estudios">
                <label>Institucion: ${detalle_estudios.getInstitucion().getNombre()}</label><br>
                <label>SubNombre: ${detalle_estudios.getInstitucion().getSubNombre()}</label><br>
                <label>Tipo de estudio: ${detalle_estudios.getTipoDeEstudio()}</label><br>  
                <label>Tema de estudio: ${detalle_estudios.getTemaDeEstudio()}</label><br>     
                <label>Fecha Inicio: ${detalle_estudios.getFechaDesde()}</label><br>
                <label>Fecha Fin: ${detalle_estudios.getFechaHasta()}</label><br>
                <label>Estado: ${detalle_estudios.getEstado()}</label><br>
            </c:forEach>

            <br><label>REFERENCIA PERSONAL</label><br>

            <c:forEach items="${postulante.referencias}" var="detalle_referencias">
                <label>Nombre: ${detalle_referencias.getNombre()}</label>
                <label>Relacion: ${detalle_referencias.getRelacion()}</label><br>
                <label>Telefono: ${detalle_referencias.getTelefono()}</label><br>
            </c:forEach>
           
            <br><label>CARGOS AL CUAL POSTULA</label><br>

            <c:forEach items="${postulante.postulaciones}" var="convocatoria">
                <label>Nombre: ${convocatoria.getCargo().getNombre()}</label><br>
            </c:forEach>
           

    </div>     

</body>

</html>