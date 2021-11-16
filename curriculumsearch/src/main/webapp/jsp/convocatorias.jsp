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
    <link href="../css/cargoStyle.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body >
    <jsp:include page="header.jsp"/>
    <jsp:include page="alerts.jsp"/>
    <div class="container-xxl my-md-4 bd-layout">
        <h2>Lista de convocatorias</h2>
        <div>
            <form>
                <label for="cargos">Cargos:</label>
                <select  name="cargoId" id="cargos">
                    <option value="">Todos los cargos</option>
                    <c:forEach items="${cargos}" var="cargo">
                        <option value="${cargo.id}" ${param.cargoId == cargo.id ? "selected" : ""} >${cargo.nombre}</option>
                    </c:forEach>
                </select>
                Estado:
                <input type="radio" id="cualquiera" name="isOpen" checked value="">
                <label for="abierto">Cualquiera</label><br>
                <input type="radio" id="abierto" name="isOpen" value="1">
                <label for="abierto">Abierto</label><br>
                <input type="radio" id="cerrado" name="isOpen" value="0">
                <label for="cerrado">Cerrado</label><br>
                <input type="submit" value="Buscar">
            </form>
        </div>
        <div>
            <a href="/convocatoria">Agregar Nueva Convocatoria</a>
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Cargo</th>
                    <th scope="col">Fecha Desde</th>
                    <th scope="col">Fecha Hasta</th>
                    <th scope="col">Vacantes</th>
                  </tr>
                </thead>
                <tbody>
                  
                    <c:forEach items="${convocatorias}" var="convocatoria" varStatus="sta">
                        <tr>
                            <th scope="row">${sta.index+1}</th>
                            <td>${convocatoria.getCargo().getNombre()}</td>
                            <td>${convocatoria.getFechaInicio().toString().split(" ")[0]}</td>
                            <td>${convocatoria.getFechaFin().toString().split(" ")[0]}</td>
                            <td>${convocatoria.getCupos()}</td>
                            <td>Ver Postulantes</td>
                            <td><a href="/convocatoria/${convocatoria.id}">Editar</a></td>
                        </tr>
                    </c:forEach>
                    
                  
                 
                </tbody>
              </table>
             
        </div>
    </div>
    
</body>
</html>