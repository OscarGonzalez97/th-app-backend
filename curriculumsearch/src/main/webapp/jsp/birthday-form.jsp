<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="APPEND"></layout:put>
    <layout:put block="contents" type="REPLACE">
        <div class="card justify-content-center mx-auto mt-2" style="width: 20rem;">
            <div class="card-header">
              <h5>Cumpleaño</h5>
            </div>
              <form:form
              action="/cumples/${cumple.id == null ? 'agregar' : 'modificar/'.concat(cumple.id)}"
              method="post"
              modelAttribute="cumple"
              class="d-flex flex-column"
              >
                <div class="card-body">
                    <form:label class="form-label visually-hidden" path="nombreCompleto"
                    >Nombre Completo
                    </form:label>
                    <form:input type="text" path="nombreCompleto" class="form-control ${ mismoNombre ? 'is-invalid' : ''}" required="true" placeholder="Nombre completo"/>
                    <div id="validationServerUsernameFeedback" class="invalid-feedback">
                      Este nombre completo ya existe
                    </div>
                    <form:label class="form-label visually-hidden" path="fecha"
                    >Descripción
                    </form:label>
                    <form:input type="date" path="fecha" class="form-control" required="true" placeholder="Fecha cumple"/>

                </div>
                <div class="card-footer d-flex flex-column">
                  <div class="mt-2 align-self-end">
                      <input type="submit" value='${cumple.id == null ? "Agregar" : "Modificar"}' class="btn btn-primary" />
                  </div>
                </div>
              </form:form>
          </div>
        
        
    </layout:put>
</layout:extends>