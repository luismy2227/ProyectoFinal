$(document).ready(function(){
    //alert("hola1");
    allCars();
});

function allCars(){
    //alert("hola2");
    $.ajax({
        url:"ajax/gestionar-allCars.php",
            dataType:"JSON",
            method:"POST",
            data:{
                "accion":"listar-carros"
            },
            success:function(respuesta){
                //alert("hola3");
                for (var i = 0; i < respuesta.length ; i++) {
                    var carros = respuesta[i];
                   var fila =  
                                //'<div class="dotted_line"></div>'+
                                '<div class ="Cajita" id="Cajita">'+
                                '   <div class="col-md-6 col-lg-4" >'+
                                '   <div class="single-feature">'+
                                '       <div class="card">'+
                                '           <div class="card-header cards-courses-h">'+carros.idvehiculo+" "+carros.marca+" "+carros.modelo+
                                '           </div>'+    
                                '           <div class="card-body">'+
                                '                   <h5 class="card-title">'+'</h5>'+
                                /*'                   <p class="card-text">Precio de venta: </p>'+
                                '                   <p class="card-text">'+carros.precioventa+'</p>'+*/
                                '                   <img src="'+carros.foto+'" alt="" width="320" height="300">'+
                                '                   <p><a class="btn btn-primary" href="verAutoSeleccionado.php?id='+carros.idvehiculo+'" role="button" >Ver Vehículo &raquo;</a></p>'+
                                '           </div>'+
                                '       </div>'+
                                '       </div>'+
                                '   </div></div>';                    
                    $("#carros").append(fila);
                }
            },
            error:function(e){
                console.log(e);
            }
    });
}