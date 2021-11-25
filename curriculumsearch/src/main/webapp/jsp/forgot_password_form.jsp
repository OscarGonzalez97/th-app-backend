<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="icon" href="/img/LogoRoshka.ico">

</head>
<body>
    <jsp:include page="alerts.jsp"/>
    <div class="container">
        <h2 class="col float-center">Recuperación de Contraseña</h2>
    </div>


    <form:form action="/forgot-password" method="post" style="max-width: 420px; margin: 0 auto;">
        <div class="border border-secondary rounded p-3">
            <div>
                <p>Te enviaremos el link de recuperación de tu cuenta a tu email</p>
            </div>
            <div>
                <p>
                    <input type="email" name="email" class="form-control" placeholder="Enter your e-mail" required autofocus/>
                </p>
                <p class="text-center">
                    <input type="submit" value="Send" class="btn btn-primary" />
                </p>
            </div>
        </div>
    </form:form>
</body>
</html>