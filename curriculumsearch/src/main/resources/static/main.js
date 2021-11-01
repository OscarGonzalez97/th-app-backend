var cont_experiencia = 0;
let cont_estudios = 0;
let cont_tecnologia = 0;
function agregarFieldExpierncia(evt){
    
    const btn = evt.target
    cont_experiencia++;
    
    const nee = document.createElement("div")
    nee.innerHTML = `
    <label for="institucion" class="form-label">Institucion</label>
    <input type="text" class="form-control  " name="experiencia-${cont_experiencia}-institucion" id="institucion" >
    <label for="fechaDesde" class="form-label">FechaDesde</label>
    <input type="date" class="form-control  " name="experiencia-${cont_experiencia}-fechaDesde" id="fechaDesde" >
    <label for="fechaHasta" class="form-label">Fecha Hasta</label>
    <input type="date" class="form-control  " name="experiencia-${cont_experiencia}-fechaHasta" id="fechaHasta" >
    <label for="cargo" class="form-label">Cargo</label>
    <input type="cargo" class="form-control  " name="experiencia-${cont_experiencia}-cargo" id="cargo" >
    <label for="refNombre" class="form-label">Referencia Nombre</label>
    <input type="text" class="form-control  " name="experiencia-${cont_experiencia}-referencias" id="refNombre" >
    <button type="button" onclick="eliminarExperiencia(event)">Eliminar</button>
    `;
    nee.className = "mb-3 col-5"
    form.insertBefore(nee,btn)
}

function eliminarExperiencia(event) {
    event.target.parentElement.remove()
}
function serializeJSON (form) {
    // Create a new FormData object
    const formData = new FormData(form);

    // Create an object to hold the name/value pairs
    const pairs = {};
    const experiencias = [];
    const estudios = [];
    const tecnologias = [];

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
    pairs["experiencias"] = experiencias.filter(exp => exp)//eliminacion de nulos
    pairs["estudios"] = estudios.filter(est => est)//eliminacion de nulos
    pairs["tecnologias"] = tecnologias.filter(tec => tec)//eliminacion de nulos
    
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