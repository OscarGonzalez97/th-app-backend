<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Profile</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<style>
    @media (min-width: 1025px) {
        .h-custom {
            height: 100vh !important;
        }
    }
</style>
<body>
<section class="h-100 h-custom">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-8 col-xl-6">
                <div class="card rounded-3">
                    <img src="https://cdn.pixabay.com/photo/2013/08/09/05/54/layer-170971_960_720.jpg" class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;height: 250px;" alt="Sample photo";>
                    <div class="card-body p-4 p-md-5">
                        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Perfil</h3>

                        <form:form action="/edit-user-data" class="px-md-2" method="POST" modelAttribute="user">
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
                            <div class="row mb-4 pb-2 pb-md-0 mb-md-5">
                                <div class="col-md-6">

                                </div>
                            </div>

                            <button type="submit" class="btn btn-success btn-lg mb-1">Submit</button>
                            <a href="/home" class="btn btn-danger btn-lg mr-3 ml-3 mb-1">Volver</a>
                        </form:form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
