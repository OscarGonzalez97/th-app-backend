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
  <body class="container">
    <h1>Hello, world!</h1>

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
      <fieldset>
        <div class="mb-3 col-5">
            
            <label for="institucion" class="form-label">Institucion</label>
            <input type="text" class="form-control  " name="experiencia-0-institucion" id="institucion" >
            <label for="fechaDesde" class="form-label">FechaDesde</label>
            <input type="date" class="form-control  " name="experiencia-0-fechaDesde" id="fechaDesde" >
            <label for="fechaHasta" class="form-label">Fecha Hasta</label>
            <input type="date" class="form-control  " name="experiencia-0-fechaHasta" id="fechaHasta" >
            <label for="cargo" class="form-label">Cargo</label>
            <input type="cargo" class="form-control  " name="experiencia-0-cargo" id="cargo" >
            <label for="refNombre" class="form-label">Referencia Nombre</label>
            <input type="text" class="form-control  " name="experiencia-0-referencias" id="refNombre" >
        </div>
        
      </fieldset>
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
    <script>
        let cont_experiencia = 0;
        let cont_estudios = 0;
        let cont_tecnologia = 0;
        function serializeJSON (form) {
            // Create a new FormData object
            const formData = new FormData(form);

            // Create an object to hold the name/value pairs
            const pairs = {};
            const experiencias = [{}];
            const estudios = [{}];
            const tecnologias = [{}];

            // Add each name/value pair to the object
            for (const [name, value] of formData) {
                //los atributos no primitivos tiene una nomenclatura distinta en sus names
                //ej.: experiencia-4-institucion == experencias[4].institucion
                let codificacion = name.split("-")
                if(codificacion.length==1){
                    pairs[name] = value
                }
                else{
                    switch (codificacion[0]) {
                        case "experiencia":
                            if(experiencias[codificacion[1]]==null) experiencias[codificacion[1]]={};
                            experiencias[codificacion[1]][codificacion[2]] = value
                            break;
                        case "estudio":
                            if(estudios[codificacion[1]]==null) estudios[codificacion[1]]={};
                            estudios[codificacion[1]][codificacion[2]] = value
                            break;
                        case "tecnologia":
                            if(tecnologias[codificacion[1]]==null) tecnologias[codificacion[1]]={};
                            tecnologias[codificacion[1]][codificacion[2]] = value
                            break;
                    
                        default:
                            break;
                    }
                }
            }
            pairs["experiencias"] = experiencias
            pairs["estudios"] = estudios
            pairs["tecnologias"] = tecnologias
            
            // Return the JSON string
            return JSON.stringify(pairs, null, 2);
        }

        async function postData(url = '', data = {}) {
            // Default options are marked with *
            const response = await fetch(url, {
                method: 'POST', // *GET, POST, PUT, DELETE, etc.
                mode: 'cors', // no-cors, *cors, same-origin
                cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
                credentials: 'same-origin', // include, *same-origin, omit
                headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
                },
                redirect: 'follow', // manual, *follow, error
                referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
                body: data // body data type must match "Content-Type" header
            });
            return response; // parses JSON response into native JavaScript objects
        }

        form = document.querySelector("form");
        form.addEventListener("submit",(evt)=>{
            
            postData('postulante', serializeJSON(form))
            .then(response => {
                console.log(response); // JSON data parsed by `data.json()` call
                location.replace(response.url);
            });
            evt.preventDefault();
        } );
    </script>
  </body>
</html>