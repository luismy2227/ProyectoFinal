$(function () {
 //alert("Entré aquí 1");
  $(document).on("submit","#Form_InsertarCliente",function(event){
    //alert("Entré aquí 2");
    event.preventDefault();
    $.ajax({
        type:"POST",
        url:"ajax/gestionar-insertarCliente.php",
        dataType:"JSON",
        data:$(this).serialize(),
        success:function(respuesta){
         //alert("Entré aquí 3");
            
            if(respuesta != 'Cliente insertado con éxito'){
                alert(respuesta);
                
            }   else{
                window.location='index.php';
            }
            /*console.log(respuesta[0]);*/
        }
    });
  });
});

