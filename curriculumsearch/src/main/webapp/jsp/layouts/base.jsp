<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="icon" href="/img/LogoRoshka.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <layout:block name="cssDeclaracion">
      <link href="/css/cargoStyle.css" rel="stylesheet" type="text/css"/>
    </layout:block>

    <title>RRHH</title>
</head>
<body>
    <header>
    
    
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">ROSHKA</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/home">Home</a>
                  </li>
                
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Cargos
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <li><a class="dropdown-item" href="/cargos/agregar">Agregar Cargo</a></li>
                      <li><a class="dropdown-item" href="/cargos">Listar cargos</a></li>
                      <li><a class="dropdown-item" href="/convocatorias">Listar convocatorias</a></li>
                    </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Tecnologías
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <li><a class="dropdown-item" href="/tecnologias/agregar">Agregar</a></li>
                      <li><a class="dropdown-item" href="/tecnologias">Listar</a></li>
                    </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Postulantes
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <li><a class="dropdown-item" href="/work-with-us">Agregar</a></li>
                      <li><a class="dropdown-item" href="/postulantes">Listar</a></li>
                    </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Beneficios
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <li><a class="dropdown-item" href="/beneficios/agregar">Agregar</a></li>
                      <li><a class="dropdown-item" href="/beneficios">Listar</a></li>
                    </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Cumpleaños
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <li><a class="dropdown-item" href="/cumples/agregar">Agregar</a></li>
                      <li><a class="dropdown-item" href="/cumples">Listar</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/edit-user-data">Editar Perfil</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/logout">Salir</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
    </header>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel">Esta seguro que desea salir?</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="/logout" class="btn btn-danger">Salir</a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container-xxl my-md-4 bd-layout">
        <layout:block name="contents">
        
        </layout:block>
    </div>

    <layout:block name="scripts">
      <script>
        function buscarPagina(nro){
          nro--
          const queries = location.search.split("&");
          let existe = false;
          if(location.search.length == 0 ) location.search = "?nroPagina="+nro; 
          let fullquery = "";
          
          for (const query of queries) {
            let [key, value] = query.split("=");
            if(key.includes('nroPagina')){
              fullquery += key + "=" + nro + "&";
              existe = true;
            }
            else{
              fullquery += key + "=" + value + "&";
            }
          }
          if(!existe) fullquery += "nroPagina" + "=" + nro + "&";
          
          location.search = fullquery.substring(0,fullquery.length-1); 
        }
      </script>
        
    </layout:block>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>