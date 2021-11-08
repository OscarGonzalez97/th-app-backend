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
        <form>
            <label for="cargos">Nombre:</label>
            <input type="text" name="nombre" id="nombre" value="${param.nombre}"/>
            <input type="submit" value="Buscar">
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
                        <td><a href="/convocatorias?cargoId=${cargo.id}">Ver Convocatorias</a></td>
                        <td><a href="/cargo/${cargo.id}">Editar cargo</a></td>
                    </tr>
                </c:forEach>
                
              
             
            </tbody>
          </table>
    </div>
    
</body>
</html>