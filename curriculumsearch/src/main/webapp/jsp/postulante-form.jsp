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

              .add-experience:hover {
                  background: blue;
                  color: #fff;
                  cursor: pointer;
                  border: solid 1px blue
              }
    </style>


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
                                  
                              
                                  <div class="inputs  mb-3 col-md-6">
                                    <label for="ci" class="form-label">Cedula de identidad</label>
                                    <input type="number" name="ci" class="form-control  " id="ci" required>
                                    <div class="valid-feedback">
                                      Luce Bien!
                                    </div>
                                  </div>
                                  
                                  <div class="inputs mb-3 col-md-6">
                                    <label form="ciudad" class="form-label">Ciudad</label>
                                    <input type="text" name="ciudad" class="form-control " id="ciudad" required>
                                    <div class="valid-feedback">
                                      Luce Bien!
                                    </div>
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
                              
                        
                                  <div class="inputs col-md-6"> <label for="nivelIngles" class="form-label"> Nivel de ingles</label> 
                                    <select name="nivelIngles" id="nivelIngles" class="bg-light">
                                    <option value="1" selected>1</option>
                                    <option value="2" >2</option>
                                    <option value="3" >3</option>
                                    <option value="4" >4</option>
                                    <option value="5" >5</option>
                                    </select> 
                                  </div>
                                
                                  <div class="inputs mb-3 col-md-6"> 
                                    <label for="disponibilidad" class="form-label"> Disponibilidad</label> 
                                    <select name="disponibilidad" id="disponibilidad" class="bg-light">
                                      <c:forEach items="${disponibilidades}" var="disponibilidad">
                                        <option value="${disponibilidad.getCode()}">${disponibilidad.getDescripcion()}</option>
                                      </c:forEach>
                                    
                                  </select> </div>
                                
                                  <div class="inputs mb-3 col-md-6"> 
                                    <label for="modalidad" class="form-label"> Modalidad</label> 
                                    <select name="modalidad" id="modalidad" class="bg-light">
                                      <c:forEach items="${modalidades}" var="modalidad">
                                        <option value="${modalidad.getCode()}">${modalidad.getDescripcion()}</option>
                                      </c:forEach>
                                    
                        
                                  </select> </div>
                              
                                  <div class="inputs p-3 py-5">
                                    <div class=" inputs d-flex justify-content-between align-items-center experience"><span class="border px-3 p-1 add-experience"  data-toggle="modal" data-target="#experienciaForm"><i class="fa fa-plus"></i>&nbsp;Agregar Experiencia</span></div><br>   
                                  </div>

                                  <div class="mt-3 gap-2 d-flex justify-content-between" id="experiencias">
                                  </div>
                                    
                               
                                  <div class="inputs p-3 py-5">
                                   <div class=" inputs d-flex justify-content-between align-items-center experience"><span class="border px-3 p-1 add-experience"  data-toggle="modal" data-target="#estudioForm"><i class="fa fa-plus"></i>&nbsp;Agregar Estudio</span></div><br>   
                                  </div>
                                 
                                  <div class="mt-3 gap-2 d-flex justify-content-between" id="estudios">
                                  </div>
                            
                               
                               
                                <div class="inputs p-3 py-5">
                                  <div class=" inputs d-flex justify-content-between align-items-center experience"><span class="border px-3 p-1 add-experience"  data-toggle="modal" data-target="#tecnologiaForm"><i class="fa fa-plus"></i>&nbsp;Agregar Tecnologia</span></div><br>   
                                </div>
                                
                                <div class="mt-3 gap-2 d-flex justify-content-between" id="tecnologias"> 
                                </div>
                              
                      
                        
                                
                                <div class="mt-3 gap-2 d-flex justify-content-end">
                                  <button class="px-3 btn btn-sm btn-outline-primary">Cancelar</button> 
                                  <button class="px-3 btn btn-sm btn-primary" type="submit">Guardar</button>
                                </div>
                              </div>
                          </div>
                      </div>
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

                        <div class="inputs">
                            <label for="institucion" class="inputs form-label">Institucion</label>
                            <input type="text" class="inputs form-control  " name="institucion" id="institucion" >
                        </div>
                        <div class="inputs">
                            <label for="fechaDesde" class="form-label">Fecha Desde</label>
                            <input type="date" class="form-control  " name="fechaDesde" id="fechaDesde" >
                        </div>
                         
                        <div class="inputs">
                            <label for="fechaHasta" class="form-label">Fecha Hasta</label>
                            <input type="date" class="form-control  " name="fechaHasta" id="fechaHasta" >
                        </div>
                        
                        <div class="inputs">
                            <label for="cargo" class="form-label">Cargo</label>
                            <input type="text" class="form-control  " name="cargo" id="cargo" >
                        </div>

                        <div class="inputs">
                          <label for="descripcion" class="form-label">Descripcion</label>
                          <textarea  class="form-control  " name="descripcion" id="descripcion" > </textarea>

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
                            <label class="form-label">Reconocimientos</label>
                          </div>
                          
                          <div class="row mb-3">
                            <div class="inputs col">
                              <input type="text" class="form-control" name="rec-nombre-0" placeholder="Titulo del reconocimiento" aria-label="First name">
                            </div>
                            <div class=" inputs col">
                              <input type="text" class="form-control" name="rec-certificado-0" placeholder="Adjuntar archivo" aria-label="Last name">
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="inputs col">
                              <input type="text" class="form-control" name="rec-nombre-1" placeholder="Titulo del reconocimiento" aria-label="First name">
                            </div>
                            <div class="inputs col">
                              <input type="text" class="form-control" name="rec-certificado-1" placeholder="Adjuntar archivo" aria-label="Last name">
                            </div>
                          </div>
                          <div class="row mb-3">
                            <div class="inputs col">
                              <input type="text" class="form-control" name="rec-nombre-2" placeholder="Titulo del reconocimiento" aria-label="First name">
                            </div>
                            <div class="inputs col">
                              <input type="text" class="form-control" name="rec-certificado-2" placeholder="Adjuntar archivo" aria-label="Last name">
                            </div>
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
              <form name="tecnologia-form">
                <label for="tecnologia-nombre" class="form-label">Tecnologia</label>
                <div class="input-group mb-3">
                  <select class="form-select" name="tecnologia-id" aria-label="Default select example">
                    <option value="-1" selected>Open this select menu</option>
                    <c:forEach items="${tecnologias}" var="tecnologia">
                      <option value="${tecnologia.id}">${tecnologia.nombre}</option>
                    </c:forEach>
                  </select>
                  <button class="btn btn-outline-secondary" type="button" id="btn-new-tech">Agregar nuevo</button>
                </div>
                  
                  
                  <input type="text" class="form-control d-none" name="tecnologia-nombre" id="tecnologia-nombre" >
                  <label for="nivel" class="form-label">Nivel</label>
                  <input type="number" class="form-control" name="nivel" id="nivel" >
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
              <form name="estudio-form">


                <div class="form-group">
                    <label for="tipoDeEstudio">Tipo de Estudio</label>
                    <select name="tipoDeEstudio" id="tipoDeEstudio">
                        <option value="-1" selected disabled hidden>Seleccionar</option>
                        <c:forEach items="${tiposDeEstudio}" var="tipo">
                            <option value="${tipo}">${tipo.name}</option>
                        </c:forEach>
                    </select>
                </div>
