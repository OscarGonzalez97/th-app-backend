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
<body>
   
   <div class="container">
    <form:form class="needs-validation" action="/convocatoria/${convocatoria.id == null ? '' : convocatoria.id}" method="post" modelAttribute="convocatoria" name="convocatoria-form"  >
       
                
                    <div class="mb-3">
                        <form:label path="fechaInicioS" class="form-label ">Fecha inicial</form:label>
                        <form:input type="date" path="fechaInicioS" class="form-control ${ existeFecha ?  'is-invalid' : ''}" placeholder="Fecha requerida" requiered="true" />
                        <div id="validationServerUsernameFeedback1" class="invalid-feedback">
                            Esta fecha ya existe
                        </div>
                    </div>
                    <div class="mb-3">
                        <form:label path="fechaFinS" class="form-label">Fecha Fin</form:label>
                        <form:input type="date" path="fechaFinS" class="form-control ${existeFecha ?  'is-invalid': '' }" placeholder="Fecha requerida" requiered="true" />
                        <div id="validationServerUsernameFeedback2" class="invalid-feedback">
                            Esta fecha ya existe
                        </div>
            
                    </div>
                    <div class="mb-3">
                        <form:label path="cupos" class="form-label">Cupos:</form:label>
                        <form:input type="number" class="form-control" path="cupos"/>
                    </div>
                    <div class="mb-3 form-check">
                        <form:label path="cargoId" class="form-label">Cargo</form:label>
                        <form:select class="form-select" path="cargoId">
                            <c:forEach items="${cargos}" var="cargo">
                                <form:option value="${cargo.id}">${cargo.nombre} </form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                    
                    <button type="submit" class="btn btn-primary" >Guardar</button>
      </form:form>
   </div>
   <script>    
   </script>
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>