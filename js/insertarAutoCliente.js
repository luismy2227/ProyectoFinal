$(function () {
  //alert("Entré aquí");
  $(document).on("submit","#Form_InsertarAutoCliente",function(event){
    event.preventDefault();
    //alert("Entré aquí 2");
    $.ajax({
        type:"POST",
        url:"ajax/gestionar-insertarAutoCliente.php",
        dataType:"JSON",
        data:$(this).serialize(),
        success:function(respuesta){
           //alert("Entré aquí 3");
            alert(respuesta);
            if(respuesta == 'Vehiculo Cliente insertado con éxito'){
                window.location='index.php';
            }   
            /*console.log(respuesta[0]);*/
        }
    });
  });
});