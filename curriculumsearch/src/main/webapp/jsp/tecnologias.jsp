<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tecnologia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../css/cargoStyle.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <jsp:include page="alerts.jsp"/>
    <div class="container-xxl my-md-4 bd-layout">
        <h2>Lista de Tecnologias</h2>

        <div>
            <form>
                <label for="tecnologias">Nombre:</label>
                <input type="text" name="nombre" id="nombre" value="${param.nombre}"/>
                <input type="submit" value="Buscar">
            </form>
            <a href="/tecnologia">Agregar Nueva Tecnologia</a>
        </div>
        <div>
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tecnologia</th>
                  </tr>
                </thead>
                <tbody>
                  
                    <c:forEach items="${tecnologias}" var="tecnologia" varStatus="sta">
                        <tr>
                            <th scope="row">${sta.index+1}</th>
                            <td>${tecnologia.getNombre()}</td>
                           
                            <td><a href="/tecnologia/${tecnologia.id}">Editar tecnologia</a></td>
                        </tr>
                    </c:forEach>
                    
                  
                 
                </tbody>
              </table>
        </div>
    </div>
    
</body>
</html>