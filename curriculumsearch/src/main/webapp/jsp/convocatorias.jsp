<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="APPEND">
        <style>
            label {
                width: auto;
            }
        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">
        <h2>Lista de convocatorias</h2>
        <div>
            <form>
                <div class="row row-cols-2 gy-2">

                    <div class="col-auto">
                        <div class="row">
                            <div class="col-auto">

                                <label class="form-label" for="cargos">Cargos:</label>
                            </div>
                            <div class="col">

                                <select class="form-select form-select-sm" name="cargoId" id="cargos">
                                    <option value="">Todos los cargos</option>
                                    <c:forEach items="${cargos}" var="cargo">
                                        <option value="${cargo.id}" ${param.cargoId == cargo.id ? "selected" : ""} >${cargo.nombre}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-auto">
                        
                        <label for="form-check-label">Estado: </label>
                        <div class="form-check form-check-inline">
        
                            <input class="form-check-input" type="radio" id="cualquiera" name="estado" checked value="">
                            <label class="form-check-label" for="cualquiera">Cualquiera</label><br>
                        </div>
                        <c:forEach var="estado" items="${estados}">

                            <div class="form-check form-check-inline">
                                
                                <input class="form-check-input" type="radio" id="${estado}" name="estado" value="${estado}">
                                <label class="form-check-label" for="${estado}">${estado}</label><br>
                            </div>
                        </c:forEach>
                        
                    </div>
                    <div class="col-auto">
                        
                        <input type="submit" class="btn btn-primary btn-sm" value="Buscar">
                    </div>
                    
                    
                </div>
            </form>
        </div>
        
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
                            <td>
                                <c:if test="${convocatoria.getEstado() != 'cerrado'}">
                                    <a class="btn btn-secondary" href="/convocatoria/${convocatoria.id}">Cerrar convocatoria</a>
                                </c:if>
                            </td>
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
        <script language="JavaScript">
                let mostrar=document.querySelector(convocatoria.getFechaFin())
                if(mostrar!=null){
                    
                }
            </script>
    </layout:put>
</layout:extends>
