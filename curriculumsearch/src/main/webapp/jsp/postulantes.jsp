<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="APPEND">
    <link href="../css/PostulanteStyle.css" rel="stylesheet" type="text/css"/> 
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    </layout:put>
    <layout:put block="contents" type="REPLACE">
      <h2>Lista de Postulantes</h2>
      <div id="buscador">
        <form name="buscador">
          <div class="row justify-content-start gy-2">
            
            <div class="col-auto">
              <input type="text" placeholder="Nombre" name="nombre" id="nombre" class="form-control" value="${param.nombre}">
            </div>
            <div class="col-auto">
              <button class="btn btn-primary">Buscar</button>
            </div>
            <div class="col" style="float: left;">
              <a href="/postulantesExcel?${query}" type="button" class="btn btn-light float-end">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-excel-fill" viewBox="0 0 16 16">
                      <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM5.884 6.68 8 9.219l2.116-2.54a.5.5 0 1 1 .768.641L8.651 10l2.233 2.68a.5.5 0 0 1-.768.64L8 10.781l-2.116 2.54a.5.5 0 0 1-.768-.641L7.349 10 5.116 7.32a.5.5 0 1 1 .768-.64z"></path>
                  </svg>
                  Excel
              </a>
          </div>
          </div>
          
          <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 gy-1 mt-2">

           <div class="col">
  
             <div class="row">
               <div class="col-auto col-md-4">
                <label class="form-label" for="estado">Estado</label>

               </div>
               <div class="col-auto col-md-8">
                <select class="form-select form-select-sm " name="estado" id="estado">
                  <option value="">Todas</option>
                  <c:forEach items="${estadoP}" var="estados">
                    <option value="${estados}" ${param.estado == estados ? "selected" : ""}>${estados.getEstado()}</option>
                  </c:forEach>
                </select>
               </div>
          </div>
          </div>
          <div class="col">
            <div class="row">
             <div class="col-auto col-md-4">
               <label class="form-label" for="expInMonths">Experiencia en general</label>

             </div>
              <div class="col-auto col-md-8">
                <select class="form-select form-select-sm " name="expInMonths" id="expInMonths">
                  <option value="">Todas</option>
                    <option value="0-6" ${param.expInMonths == "0-6" ? "selected" : ""}>Menor a 6 meses</option>
                    <option value="0-12" ${param.expInMonths == "0-12" ? "selected" : ""}>Menor a 1 año</option>
                    <option value="0-36" ${param.expInMonths == "0-36" ? "selected" : ""}>Menor a 3 años</option>
                    <option value="0-60" ${param.expInMonths == "0-60" ? "selected" : ""}>Menor a 5 años</option>
                    <option value="60-1200" ${param.expInMonths == "60-1200" ? "selected" : ""}>Mayor a 5 años</option>
                </select>

              </div>        
            </div>
         </div>
           
         <div class="col">
          <div class="row">
            <div class="col-auto col-md-4">
              <label class="form-label" for="cargoId">Cargo</label>
            </div>
            <div class="col-auto col-md-8">
              <select class="form-select form-select-sm " name="cargoId" id="cargoId">
                <option value="">Todas</option>
                <c:forEach items="${cargos}" var="cargo">
                  <option value="${cargo.id}" ${param.cargoId == cargo.id ? "selected" : ""}>${cargo.getNombre()}</option>
                </c:forEach>
              </select>
            </div>
          </div>           
        </div>
      <div class="col">
        <div class="row" id="convocatoriaBlock" style="display: none;">
          <div class="col-auto col-md-4">
            <label class="form-label" for="convId">Convocatoria</label>
          </div>
          <div class="col-auto col-md-8">
            <select class="form-select form-select-sm " name="convId" id="convId">
              <option value="">Todas</option>
            </select>
          </div>
        </div>           
      </div>
      <div class="col">
        <div class="row">
          <div class="col-auto col-md-4">
            <label class="form-label" for="instId">Institución Educativa</label>

          </div>
          <div class="col-auto col-md-8">
            <select class="form-select form-select-sm " name="instId" id="instId">
              <option value="">Todas</option>
              <c:forEach items="${institucionesEducativas}" var="inst">
                <option value="${inst.id}" ${param.instId == inst.id ? "selected" : ""}>${inst.nombre}</option>
              </c:forEach>
            </select>
          </div>
        </div>
         
       
      </div>
             <div class="col">
              <div class="row">
                <div class="col-auto col-md-4">
                  <label class="form-label" for="lvlEng">Nivel de Inglés</label>
                </div>
                <div class="col-auto col-md-8">
                  <select class="form-select form-select-sm " name="lvlEng" id="lvlEng">
                    <option value="">Todas</option>
                    <option value="1">Básico</option>
                    <option value="2">Regular</option>
                    <option value="3">Intermedio</option>
                    <option value="4">Avanzado</option>
                    <option value="5">Proficiente</option>
                    
                  </select>
                </div>
              </div>
               
             
              
            </div>
            
          
          <div class="col">

            <div class="row">
              <div class="col-auto col-md-4">
                <label class="form-label" for="tecId">Tecnologías</label>

              </div>
              <div class="col-auto col-md-8">
                <select class="form-select form-select-sm " name="tecId" id="tecId">
                  <option value="">Todas</option>
                  <c:forEach items="${tecnologias}" var="tecnologia">
                    <option value="${tecnologia.id}" ${param.tecId == tecnologia.id ? "selected" : ""}>${tecnologia.nombre}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
          </div>
          
          <div class="col">
            <div class="row" id="lvlTecBlock">
              <div class="col-auto col-md-4">
                <label class="form-label" for="lvlTec">Nivel de Tecnología</label>
              </div>
              <div class="col-auto col-md-8">
                <select class="form-select form-select-sm" name="lvlTec" id="lvlTec">
                  <option value="">Todas</option>
                  <c:forEach var = "lvl" begin = "1" end = "5">
                    <option value="${lvl}" ${param.lvlTec == lvl ? "selected" : ""}>${lvl}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
             
            
            
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
                  <th scope="col">Nombre</th>
                  <th scope="col">Nivel de Inglés</th>
                  <th scope="col">Experiencia</th>
                  <th scope="col">Tecnologías</th>
                  <th scope="col">Estado</th>
                </tr>
              </thead>
              <tbody>
                  <c:forEach items="${postulantes}" var="postulante" varStatus="staPost">
                      <tr>
                          <th scope="row">${staPost.index + 1}</th>
                          <td>${postulante.nombre} ${postulante.apellido}</td>
                          <td>${postulante.nivelIngles}</td>
                          <td><c:choose>
         
                            <c:when test = "${postulante.experienciaMeses < 12}">
                               ${postulante.experienciaMeses} mes<c:if test="${postulante.experienciaMeses > 1}">es</c:if>
                            </c:when>
                            
                            <c:when test = "${postulante.experienciaMeses > 12}">
                              <fmt:parseNumber var="j" integerOnly="true" type="NUMBER" value="${postulante.experienciaMeses / 12}" parseLocale="en_US" />  
                              <fmt:parseNumber var="k" integerOnly="true" type="NUMBER" value="${postulante.experienciaMeses % 12}"  parseLocale="en_US" />  
                               ${j} año<c:if test="${postulante.experienciaMeses >= 24}">s</c:if> <c:if test="${k > 0}"> y ${k} mes<c:if test="${k > 1}">es</c:if></c:if> 
                            </c:when>

                         </c:choose>
                         </td>
                          <td>
                              <c:forEach items="${postulante.tecnologias}" var="detalle_tecnologia" varStatus="staTec">
                                  ${detalle_tecnologia.getTecnologia().getNombre()}${not staTec.last ? "," : ""}
                              </c:forEach>
                          </td>
                          <td>${postulante.estado.getEstado()}</td>
                          <td><a href="/postulantes/${postulante.id}"><i class="bi bi-eye-fill"></i></a></td>
                      </tr>
                  </c:forEach>
                </tbody>
      
          </table>
          </div>
          
        </div>
        <div class="card-footer">
          <div>
            <nav aria-label="Page navigation example">
              <div class="row">
                  <div class="col-md-10">
                      <ul class="pagination">
                          <c:forEach begin="1" end="${pages}" var="nro">
                              <li class="page-item ${(param.nroPagina == null and nro == 1)  or param.nroPagina == nro-1 ? 'active' : ''}"><a class="page-link" href="javascript:buscarPagina(${nro})">${nro}</a></li>
                          </c:forEach>
                      </ul>
                  </div>
                  <div class="col-md-2">
                      <span class="badge bg-light text-dark">Postulantes: ${numeroOcurrencias}</span>
                  </div>
              </div>
            </nav>
          </div>
        </div>
      </div>
     
    
      
    </layout:put>
    <layout:put block="scripts" type="APPEND">
      <script>
        var convocatorias = ${convocatoriaC};
      </script>
      <script src="./Convo.js"></script>
      <script>
        function habilitarLvlTec(){
          //si se selecciono una tecnologia entonces permitir seleccionar un nivel
          lvlTec.disabled = tecId.value == false
          if(lvlTec.disabled){
            lvlTec.firstElementChild.selected=true;
            lvlTecBlock.style.display = "none";
          }
          else{
            lvlTecBlock.style.display = "";
          }
          
        }

        
        const tecId = document.querySelector("#tecId");
        const lvlTec = document.querySelector("#lvlTec");
        const lvlTecBlock = document.querySelector("#lvlTecBlock");
        tecId.addEventListener('change',habilitarLvlTec);
        habilitarLvlTec()


      </script>
    </layout:put>
</layout:extends>
