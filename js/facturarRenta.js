$(function () {
$(document).on("submit","#Form_Renta",function(event){
    event.preventDefault();
    //alert("Hola 2");
    $.ajax({
        type:"POST",
        url:"ajax/gestionar-facturarRenta.php",
        dataType:"JSON",
        data:$(this).serialize(),
        //data:$(this).serialize(),
        success:function(respuesta){
            //alert("Entré aquí 3");
            //var html = '';
            //alert(respuesta.mensajeSesions);
            if(respuesta=="Vehiculo rentado con éxito") {
                alert(respuesta);
                window.location='detalleFactura.php';
            }
            else{
                alert(respuesta);
            }
            console.log(respuesta);
        }
    });
  });
});

