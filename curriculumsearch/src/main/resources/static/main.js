var cont_experiencia = 0;
let cont_estudios = 0;
let cont_tecnologia = 0;

let cont_cargo = 0;
const experiencias = [];
const estudios = [];
const tecnologias = [];
let noValidateFlag = false;

const postulaciones = [];

var cont_referencias=0 ;
const referencias= [];

form = document.querySelector("form");
const depSelect = document.querySelector("#departamentos");

console.log("saddsa", bootstrap)
const modalCargo = bootstrap.Modal.getOrCreateInstance(document.getElementById('cargoForm'))
const modalExperiencia = bootstrap.Modal.getOrCreateInstance(document.getElementById('experienciaForm'))
const modalTecnologia = bootstrap.Modal.getOrCreateInstance(document.getElementById('tecnologiaForm'))
const modalEstudio = bootstrap.Modal.getOrCreateInstance(document.getElementById('estudioForm'))
const modalReferencia = bootstrap.Modal.getOrCreateInstance(document.getElementById('referenciaForm'))
//variable ciudades esta declarada en el jsp

/*-----------------Definicion de funciones de poblacion de elementos y validaciones----------------------------------------*/

const formValidator = function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')
    var expForm = document.querySelector('#agregar-exp')


    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                    noValidateFlag = true;
                }

                form.classList.add('was-validated')
            }, false)
        })
}
function fechasMaxMin(){
    var today = new Date();
    var dd = today.getDate()-1;
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
    let fechaNacimiento = document.querySelector("#fechaNacimiento");
    let fechas = [fechaDesdeEstudio,fechaDesdeExperiencia,fechaHastaEstudio,fechaHastaExperiencia,fechaNacimiento]
    fechas.forEach(fch => fch.addEventListener('keydown',()=>false))//no dejar cargar manualmente fechas

    fechaDesdeEstudio.setAttribute("max", today);
    fechaDesdeExperiencia.setAttribute("max", today);
    fechaNacimiento.setAttribute("max", today);

    fechaDesdeExperiencia.addEventListener("change", ()=>{
        fechaHastaExperiencia.setAttribute("min", fechaDesdeExperiencia.value)
    })
    fechaDesdeEstudio.addEventListener("change", ()=>{
        fechaHastaEstudio.setAttribute("min", fechaDesdeEstudio.value)
    })
}

 function listarCiudades(depId){
    const ciuAmostrar = ciudades.filter(c=>c.departamentoId==depId);
    const ciudad = document.querySelector("select[name=ciudadId]");
    const frag = document.createDocumentFragment();
    for (const ciu of ciuAmostrar) {
        const opt = document.createElement("option");    
        opt.value = ciu.id;
        opt.innerHTML = ciu.nombre;
        opt.setAttribute("data-departamentoId",ciu.departamentoId);
        frag.appendChild(opt)
    }
    ciudad.replaceChildren(frag);
    
    
}

