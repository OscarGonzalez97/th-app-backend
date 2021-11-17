<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Curriculum</title>
    <link href="../css/formPostulanteStyle.css" rel="stylesheet" type="text/css"/>
  </head>

  <body class="container">
    <form name="postulante" method="post" class="needs-validation" novalidate>
      <div class="container mt-3">
          <div class="card p-3 text-center">
              <div class="d-flex flex-row justify-content-center mb-3">

              </div>
              <h4>Curriculum</h4>
              <div class="row">
                  <div class="about-inputs  mb-3 col-md-12 center">
                    <label for="resumen" class="form-label">Resumen</label>
                    <textarea  class="form-control center  " name="resumen" id="resumen" required > </textarea>
                    <div class="valid-feedback">
                      Luce Bien!
                    </div>

                  </div>

                  <div class="inputs mb-3 col-md-6">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" name="nombre" class="form-control  " id="nombre" required>
                    <div class="valid-feedback">
                      Luce Bien!
                    </div>
                  </div>

                  <div class="inputs mb-3 col-md-6">
                    <label for="apellido" class="form-label">Apellido</label>
                    <input type="text" name="apellido" class="form-control  " id="apellido" required>
                    <div class="valid-feedback">
                      Luce Bien!
                    </div>
                  </div>


                  <div class="inputs mb-3 col-md-6">
                    <label for="correo" class="form-label">Email address</label>
                    <input type="email" name="correo" class="form-control  " id="correo" required>
                    <div class="valid-feedback">
                      Luce Bien!
                    </div>
                  </div>

                  <div class="inputs mb-3 col-md-6">
                    <label for="nacionalidad" class="form-label"> Nacionalidad</label>
                    <select name="nacionalidad" id="nacionalidad" class="bg-light">
                      <c:forEach items="${nacionalidades}" var="nacionalidad">
                        <option value="${nacionalidad.getDescripcion()}">${nacionalidad.getDescripcion()}</option>
                      </c:forEach>

                  </select> </div>

                  <div class="inputs mb-3 col-md-6">
                    <label for="tipoDocumento" class="form-label"> Tipo de documento</label>
                    <select name="tipoDocumento" id="tipoDocumento" class="bg-light" required onchange='carg(this.value);'>
                        <option value='CI' selected>C.I</option>
                        <option value='PAS'>Pasport</option>
                        <option value='Otro'>Otro</option>
                    </select>
                  </div>

                  <div class="inputs  mb-3 col-md-6">
                    <label for="nroDocument" class="form-label">Numero de Documento</label>
                    <input type="number" name="nroDocument" class="form-control  " id="nroDocument" required>
                    <div class="valid-feedback">
                      Luce Bien!
                    </div>
                  </div>

                  <div class="inputs mb-3 col-md-6">
                    <label for="departamentos" class="form-label"> Departamentos</label>
                    <select  id="departamentos" class="bg-light">
                      <c:forEach items="${departamentos}" var="departamentos">
                        <option value="${departamentos.getId()}">${departamentos.getNombre()}</option>
                      </c:forEach>

                    </select>
                  </div>

                  <div class="inputs mb-3 col-md-6">
                    <label for="ciudad" class="form-label"> Ciudad</label>
                    <select name="ciudadId" id="ciudad" class="bg-light">


                     </select>
                </div>
                  <div class="inputs mb-3 col-md-6">
                    <label for="telefono" class="form-label">Telefono</label>
                    <input type="number" name="telefono" class="form-control  " id="telefono" required>
                    <div class="valid-feedback">
                      Luce Bien!
                    </div>
                  </div>

                  <div class="inputs mb-3 col-md-6">
                    <label for="fechaNacimiento" class="form-label">Fecha de nacimiento</label>
                    <input type="date" name="fechaNacimiento" class="form-control  " id="fechaNacimiento" required>
                    <div class="valid-feedback">
                      Luce Bien!
                    </div>
                  </div>


                  <div class="inputs mb-3 col-md-4"> <label for="nivelIngles" class="form-label"> Nivel de ingles</label>
                    <select name="nivelIngles" id="nivelIngles" class="content-select">
                    <option value="1" selected>Ingles muy basico</option>
                    <option value="2" >Comprendo algunas cosas y puedo leer con la ayuda del traductor</option>
                    <option value="3" >Puedo leer tranquilamente</option>
                    <option value="4" >Puedo escribir documentacion</option>
                    <option value="5" >Puedo escribir y hablar tranquilamente</option>
                    </select>
                  </div>

                  <div class="inputs mb-3 col-md-4">
                    <label for="disponibilidad" class="form-label"> Disponibilidad</label>
                    <select name="disponibilidad" id="disponibilidad" class="content-select">
                      <c:forEach items="${disponibilidades}" var="disponibilidad">
                        <option value="${disponibilidad.getCode()}">${disponibilidad.getDescripcion()}</option>
                      </c:forEach>

                  </select> </div>

                  <div class="inputs mb-3 col-md-4">
                    <label for="estadoCivil" class="form-label"> Estado Civil</label>
                    <select name="estadoCivil" id="estadoCivil" class="content-select">
                      <c:forEach items="${estadosCiviles}" var="estadoCivil">
                        <option value="${estadoCivil.getDescripcion()}">${estadoCivil.getDescripcion()}</option>
                      </c:forEach>


                  </select> </div>

                  <div class="inputs p-3 py-5">
                    <div class="inputs d-flex justify-content-between align-items-center experience">
                        <span class="border px-3 p-1 add-experience"  data-toggle="modal" data-target="#cargoForm">
                            <i class="fa fa-plus"></i>&nbsp;Cargo al que postulas
                        </span>
                    </div><br>
                  </div>
                  <p id="no-valid-cargo" style="display: none; color: darkred; border: solid 1px darkred; border-radius: 25px; width: 75%" class="m-3">
                      *Agrega por lo menos un cargo</p>

                  <div class="mt-3 gap-2 d-flex justify-content-between" id="cargos">
                  </div>


                  <div class="inputs p-3 py-5">
                    <div class=" inputs d-flex justify-content-between align-items-center experience">
                        <span class="border px-3 p-1 add-experience"  data-toggle="modal" data-target="#experienciaForm">
                            <i class="fa fa-plus"></i>&nbsp;Agregar Experiencia
                        </span>
                    </div><br>
                  </div>

                  <div class="mt-3 gap-2 d-flex justify-content-between" id="experiencias">
                  </div>


                  <div class=" p-3 py-5">
                   <div class="  d-flex justify-content-between align-items-center experience">
                       <span class="border px-3 p-1 add-experience"  data-toggle="modal" data-target="#estudioForm">
                           <i class="fa fa-plus"></i>&nbsp;Agregar Estudio
                       </span>
                   </div><br>
                  </div>

                  <div class="mt-3 gap-2 d-flex justify-content-between" id="estudios">
                  </div>


                <div class=" p-3 py-5">
                  <div class="  d-flex justify-content-between align-items-center experience">
                      <span class="border px-3 p-1 add-experience"  data-toggle="modal" data-target="#tecnologiaForm">
                          <i class="fa fa-plus"></i>&nbsp;Agregar Tecnologia
                      </span>
                  </div><br>
                </div>
                  <p id="no-valid-tecno" style="display: none; color: darkred; border: solid 1px darkred; border-radius: 25px; width: 75%" class="m-3">
                      *Agrega por lo menos una tecnologia</p>


                <div class="mt-3 gap-2 d-flex justify-content-between" id="tecnologias">
                </div>


                <div class=" p-3 py-5">
                  <div class="  d-flex justify-content-between align-items-center experience">
                      <span class="border px-3 p-1 add-experience"  data-toggle="modal" data-target="#referenciaForm">
                          <i class="fa fa-plus"></i>&nbsp;Referencias Personales
                      </span>
                  </div><br>
                </div>
                <div class="mt-3 gap-2 d-flex justify-content-between" id="referencia">
                </div>



                <div class="mt-3 gap-2 d-flex justify-content-end">
                  <a class="px-3 btn btn-sm btn-outline-primary" href="/postulante">Cancelar</a>
                  <button class="px-3 btn btn-sm btn-primary" type="submit">Guardar</button>
                </div>
              </div>
          </div>
      </div>
    </form>
    <!---------------------------------------Modal de Cargos disponibles---------------------------------------------------------------->
    <div class="modal fade" id="cargoForm" tabindex="-2" role="dialog" aria-labelledby="cargoForm" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel" >CargosDisponibles</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form name="cargo-form" class="needs-validation" novalidate>
              <label for="cargo-nombre" class="form-label">Cargo</label>
              <div class="input-group mb-3">
                <select class="form-select" name="cargo-id" aria-label="Default select example" required>
                  <option value="-1" selected>Open this select menu</option>
                  <c:forEach items="${CargosDisponibles}" var="convocatoria">
                                <option value="${convocatoria.getId()}">${convocatoria.getCargo().getNombre()}</option>
                  </c:forEach>>
                </select>
              </div>
            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" onclick="agregarFieldCargo()" data-dismiss="modal">Agregar</button>
        </div>
      </div>
    </div>
  </div>  
  <!-------------------------------------------------------------------------------------------------------------------------->

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
                <form name="experiencia-form" class="needs-validation" novalidate>

                        <div class="inputs">
                            <label for="institucionExperiencia" class="inputs form-label">Institucion</label>
                            <input type="text" class="inputs form-control  " name="institucion" id="institucionExperiencia" required>
                        </div>
                        <div class="inputs">
                            <label for="fechaDesdeExperiencia" class="form-label">Fecha Desde</label>
                            <input type="date" class="form-control" name="fechaDesde" id="fechaDesdeExperiencia" required>
                        </div>
                         
                        <div class="inputs">
                            <label for="fechaHastaExperiencia" class="form-label">Fecha Hasta</label>
                            <input type="date" class="form-control" name="fechaHasta" id="fechaHastaExperiencia" >
                        </div>
                        
                        <div class="inputs">
                            <label for="cargo" class="form-label">Cargo</label>
                            <input type="text" class="form-control " name="cargo" id="cargo" required>
                        </div>

                        <div class="inputs">
                          <label for="descripcion" class="form-label">Descripcion</label>
                          <textarea  class="form-control  " name="descripcion" id="descripcion"> </textarea>

                        </div>
                        <div class="inputs">
                          <label for="refNombre" class="form-label">Nombre de la Referencia</label>
                          <input type="text" class="form-control  " name="nombreReferencia" id="refNombre" >
                        </div>
                        <div class="inputs">
                          <label for="refTel" class="form-label">Telefono de la Referencia</label>
                          <input type="text" class="form-control  " name="telefonoReferencia" id="refTel" >
                        </div>
                        
                        <div class="inputs">
                          <label for="motivoSalida" class="form-label">Motivo de Salida</label>
                          <textarea class="form-control  " name="motivoSalida" id="motivoSalida" ></textarea>
                        </div>
                        <div class="inputs">
                          <label for="tipoExperiencia" class="form-label"> Tipo de Experiencia</label> 
                            <select name="tipoExperiencia" id="tipoExperiencia" class="bg-light">
                              <c:forEach items="${tiposExperencia}" var="tipoExperiencia">
                                <option value="${tipoExperiencia.getDescripcion()}">${tipoExperiencia.getDescripcion()}</option>
                              </c:forEach>
                            
                            </select>
                        </div>
                        
                          

                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button id="agregar-exp" type="button" class="btn btn-primary" onclick="agregarFieldExpierncia()" data-dismiss="modal">Agregar</button>
            </div>
          </div>
        </div>
      </div>
    <!--------------------------------------------------------------------------------------->
      <div class="modal fade" id="tecnologiaForm" tabindex="-2" role="dialog" aria-labelledby="tecnologiaForm" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel" >tecnologia</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form name="tecnologia-form" class="needs-validation" novalidate>
                <label for="tecnologia-nombre" class="form-label">Tecnologia</label>
                <div class="input-group mb-3">
                  <select class="form-select" name="tecnologia-id" aria-label="Default select example" required>
                    <option value="-1" selected>Open this select menu</option>
                    <c:forEach items="${tecnologias}" var="tecnologia">
                      <option value="${tecnologia.id}">${tecnologia.nombre}</option>
                    </c:forEach>
                  </select>
                </div>
                  
                  
                  <input type="text" class="form-control d-none" name="tecnologia-nombre" id="tecnologia-nombre" >
                  <label for="nivel" class="form-label">Nivel</label>
                  <input type="range" class="form-range" name="nivel" id="nivel" min="1" max="5" required>
              </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="agregarFieldTecnologia()" data-dismiss="modal">Agregar</button>
          </div>
        </div>
      </div>
    </div>      
  <!--------------------------------------------------------------------------------------->


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
              <form name="estudio-form" class="needs-validation" novalidate>


                <div class="form-group">
                    <label for="tipoDeEstudio">Tipo de Estudio</label>
                    <select name="tipoDeEstudio" id="tipoDeEstudio" required>
                        <option value="-1" selected disabled hidden>Seleccionar</option>
                        <c:forEach items="${tiposDeEstudio}" var="tipo">
                            <option value="${tipo}">${tipo.name}</option>
                        </c:forEach>
                    </select>
                </div>
