<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="APPEND"></layout:put>
    <layout:put block="cssDeclaracion" type="APPEND"></layout:put>
    <layout:put block="contents" type="REPLACE">
        <h2>${tecnologia.id == null ? "Agregar" : "Modificar"} Tecnología</h2>
        <div class="p-3 mb-2 bg-light text-dark  bg-transparent">

            <form:form action="/tecnologia/${tecnologia.id == null ? '' : tecnologia.id}"  method="post" modelAttribute="tecnologia" class="row row-cols-lg-auto g-3 align-items-center">
            <div class="col-12">
                <form:label class="form-label visually-hidden"  path="nombre">Nombre: </form:label> 
                <form:input type="text" path="nombre" class="form-control ${ mismoNombre ? 'is-invalid' : ''}" required="true" placeholder="Nombre de la tecnologia"/>
                <div id="validationServerUsernameFeedback" class="invalid-feedback">
                    Este nombre ya existe
                  </div>
            </div>
            <div class="col-12">
                <input type="submit" value="Guardar" class="btn btn-primary"/>
            </div>
            </form:form>
        </div>
    </layout:put>
</layout:extends>