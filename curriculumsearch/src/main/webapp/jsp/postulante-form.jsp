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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="icon" href="../img/LogoRoshka.ico">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Shippori+Antique+B1">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
  </head>

  <body class="container">
    <div class="row">
      <div id="errorSection" class="col" tabindex="-1">

      </div>
    </div>
    <form name="postulante" method="post" class="needs-validation" novalidate >
                      <div class="container mt-3" style="background-color:#ffff; background: #5791EE40;">
                          <div class="card p-3 text-center" style="background-color:#ffff; background: #5791EE40;">
                              <div class="d-flex flex-row justify-content-center mb-3">
                                
                              </div>
                              <h4 class="text-start">Datos Personales</h4>
                              <h6 class="text-start">Todos los campos con (*) deben estar rellenados</h6>
                              <div class="row">
                                  

                                  <div class="inputs mb-3 col-md-6">
                                    <label for="nombre" class="form-label">Nombre *</label>
                                    <input placeholder="&#xf007;      Ingrese su nombre" type="text" name="nombre" class="form-control FA" id="nombre" required>
                                    
                                  </div>
                                  
                                  <div class="inputs mb-3 col-md-6">
                                    <label for="apellido" class="form-label ">Apellido *</label>
                                    <input placeholder="&#xf007;      Ingrese su apellido" type="text" name="apellido" class="form-control FA" id="apellido" required>
                                    
                                  </div>
          

                                  <div class="inputs mb-3 col-md-6">
                                    <label for="correo" class="form-label">Email *</label>
                                    <input type="email" placeholder="&#xf0e0;     Ingrese su email" name="correo" class="form-control FA" id="correo" required>
                                    
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
                                    <select name="tipoDocumento" id="tipoDocumento" class="bg-light" required>
                                        <option value='CI' selected>C.I</option>
                                        <option value='PAS'>Passport</option>
                                        <option value='Otro'>Otro</option>
                                    </select> 
                                  </div>
                              
                                  <div class="inputs  mb-3 col-md-6">
                                    <label for="nroDocument" class="form-label">Número de Documento *</label>
                                    <input placeholder="&#xf2c2;    Ingrese su número de documento" type="number" name="nroDocument" class="form-control  nroDocument-ph FA" id="nroDocument" required>
                                    
                                  </div>
                                  
                                  <div class="inputs mb-3 col-md-6"> 
                                    <label for="departamentos" class="form-label"> Departamento</label> 
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
                                    <label for="direccion" class="form-label">Dirección *</label>
                                    <input placeholder="&#xf041;      Ingrese su dirección" type="text" name="direccion" class="form-control FA " id="direccion" required> </textarea>
                                  </div>
                                  
                                  
                                  <div class="inputs mb-3 col-md-6">
                                    <label for="telefono" class="form-label">Teléfono *</label>
                                    <input placeholder="&#xf095;      Ingrese su número de teléfono" type="number" name="telefono" class="form-control telefono-ph FA" id="telefono" required>
                                    
                                  </div>
                                  
                                  <div class="inputs mb-3 col-md-6">
                                    <label for="fechaNacimiento" class="form-label">Fecha de nacimiento *</label>
                                    <input type="date" name="fechaNacimiento" class="form-control  " id="fechaNacimiento" required>
                                    
                                  </div>
                                  
                                  <div class="inputs mb-3 col-md-6">
                                    <label for="formFile" class="form-label">Cargar CV</label>
                                    <input class="form-control" type="file" id="cvFile">
                                  </div>
                                  
                                  <br>
                        
                                  <div class="inputs mb-3 col-md-6"> <label for="nivelIngles" class="form-label"> Nivel de ingles</label> 
                                    <select name="nivelIngles" id="nivelIngles" class="content-select">
                                    <option value="1" selected>Conocimiento de ingles muy básico</option>
                                    <option value="2" >Comprendo algunas cosas y puedo leer con la ayuda del traductor</option>
                                    <option value="3" >Puedo entender todo lo que leo</option>
                                    <option value="4" >Puedo escribir documentación en ingles</option>
                                    <option value="5" >Puedo escribir y hablar fluidamente</option>
                                    </select> 
                                  </div>
                                
                                  
                                <!--

                                  <div class="inputs mb-3 col-md-4"> 
                                    <label for="estadoCivil" class="form-label"> Estado civil</label> 
                                    <select name="estadoCivil" id="estadoCivil" class="content-select">
                                      <c:forEach items="${estadosCiviles}" var="estadoCivil">
                                        <option value="${estadoCivil.getDescripcion()}">${estadoCivil.getDescripcion()}</option>
                                      </c:forEach>
                                    </select> 
                                  </div>
                                -->
                                <div class="inputs mb-3 col-md-6"> 
                                  <label for="estadoCivil" class="form-label"> Estado civil</label>
                                  <select name="estadoCivil" id="estadoCivil" class="content-select">
                                      <option value='Soltero' selected>Soltero/a</option>
                                      <option value='Concubinado'>Concubinado/a</option>
                                      <option value='Casado'>Casado/a</option>
                                      <option value='Viudo'>Viudo/a</option>
                                      <option value='Divorciado'>Divorciado/a</option>
                                  </select> 
                                </div>

                                  <!-- Button Agregar Cargo al que postulas -->
                                  <hr>
                                  <div class="mb-3 col-md-12">

                                    <div class="row w-100 gy-2 mx-auto">
                                      <div class="col-12 px-0">
                                        <h4 class="text-start">Cargos </h4>
                                      </div>
                                      <div class="col-12">
                                        <div class="mt-3 gap-2 row" id="cargos">
                                          <c:forEach items="${CargosDisponibles}" var="convocatoria">
                                            
                                            <div class="form-check form-check-inline col-2">
                                              <div class="row">

                                                <input class="form-check-input col-auto ms-1" type="checkbox" name="cargo-id" id="cargo-${convocatoria.getId()}" value="${convocatoria.getId()}">
                                                <label class="col text-start" for="cargo-${convocatoria.getId()}">${convocatoria.getCargo().getNombre()}</label>
                                              </div>
                                            </div>
                                          </c:forEach>
                                        </div>
                                      </div>
                                      <div class="col-12">
                                        <p id="no-valid-cargo" style="display: none; color: yellow;" class="text-center">
                                          *Agrega por lo menos un cargo !
                                        </p>
                                      </div>
                                    </div>
                                  </div>
                                  
                                  <!-- Button Agregar Estudio -->
                                  <hr>
                                  <div class="inputs mb-3 col-md-12">

                                    <div class="row w-100  gy-2 mx-auto">
                                      <div class="col-12 px-0">
                                        <h4 class="text-start">Estudios <i class="bi bi-plus-square pointer" data-bs-toggle="modal" data-bs-target="#estudioForm"></i></h4>	
                                      </div>
                                      <div class="col-12">
                                        <div class="mt-3 gap-2 row row-cols-4" id="estudios">
                                          
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  

                                  <!-- Button Agregar Tecnologia -->
                                  <hr>
                                  <div class="inputs mb-3 col-md-12">

                                    <div class="row w-100  gy-2 mx-auto">
                                      <div class="col-12 px-0">
                                        
                                        <h4 class="text-start">Tecnologías <i class="bi bi-plus-square pointer" data-bs-toggle="modal" data-bs-target="#tecnologiaForm"></i></h4>	
                                      </div>
                                      <div class="col-12">
                                        
                                          <div class="mt-3 gap-2 row row-cols-5" style="display: flex;" id="tecnologias">
                                          </div>
                                        
                                      </div>
                                      <div class="col-12">
                                        <p id="no-valid-tecno" style="display: none; color: yellow;" class="text-center">
                                          *Agrega por lo menos una tecnología
                                        </p>   
                                      </div>
                                      
                                    
                                    </div>
                                  </div>
                                  <!-- Button Otras tecnologias -->
                                  <hr>
                                  <div class="inputs mb-3 col-md-12">

                                    <div class="row w-100  gy-2 mx-auto">
                                      <div class="col-12 px-0">
                                        
                                        <h4 class="text-start">Otras Tecnologías </h4>	
                                      </div>
                                      <div class="col-6">
                                        
                                        <div class="mb-3">
                                          <textarea class="form-control" id="exampleFormControlTextarea1" name="tecnologiaOtros" placeholder="Si tienes alguna tecnología que no figura en la sección anterior. Escribelo aquí."></textarea>
                                        </div>
                                        
                                      </div>
                                      
                                      
                                    
                                    </div>
                                  </div>

                                  <!-- Button Agregar Experiencia -->
                                  <hr>
                                  <div class="inputs mb-3 col-md-12">

                                    <div class="row w-100  gy-2 mx-auto">
                                      <div class="col-12 px-0">
                                        <h4 class="text-start">Experiencias <i class="bi bi-plus-square pointer" data-bs-toggle="modal" data-bs-target="#experienciaForm"></i></h4>	
                                      </div>
                                      <div class="col-12">
                                        <div class="mt-3 gap-2 row row-cols-4" id="experiencias">
                                          
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- Button Agregar Refencia personal -->
                                  <hr>
                                  <div class="inputs mb-3 col-md-12">
                                    <div class="row  w-100  gy-2 mx-auto">
                                      <div class="col-12 px-0">
                                        <h4 class="text-start">Referencia personal <i class="bi bi-plus-square pointer" data-bs-toggle="modal" data-bs-target="#referenciaForm"></i></h4>
                                      </div>
                                      <div class="col-12">
                                        <div class="mt-3 gap-2 row row-cols-4" id="referencia">
                                          
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  
                      
                        
                                
                                <div class="mt-3 gap-2 d-flex justify-content-end">
                                  <a class="px-3 btn btn-sm btn-light" href="/work-with-us">Cancelar</a>
                                  <button class="px-3 btn btn-sm btn-light" type="submit">Guardar</button>
                                </div>
                              </div>
                          </div>
                      </div>
    </form>
  <!-------------------------------------------------------------------------------------------------------------------------->

      <!--Modal de Experiencia-->
      <div class="modal fade" id="experienciaForm" tabindex="-1" role="dialog" aria-labelledby="experienciaForm" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Experiencia</h5>
              <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="color:#21130d;">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <form name="experiencia-form" class="needs-validation" novalidate>

                        <div class="inputs">
                            <label for="institucionExperiencia" class="inputs form-label">Institución *</label>
                            <input placeholder="&#xf1ad;      Ingrese su institución" type="text" class="inputs form-control FA" name="institucion" id="institucionExperiencia" required>
                        </div>
                        <div class="inputs">
                            <label for="fechaDesdeExperiencia" class="form-label">Fecha desde *</label>
                            <input type="date" class="form-control" name="fechaDesde" id="fechaDesdeExperiencia" required>
                            <div class="invalid-feedback errorFechaDesde">
                              
                            </div>
                        </div>
                         
                        <div class="inputs">
                            <label for="fechaHastaExperiencia" class="form-label">Fecha hasta</label>
                            <input type="date" class="form-control" name="fechaHasta" id="fechaHastaExperiencia" >
                            <div class="invalid-feedback errorfechaHasta"></div>
                          </div>
                        
                        <div class="inputs">
                            <label for="cargo" class="form-label">Cargo *</label>
                            <input placeholder="&#xf0b1;      Ingrese su cargo" type="text" class="form-control FA " name="cargo" id="cargo" required>
                        </div>

                        <div class="inputs">
                          <label for="descripcion" class="form-label">Descripción *</label>
                          <textarea placeholder="&#xf022;     Ingrese una descripción de su trabajo"  class="form-control FA" name="descripcion" id="descripcion" required></textarea>

                        </div>
                        <div class="inputs">
                          <label for="refNombre" class="form-label">Nombre de la referencia</label>
                          <input placeholder="&#xf007;      Ingrese el nombre de su referencia" type="text" class="form-control FA " name="nombreReferencia" id="refNombre" required >
                        </div>
                        <div class="inputs">
                          <label for="refTel" class="form-label">Teléfono de la referencia</label>
                          <input placeholder="&#xf095;      Ingrese el teléfono de su referencia" type="number" class="form-control FA" name="telefonoReferencia" id="refTel" required>
                        </div>
                        
                        <div class="inputs">
                          <label for="motivoSalida" class="form-label">Motivo de salida</label>
                          <textarea placeholder="&#xf022;     Ingrese el motivo de su salida" class="form-control FA " name="motivoSalida" id="motivoSalida" ></textarea>
                        </div>
                        <div class="inputs">
                          <label for="tipoExperiencia" class="form-label"> Tipo de experiencia</label> 
                            <select name="tipoExperiencia" id="tipoExperiencia" class="bg-light">
                              <c:forEach items="${tiposExperencia}" var="tipoExperiencia">
                                <option value="${tipoExperiencia.getDescripcion()}">${tipoExperiencia.getDescripcion()}</option>
                              </c:forEach>
                            
                            </select>
                        </div>
                        
                          

                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
              <button id="agregar-exp" type="button" class="btn btn-primary" onclick="agregarFieldExpierncia()">Agregar</button>
            </div>
          </div>
        </div>
      </div>
    <!--------------------------------------------------------------------------------------->
      <div class="modal fade" id="tecnologiaForm" tabindex="-1" role="dialog" aria-labelledby="tecnologiaForm" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel" >Tecnología</h5>
              <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="color:#21130d;">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form name="tecnologia-form" class="needs-validation" novalidate>
                <label for="tecnologia-nombre" class="form-label">Tecnología</label>
                <div class="input-group mb-3">
                  <select class="content-select" name="tecnologia-id" aria-label="Default select example" required>
                    
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
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" onclick="agregarFieldTecnologia()">Agregar</button>
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
              <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="color:#21130d;">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form name="estudio-form" class="needs-validation" novalidate>


                <div class="form-group">
                    <label for="tipoDeEstudio">Tipo de estudio</label>
                    <select name="tipoDeEstudio" id="tipoDeEstudio" required>
                        
                        <c:forEach items="${tiposDeEstudio}" var="tipo">
                            <option value="${tipo}">${tipo.name}</option>
                        </c:forEach>
                    </select>
                </div>
