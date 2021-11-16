<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Convocatoria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../css/cargoStyle.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <jsp:include page="alerts.jsp"/>
    <div class="container-xxl my-md-4 bd-layout">
    <h2>Agregar Convocatoria</h2>
    <div class="p-3 mb-2 " style="background-color: transparent;">
        <form:form action="/convocatoria/${convocatoria.id == null ? '' : convocatoria.id}" method="post" modelAttribute="convocatoria">
            <div class="mb-3 col-3">
                <form:label path="fechaInicioS" class="form-label">Fecha inicial</form:label>
                <form:input type="date" class="form-control" path="fechaInicioS" required="true"/>
              
            </div>
            <div class="mb-3 col-3">
                <form:label path="fechaFinS" class="form-label">Fecha Fin</form:label>
                <form:input type="date" class="form-control" path="fechaFinS" required="true"/>
            </div>
            <div class="mb-3 col-3">
                <form:label path="cupos" class="form-label">Cupos:</form:label>
                <form:input type="number" class="form-control" path="cupos" required="true"/>
            </div>
            <div class="mb-3 col-3">
                <form:label path="cargoId" class="form-label">Cargo</form:label>
                <form:select class="form-select" path="cargoId" required="true">
                    <c:forEach items="${cargos}" var="cargo">
                        <form:option value="${cargo.id}">${cargo.nombre} </form:option>
                    </c:forEach>
                </form:select>
            </div>
            <button type="submit" class="btn btn-primary">Guardar</button>
          </form:form>
    </div>
   </div>
</body>
</html>