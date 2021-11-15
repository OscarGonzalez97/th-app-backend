<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="contents" type="REPLACE">
        <h2>Lista de convocatorias</h2>
        <div>
            <form>
                <label for="cargos">Cargos:</label>
                <select  name="cargoId" id="cargos">
                    <option value="">Todos los cargos</option>
                    <c:forEach items="${cargos}" var="cargo">
                        <option value="${cargo.id}" ${param.cargoId == cargo.id ? "selected" : ""} >${cargo.nombre}</option>
                    </c:forEach>
                </select>
                Estado:
                <input type="radio" id="cualquiera" name="isOpen" checked value="">
                <label for="abierto">Cualquiera</label><br>
                <input type="radio" id="abierto" name="isOpen" value="1">
                <label for="abierto">Abierto</label><br>
                <input type="radio" id="cerrado" name="isOpen" value="0">
                <label for="cerrado">Cerrado</label><br>
                <input type="submit" value="Buscar">
            </form>
        </div>
        <div>
            <a href="/convocatoria">Agregar Nueva Convocatoria</a>
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Cargo</th>
                    <th scope="col">Fecha Desde</th>
                    <th scope="col">Fecha Hasta</th>
                    <th scope="col">Vacantes</th>
                  </tr>
                </thead>
                <tbody>
                  
                    <c:forEach items="${convocatorias}" var="convocatoria" varStatus="sta">
                        <tr>
                            <th scope="row">${sta.index+1}</th>
                            <td>${convocatoria.getCargo().getNombre()}</td>
                            <td>${convocatoria.getFechaInicio().toString().split(" ")[0]}</td>
                            <td>${convocatoria.getFechaFin().toString().split(" ")[0]}</td>
                            <td>${convocatoria.getCupos()}</td>
                            <td>Ver Postulantes</td>
                            <td><a href="/convocatoria/${convocatoria.id}">Editar</a></td>
                        </tr>
                    </c:forEach>
                    
                  
                 
                </tbody>
              </table>
             
        </div>
    </layout:put>
    <layout:put block="scripts" type="APPEND">

    </layout:put>
</layout:extends>
