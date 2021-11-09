<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title>Lista de postulantes</title>
</head>
<body class="container">
    <div id="buscador">
       <form name="buscador">
         <label for="nombre">Nombre</label>
        <input type="text" name="nombre" id="nombre" value="${param.nombre}">
        <button>Buscar</button>
        <br>
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
          </tr>
        </thead>
        <tbody>
            <c:forEach items="${postulantes}" var="postulante" varStatus="staPost">
                <tr>
                    <th scope="row">${staPost.index + 1}</th>
                    <td>${postulante.nombre} ${postulante.apellido}</td>
                    <td>${postulante.disponibilidad.getDescripcion()}</td>
                    <td>${postulante.nivelIngles}</td>
                    <td>${postulante.experienciaMeses}</td>
                    <td>
                        <c:forEach items="${postulante.tecnologias}" var="detalle_tecnologia" varStatus="staTec">
                         ${detalle_tecnologia.getTecnologia().getNombre()}${not staTec.last ? "," : ""}
                        </c:forEach>
                    </td>
                  </tr>
            </c:forEach>
          
          
        </tbody>
      </table>
      <div id="paginator">

      </div>
      <script>
        function habilitarLvlTec(){
          //si se selecciono una tecnologia entonces permitir seleccionar un nivel
          lvlTec.disabled = tecId.value == false
          if(lvlTec.disabled){
            lvlTec.firstElementChild.selected=true;
          }
          
        }
        const tecId = document.querySelector("#tecId");
        const lvlTec = document.querySelector("#lvlTec");
        tecId.addEventListener('change',habilitarLvlTec);
        habilitarLvlTec()
      </script>
</body>
</html>