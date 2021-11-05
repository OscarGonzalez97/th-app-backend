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
        <div class="dropdown" id="experiencia">
            <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
              Experiencia
            </a>
          
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <li><a class="dropdown-item" href="#">Junior</a></li>
              <li><a class="dropdown-item" href="#">Semisenior</a></li>
              <li><a class="dropdown-item" href="#">Senior</a></li>
            </ul>
        </div>
        <div class="dropdown" id="tecnologia">
            <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
              Tecnologia
            </a>
          
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <c:forEach items="${tecnologias}" var="tecnologia">
                    <li><a class="dropdown-item" href="?tec=${tecnologia.id}">${tecnologia.nombre}</a></li>
                </c:forEach>
            </ul>
        </div>
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
                    <td>0</td>
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
      
</body>
</html>