function validarfecha(fechaDesde, fechaHasta){
    let fechadehoy= new Date().toISOString().slice(0,10);

    if(fechaDesde>fechadehoy ){
       return "la fecha desde no puede ser mayor a la fecha actual" ;   
    }
    
    if(fechaHasta =! null && fechaDesde>fechaHasta){
        return "la fecha desde no puede ser mayor a la fecha hasta";
    
    }
        return false
  
}
/*-----------------Tecnologia----------------------------------------*/
function agregarFieldTecnologia(){
    //recoger del form
    const pairs = {};
    const formtecn = document.querySelector("[name=tecnologia-form]");
    const formData = new FormData(formtecn);

    //Validacion
    let returnFlag = false;

    let requiredValues = ["nombre", "nivel"]

    formData.forEach((value, key)=>{
        if(requiredValues.includes(key)
            && value==="" && returnFlag == false){
            console.log(key, value)
            returnFlag = true;
        }
    });

    if(returnFlag===true){
        let message = "Rellene "
        for(let i=0;i<requiredValues.length;i++){
            message+=", "+requiredValues[i];
        }
        message += " como minimo."
        alert(message);
        return;
    }

    for(let i=0;i<cont_tecnologia;i++){
        if(tecnologias[i]!==null){
            if(tecnologias[i]["tecnologia"]["id"]==formData.get("tecnologia-id")){
                alert("Ya has agregado esa tecnologia!")
                //cont_cargo--;
                return;
            }
        }
    }

    for (const [name, value] of formData){
        pairs[name] = value
    }
    tecnologias[cont_tecnologia]={}
    tecnologias[cont_tecnologia]["tecnologia"]=pairs["tecnologia-id"]=="-1"?{nombre: pairs["tecnologia-nombre"]}:{id: pairs["tecnologia-id"],nombre:document.querySelector('[name=tecnologia-id] > option[value="'+pairs["tecnologia-id"]+'"]').innerHTML}
    tecnologias[cont_tecnologia]["nivel"]=pairs.nivel
    //tecnologias[cont_tecnologia] = pairs;
    formtecn.reset();
    document.querySelector("#tecnologia-nombre").classList.add('d-none')
    //imprimir lista actualizada
    const div = document.querySelector("#tecnologias")
    const div1 = document.createElement('div');
    console.log(tecnologias[0])

    let content1=''
    for (let index = 0; index < tecnologias.length; index++) {
        const tecn = tecnologias[index];
        if(tecn==null) continue;
        content1 += `
        <div class="col-auto" id="tecn-${index}">
        ${tecn.tecnologia.nombre} ( ${tecn.nivel} <i class="bi bi-star-fill"></i> ) &nbsp; <i class="bi bi-trash-fill" onclick="eliminarTecnologia(event)"></i>             
        </div>
        
        `
    }
    //content1 += "</ul>" 
    div.innerHTML = content1
    //div.innerHTML = '';
    //div.appendChild(div1);
    cont_tecnologia++;
    document.querySelector("#no-valid-tecno").style.display = "none";
    modalTecnologia.hide()
}
function eliminarTecnologia(event) {
    //eliminar del array
    tecnologias[event.target.parentElement.id.split("-")[1]]=null
    //eliminar en html
    event.target.parentElement.remove()
}

/*----------------Experiencia-----------------------------------------*/
function agregarFieldExpierncia(event){
    //recoger del form
    const pairs = {};
    const formexp = document.querySelector("[name=experiencia-form]");
    formexp.classList.add('was-validated')
    const formData = new FormData(formexp);
    let error=validarfecha(formData.get("fechaDesde"), formData.get("fechaHasta"))
    let appendTo = "Hasta";
    if (error) {

            if(error.includes("desde")) appendTo = "Desde";
            
            
            formexp['fecha'+appendTo].setCustomValidity(error)
            formexp.querySelector(".errorFecha"+appendTo).innerHTML = error;
            console.log(error);
            
    }
    else{
        formexp.fechaDesde.setCustomValidity('')
        formexp.fechaHasta.setCustomValidity('')
    }
    
    const reconocimientos = [{},{},{}];
    let pos_rec;
    let returnFlag = false;

    let requiredValues = ["institucion", "cargo", "fechaDesde"]

    formData.forEach((value, key)=>{
        if(requiredValues.includes(key)
        && value==="" && returnFlag == false){
            console.log(key, value)
            returnFlag = true;
        }
    });

    if(returnFlag===true){
        let message = "Rellene "
        for(let i=0;i<requiredValues.length;i++){
            message+=", "+requiredValues[i];
        }
        message += " como minimo."
        //alert(message);
        return;
    }

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
    formexp.classList.remove('was-validated')
    //imprimir lista actualizada
    const div = document.querySelector("#experiencias")
    const div1 = document.createElement('div');
    
    let content='';
    for (let index = 0; index < experiencias.length; index++) {
        const exp = experiencias[index];
        if(exp==null) continue;
        content += `
        <div class="col border border-3 rounded" id="exp-${index}">
                    <center><h5>Experiencia <i class="bi bi-trash-fill" onclick="eliminarExperiencia(${index})"></i></h5></center>
                    <dl class="row row-cols-md-2 gx-0 gy-2">
                        <dt class="col-sm-auto text-start">Institucion</dt>
                        <dd class="col-sm-6 text-start">${exp.institucion}</dd>
                        <dt class="col-sm-auto text-start">Cargo</dt>
                        <dd class="col-sm-6 text-start">${exp.cargo}</dd>
                        <dt class="col-sm-auto text-start">Referencia</dt>
                        <dd class="col-sm-6 text-start">${exp.nombreReferencia}</dd>
                        <dt class="col-sm-auto text-start">Telf. Referencia</dt>
                        <dd class="col-sm-6 text-start">${exp.telefonoReferencia}</dd>
                        <dt class="col-sm-auto text-start">Fecha Inicio</dt>
                        <dd class="col-sm-6 text-start">${exp.fechaDesde}</dd>
                        <dt class="col-sm-auto text-start">Fecha Fin</dt>
                        <dd class="col-sm-6 text-start">${exp.fechaHasta}</dd>
                        <dt class="col-sm-auto text-start">Motivo de salida</dt>
                        <dd class="col-sm-6 text-start">${exp.motivoSalida}</dd>
                    </dl>
        </div>
        `
    }
    //content += "</ul>" 
    div.innerHTML = content
    //div.innerHTML = '';
    //div.appendChild(div1);
    cont_experiencia++;
    modalExperiencia.hide()
}
function eliminarExperiencia(index) {
    //eliminar del array
    experiencias[index]=null
    //eliminar en html
    document.getElementById("exp-"+index).remove()
    //event.target.parentElement.remove()
}
/*---------------Estudios---------------------------*/

