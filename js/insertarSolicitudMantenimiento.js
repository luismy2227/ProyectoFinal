$(function () {
  //alert("Entré aquí 1");
  $(document).on("submit","#Form_Mantenimiento",function(event){
    event.preventDefault();
    //alert("Entré aquí 2");
    $.ajax({
        type:"POST",
        url:"ajax/gestionar-solicitudMantenimiento.php",
        dataType:"JSON",
        data:$(this).serialize(),
        success:function(respuesta){
           //alert("Entré aquí 3");
           alert(respuesta);
           console.log(respuesta);
            
            if(respuesta == 'Mantenimiento insertado con éxito'){
                window.location='index.php';
            }   else{
              alert(respuesta);
            }
            /*console.log(respuesta[0]);*/
        }
    });
  });
});