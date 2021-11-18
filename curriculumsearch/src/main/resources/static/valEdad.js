//Convertir DOB to Age
window.onload= init;


function init(){
    contarEdad();
    //fechaFormat();
}


function contarEdad() {
    let today = new Date();
    let dob = document.getElementById("dob").value;
    let current_datetime = new Date(dob);
    let month = current_datetime.getMonth();
    let day = current_datetime.getDate();
    let formatted_date = current_datetime.getDate() + "/" + (current_datetime.getMonth() + 1)  + "/" + current_datetime.getFullYear();
    //console.log(formatted_date); ver Fecha del form en formato dd/mm/yyy
    let date2=new Date(dob);
    let pattern = /^\d{1,2}\/\d{1,2}\/\d{4}$/; //Regex to validate date format (dd/mm/yyyy)
    let age = today.getFullYear() - current_datetime.getFullYear();

    if (pattern.test(formatted_date)) {
       if (today.getMonth() < month || (today.getMonth() == month && today.getDate() < day))
       {
         age--;
        }  
   //     console.log(age); ver edad
        let anio = document.getElementById("edad").innerHTML=age+" años";
    } else {
        alert("Invalid date format. Please Input in (dd/mm/yyyy) format!");
    }

/*
function fechaFormat(){

    //EXPERIENCIA

   let fechaInicioExp = document.getElementById("fechaInicioExp2").value;
   let fie =new Date(fechaInicioExp);
 //  let formatted_fie = fie.getDate() + "/" + (fie.getMonth() + 1)  + "/" + fie.getFullYear();
   
   let fechaFinExp = document.getElementById("fechaFinExp2").value;
   let ffe =new Date(fechaFinExp);
 //  let formatted_ffe = ffe.getDate() + "/" + (ffe.getMonth() + 1)  + "/" + ffe.getFullYear();
   

     // Validacion de ceros Fecha inicio
    if(((fie.getMonth() + 1) < 10) && (fie.getDate() < 10) ){
    let formatted_fie = "0"+  fie.getDate() + "/0" + (fie.getMonth() + 1)  + "/" + fie.getFullYear();
    let mostrar1 = document.getElementById("fiemostrar").innerHTML = formatted_fie;
    console.log(mostrar1);
    }else{
        if((fie.getMonth() + 1) < 10){
            let formatted_fie = fie.getDate() + "/0" + (fie.getMonth() + 1)  + "/" + fie.getFullYear();
             mostrar1 = document.getElementById("fiemostrar").innerHTML = formatted_fie;
             console.log(mostrar1);
        }else{
            if(fie.getDate() < 10){
                let formatted_fie ="0"+ fie.getDate() + "/" + (fie.getMonth() + 1)  + "/" + fie.getFullYear();
                 mostrar1 = document.getElementById("fiemostrar").innerHTML = formatted_fie;
                 console.log(mostrar1);
            }else{
                let formatted_fie = fie.getDate() + "/" + (fie.getMonth() + 1)  + "/" + fie.getFullYear();
                 mostrar1 = document.getElementById("fiemostrar2").innerHTML = formatted_fie;
                 console.log(mostrar1);
            }
        }
    }
    


   // Validacion de ceros Fecha fin
   if(((ffe.getMonth() + 1) < 10) && (ffe.getDate() < 10) ){
    let formatted_ffe = "0"+  ffe.getDate() + "/0" + (ffe.getMonth() + 1)  + "/" + ffe.getFullYear();
    let mostrar2 = document.getElementById("ffemostrar").innerHTML = formatted_ffe;
    console.log(mostrar2);
    }else{
        if((ffe.getMonth() + 1) < 10){
            let formatted_ffe = ffe.getDate() + "/0" + (ffe.getMonth() + 1)  + "/" + ffe.getFullYear();
             mostrar2 = document.getElementById("ffemostrar").innerHTML = formatted_ffe;
             console.log(mostrar2);
        }else{
            if(ffe.getDate() < 10){
                let formatted_ffe ="0"+ ffe.getDate() + "/" + (ffe.getMonth() + 1)  + "/" + ffe.getFullYear();
                 mostrar2 = document.getElementById("ffemostrar").innerHTML = formatted_ffe;
                 console.log(mostrar2);
            }else{
                let formatted_ffe = ffe.getDate() + "/" + (ffe.getMonth() + 1)  + "/" + ffe.getFullYear();
                 mostrar2 = document.getElementById("ffemostrar").innerHTML = formatted_ffe;
                 console.log(mostrar2);
            }
        }
    }
    

   

     //ESTUDIOS//////////

   let fechaInicioEst = document.getElementById("fechaInicioEst").value;
   let fies =new Date(fechaInicioEst);
   let formatted_fies = fies.getDate() + "/" + (fies.getMonth() + 1)  + "/" + fies.getFullYear();
   
   let fechaFinEst = document.getElementById("fechaFinEst").value;
   let ffes =new Date(fechaFinEst);
   let formatted_ffes = ffes.getDate() + "/" + (ffes.getMonth() + 1)  + "/" + ffes.getFullYear();
   
   // Validacion de ceros Fecha fin
   if(((ffes.getMonth() + 1) < 10) && (ffes.getDate() < 10) ){
    let formatted_ffes = "0"+  ffes.getDate() + "/0" + (ffes.getMonth() + 1)  + "/" + ffes.getFullYear();
    let mostrar3 = document.getElementById("ffesmostrar").innerHTML = formatted_ffes;
    }else{
        if((ffes.getMonth() + 1) < 10){
            let formatted_ffes = ffes.getDate() + "/0" + (ffes.getMonth() + 1)  + "/" + ffes.getFullYear();
             mostrar3 = document.getElementById("ffesmostrar").innerHTML = formatted_ffes;
        }else{
            if(ffes.getDate() < 10){
                let formatted_ffes ="0"+ ffes.getDate() + "/" + (ffes.getMonth() + 1)  + "/" + ffes.getFullYear();
                 mostrar3 = document.getElementById("ffesmostrar").innerHTML = formatted_ffes;
            }else{
                let formatted_ffes = ffes.getDate() + "/" + (ffes.getMonth() + 1)  + "/" + ffes.getFullYear();
                mostrar3 = document.getElementById("ffesmostrar").innerHTML = formatted_ffes;
            }
        }
    }
   

    // Validacion de ceros Fecha inicio
   if(((fies.getMonth() + 1) < 10) && (fies.getDate() < 10) ){
    let formatted_fies = "0"+  fies.getDate() + "/0" + (fies.getMonth() + 1)  + "/" + fies.getFullYear();
    let mostrar4 = document.getElementById("fiesmostrar").innerHTML = formatted_fies;
    }else{
        if((fies.getMonth() + 1) < 10){
            let formatted_fies = fies.getDate() + "/0" + (fies.getMonth() + 1)  + "/" + fies.getFullYear();
             mostrar4 = document.getElementById("fiesmostrar").innerHTML = formatted_fies;
        }else{
            if(fies.getDate() < 10){
                let formatted_fies ="0"+ fies.getDate() + "/" + (fies.getMonth() + 1)  + "/" + fies.getFullYear();
                 mostrar4 = document.getElementById("fiesmostrar").innerHTML = formatted_fies;
            }else{
                let formatted_fies = fies.getDate() + "/" + (fies.getMonth() + 1)  + "/" + fies.getFullYear();
                 mostrar4 = document.getElementById("fiesmostrar").innerHTML = formatted_fies;
            }
        }
    }
}*/


    
  
}
    