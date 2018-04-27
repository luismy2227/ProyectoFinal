$(function () {
//alert("Entre aqui");
$(document).on("submit","#Login",function(event){
    event.preventDefault();
    var user = $("#text_usuario").val();
    var password = $("#text_contrasena").val();
    //alert(user + password);
    $.ajax({
        type:"POST",
        url:"ajax/gestionar-login.php",
        dataType:"JSON",
        data:{
            "accion":"login",
            "user": user,
            "password": password
        },
        //data:$(this).serialize(),
        success:function(respuesta){
            //alert("Entré aquí 3");
            alert(respuesta[0]);
            //alert(respuesta.mensajeSesions);
            if(respuesta[0]=="Usuario y contraseña correctos") {
                window.location='index.php';
            }
            console.log(respuesta);
        }
    });
  });
});

