<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="APPEND"></layout:put>
    <layout:put block="contents" type="REPLACE">
        <h2>${convocatoria.id == null ? "Agregar" : "Modificar"} Convocatoria</h2>
        <div class="p-3 mb-2 bg-light text-dark  bg-transparent ">
            <form:form action="/convocatoria/${convocatoria.id == null ? '' : convocatoria.id}" method="post" modelAttribute="convocatoria">
                <div class="mb-3 col-3">
                    <form:label path="fechaInicioS" class="form-label ">Fecha inicial</form:label>
                    <form:input type="date" path="fechaInicioS" required="true" class="form-control ${ existeFecha ?  'is-invalid' : ''}" placeholder="Fecha requerida" requiered="true" />
                    <div id="validationServerUsernameFeedback1" class="invalid-feedback">
                        Esta fecha ya existe
                    </div>
                
                </div>
                <div class="mb-3 col-3">
                    <form:label path="fechaFinS" class="form-label">Fecha Fin</form:label>
                    <form:input type="date" path="fechaFinS" required="true" class="form-control ${existeFecha ?  'is-invalid': '' }" placeholder="Fecha requerida" requiered="true" />
                    <div id="validationServerUsernameFeedback2" class="invalid-feedback">
                        Esta fecha ya existe
                    </div>
                </div>
                <div class="mb-3 col-3">
                    <form:label path="cupos" class="form-label">Cupos:</form:label>
                    <form:input type="number" class="form-control" path="cupos" required="true"/>
                </div>
                <div class="mb-3 col-3">
                    <form:label path="cargoId" class="form-label">Cargo</form:label>
                    <form:select class="form-select" path="cargoId">
                        <c:forEach items="${cargos}" var="cargo">
                            <form:option value="${cargo.id}">${cargo.nombre} </form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form:form>
        </div>
    </layout:put>
    <layout:put block="scripts" type="APPEND">
       
    </layout:put>
</layout:extends>
