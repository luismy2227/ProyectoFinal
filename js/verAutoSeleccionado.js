$(document).ready(function(){
    //alert("hola1");
    seleccionarCarro();
});

function seleccionarCarro(){
    var idVehiculoSeleccionado = $("#txt_idVehiculo").val();
    //alert("hola2");
    $.ajax({
        url:"ajax/gestionar-allCars.php",
            dataType:"JSON",
            method:"POST",
            data:{
                "accion":"seleccionar-especifico",
                "idvehiculo": idVehiculoSeleccionado
            },
            success:function(respuesta){
                //alert("hola3");
                //for (var i = 0; i < respuesta.length ; i++) {
                   var carros = respuesta;
                   //alert(carros.sevende+" "+carros.serenta)
                   var fila =  
                                '<div class="dotted_line"></div>'+
                                '<div class ="Cajita" id="Cajita">'+
                                '   <div class="col-md-6 col-lg-4" >'+
                                '   <div class="single-feature">'+
                                '       <div class="card">'+
                                '           <div class="card-header cards-courses-h"><h3>'+carros.marca+" "+carros.modelo+" "+carros.anio+
                                '           </h3></div>'+    
                                '           <div class="card-body">'+
                                '                   <h5 class="card-title">'+'</h5>'+
                                '                   <img src="'+carros.foto+'" alt="" width="1000" height="700">'+
                                //'                   <p><a class="btn btn-primary" href="verAutoSeleccionado.php?id='+carros.idvehiculo+'" role="button" >Ver Vehículo &raquo;</a></p>'+
                                '           </div>'+
                                '       </div>'+
                                '       </div>'+
                                '   </div></div>'+
                                '<br><br><br><br>'+
                                '<div class="add-details">'+
                                '<div class="container">'+
                                '<div class="row">'+
                                '<div class="col-800">'+
                                '<ul>';
                                if (carros.sevende=='t'){
                                    fila = fila +'<br><span class="info-name">Precio de venta: </span>'+
                                                '<span class="info-value" >Lps. '+carros.precioventa+'</span>';
                                }
                                if (carros.serenta=='t'){
                                    fila = fila +'<br><span class="info-name">Precio de renta por hora: </span>'+
                                                '<span class="info-value" >Lps. '+carros.preciorenta+'</span>';
                                }
                                fila = fila +'</ul></div></div></div></div>';
                    $("#carros").append(fila);
                //}
            },
            error:function(e){
                console.log(e);
            }
    });
}

function seleccionar(idvehiculo){
    alert(idvehiculo);
}