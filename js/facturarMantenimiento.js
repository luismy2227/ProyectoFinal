$(function () {
//alert("Entre aqui");
$(document).on("submit","#Form_Mantenimiento",function(event){
    event.preventDefault();
    //alert("Hola 2");
    $.ajax({
        type:"POST",
        url:"ajax/gestionar-facturarMantenimiento.php",
        dataType:"JSON",
        data:$(this).serialize(),
        data:$(this).serialize(),
        success:function(respuesta){
            //alert("Entré aquí 3");
            //var html = '';
            //alert(respuesta.mensajeSesions);
            if(respuesta=="Mantenimiento cancelado con éxito") {
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

