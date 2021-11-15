<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="contents" type="REPLACE">
      <div class="card d-flex flex-column justify-content-center align-items-center mx-auto mt-2 p-3" style="width: 20rem;">
        <h5 class="card-title">${cargo.id == null ? "Agregar" : "Modificar"} Cargo</h5>
          <form:form
          action="/cargo/${cargo.id == null ? '' : cargo.id}"
          method="post"
          modelAttribute="cargo"
          class="card-body d-flex flex-column"
          >
          <div class="">
              <form:label class="form-label visually-hidden" path="nombre"
              >Nombre del cargo
              </form:label>
              <form:input
              type="text"
              path="nombre"
              class="form-control ${ mismoNombre ? 'is-invalid' : ''}"
              placeholder="Nombre del cargo" required="true"
              
              />
              <div id="validationServerUsernameFeedback" class="invalid-feedback">
                Este nombre ya existe
              </div>
          </div>
          <div class="mt-2 align-self-end">
              <input type="submit" value="Guardar" class="btn btn-primary" />
          </div>
          </form:form>
      </div>
    </layout:put>
    <layout:put block="scripts" type="APPEND">

    </layout:put>
</layout:extends>