function agregarFieldEstudio(){
    //recoger del form
    let pairs = {};
    const formest = document.querySelector("[name=estudio-form]");
    const formData = new FormData(formest);
    formest.classList.add('was-validated')
    let error=validarfecha(formData.get("fechaDesde"), formData.get("fechaHasta"))
    let appendTo = "Hasta";
    if (error) {

            if(error.includes("desde")) appendTo = "Desde";
            
            formest['fecha'+appendTo].setCustomValidity(error)
            formest.querySelector(".errorFecha"+appendTo).innerHTML = error;
            console.log(error);
            
    }
    else{
        formest.fechaDesde.setCustomValidity('')
        formest.fechaHasta.setCustomValidity('')
    }

    //Validacion
    let returnFlag = false;

    let requiredValues = ["tipoDeEstudio", "institucion", "estado", "fechaDesde", "temaDeEstudio"]

    formData.forEach((value, key)=>{
        if(requiredValues.includes(key)
            && value==="" && returnFlag == false){
            console.log(key, value)
            returnFlag = true;
        }
    });

    if(returnFlag===true){
        let message = "Rellene "
        for(let i=0;i<requiredValues.length;i++){
            message+=", "+requiredValues[i];
        }
        message += " como minimo."
        //alert(message);
        return;
    }


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
    let nombre = pairs["institucion"]
    delete pairs["institucion"]
    console.log(pairs)
    pairs["institucion"] = {  }
    pairs["institucion"].nombre = nombre
    pairs["institucion"].subNombre = ""
    pairs["estudioReconocimiento"] = estudioReconocimiento.filter(rec => rec.nombre);
    estudios[cont_estudios] = pairs;
    formest.reset();
    //imprimir lista actualizada
    const div = document.querySelector("#estudios")
    const div1 = document.createElement('div');
    let content='';
    
    for (let index = 0; index < estudios.length; index++) {
        const est = estudios[index];
        if(est==null) continue;
        content += `
        <div class="col border border-3 rounded" id="est-${index}">
        <center><h5>Estudio <i class="bi bi-trash-fill" onclick="eliminarEstudio(${index})"></i></h5></center>
        <dl class="row row-cols-md-2 gx-0 gy-2">
            <dt class="col-sm-auto text-start">Institucion</dt>
            <dd class="col-sm-6 text-start">${est.institucion.nombre}</dd>
            <dt class="col-sm-auto text-start">Tipo de estudio</dt>
            <dd class="col-sm-6 text-start">${est.tipoDeEstudio}</dd>
            <dt class="col-sm-auto text-start">Carrera</dt>
            <dd class="col-sm-6 text-start">${est.temaDeEstudio}</dd>
            <dt class="col-sm-auto text-start">Fecha Inicio</dt>
            <dd class="col-sm-6 text-start">${est.fechaDesde}</dd>
            <dt class="col-sm-auto text-start">Fecha Fin</dt>
            <dd class="col-sm-6 text-start">${est.fechaHasta}</dd>
            <dt class="col-sm-auto text-start">Estado</dt>
            <dd class="col-sm-6 text-start">${est.estado}</dd>
        </dl>
            
        </div>
        
        `
    }
 
    div.innerHTML = content
    //div.innerHTML = '';
    //div.appendChild(div1);
    cont_estudios++;
    formest.classList.remove('was-validated')
    modalEstudio.hide()
}

