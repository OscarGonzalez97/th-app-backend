<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cargo</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <jsp:include page="header.jsp" />
    <jsp:include page="alerts.jsp" />
    <div class="container-xxl my-md-4 bd-layout">
      <div class="card d-flex flex-column justify-content-center align-items-center mx-auto mt-2 p-3" style="width: 20rem;">
          <h5 class="card-title">${cargo.id == null ? "Agregar" : "Modificar"} Cargo</h5>
            <form:form
            action="/cargo/${cargo.id == null ? '' : cargo.id}"
            method="post"
            modelAttribute="cargo"
            class="card-body d-flex flex-column"
            >
            <div class="">
                <form:label class="form-label visually-hidden" path="nombre"
                >Nombre del cargo
                </form:label>
                <form:input
                type="text"
                path="nombre"
                class="form-control"
                placeholder="Nombre del cargo" required="true"
                
                />
            </div>
            <div class="mt-2 align-self-end">
                <input type="submit" value="Guardar" class="btn btn-primary" />
            </div>
            </form:form>
        </div>
    </div>
  </body>
</html>
