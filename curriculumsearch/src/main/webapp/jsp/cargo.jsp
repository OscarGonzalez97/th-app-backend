<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cargo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body class="container">
    <div>
        Cargos:
        <select class="form-select" name="cargos" id="cargos">
            <option value="-1">Todos los cargos</option>
            <c:forEach items="${cargos}" var="cargo">
                <option value="${cargo.id}" ${param.cargoId == cargo.id ? "selected" : ""} >${cargo.nombre}</option>
            </c:forEach>
        </select>
        <a href="/cargo">Agregar Nuevo Cargo</a>
    </div>
    <div>
        <a href="/convocatoria">Agregar Nueva Convocatoria</a>
        <table class="table">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Fecha Desde</th>
                <th scope="col">Fecha Hasta</th>
                <th scope="col">Vacantes</th>
              </tr>
            </thead>
            <tbody>
              
                <c:forEach items="${convocatorias}" var="convocatoria" varStatus="sta">
                    <tr>
                        <th scope="row">${sta.index+1}</th>
                        <td>${convocatoria.getFechaInicio().toString().split(" ")[0]}</td>
                        <td>${convocatoria.getFechaFin().toString().split(" ")[0]}</td>
                        <td>${convocatoria.getCupos()}</td>
                        <td>Ver Postulantes</td>
                    </tr>
                </c:forEach>
                
              
             
            </tbody>
          </table>
    </div>
    <script>
        document.querySelector("#cargos").addEventListener("change",evt=>{
            const cargoId = evt.target.value;
            if(cargoId == -1) location.assign("/cargos");
            else location.assign("/cargos?cargoId="+cargoId)
        })
    </script>
</body>
</html>