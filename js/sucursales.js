$(document).ready(function(){
    //alert("hola1");
    allCars();
});

function allCars(){
    //alert("hola2");
    $.ajax({
        url:"ajax/gestionar-Sucursales.php",
            dataType:"JSON",
            method:"POST",
            data:{
                "accion":"listar"
            },
            success:function(respuesta){
                //alert("hola3");
                for (var i = 0; i < respuesta.length ; i++) {
                    var sucursales = respuesta[i];
                   var fila =  
                                //'<div class="dotted_line"></div>'+
                                '<div class ="Cajita" id="Cajita">'+
                                '   <div class="col-md-6 col-lg-4" >'+
                                '   <div class="single-feature">'+
                                '       <div class="card">'+
                                '           <div class="card-header cards-courses-h">'+sucursales.idsucursal+" "+sucursales.descripcion+
                                '           </div>'+    
                                '           <div class="card-body">'+
                                '                   <h5 class="card-title">'+'</h5>'+
                                /*'                   <p class="card-text">Precio de venta: </p>'+
                                '                   <p class="card-text">'+sucursales.precioventa+'</p>'+*/
                                '                   <img src="'+sucursales.foto+'" alt="" width="300" height="250">'+
                                '                   <p><a class="btn btn-primary" href="#" role="button">&raquo;</a></p>'+
                                '           </div>'+
                                '       </div>'+
                                '       </div>'+
                                '   </div></div>';                    
                    $("#sucursales").append(fila);
                }
            },
            error:function(e){
                console.log(e);
            }
    });
}