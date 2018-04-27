<?php
  include("../class/class-conexion.php");
  $conexion= new Conexion();
  $aux=null;
  $aux1=null;
  $aux2=null;
  $query=null;


  if(isset($_POST["cbx_SeleccioneGenero"])){
    $genero=$_POST["cbx_SeleccioneGenero"];
    $genero=(int)$genero;
  }
  

  
if(isset($_POST["text_PrimerNombre"])){
    $primernombre=$_POST["text_PrimerNombre"];
    
  }

  if(isset($_POST["text_Identidad"])){
    $identidad=$_POST["text_Identidad"];
    
  }
  if(isset($_POST["text_FechaContratacion"])){
    $fechacontratacion=$_POST["text_FechaContratacion"];
    
  }
   if(isset($_POST["text_FechaPromocion"])){
    $fechapromocion=$_POST["text_FechaPromocion"];
    
  }
   if(isset($_POST["cbx_Idcargo"])){
    $cargo=$_POST["cbx_Idcargo"];
    $cargo=(int)$cargo;
  }

  if(isset($_POST["cbx_EmpleadoSuperior"])){
    $empleadosuperior=$_POST["cbx_EmpleadoSuperior"];
    $empleadosuperior=(int)$empleadosuperior;
  }
   
  if(isset($_POST["text_NombreUsuario"])){
    $nombreusuario=$_POST["text_NombreUsuario"];
    
  }
  if(isset($_POST["text_UserPassword"])){
    $userpassword=$_POST["text_UserPassword"];
    
  }
  if(isset($_POST["text_Imagenruta"])){
    $imagenruta=$_POST["text_Imagenruta"];
    
  }

  if(isset($_POST["text_SegundoNombre"])){
    $segundonombre=$_POST["text_SegundoNombre"];
  }

  if(isset($_POST["text_PrimerApellido"])){
    $primerapellido=$_POST["text_PrimerApellido"];
    
  }

  if(isset($_POST["text_SegundoApellido"])){
    $segundoapellido=$_POST["text_SegundoApellido"];
  }

  if(isset($_POST["text_Correo"])){
    $correo=$_POST["text_Correo"];

  }

  if(isset($_POST["text_Telefono"])){
    $telefono=$_POST["text_Telefono"];
  }



  if(isset($_POST["text_Departamento"])){
    $departamento=$_POST["text_Departamento"];
  }

  if(isset($_POST["text_Municipio"])){
    $municipio=$_POST["text_Municipio"];
  }

  if(isset($_POST["text_Colonia"])){
    $colonia=$_POST["text_Colonia"];
  }

  if(isset($_POST["text_Sector"])){
    $sector=$_POST["text_Sector"];
    
  }

  if(isset($_POST["text_NumeroCasa"])){
    $numerocasa=$_POST["text_NumeroCasa"];
  }

  
  $respuesta="";

  if($genero==0){
    $respuesta="Seleccione un Genero"; 
  }
  if($cargo==0){
    $respuesta="Seleccione un Cargo"; 
  }
  if($empleadosuperior==0){
    $respuesta="Seleccione un Empleado Superior"; 
  }
else if ($primernombre==null or $primernombre==""){
  $respuesta="Ingrese Primer Nombre";

}
else if ($segundonombre==null or $segundonombre==""){
  $respuesta="Ingrese Segundo Nombre";

}
else if ($identidad==null or $identidad==""){
  $respuesta="Ingrese la identidad";

}

else if ($nombreusuario==null or $nombreusuario==""){
  $respuesta="Ingrese el Nmbre de usuario";

}
else if ($userpassword==null or $userpassword==""){
  $respuesta="Ingrese Password";

}
else if ($imagenruta==null or $imagenruta==""){
  $respuesta="Ingrese la Ruta";

}

else if ($primerapellido==null or $primerapellido==""){
  $respuesta="Ingrese Primer Apellido";

}
else if ($segundoapellido==null or $segundoapellido==""){
  $respuesta="Ingrese Primer Nombre";

}
else if ($correo==null or $correo==""){
  $respuesta="Ingrese el Correo ";

}
else if ($telefono==null or $telefono==""){
  $respuesta="Ingrese el Telefono";

}

else if ($departamento==null or $departamento==""){
  $respuesta="Ingrese el Departamento";

}
else if ($municipio==null or $municipio==""){
  $respuesta="Ingrese el Municipio";

}
else if ($colonia==null or $colonia==""){
  $colonia="Ingrese el colonia";

}
else if ($sector==null or $sector==""){
  $sector="Ingrese el sector";

}
else if ($fechapromocion==null or $fechapromocion==""){
  $fechapromocion="Ingrese la fecha Promocion";

}
else if ($fechacontratacion==null or $fechacontratacion==""){
  $fechacontratacion="Ingrese la fecha Contratacion";

}

else if ($numerocasa==null or $numerocasa==""){
  $numerocasa="Ingrese el numerocasa";

}
  else{
    $query="SELECT  * FROM funcion_agregar_usuario_empleado('$identidad','$primernombre','$segundonombre','$primerapellido','$segundoapellido','$telefono','$correo','$departamento','$municipio','$colonia','$sector','$numerocasa',$genero,'$nombreusuario','$userpassword','$imagenruta','$fechacontratacion',$cargo,$empleadosuperior,'$fechapromocion');";  
    $resultados=$conexion->ejecutarConsulta($query);
    $respuesta=$conexion->obtenerFila($resultados);
    $respuesta=$respuesta[0];//
  }
  $conexion->cerrarConexion();
  echo json_encode($respuesta); 
