<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>

    <style type="text/css" media="screen">
          body {
    background-color: blue
}

.card {
    border: none
}

.image {
    position: relative
}

.image span {
    background-color: blue;
    color: #fff;
    padding: 6px;
    height: 30px;
    width: 30px;
    border-radius: 50%;
    font-size: 13px;
    position: absolute;
    display: flex;
    justify-content: center;
    align-items: center;
    top: -0px;
    right: 0px
}

.user-details h4 {
    color: blue
}

.ratings {
    font-size: 30px;
    font-weight: 600;
    display: flex;
    justify-content: left;
    align-items: center;
    color: #f9b43a
}

.user-details span {
    text-align: left
}

.inputs label {
    display: flex;
    margin-left: 3px;
    font-weight: 500;
    font-size: 13px;
    margin-bottom: 4px
}

.inputs input {
    font-size: 14px;
    height: 40px;
    border: 2px solid #ced4da
}

.inputs input:focus {
    box-shadow: none;
    border: 2px solid blue
}

.about-inputs label {
    display: flex;
    margin-left: 3px;
    font-weight: 500;
    font-size: 13px;
    margin-bottom: 4px
}

.about-inputs textarea {
    font-size: 14px;
    height: 100px;
    border: 2px solid #ced4da;
    resize: none
}

.about-inputs textarea:focus {
    box-shadow: none
}

.btn {
    font-weight: 600
}

.btn:focus {
    box-shadow: none
}

select {
    display: block;
    width: 100%;
    border: 1px solid #ddd;
    border-radius: 10px;
    height: 40px;
    padding: 5px 10px
}

select:focus {
    outline: none
}
    </style>


  </head>
  <body class="container">

    <form name="postulante" method="post">

                        <div class="container mt-3">
                          <div class="card p-3 text-center">
                              <div class="d-flex flex-row justify-content-center mb-3">
                                  <div class="image"> <img src="https://i.imgur.com/hczKIze.jpg" class="rounded-circle"> <span><i class='bx bxs-camera-plus'></i></span> </div>
                                  <div class="d-flex flex-column ms-3 user-details">
                                      <h4 class="mb-0">Zenda Grace</h4>
                                      <div class="ratings"> <span>4.0</span> <i class='bx bx-star ms-1'></i> </div> <span>Pro Member</span>
                                  </div>
                              </div>
                              <h4>Edit Profile</h4>
                              <div class="row">
                                  <div class="mb-3 col-md-6">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" name="nombre" class="form-control  " id="nombre" >
                                  </div>
                                  
                                  <div class="mb-3 col-md-6">
                                    <label for="apellido" class="form-label">Apellido</label>
                                    <input type="text" name="apellido" class="form-control  " id="apellido" >
                                  </div>
          

                                  <div class="mb-3 col-md-6">
                                    <label for="correo" class="form-label">Email address</label>
                                    <input type="email" name="correo" class="form-control  " id="correo" >
                                  </div>
                                  
                    
                              
                                  <div class="col-md-6">
                                    <label for="ci" class="form-label">Cedula de identidad</label>
                                    <input type="number" name="ci" class="form-control  " id="ci" >
                                  </div>
                                  
                                  <div class="col-md-6">
                                    <label form="ciudad" class="form-label">Ciudad</label>
                                    <input type="text" name="ciudad" class="form-control " id="ciudad" >
                                  </div>
                                  <div class="mb-3 col-md-6">
                                    <label for="telefono" class="form-label">Telefono</label>
                                    <input type="number" name="telefono" class="form-control  " id="telefono" >
                                  </div>

                                <div class="mb-3 col-md-6">
                                  <label for="fechaNacimiento" class="form-label">Fecha de nacimiento</label>
                                  <input type="date" name="fechaNacimiento" class="form-control  " id="fechaNacimiento" >
                                </div>
                              
                        
                                <div class="col-md-6"> <label for="nivelIngles"> Nivel de ingles</label> <select name="nivelIngles" id="nivelIngles" class="bg-light">
                                  <option value="1" selected>1</option>
                                  <option value="2" >2</option>
                                  <option value="3" >3</option>
                                  <option value="4" >4</option>
                                  <option value="5" >5</option>
                                 
                      
                                </select> </div>

                                <div class="col-md-6"> <label for="disponibilidad"> Disponibilidad</label> <select name="disponibilidad" id="disponibilidad" class="bg-light">
                                  <option value="Tiempo completo" selected>Tiempo completo</option>
                                  <option value="Medio tiempo">Medio tiempo</option>
                      
                                </select> </div>
                                
                                <div class="col-md-6"> <label for="modalidad"> Modalidad</label> <select name="modalidad" id="modalidad" class="bg-light">
                                  <option value="Pesencial" selected>Presencial</option>
                                  <option value="Semi presencial">Semi presencial</option>
                                  <option value="Remoto">Remoto</option>
                      
                                </select> </div>
                                <div class="mb-3 col-md-6">
                                  <label for="curriculum" class="form-label">Curriculum</label>
                                  <input type="text" name="curriculum" class="form-control  " id="curriculum" >
                                </div>

                              </div>

                              <div class="row">
                                <div class="class about-inputs">
                                  <label for="resumen" class="form-label">Resumen</label>
                                  <textarea  class="form-control  " name="resumen" id="resumen" > </textarea>
                                </div>
                                   
                            </div>
                          
                                  <div class="p-3 py-5">
                                    <div class="d-flex justify-content-between align-items-center experience"><span>Edit Experience</span><span class="border px-3 p-1 add-experience"  data-toggle="modal" data-target="#experienciaForm"><i class="fa fa-plus"></i>&nbsp;Experience</span></div><br>   
                                </div>
                              <div class="mt-3 gap-2 d-flex justify-content-end"> <button class="px-3 btn btn-sm btn-outline-primary">Cancel</button> <button class="px-3 btn btn-sm btn-primary" type="submit">Save</button> </div>
                          </div>
                      </div>

  
  
      </form>

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
                    <input type="cargo" class="form-control  " name="cargo" id="cargo" >
                    <label for="refNombre" class="form-label">Referencia Nombre</label>
                    <input type="text" class="form-control  " name="referencias" id="refNombre" >
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" onclick="agregarFieldExpierncia()" data-dismiss="modal">Agregar</button>
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