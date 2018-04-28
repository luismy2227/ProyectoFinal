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
                   var fila =  '<li>'+

<<<<<<< HEAD
                                '<div class=""></div>'+
                                '   <div class="col-md-6 col-lg-4 " >'+
                                '    <div class="single-feature">'+
                                '       <div class="">'+
                                '           <div class="">'+carros.marca+" "+carros.modelo+
=======
                                '<div class="dotted_line"></div>'+
                                '   <div class="col-md-6 col-lg-4" >'+
                                '       <div class="card">'+
                                '           <div class="card-header cards-courses-h">'+carros.marca+" "+carros.modelo+
>>>>>>> 901def8991185e2b7c3b501b00b893fc2971324e
                                '           </div>'+    
                                //'           <div class="single-feature">'+
                                '                   <h5 class="">'+'</h5>'+
                                /*'                   <p class="card-text">Precio de venta: </p>'+
                                '                   <p class="card-text">'+carros.precioventa+'</p>'+*/
<<<<<<< HEAD
                                '                   <img src="'+carros.foto+'" alt="" width="200" height="200">'+
                                '                   <p><a class="btn btn-primary" href="#" role="button">Ver Vehículo &raquo;</a></p>'+
=======
                                '                   <img src="'+carros.foto+'" alt="" width="350" height="350">'+
                                '                   <p><a class="btn btn-primary" href="verAutoSeleccionado.php" role="button">Ver Vehículo &raquo;</a></p>'+
>>>>>>> f54db400cc232ec1c74c9c00060a80494285609d
                                '           </div>'+
                                '       </div>'+
                                '   </div></li>';                   
                    $("#carros").append(fila);
            },
            error:function(e){
                console.log(e);
            }
    });
}