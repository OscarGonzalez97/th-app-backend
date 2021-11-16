<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title>Agregar Tecnologia</title>
    <link href="../css/cargoStyle.css" rel="stylesheet" type="text/css"/>

</head>
<body>
    <jsp:include page="header.jsp"/>
    <jsp:include page="alerts.jsp"/>
    <div class="container-xxl my-md-4 bd-layout">
        <h2>Agregar Tecnologia</h2>
        <div class="p-3 mb-2 ">

            <form:form action="/tecnologia/${tecnologia.id == null ? '' : tecnologia.id}"  method="post" modelAttribute="tecnologia" class="row row-cols-lg-auto g-3 align-items-center">
            <div class="col-12">
                <form:label class="form-label visually-hidden"  path="nombre">Nombre: </form:label> <form:input type="text" path="nombre" class="form-control" required="true" placeholder="Nombre de la tecnologia"/>
            </div>
            <div class="col-12">
                <input type="submit" value="Guardar" class="btn btn-primary"/>
            </div>
            </form:form>
        </div>
    </div>





</body>



</html>