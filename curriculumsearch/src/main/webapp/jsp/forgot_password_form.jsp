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
    <link rel="icon" href="../img/LogoRoshka.ico">
    <link href="../css/cargoStyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<a type="button" class="btn btn-xl btn-light m-3" href="/login">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-left" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0v-2z"/>
        <path fill-rule="evenodd" d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
    </svg>
    Volver
</a>
    <jsp:include page="alerts.jsp"/>
    <div class="container mb-3">
        <h2 style="text-align: center;">Recuperacion de Password</h2>
    </div>


    <form:form action="/forgot-password" method="post" style="max-width: 420px; margin: 0 auto;">
        <div class="border border-secondary rounded p-3">
            <div>
                <p>Te enviaremos el link de recuperacion de tu cuenta a tu email</p>
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