<%--                <label for="tipoDeEstudio" class="form-label">Tipo De Estudio</label>--%>
<%--                <input type="text" class="form-control  " name="tipoDeEstudio" id="tipoDeEstudio">--%>
                <div class="form-group">
                    <label for="institucion" class="form-label">Institucion</label>
                    <input type="text" class="form-control" name="institucion" id="institucion">
                </div>
                <div class="form-group">
                    <label for="temaDeEstudio" class="form-label">Carrera/Bachiller/Tema de Curso</label>
                    <input type="text" class="form-control" name="temaDeEstudio" id="temaDeEstudio" >
                </div>
                  <div class="form-group">
                      <label for="estado">Estado</label>
                      <select name="estado" id="estado">
                          <option value="-1" selected disabled hidden>Seleccionar</option>
                          <c:forEach items="${estadosEstudio}" var="estado">
                              <option value="${estado}">${estado.name}</option>
                          </c:forEach>
                      </select>
                  </div>
                <div class="form-group">
                    <label for="fechaDesde" class="form-label">Fecha Desde</label>
                    <input type="date" class="form-control  " name="fechaDesde" id="fechaDesde" >
                </div>
                <div class="form-group">
                    <label for="fechaHasta" class="form-label">Fecha Hasta</label>
                    <input type="date" class="form-control  " name="fechaHasta" id="fechaHasta" >
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