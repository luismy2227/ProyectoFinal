$(function () {
  //alert("Entré aquí 1");
  $(document).on("submit","#Form_InsertarEmpleado",function(event){
    event.preventDefault();
    //alert("Entré aquí 2");
    $.ajax({
        type:"POST",
        url:"ajax/gestionar-insertarEmpleado.php",
        dataType:"JSON",
        data:$(this).serialize(),
        success:function(respuesta){
           //alert("Entré aquí 3");
            
            if(respuesta != 'Empleado insertado con éxito'){
                alert(respuesta);
                
            }   else{
              window.location='index.php';
            }
            /*console.log(respuesta[0]);*/
        }
    });
  });
});