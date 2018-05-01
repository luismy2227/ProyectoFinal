CREATE OR REPLACE FUNCTION public.funcion_solicitud_mantenimiento(
	IN pn_vehiculo 		integer,
	IN pn_empleado 		integer,
	OUT pcMensaje 		VARCHAR(1000),
	OUT pbOcurreerror 	boolean
)
    RETURNS RECORD AS 
	$BODY$
		DECLARE
			temMensaje 			VARCHAR(1000);
			contador   			INTEGER DEFAULT 0;
	        auxiliarVehiculo   	INTEGER DEFAULT 0;
		BEGIN
			pbOcurreError:=TRUE;
			temMensaje := '';

			--Comprobando que el rtn  no sea null:
			IF  pn_vehiculo IS NULL THEN
				RAISE NOTICE 'El Vehiculo np puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'Vehiculo, ');
			END IF;

	        IF  pn_empleado IS NULL THEN
				RAISE NOTICE 'El Empleado  no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'Vehiculo, ');
			END IF;

			IF temMensaje<>'' THEN
				pcMensaje := CONCAT('Campos requeridos para poder realizar la Solicitud:',temMensaje);
				RETURN;
			END IF;

			SELECT COUNT(*) INTO contador FROM tbl_VehiculoCliente WHERE  tbl_VehiculoCliente.idVehiculoCliente = pn_Vehiculo;
	 		IF contador = 0 THEN
				RAISE NOTICE 'No existe el vehículo ( % )', pn_Vehiculo;
				pcMensaje := 'El Vehiculo "'|| pn_Vehiculo ||'" no existe';
				RETURN;
			END IF;

	        SELECT COUNT(*) INTO contador FROM tbl_Empleado WHERE  tbl_Empleado.idEmpleado = pn_Empleado;
	 		IF contador = 0 THEN
				RAISE NOTICE 'No existe el empleado( % )', pn_Empleado;
				pcMensaje := 'El Empleado "'|| pn_Empleado ||'" no existe';
				RETURN;
			END IF;

			SELECT MAX(idSolicitudMantenimiento) INTO auxiliarVehiculo FROM tbl_SolicitudMantenimiento; -- Obteniendo el idVehiculo
			
			INSERT INTO tbl_SolicitudMantenimiento(idsolicitudMantenimiento,fechaSolicitud,estado,observacion,idempleado,idVehiculoCliente)
			VALUES(auxiliarVehiculo+1,CURRENT_DATE,'P','Ninguna',pn_Empleado,pn_Vehiculo);

			pcMensaje:= 'Solicitud insertado con éxito';
			pbOcurreError:= FALSE;

			RETURN;
		END;
	$BODY$
	LANGUAGE plpgsql VOLATILE
	COST 100;
