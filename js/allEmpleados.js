$(document).ready(function(){
    //alert("hola1");
    allEmpleados();
});

function allEmpleados(){
    //alert("hola2");
    $.ajax({
        url:"ajax/gestionar-allEmpleados.php",
            dataType:"JSON",
            method:"POST",
            data:{
                "accion":"verTodos"
            },
            success:function(respuesta){
                //alert("hola3");
                for (var i = 0; i < respuesta.length ; i++) {
                    var usuario = respuesta[i];
                    var fila =  
                                '<div class="dotted_line"></div>'+
                                '<div class="dotted_line"></div>'+
                                '<div class ="Cajita" id="Cajita">'+
                                '   <div class="col-md-6 col-lg-4" >'+
                                '   <div class="single-feature">'+
                                '       <div class="card">'+
                                '           <div class="card-header cards-courses-h"> <h3> Usuario: '+usuario.nombreusuario+' </h3>'+
                                '           </div>'+    
                                '           <div class="card-body">'+
                                '                   <h5 class="card-title">'+'</h5>'+
                                '                   <img src="'+usuario.rutafoto+'" alt="" width="200" height="250">'+
                                '           </div>'+
                                '       </div>'+
                                '       </div>'+
                                '   </div></div>'+
                                '<br><br><br><br><br>'+
                                'Empleado: '+usuario.idempleado+
                                '<br>Nombre: '+usuario.primernombre+" "+usuario.segundonombre+" "+usuario.primerapellido+" "+usuario.segundoapellido+
                                '<br>Fecha de contratación: '+usuario.fechacontratacion+
                                '<br>Cargo: '+usuario.cargo+
                                '<br>Fecha de obtención de cargo: '+usuario.fechapromocion+
                                '<br>Teléfono: '+usuario.telefono+
                                '<br>Correo Electrónico: '+usuario.correoelectronico+
                                '<br><br><br>';
                                //'<button class="btn btn-color btn-rounded" id="btn_Editar" name="btn_Editar" type="submit" onclick="javascript:window.location = \'editarEmpleado.php\';">Editar</button>';                    
                    $("#Empleados").append(fila);
                }
            },
            error:function(e){
                console.log(e);
            }
    });
}