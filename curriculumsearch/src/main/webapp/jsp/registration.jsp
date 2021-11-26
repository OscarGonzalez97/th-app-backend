<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registration Success</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="../css/cargoStyle.css" rel="stylesheet" type="text/css"/>
</head>
<style>
    @media (min-width: 1025px) {
        .h-custom {
            height: 100vh !important;
        }
    }
</style>
<body>
<a type="button" class="btn btn-xl btn-light m-3" href="/login">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-left" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0v-2z"/>
        <path fill-rule="evenodd" d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
    </svg>
    Volver
</a>
<section class="h-100 h-custom">
    <div class="container py-5 h-100">
        <jsp:include page="alerts.jsp"/>
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-8 col-xl-6">
                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2" style="text-align: center;">Información de Registro</h3>
                <div class="card rounded-3">
                    <div class="card-body p-4 p-md-5">


                        <form:form action="/process_register" class="px-md-2" method="POST" modelAttribute="user">
                            <div class="form-outline mb-4">
                                <form:label path="email" class="form-label">Email</form:label>
                                <form:input path="email" type="email" class="form-control" required="required"></form:input>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                        <form:label path="firstName" class="form-label">Nombre </form:label>
                                        <form:input path="firstName" class="form-control"></form:input>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                        <form:label path="lastName" class="form-label">Apellido </form:label>
                                        <form:input path="lastName" class="form-control"></form:input>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-4">
                                <form:label path="password" class="form-label">Contraseña</form:label>
                                <form:input type="password" path="password" class="form-control" required="required"></form:input>
                            </div>
                            <div class="row mb-4 pb-2 pb-md-0 mb-md-5">
                                <div class="col-md-6">

                                    <div class="form-outline">
                                        <label class="form-label" for="form3Example1w" style="width: 600px">Clave de Registro</label>
                                        <input type="password" id="form3Example1w" class="form-control" name="registrationCode" required/>
                                    </div>

                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-lg mb-1">Guardar</button>
                        </form:form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
