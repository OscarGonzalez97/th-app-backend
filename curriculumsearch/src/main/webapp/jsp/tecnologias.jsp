<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="APPEND"></layout:put>
    <layout:put block="contents" type="REPLACE">
        <h2>Lista de Tecnologías</h2>

        <div>
            <form>
              <div class="row justify-content-start gy-2">
                <div class="col-auto">
                  <input
                    class="form-control" 
                    placeholder="Nombre"
                    type="text"
                    name="nombre"
                    id="nombre"
                    value="${param.nombre}"
                  />

                </div>
                <div class="col-auto">

                  <input type="submit" class="btn btn-primary" value="Buscar" />
                </div>
                
              </div>
            </form>
            
        </div>
        <div class="card text-dark bg-light mt-3">
        
          <div class="card-body">
            <div class="table-responsive">
              <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Tecnología</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                    
                      <c:forEach items="${tecnologias}" var="tecnologia" varStatus="sta">
                          <tr>
                              <th scope="row">${sta.index+1}</th>
                              <td>${tecnologia.getNombre()}</td>
                            
                              <td><a href="/tecnologia/${tecnologia.id}"><i class="bi bi-pencil-fill"></i></a></td>
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
        </div>
       
        
      </layout:put>
      <layout:put block="scripts" type="APPEND">
        
      </layout:put>
</layout:extends>