<%--                <label for="tipoDeEstudio" class="form-label">Tipo de estudio</label>--%>
<%--                <input type="text" class="form-control  " name="tipoDeEstudio" id="tipoDeEstudio">--%>
                <div class="form-group">
                    <label for="institucionEstudio" class="form-label">Institución *</label>
                    <input placeholder="&#xf19c;      Ingrese su institución" type="text" class="form-control FA" name="institucion" id="institucionEstudio" required>
                </div>
                <div class="form-group">
                    <label for="temaDeEstudio" class="form-label">Carrera/Bachiller/Tema de curso *</label>
                    <input placeholder="&#xf02d;      Ingrese su carrera/bachiller/tema de curso " type="text" class="form-control FA" name="temaDeEstudio" id="temaDeEstudio" required>
                </div>
                  <div class="form-group">
                      <label for="estado">Estado</label>
                      <select name="estado" id="estado" required>
                          
                          <c:forEach items="${estadosEstudio}" var="estado">
                              <option value="${estado}">${estado.name}</option>
                          </c:forEach>
                      </select>
                  </div>
                <div class="form-group">
                    <label for="fechaDesdeEstudio" class="form-label">Fecha desde *</label>
                    <input type="date" class="form-control  " name="fechaDesde" id="fechaDesdeEstudio" required>
                    <div class="invalid-feedback errorFechaDesde">
                              
                    </div>
                </div>
                <div class="form-group">
                    <label for="fechaHastaEstudio" class="form-label">Fecha hasta</label>
                    <input type="date" class="form-control  " name="fechaHasta" id="fechaHastaEstudio" >
                    <div class="invalid-feedback errorFechaHasta">
                              
                    </div>
                </div>


            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="agregarFieldEstudio()">Agregar</button>
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
              <h5 class="modal-title" id="exampleModalLabel">Referencias personales</h5>
              <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" style="color:#21130d;">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form name="referencia-form" class="needs-validation" novalidate>
                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre *</label>
                    <input placeholder="&#xf007;      Ingrese el nombre de su referencia" type="text" class="form-control FA " name="nombre" id="nombre" required>
                </div>
                <div class="form-group">
                    <label for="relacion" class="form-label">Relación *</label>
                    <input placeholder="&#xf0c1;      Ingrese la relacion con su referencia" type="text" class="form-control FA" name="relacion" id="relacion" required>
                </div>

                <div class="form-group">
                  <label for="telefono" class="form-label">Teléfono *</label>
                  <input placeholder="&#xf095;      Ingrese el número de su referencia" type="number" class="form-control FA" name="telefono" id="telefono" required>
              </div>
                 
                


            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="agregarFieldReferencia()">Agregar</button>
        </div>
      </div>
    </div>
      </div>


    <!-- Optional JavaScript; choose one of the two! -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script>
      var ciudades = ${ciudades};
          </script>
    <script src="./main.js"></script>
  </body>
</html>