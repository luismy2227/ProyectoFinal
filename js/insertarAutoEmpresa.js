$(function () {
  //alert("Entré aquí 2");
  $(document).on("submit","#Form_InsertarAutoEmpresa",function(event){
    event.preventDefault();
    //alert("Entré aquí 2");
    $.ajax({
        type:"POST",
        url:"ajax/gestionar-insertarAutoEmpresa.php",
        dataType:"JSON",
        data:$(this).serialize(),
        success:function(respuesta){
           //alert("Entré aquí 3");
            
            if(respuesta == 'Vehiculo Empresa insertado con éxito'){
                window.location='index.php';
            }   else{
              alert(respuesta);
            }
            /*console.log(respuesta[0]);*/
        }
    });
  });
});