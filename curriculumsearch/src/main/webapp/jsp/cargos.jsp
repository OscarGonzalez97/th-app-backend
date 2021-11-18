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
        <div class="card-footer">
          <div>
            <nav aria-label="Page navigation example">
              <ul class="pagination">
                <c:forEach begin="1" end="${pages}" var="nro">
                  <li class="page-item ${(param.nroPagina == null and nro == 1)  or param.nroPagina == nro-1 ? 'active' : ''}"><a class="page-link" href="javascript:buscarPagina(${nro})">${nro}</a></li>
                </c:forEach>
              </ul>
            </nav>
          </div>
        </div>
      </div>  
    </layout:put>
    <layout:put block="scripts" type="APPEND">
      <script>
        function buscarPagina(nro){
          nro--
          const aBuscar = 'nroPagina='+nro
          if(!location.search) location.search = "?"+aBuscar
          const inicial = location.search.search(aBuscar);
          if(inicial==-1){//si no se encuentra y hay otros queries
            location.search = "&"+aBuscar
          }
          location.search.replace('nroPagina=',aBuscar)
        }
      </script>
    </layout:put>
</layout:extends>
