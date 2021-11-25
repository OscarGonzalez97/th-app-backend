<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
  <layout:put block="cssDeclaracion" type="APPEND"></layout:put>
    <layout:put block="contents" type="REPLACE">
        <div class="card justify-content-center mx-auto mt-2" style="width: 30rem;">
            <div class="card-header">
              <h5>Datos del usuario</h5>
            </div>
              <form:form
              action="/edit-user-data"
              method="post"
              modelAttribute="user"
              class="d-flex flex-column"
              >
                <div class="card-body">
                    <div class="row mb-3">
                        <form:label path="email" class="col-sm-3 col-form-label">Email</form:label>
                        <div class="col-sm">
                            <form:input path="email" placeholder="Ingrese su email" type="email" class="form-control" required="required"></form:input>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <form:label path="firstName" class="col-sm-3 col-form-label">Nombre </form:label>
                        <div class="col-sm">
                            <form:input path="firstName" class="form-control" placeholder="Ingrese su nombre"></form:input>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <form:label path="lastName" class="col-sm-3 col-form-label">Apellido </form:label>
                        <div class="col-sm">
                            <form:input path="lastName" class="form-control" placeholder="Ingrese su apellido"></form:input>
                        </div>
                    </div>
                    
                </div>
                <div class="card-footer d-flex flex-column">
                  <div class="mt-2 align-self-end">
                      <input type="submit" value='Guardar' class="btn btn-primary" />
                  </div>
                </div>
              </form:form>
          </div>
    
    </layout:put>
    <layout:put block="scripts" type="APPEND">

    </layout:put>
</layout:extends><html>