function eliminarEstudio(index) {
    //eliminar del array
    estudios[index]=null
    //eliminar en html
    document.getElementById("est-"+index).remove()
}
/*------------Cargos----------------------------------------*/
function agregarFieldCargo(){
    //recoger del form
    const pairs = {};
    const formcar = document.querySelector("[name=cargo-form]");
    const formData = new FormData(formcar);

    //Validacion
    let returnFlag = false;

    let requiredValues = ["nombre"]

    formData.forEach((value, key)=>{
        if(requiredValues.includes(key)
            && value==="" && returnFlag == false){
            console.log(key, value)
            returnFlag = true;
        }
    });

    if(returnFlag===true){
        let message = "Rellene "
        for(let i=0;i<requiredValues.length;i++){
            message+=", "+requiredValues[i];
        }
        message += " como minimo."
        alert(message);
        return;
    }

    for (const [name, value] of formData){
        pairs[name] = value
    }
    console.log(pairs)
    for(let i=0;i<cont_cargo;i++){
        if(postulaciones[i]!==null){
            if(postulaciones[i]["id"]===pairs["cargo-id"]){
                alert("Ya has agregado ese cargo!")
                //cont_cargo--;
                return;
            }
        }
    }
    postulaciones[cont_cargo]={}
    postulaciones[cont_cargo]["id"]=pairs["cargo-id"]
    //postulaciones[cont_cargo]["cargo"]=pairs["cargo-id"]=="-1"?{nombre: pairs["cargo-nombre"]}:{id: pairs["cargo-id"],nombre:document.querySelector('[name=cargo-id] > option[value="'+pairs["cargo-id"]+'"]').innerHTML}
    console.log(postulaciones)
    formcar.reset();
    //imprimir lista actualizada
    const div = document.querySelector("#cargos")
    const div1 = document.createElement('div');

    let content1=''
    for (let index = 0; index < postulaciones.length; index++) {
        const car = postulaciones[index];
        if(car==null) continue;
        content1 += `
        <div class="col-auto" id="car-${index}" style="text-transform: uppercase;">
            ${document.querySelector('[name=cargo-id] >  option[value="'+car.id+'"]').innerHTML} &nbsp;<i class="bi bi-trash-fill" onclick="eliminarCargoPostulante(event)"></i>     
            
        </div>

        `
    }
    //content1 += "</ul>" 
    div.innerHTML = content1
    //div.innerHTML = '';
    //div.appendChild(div1);
    cont_cargo++;
    document.querySelector("#no-valid-cargo").style.display = "none";
    modalCargo.hide()
}
function eliminarCargoPostulante(event) {
    //eliminar del array
    postulaciones[event.target.parentElement.id.split("-")[1]]=null
    //eliminar en html
    event.target.parentElement.remove()
}

