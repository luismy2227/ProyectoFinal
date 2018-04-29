$(document).ready(function(){
//alert("hola1");
    cargarInfo();
});

function cargarInfo(){
    //alert("hola2");
    $.ajax({
        url:"ajax/gestionar-verPerfil.php",
            dataType:"JSON",
            method:"POST",
            data:{
                "accion":"cargarInfo"
            },
            success:function(respuesta){
                //alert("hola3");

                //for (var i = 0; i < respuesta.length ; i++) {
                    var usuario = respuesta[0];
                    //alert("hola4");
                   var html =  //'<input required type="text" class="form-control" name="text_PrimerNombre" id="text_PrimerNombre"  data-rule="minlen:4" placeholder="Primer Nombre" data-msg="PrimerNombre" value="'+usuario.primernombre+'"/>';
                                    
                                '<div class="row">'+
                                '   <div class="span4 form-group">'+
                                '       <div class="span4 form-group">'+
                                '            <input required type="text" class="form-control" name="text_PrimerNombre" id="text_PrimerNombre"  data-rule="minlen:4" placeholder="Primer Nombre" data-msg="PrimerNombre" value="'+usuario.primernombre+'"/>'+
                                '            <input required type="text" class="form-control" name="text_SegundoNombre" id="text_SegundoNombre"  data-rule="minlen:4" placeholder="Segundo Nombre" data-msg="SegundoNombre" value="'+usuario.segundonombre+'"/>'+
                                '        </div>'+
                                '        <div class="span4 form-group">'+
                                '            <div class="wrap-input100 validate-input m-b-16" data-validate = "Correo Requerido">'+
                                '                <input required class="input100" type="email" name="text_Correo" id="text_Correo" placeholder="Correo" required value="'+usuario.correoelectronico+'">'+
                                '                <span class="focus-input100"></span>'+
                                '            </div>'+
                                '            <input required type="text" class="form-control" name="text_Telefono" id="text_Telefono" placeholder="Ingrese Telefono" data-rule="minlen:4" data-msg="Porfavor ingrese Telefono" value="'+usuario.telefono+'"/>'+
                                '            <div class="validation"></div>'+
                                '        </div>'+
                                '        <div class="span4 form-group">'+
                                '            <input required type="text" class="form-control" name="text_NombreUsuario" id="text_NombreUsuario" placeholder="Ingrese el Usuario"  data-rule="minlen:4" data-msg="Porfavor ingrese Identidad" value="'+usuario.nombreusuario+'"/>'+
                                '            <div class="validation"></div>'+
                                '            <input required type="password" class="form-control" name="text_UserPassword" id="text_UserPassword" placeholder="Ingrese el Password"  data-rule="minlen:4" data-msg="Porfavor ingrese Identidad" />'+
                                '            <input required type="text" class="form-control" name="text_Departamento" id="text_Departamento" placeholder="Ingrese el Departamento"  data-rule="minlen:4" data-msg="Porfavor ingrese Telefono" value="'+usuario.departamento+'"/>'+
                                '            <div class="validation"></div>'+
                                '            <input required type="text" class="form-control" name="text_Municipio" id="text_Municipio" placeholder="Ingrese el Municipio" data-rule="minlen:4" data-msg="Porfavor ingrese Telefono" value="'+usuario.municipio+'"/>'+
                                '            <div class="validation"></div>'+
                                '        </div>'+
                                
                                '    </div>'+
                                '    <div class="span4 form-group">'+
                                '        <div class="span4 form-group">'+
                                '            <input required type="text" class="form-control" name="text_PrimerApellido" id="text_PrimerApellido" placeholder="Primer Apellido" data-rule="minlen:4" data-msg="PrimerApellido" value="'+usuario.primerapellido+'"/>'+
                                '            <input required type="text" class="form-control" name="text_SegundoApellido" id="text_SegundoApellido" placeholder="Segundo Apellido" data-rule="minlen:4" data-msg="SegundoApellido" value="'+usuario.segundoapellido+'"/>'+
                                '            <input required type="text" class="form-control" name="text_Identidad" id="text_Identidad" placeholder="Ingrese el Identidad"  data-rule="minlen:4" data-msg="Porfavor ingrese Identidad" value="'+usuario.identidad+'"/>'+
                                '            <div class="validation"></div>'+
                                '            <input required type="text" class="form-control" name="text_FechaContratacion" id="text_FechaContratacion" placeholder="Ingrese Fecha Contratacion"  data-rule="minlen:4" data-msg="Porfavor ingrese Fecha Contratacion" value="'+usuario.fechacontratacion+'"/>'+
                                '            <div class="validation"></div>'+
                                '            <input required type="text" class="form-control" name="text_FechaPromocion" id="text_FechaPromocion" placeholder="Ingrese Fecha Promocion"  data-rule="minlen:4" data-msg="Porfavor ingrese Fecha Promocion" value="'+usuario.fechapromocion+'"/>'+
                                '            <div class="validation"></div>'+
                                '            <input required type="text" class="form-control" name="text_Imagenruta" id="text_Imagenruta" placeholder="Ingrese la imagen"  data-rule="minlen:4" data-msg="Porfavor ingrese la imagen" value="'+usuario.rutafoto+'"/>'+
                                '            <div class="validation"></div>'+
                                '        </div>'+
                                '    </div>'+
                                '    <div class="span4 form-group">'+
                                '        <div class="span4 form-group">'+
                                '            <input required type="text" class="form-control" name="text_Colonia" id="text_Colonia" placeholder="Ingrese la Colonia" data-rule="minlen:4" data-msg="Porfavor ingrese colonia" value="'+usuario.colonia+'"/>'+
                                '            <div class="validation"></div>'+
                                '            <input required type="text" class="form-control" name="text_Sector" id="text_Sector" placeholder="Ingrese el Sector"  data-rule="minlen:4" data-msg="Porfavor ingrese sector" value="'+usuario.sector+'"/>'+
                                '            <div class="validation"></div>'+
                                '            <input required type="text" class="form-control" name="text_NumeroCasa" id="text_NumeroCasa"  placeholder="Ingrese numero de Vivienda" data-rule="minlen:4" data-msg="Porfavor ingrese viviendoa" value="'+usuario.numerocasa+'"/>'+
                                '            <div class="validation"></div>'+
                                '        </div>'+
                                '    </div>'+
                                '</div>';                 
                    $("#Form_EditarEmpleado").append(html);
                //}
            },
            error:function(e){
                console.log(e);
            }
    });
}