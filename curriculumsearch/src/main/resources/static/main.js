var cont_experiencia = 0;
let cont_estudios = 0;
let cont_tecnologia = 0;
const experiencias = [];
const estudios = [];
const tecnologias = [];
function agregarFieldExpierncia(){
    //recoger del form
    const pairs = {};
    const formexp = document.querySelector("[name=experiencia-form]");
    const formData = new FormData(formexp);
    const reconocimientos = [{},{},{}];
    let pos_rec;
    for (const [name, value] of formData){
        pos_rec = name.split("-");//rec-nombre-index
        if (pos_rec.length > 1) {
            reconocimientos[pos_rec[2]][pos_rec[1]] = value
        }
        else{
            pairs[name] = value
        }
        
    }
    pairs["reconocimientos"] = reconocimientos.filter(rec => rec.nombre);
    experiencias[cont_experiencia] = pairs;
    formexp.reset();
    //imprimir lista actualizada
    const div = document.querySelector("#experiencias")
    const div1 = document.createElement('div');
    let content='<ul>'
    
    for (let index = 0; index < experiencias.length; index++) {
        const exp = experiencias[index];
        if(exp==null) continue;
        content += `
        <li id="exp-${index}">        
            ${exp.institucion}
            <button type="button" onclick="eliminarExperiencia(event)">Eliminar</button>
        </li>
        
        `
    }
    content += "</ul>" 
    div1.innerHTML = content
    div.innerHTML = '';
    div.appendChild(div1);
    cont_experiencia++;

}

function eliminarExperiencia(event) {
    //eliminar del array
    experiencias[event.target.parentElement.id.split("-")[1]]=null
    //eliminar en html
    event.target.parentElement.remove()
}
function serializeJSON (form) {
    // Create a new FormData object
    const formData = new FormData(form);

    // Create an object to hold the name/value pairs
    const pairs = {};

    // Add each name/value pair to the object
    for (const [name, value] of formData) {
        pairs[name] = value
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
        location.replace(response.url);
    });
    evt.preventDefault();
} );



//Metodos para Estudios



function agregarFieldEstudio(){
    //recoger del form
    const pairs = {};
    const formest = document.querySelector("[name=estudio-form");
    const formData = new FormData(formest);
    const estudioReconocimiento = [{},{},{}];
    let pos_rec;
    for (const [name, value] of formData){
        pos_rec = name.split("-");//rec-nombre-index
        if (pos_rec.length > 1) {
            estudioReconocimiento[pos_rec[2]][pos_rec[1]] = value
        }
        else{
            pairs[name] = value
        }
        
    }
    pairs["estudioReconocimiento"] = estudioReconocimiento.filter(rec => rec.nombre);
    estudios[cont_estudios] = pairs;
    formest.reset();
    //imprimir lista actualizada
    const div = document.querySelector("#estudios")
    const div1 = document.createElement('div');
    let content='<ul>'
    
    for (let index = 0; index < estudios.length; index++) {
        const est = estudios[index];
        if(est==null) continue;
        content += `
        <li id="est-${index}">        
            ${est.institucion}
            <button type="button" onclick="eliminarEstudio(event)">Eliminar</button>
        </li>
        
        `
    }
    content += "</ul>" 
    div1.innerHTML = content
    div.innerHTML = '';
    div.appendChild(div1);
    cont_estudios++;

}

function eliminarEstudio(event) {
    //eliminar del array
    estudios[event.target.parentElement.id.split("-")[1]]=null
    //eliminar en html
    event.target.parentElement.remove()
}






