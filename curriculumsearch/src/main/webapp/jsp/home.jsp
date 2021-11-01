<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
    <h1>Hello, world!</h1>

    <form name="postulante" method="post">
        <div class="mb-3 col-5">
          <label for="correo" class="form-label">Email address</label>
          <input type="email" name="correo" class="form-control  " id="correo" aria-describedby="emailHelp">
          <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        </div>

        <div class="mb-3 col-5">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" name="nombre" class="form-control  " id="nombre" aria-describedby="emailHelp">
        </div>
        <div class="mb-3 col-5">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" name="apellido" class="form-control  " id="apellido" aria-describedby="emailHelp">
        </div>

        <div class="mb-3 col-3">
            <label for="ci" class="form-label">Cedula de identidad</label>
            <input type="number" name="ci" class="form-control  " id="ci" aria-describedby="emailHelp">
        </div>
        <div class="mb-3 col-5">
            <label for="ciudad" class="form-label">Ciudad</label>
            <input type="text" name="ciudad" class="form-control  " id="ciudad" aria-describedby="emailHelp">
        </div>

        <div class="mb-3 col-5">
            <label for="telefono" class="form-label">Telefono</label>
            <input type="number" name="telefono" class="form-control  " id="telefono" aria-describedby="emailHelp">
        </div>

        <div class="mb-3 col-5">
            <label for="fechaNacimiento" class="form-label">Fecha de nacimiento</label>
            <input type="date" name="fechaNacimiento" class="form-control  " id="fechaNacimiento" aria-describedby="emailHelp">
        </div>
        <div class="mb-3 col-5">
            <label for="resumen" class="form-label">Resumen</label>
            <textarea  class="form-control  " name="resumen" id="resumen" aria-describedby="emailHelp"> </textarea>
        </div>
        <div class="mb-3 col-5">
            <label for="nivelIngles" class="form-label">Nivel de ingles</label>
            <input type="text" class="form-control"  name="nivelIngles" id="nivelIngles" aria-describedby="emailHelp">
        </div>
        <div class="mb-3 col-5">
            <label for="curriculum" class="form-label">Curriculum</label>
            <input type="text" name="curriculum" class="form-control  " id="curriculum" aria-describedby="emailHelp">
        </div>
        <div class="mb-3 col-5">
            <label for="disponibilidad" class="form-label">Disponibilidad</label>
            <input type="text" class="form-control  " name="disponibilidad" id="disponibilidad" aria-describedby="emailHelp">
        </div>
        <div class="mb-3 col-5">
            <label for="modalidad" class="form-label">Modalidad</label>
            <input type="text" class="form-control  " name="modalidad" id="modalidad" aria-describedby="emailHelp">
        </div>
       
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>