/*--------------Referencias----------------------------- */
function agregarFieldReferencia(event){
    //recoger del form
    const pairs = {};
    const formexp = document.querySelector("[name=referencia-form]");
    formexp.classList.add('was-validated')
    const formData = new FormData(formexp);
    const referenciaPersonal = [{},{},{}];
    let pos_rec;
    let returnFlag = false;

    let requiredValues = ["nombre", "relacion", "telefono"]

    formData.forEach((value, key)=>{
        if(requiredValues.includes(key)
        && value==="" && returnFlag == false){
            console.log(key, value)
            returnFlag = true;
        }
    });

    if(returnFlag===true){
        let message = "Rellene "
        for(let i=0;i<requiredValues.length;i++){
            message+=", "+requiredValues[i];
        }
        message += " como minimo."
        //alert(message);
        return;
    }

    for (const [name, value] of formData){
        pos_rec = name.split("-");//rec-nombre-index
        if (pos_rec.length > 1) {
            referenciaPersonal[pos_rec[2]][pos_rec[1]] = value
        }
        else{
            pairs[name] = value
        }

    }
    pairs["referenciaPersonal"] = referenciaPersonal.filter(rec => rec.nombre);
    referencias[cont_referencias] = pairs;
    formexp.reset();
    //imprimir lista actualizada
    const div = document.querySelector("#referencia")
    const div1 = document.createElement('div');
    let content=''
    for (let index = 0; index < referencias.length; index++) {
        const exp = referencias[index];
        if(exp==null) continue;
        content += `
        <div class="col border border-3 rounded" id="ref-${index}">
        <center><h5>Referencia Personal <i class="bi bi-trash-fill" onclick="eliminarReferencia(${index})"></i></h5></center> 
            <dl class="row row-cols-sm-2">
                <dt class="col-sm-auto text-start">Nombre</dt>
                <dd class="col-sm text-start">${exp.nombre}</dd>
                <dt class="col-sm-auto text-start">Telefono</dt>
                <dd class="col-sm text-start">${exp.telefono}</dd>
                <dt class="col-sm-auto text-start">Relacion</dt>
                <dd class="col-sm text-start">${exp.relacion}</dd>
            </dl>
        </div>
        
        `
    }
    //content += "</ul>" 
    div.innerHTML = content
    //div.innerHTML = '';
    //div.appendChild(div1);
    cont_referencias++;
    formexp.classList.remove('was-validated')
    modalReferencia.hide()
}
function eliminarReferencia(index) {
    //eliminar del array
    referencias[index]=null
    //eliminar en html
    document.getElementById("ref-"+index).remove()
}
/*--------------Form submit----------------------------- */
function serializeJSON (form) {
    // Create a new FormData object
    const formData = new FormData(form);

    if(formData.get('fechaNacimiento')>=new Date().toISOString().slice(0,10)){
        form['fechaNacimiento'].setCustomValidity('Fecha de nacimiento debe ser menor que actual')
        noValidateFlag = true;
        return;
    }
    else{
        form['fechaNacimiento'].setCustomValidity('')   
    }


    // Create an object to hold the name/value pairs
    const pairs = {};

    // Add each name/value pair to the object
    for (const [name, value] of formData) {
        pairs[name] = value
    }
    pairs["experiencias"] = experiencias.filter(exp => exp)//eliminacion de nulos
    pairs["estudios"] = estudios.filter(est => est)//eliminacion de nulos
    pairs["tecnologias"] = tecnologias.filter(tec => tec)//eliminacion de nulos
    pairs["postulaciones"] = postulaciones.filter(car => car)//eliminacion de nulos
    pairs["referencias"] = referencias.filter(tec => tec)
    if(pairs["postulaciones"].length<1){
        document.querySelector("#no-valid-cargo").style.display = "block";
        noValidateFlag = true;
    }else{
        document.querySelector("#no-valid-cargo").style.display = "none";
    }
    console.log(pairs["tecnologias"])
    if(pairs["tecnologias"].length<1){
        document.querySelector("#no-valid-tecno").style.display = "block";
        noValidateFlag = true;
    }else{
        document.querySelector("#no-valid-tecno").style.display = "none";
    }
    if(noValidateFlag){
        return;
    }
    noValidateFlag = false
    
    // Return the JSON string
    return JSON.stringify(pairs, null, 2);
}

function obtenerCV(){
    let input = document.querySelector('#cvFile')
    return input.files[0];
  
}

async function postData(url = '', data = {}) {
    var token = document.querySelector("meta[name='_csrf']").content;
    var headerxs = document.querySelector("meta[name='_csrf_header']").content;
    // Default options are marked with *
    let senddata = {
        method: 'POST', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
            //'Content-Type': undefined//'application/json',
            // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        redirect: 'follow', // manual, *follow, error
        referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
        body: data // body data type must match "Content-Type" header
    }
    senddata["headers"][headerxs] = token;
    let response = null
    if(!noValidateFlag){
        response = await fetch(url, senddata);
    }
    return response; // parses JSON response into native JavaScript objects
}

function formatearJsonWithFile(json, file){
    formData = new FormData();

    formData.append("file", file);
    formData.append('postulante', new Blob([json], {
                type: "application/json"
            }));
    return formData
}

/*--------------Llamar funciones y agregar listeners----------------------------- */
formValidator();
fechasMaxMin();
listarCiudades(depSelect.value);

form.addEventListener("submit",(evt)=>{
    // if (!form.checkValidity()) {
    //     evt.preventDefault()
    //     evt.stopPropagation()
    // }
    // form.classList.add('was-validated')
    evt.preventDefault();
    let formSerialized = serializeJSON(form);
    let fileCV = obtenerCV();
    if(!noValidateFlag){
        postData('work-with-us', formatearJsonWithFile(formSerialized,fileCV))
            .then(response => {
                if(response.status==200 || response.status==302){
                    location.replace(response.url);
                }else{
                    
                    errorDispatcher(response.text().then(value => console.log(value)));
                    
                }
            },(reason)=>{
                errorDispatcher(reason);
            });
        }
    noValidateFlag = false
} );

function errorDispatcher(reason){
    const errorSection = document.querySelector("#errorSection")
    errorSection.innerHTML = `
    <div  class="alert alert-warning alert-dismissible fade show " role="alert">
        <strong>Ha ocurrido un error</strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>`;
    console.log(reason)
    errorSection.focus()
}

//evento para cambio de ciudad segun departamento
depSelect.addEventListener("change",evt => listarCiudades(evt.target.value))