<%--                <label for="tipoDeEstudio" class="form-label">Tipo De Estudio</label>--%>
<%--                <input type="text" class="form-control  " name="tipoDeEstudio" id="tipoDeEstudio">--%>
                <div class="form-group">
                    <label for="institucionEstudio" class="form-label">Institucion</label>
                    <input type="text" class="form-control" name="institucion" id="institucionEstudio" required>
                </div>
                <div class="form-group">
                    <label for="temaDeEstudio" class="form-label">Carrera/Bachiller/Tema de Curso</label>
                    <input type="text" class="form-control" name="temaDeEstudio" id="temaDeEstudio" required>
                </div>
                  <div class="form-group">
                      <label for="estado">Estado</label>
                      <select name="estado" id="estado" required>
                          <option value="-1" selected disabled hidden>Seleccionar</option>
                          <c:forEach items="${estadosEstudio}" var="estado">
                              <option value="${estado}">${estado.name}</option>
                          </c:forEach>
                      </select>
                  </div>
                <div class="form-group">
                    <label for="fechaDesdeEstudio" class="form-label">Fecha Desde</label>
                    <input type="date" class="form-control  " name="fechaDesde" id="fechaDesdeEstudio" required>
                </div>
                <div class="form-group">
                    <label for="fechaHastaEstudio" class="form-label">Fecha Hasta</label>
                    <input type="date" class="form-control  " name="fechaHasta" id="fechaHastaEstudio" >
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
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <!--Modal de referencias-->
       <div class="modal fade" id="referenciaForm" tabindex="-1" role="dialog" aria-labelledby="referenciaForm" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Referencias Personales</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form name="referencia-form" class="needs-validation" novalidate>
                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" name="nombre" id="nombre" required>
                </div>
                <div class="form-group">
                    <label for="relacion" class="form-label">Relacion</label>
                    <input type="text" class="form-control" name="relacion" id="relacion" required>
                </div>

                <div class="form-group">
                  <label for="telefono" class="form-label">Telefono</label>
                  <input type="number" class="form-control" name="telefono" id="telefono" required>
              </div>
                 
                


            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="agregarFieldReferencia()" data-dismiss="modal">Agregar</button>
        </div>
      </div>
    </div>
      </div>


    <!-- Optional JavaScript; choose one of the two! -->

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script>
      var ciudades = ${ciudades};
      (function(){
          var today = new Date();
          var dd = today.getDate();
          var mm = today.getMonth() + 1; //January is 0!
          var yyyy = today.getFullYear();

          if (dd < 10) {
              dd = '0' + dd;
          }

          if (mm < 10) {
              mm = '0' + mm;
          }

          today = yyyy + '-' + mm + '-' + dd;


          let fechaDesdeEstudio = document.querySelector("#fechaDesdeEstudio");
          let fechaDesdeExperiencia = document.querySelector("#fechaDesdeExperiencia");
          let fechaHastaEstudio = document.querySelector("#fechaHastaEstudio");
          let fechaHastaExperiencia = document.querySelector("#fechaHastaExperiencia");

          fechaDesdeEstudio.setAttribute("max", today);
          fechaDesdeExperiencia.setAttribute("max", today);

          fechaDesdeExperiencia.addEventListener("change", ()=>{
              fechaHastaExperiencia.setAttribute("min", fechaDesdeExperiencia.value)
          })
          fechaDesdeEstudio.addEventListener("change", ()=>{
              fechaHastaEstudio.setAttribute("min", fechaDesdeEstudio.value)
          })
      })()
    </script>
    <script src="./main.js"></script>
  </body>
</html>