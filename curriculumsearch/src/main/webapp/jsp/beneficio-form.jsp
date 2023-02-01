<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="APPEND"></layout:put>
    <layout:put block="contents" type="REPLACE">
        <div class="card justify-content-center mx-auto mt-2" style="width: 20rem;">
            <div class="card-header">
              <h5>Beneficio</h5>
            </div>
              <form:form
              action="/beneficios/${beneficio.id == null ? 'agregar' : 'modificar/'.concat(beneficio.id)}"
              method="post"
              modelAttribute="beneficio"
              class="d-flex flex-column"
              >
                <div class="card-body">
                    <form:label class="form-label visually-hidden" path="titulo"
                    >Beneficio
                    </form:label>
                    <form:input type="text" path="titulo" class="form-control ${ mismoNombre ? 'is-invalid' : ''}" required="true" placeholder="Titulo de beneficio"/>
                    <div id="validationServerUsernameFeedback" class="invalid-feedback">
                      Este beneficio ya existe
                    </div>
                    <form:label class="form-label visually-hidden" path="descripcion"
                    >Descripción
                    </form:label>
                    <form:input type="text" path="descripcion" class="form-control" required="true" placeholder="Descripción de beneficio"/>

                </div>
                <div class="card-footer d-flex flex-column">
                  <div class="mt-2 align-self-end">
                      <input type="submit" value='${beneficio.id == null ? "Agregar" : "Modificar"}' class="btn btn-primary" />
                  </div>
                </div>
              </form:form>
          </div>
        
        
    </layout:put>
</layout:extends>