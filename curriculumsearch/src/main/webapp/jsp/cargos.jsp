<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
  <layout:put block="cssDeclaracion" type="APPEND"></layout:put>
    <layout:put block="contents" type="REPLACE">
      <div class="container-xxl my-md-4 bd-layout">
        <h2>Lista de cargos</h2>
          <div>
            <form>
              <label for="cargos">Nombre:</label>
              <input
                type="text"
                name="nombre"
                id="nombre"
                value="${param.nombre}"
              />
              <input type="submit" value="Buscar" />
            </form>
            <a href="/cargo">Agregar Nuevo Cargo</a>
          </div>
          <div>
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Cargo</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${cargos}" var="cargo" varStatus="sta">
                  <tr>
                    <th scope="row">${sta.index+1}</th>
                    <td>${cargo.getNombre()}</td>
                    <td>
                      <a href="/convocatorias?cargoId=${cargo.id}"
                        >Ver Convocatorias</a
                      >
                    </td>
                    <td><a href="/cargo/${cargo.id}">Editar cargo</a></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
    </layout:put>
    <layout:put block="scripts" type="APPEND">

    </layout:put>
</layout:extends>
