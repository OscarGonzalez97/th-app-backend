<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Postulante</title>
  </head>
  <body class="container">
    <h1>Curriculum</h1>

    <form name="postulante" method="post">
        <div class="mb-3 col-5">
          <label for="correo" class="form-label">Email address</label>
          <input type="email" name="correo" class="form-control  " id="correo" >
          <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        </div>

        <div class="mb-3 col-5">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" name="nombre" class="form-control  " id="nombre" >
        </div>
        <div class="mb-3 col-5">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" name="apellido" class="form-control  " id="apellido" >
        </div>

        <div class="mb-3 col-3">
            <label for="ci" class="form-label">Cedula de identidad</label>
            <input type="number" name="ci" class="form-control  " id="ci" >
        </div>
        <div class="mb-3 col-5">
            <label for="ciudad" class="form-label">Ciudad</label>
            <input type="text" name="ciudad" class="form-control  " id="ciudad" >
        </div>

        <div class="mb-3 col-5">
            <label for="telefono" class="form-label">Telefono</label>
            <input type="number" name="telefono" class="form-control  " id="telefono" >
        </div>

        <div class="mb-3 col-5">
            <label for="fechaNacimiento" class="form-label">Fecha de nacimiento</label>
            <input type="date" name="fechaNacimiento" class="form-control  " id="fechaNacimiento" >
        </div>
        <div class="mb-3 col-5">
            <label for="resumen" class="form-label">Resumen</label>
            <textarea  class="form-control  " name="resumen" id="resumen" > </textarea>
        </div>
        <div class="mb-3 col-5">
            <label for="nivelIngles" class="form-label">Nivel de ingles</label>
            <input type="number" class="form-control"  name="nivelIngles" id="nivelIngles" >
        </div>
        <div class="mb-3 col-5">
            <label for="curriculum" class="form-label">Curriculum</label>
            <input type="text" name="curriculum" class="form-control  " id="curriculum" >
        </div>
        <div class="mb-3 col-5">
            <label for="disponibilidad" class="form-label">Disponibilidad</label>
            <input type="text" class="form-control  " name="disponibilidad" id="disponibilidad" >
        </div>
        <div class="mb-3 col-5">
            <label for="modalidad" class="form-label">Modalidad</label>
            <input type="text" class="form-control  " name="modalidad" id="modalidad" >
        </div>     
        <br>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#experienciaForm">
            Agregar Experiencia
        </button>
        <div id="experiencias"></div>
        <br>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#estudioForm">
          Agregar Estudios
       </button>
        <br><br>
        <div id="estudios"></div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>

      <!--Modal de Experiencia-->
      <div class="modal fade" id="experienciaForm" tabindex="-1" role="dialog" aria-labelledby="experienciaForm" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Experiencia</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <form name="experiencia-form">
                    <label for="institucion" class="form-label">Institucion</label>
                    <input type="text" class="form-control  " name="institucion" id="institucion" >
                    <label for="fechaDesde" class="form-label">FechaDesde</label>
                    <input type="date" class="form-control  " name="fechaDesde" id="fechaDesde" >
                    <label for="fechaHasta" class="form-label">Fecha Hasta</label>
                    <input type="date" class="form-control  " name="fechaHasta" id="fechaHasta" >
                    <label for="cargo" class="form-label">Cargo</label>
                    <input type="text" class="form-control  " name="cargo" id="cargo" >
                    
                    <label for="descripcion" class="form-label">Descripcion</label>
                    <textarea  class="form-control  " name="descripcion" id="descripcion" > </textarea>
                    
                    <label for="refNombre" class="form-label">Nombre de la Referencia</label>
                    <input type="text" class="form-control  " name="nombreReferencia" id="refNombre" >
                    <label for="refTel" class="form-label">Telefono de la Referencia</label>
                    <input type="text" class="form-control  " name="telefonoReferencia" id="refTel" >
                    <label class="form-label">Reconocimientos</label>
                    <div class="row mb-3">
                      <div class="col">
                        <input type="text" class="form-control" name="rec-nombre-0" placeholder="Titulo del reconocimiento" aria-label="First name">
                      </div>
                      <div class="col">
                        <input type="text" class="form-control" name="rec-certificado-0" placeholder="Adjuntar archivo" aria-label="Last name">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <div class="col">
                        <input type="text" class="form-control" name="rec-nombre-1" placeholder="Titulo del reconocimiento" aria-label="First name">
                      </div>
                      <div class="col">
                        <input type="text" class="form-control" name="rec-certificado-1" placeholder="Adjuntar archivo" aria-label="Last name">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <div class="col">
                        <input type="text" class="form-control" name="rec-nombre-2" placeholder="Titulo del reconocimiento" aria-label="First name">
                      </div>
                      <div class="col">
                        <input type="text" class="form-control" name="rec-certificado-2" placeholder="Adjuntar archivo" aria-label="Last name">
                      </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" onclick="agregarFieldExpierncia()" data-dismiss="modal">Agregar</button>
            </div>
          </div>
        </div>
      </div>


      <!--Modal de Estudios-->
      <div class="modal fade" id="estudioForm" tabindex="-1" role="dialog" aria-labelledby="estudioForm" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Estudios</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <form name="estudio-form">
                    <label for="tipoDeEstudio" class="form-label">Tipo De Estudio</label>
                    <input type="text" class="form-control  " name="tipoDeEstudio" id="tipoDeEstudio">
                    <label for="institucion" class="form-label">Institucion</label>
                    <input type="text" class="form-control  " name="institucion" id="institucion">                 
                    <label for="fechaDesde" class="form-label">Fecha Desde</label>
                    <input type="date" class="form-control  " name="fechaDesde" id="fechaDesde" >
                    <label for="fechaHasta" class="form-label">Fecha Hasta</label>
                    <input type="date" class="form-control  " name="fechaHasta" id="fechaHasta" >
                    <label for="titulo" class="form-label">Titulo</label>
                    <input type="text" class="form-control  " name="titulo" id="titulo" >

                    <label class="form-label">Reconocimientos</label>
                    <div class="row mb-3">
                      <div class="col">
                        <input type="text" class="form-control" name="rec-nombre-0" placeholder="Titulo del reconocimiento" aria-label="First name">
                      </div>
                      <div class="col">
                        <input type="text" class="form-control" name="rec-certificado-0" placeholder="Adjuntar archivo" aria-label="Last name">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <div class="col">
                        <input type="text" class="form-control" name="rec-nombre-1" placeholder="Titulo del reconocimiento" aria-label="First name">
                      </div>
                      <div class="col">
                        <input type="text" class="form-control" name="rec-certificado-1" placeholder="Adjuntar archivo" aria-label="Last name">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <div class="col">
                        <input type="text" class="form-control" name="rec-nombre-2" placeholder="Titulo del reconocimiento" aria-label="First name">
                      </div>
                      <div class="col">
                        <input type="text" class="form-control" name="rec-certificado-2" placeholder="Adjuntar archivo" aria-label="Last name">
                      </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
              <button type="button" class="btn btn-primary" onclick="agregarFieldEstudio()" data-dismiss="modal">Agregar</button>
            </div>
          </div>
        </div>
      </div>




    <!-- Optional JavaScript; choose one of the two! -->

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="./main.js"></script>
  </body>
</html>