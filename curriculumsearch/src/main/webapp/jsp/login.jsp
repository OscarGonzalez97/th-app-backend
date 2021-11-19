<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="../img/LogoRoshka.ico">
</head>
<body>
<jsp:include page="alerts.jsp"/>
<!-- <section class="vh-100" style="background-color: #508bfc;"> -->
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-10">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">

                        <form:form method="post" action="/login">
                            <h3 class="mb-5">Ingresar</h3>
                            <div align="center">
                                <img src="../img/LogoRoshka.jpg" class="rounded img-fluid" id="image" style="width:auto;height:auto;" alt=""/>
                            </div>
                            <div class="form-outline mb-4">
                                <input type="email" id="typeEmailX-2" class="form-control form-control-lg" name="email" placeholder="example@example.com"/>
                                <label class="form-label" for="typeEmailX-2">Email</label>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="password" id="typePasswordX-2" class="form-control form-control-lg" name="password" />
                                <label class="form-label" for="typePasswordX-2">Password</label>
                            </div>


                            <button class="btn btn-primary btn-lg btn-block" type="submit">Ingresar</button>
                        </form:form>

                        <hr class="my-4">
                        <div class="row">
                            <a href="/forgot-password">Olvidaste tu contrasena?</a>
                        </div>
                        <div class="row">
                            <a href="/register">Registrate</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

