<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="APPEND"></layout:put>
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
        <a href="/convocatoria">Agregar Nueva Convocatoria</a>
        <c:if test="${SUCCESS_MESSAGE != null}">
            <div id="status_message" style="color: brown;" >${SUCCESS_MESSAGE}</div>
        </c:if>
        <div class="card text-dark bg-light mt-3">
        
            <div class="card-body">
              <div class="table-responsive">
                <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Cargo</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Fecha Abierta</th>
                    <th scope="col">Fecha Cerrada</th>
                  </tr>
                </thead>
                <tbody>
                  
                    <c:forEach items="${convocatorias}" var="convocatoria" varStatus="sta">
                        <tr>
                            <th scope="row">${sta.index+1}</th>
                            <td>${convocatoria.getCargo().getNombre()}</td>
                            <td>${convocatoria.getEstado().getDescripcion()}</td>
                            <td><fmt:formatDate value="${convocatoria.getFechaInicio()}" pattern="dd-MM-yyyy" /></td>
                            <td><fmt:formatDate value="${convocatoria.getFechaFin()}" pattern="dd-MM-yyyy" /></td>
                            <td><a href="/postulantes?convId=${convocatoria.id}">Ver postulantes</a></td>
                            <td><button onclick=window.location.href="/convocatoria/${convocatoria.id}">Cerrar convocatoria</button></td>
                        </tr>
                    </c:forEach>
                    
                  
                 
                </tbody>
                </table>
             </div>
            </div>
        </div>
         
    </layout:put>
    <layout:put block="scripts" type="APPEND">
        <script language="JavaScript">
                let mostrar=document.querySelector(convocatoria.getFechaFin())
                if(mostrar!=null){
                    
                }
            </script>
    </layout:put>
</layout:extends>
