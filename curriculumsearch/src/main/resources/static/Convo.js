const cargoSelect = document.querySelector("#cargoId");

function listarConvocatorias(id){
    const ConvocatoriaAmostrar = convocatorias.filter(c=>c.cargoId==id);
    const convocatoria = document.querySelector("select[name=convId]");
    const frag = document.createDocumentFragment();
    let optionDefault = document.createElement("option");
    optionDefault.value = "";
    optionDefault.innerHTML = "Seleccione una opcion";
    frag.appendChild(optionDefault);
    for (const conv of ConvocatoriaAmostrar) {
        const opt = document.createElement("option");    
        opt.value = conv.id;
        if(conv.fechaFin!=null){
            opt.innerHTML ="Desde :"+new Date(conv.fechaInicio).toISOString().slice(0,10)+"-"+" Hasta :"+new Date(conv.fechaFin).toISOString().slice(0,10);
        }else{
            opt.innerHTML ="Desde :"+new Date(conv.fechaInicio).toISOString().slice(0,10)
        }
        opt.setAttribute("data-CargoId",conv.cargoId);
        frag.appendChild(opt)
    }
    convocatoria.replaceChildren(frag);
     
}
listarConvocatorias(cargoSelect.value);
cargoSelect.addEventListener("change",evt => listarConvocatorias(evt.target.value))
