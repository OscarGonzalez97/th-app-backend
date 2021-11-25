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

</head>
<body>
<jsp:include page="alerts.jsp"/>
<div class="container">
        <h2>Cambia tu contraseña</h2>
</div>

<form:form action="/reset-password" method="post" style="max-width: 350px; margin: 0 auto;">
    <input type="hidden" name="token" value="${token}" />
    <div class="border border-secondary rounded p-3">
        <div>
            <p>
                <input type="password" name="password" id="password" class="form-control"
                       placeholder="Enter your new password" required autofocus />
            </p>
            <p class="text-center">
                <input type="submit" value="Change Password" class="btn btn-primary" />
            </p>
        </div>
    </div>
</form:form>
</body>
</html>


