$("#btn_Logout").click(function(){
    //alert("Entre a logout");
    $.ajax({
        type:"POST",
        url:"ajax/gestionar-logout.php",
        dataType:"JSON",
        data:{
            "accion":"logout",
        },
        //data:$(this).serialize(),
        success:function(respuesta){
            //alert("Entré aquí 3");
            //alert(respuesta);
            if(respuesta.loggedin==0){
                window.location.href = "index.php";
            }
            console.log(respuesta);
        },
            error:function(e){
                console.log(e);
            }
    });
});