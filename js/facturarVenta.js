$(function () {
//alert("Entre aqui");
$(document).on("submit","#Form_Venta",function(event){
    event.preventDefault();
    //alert("Hola 2");
    $.ajax({
        type:"POST",
        url:"ajax/gestionar-facturarVenta.php",
        dataType:"JSON",
        data:$(this).serialize(),
        //data:$(this).serialize(),
        success:function(respuesta){
            //alert("Entré aquí 3");
            var html = '';
            //alert(respuesta.mensajeSesions);
            if(respuesta=="Vehiculo vendido con éxito") {
                alert(respuesta);
                $("#Tablita").append(html);
            }
            else{
                alert(respuesta);
            }
            console.log(respuesta);
        }
    });
  });
});

