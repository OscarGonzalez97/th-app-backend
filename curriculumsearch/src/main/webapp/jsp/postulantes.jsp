<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="layouts/base.jsp">
    <layout:put block="cssDeclaracion" type="APPEND"></layout:put>
    <layout:put block="contents" type="REPLACE">
      <h2>Lista de Postulantes</h2>
      <div id="buscador">
        <form name="buscador">
          <label for="nombre">Nombre</label>
         <input type="text" name="nombre" id="nombre" value="${param.nombre}">
         <button>Buscar</button>
         <br>
           <label for="estado">Estado</label>
           <select name="estado" id="estado">
             <option value="">Seleccione una opcion</option>
             <c:forEach items="${estadoP}" var="estados">
               <option value="${estados}" ${param.estado == estados ? "selected" : ""}>${estados.getEstado()}</option>
             </c:forEach>
           </select>
           <label for="dispo">Disponbilidad</label>
           <select name="dispo" id="dispo">
             <option value="">Seleccione una opcion</option>
             <c:forEach items="${disponibilidades}" var="disponibilidad">
               <option value="${disponibilidad}" ${param.dispo == disponibilidad ? "selected" : ""}>${disponibilidad.getDescripcion()}</option>
             </c:forEach>
           </select>
           <label for="tecId">Tecnologias</label>
           <select name="tecId" id="tecId">
             <option value="">Seleccione una opcion</option>
             <c:forEach items="${tecnologias}" var="tecnologia">
               <option value="${tecnologia.id}" ${param.tecId == tecnologia.id ? "selected" : ""}>${tecnologia.nombre}</option>
             </c:forEach>
           </select>
           <label for="instId">Institucion Educativa</label>
           <select name="instId" id="instId">
             <option value="">Seleccione una opcion</option>
             <c:forEach items="${institucionesEducativas}" var="inst">
               <option value="${inst.id}" ${param.instId == inst.id ? "selected" : ""}>${inst.nombre}</option>
             </c:forEach>
           </select>
           <br>
           <br>
           <label for="lvlEng">Nivel de Ingles</label>
           <select name="lvlEng" id="lvlEng">
             <option value="">Seleccione una opcion</option>
             <c:forEach var = "lvl" begin = "1" end = "5">
               <option value="${lvl}" ${param.lvlEng == lvl ? "selected" : ""}>${lvl}</option>
             </c:forEach>
           </select>
           <label for="lvlTec">Nivel de Tecnologia</label>
           <select name="lvlTec" id="lvlTec">
             <option value="">Seleccione una opcion</option>
             <c:forEach var = "lvl" begin = "1" end = "5">
               <option value="${lvl}" ${param.lvlTec == lvl ? "selected" : ""}>${lvl}</option>
             </c:forEach>
           </select>
           <label for="expInMonths">Experiencia en general</label>
           <select name="expInMonths" id="expInMonths">
             <option value="">Seleccione una opcion</option>
             <option value="6">Mayor a 6 meses</option>
             <option value="12">Mayor a 1 año</option>
             <option value="36">Mayor a 3 años</option>
             <option value="60">Mayor a 5 años</option>
           </select>
          <label for="convId">convocatoria</label>
           <select name="convId" id="convId">
             <option value="">Seleccione una opcion</option>
             <c:forEach items="${convocatoriaC}" var="convo">
               <option value="${convo.id}" ${param.convId == convo.id ? "selected" : ""}>${convo.getCargo().getNombre()}</option>
             </c:forEach>
           </select>
        </form>
      </div>
      <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nombre</th>
              <th scope="col">Disponibilidad</th>
              <th scope="col">Nivel de Ingles</th>
              <th scope="col">Experiencia</th>
              <th scope="col">Tecnologias</th>
              <th scope="col">Estado</th>
            </tr>
          </thead>
          <tbody>
              <c:forEach items="${postulantes}" var="postulante" varStatus="staPost">
                  <tr>
                      <th scope="row">${staPost.index + 1}</th>
                      <td>${postulante.nombre} ${postulante.apellido}</td>
                      <td>${postulante.disponibilidad.getDescripcion()}</td>
                      <td>${postulante.nivelIngles}</td>
                      <td>${postulante.experienciaMeses}<op></td>
                      <td>
                          <c:forEach items="${postulante.tecnologias}" var="detalle_tecnologia" varStatus="staTec">
                              ${detalle_tecnologia.getTecnologia().getNombre()}${not staTec.last ? "," : ""}
                          </c:forEach>
                      </td>
                      <td>${postulante.estado.getEstado()}</td>
                      <td><a href="/postulantes/${postulante.id}">Ver</a></td>
                  </tr>
              </c:forEach>
            </tbody>
  
      </table>
      <div>
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <c:forEach begin="1" end="${pages}" var="nro">
              <li class="page-item ${(param.nroPagina == null and nro == 1)  or param.nroPagina == nro-1 ? 'active' : ''}"><a class="page-link" href="javascript:buscarPagina(${nro})">${nro}</a></li>
            </c:forEach>
          </ul>
        </nav>
      </div>
    </layout:put>
    <layout:put block="scripts" type="APPEND">
      <script>
        function habilitarLvlTec(){
          //si se selecciono una tecnologia entonces permitir seleccionar un nivel
          lvlTec.disabled = tecId.value == false
          if(lvlTec.disabled){
            lvlTec.firstElementChild.selected=true;
          }
          
        }
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
        const tecId = document.querySelector("#tecId");
        const lvlTec = document.querySelector("#lvlTec");
        tecId.addEventListener('change',habilitarLvlTec);
        habilitarLvlTec()
      </script>
    </layout:put>
</layout:extends>
