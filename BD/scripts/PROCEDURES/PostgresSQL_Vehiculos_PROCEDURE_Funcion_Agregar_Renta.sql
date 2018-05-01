/*Procedimiento Agegar vehículo empresa*/
	CREATE OR REPLACE FUNCTION Funcion_Agregar_Renta(
		IN pn_idFactura			INTEGER,
		IN pn_idVehiculo		INTEGER,

		IN pd_fechaEntrega		DATE,
		IN pd_fechaDevolucion	DATE,
		IN pn_totalHoras		INTEGER,

		OUT pbOcurreError 		BOOLEAN,
		OUT pcMensaje			VARCHAR(2000)
	)
	RETURNS RECORD AS
	$BODY$
		DECLARE
			temMensaje 					VARCHAR(1000);
			contador   					INTEGER DEFAULT 0;
			auxiliarVehiculo   			BOOLEAN;

			pbOcurreErrorItinerario		BOOLEAN;
			pcMensajeItinerario 		VARCHAR(2000);
			pn_idItinerario				INTEGER;

		BEGIN
			pbOcurreError:=TRUE;
			auxiliarVehiculo:=FALSE;
			temMensaje := '';

			/*----------------------Comprobaciones NULL------------------------*/
			--Comprobando que el idVehiculo no sea null:
			IF pn_idVehiculo IS NULL THEN
				RAISE NOTICE 'El Vehículo no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Vehículo, ');
			END IF;

			--Comprobando que el idFactura no sea null:
			IF pn_idFactura IS NULL THEN
				RAISE NOTICE 'La Factura no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Factura, ');
			END IF;

			--Comprobando que ela FechaEntrega no sea null:
			IF pd_fechaEntrega IS NULL THEN
				RAISE NOTICE 'La Fecha de entrega no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Fecha de entrega, ');
			END IF;

			--Comprobando que ela FechaDevolucion no sea null:
			IF pd_fechaDevolucion IS NULL THEN
				RAISE NOTICE 'La Fecha de devolucion no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Fecha de devolucion, ');
			END IF;

			--Comprobando que el total de horas no sea null:
			IF pn_totalHoras IS NULL THEN
				RAISE NOTICE 'El total de horas no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Total horas, ');
			END IF;

			IF temMensaje<>'' THEN
				pcMensaje := CONCAT('Campos requeridos para poder realizar la venta: ',temMensaje);
				RETURN;
			END IF;

			/*----------------------Comprobaciones de existencia------------------------*/

			SELECT COUNT(*) INTO contador FROM tbl_VehiculoEmpresa WHERE idVehiculoEmpresa = pn_idVehiculo;
			IF contador <> 1 THEN
				pcMensaje := 'El vehículo seleccionado no existe.';
				RETURN;
			END IF;

			SELECT COUNT(*) INTO contador FROM tbl_Factura WHERE idFactura = pn_idFactura;
			IF contador <> 1 THEN
				pcMensaje := 'La factura seleccionado no existe.';
				RETURN;
			END IF;

			/*---------------------Comprobaciones lógicas---------------*/

			SELECT seRenta INTO auxiliarVehiculo FROM tbl_VehiculoEmpresa WHERE idVehiculoEmpresa = pn_idVehiculo;
			IF auxiliarVehiculo = FALSE THEN
				pcMensaje := 'El vehículo seleccionado no está en renta.';
				RETURN;
			END IF;

			SELECT vendido INTO auxiliarVehiculo FROM tbl_VehiculoEmpresa WHERE idVehiculoEmpresa = pn_idVehiculo;
			IF auxiliarVehiculo = TRUE THEN
				pcMensaje := 'El vehículo seleccionado ya está vendido.';
				RETURN;
			END IF;

			/*-------------------Insertando---------------------------*/

			SELECT * INTO pbOcurreErrorItinerario, pcMensajeItinerario, pn_idItinerario 
			FROM Funcion_Agregar_Itinerario(pd_fechaEntrega, pd_fechaDevolucion);
			IF pbOcurreErrorItinerario = TRUE THEN
				pcMensaje := pcMensajeItinerario;
				RETURN;
			END IF;

			
			INSERT INTO tbl_Renta(idFactura, idVehiculoEmpresa, anticipo, mora, totalHoras, idItinerario)
			VALUES(pn_idFactura, pn_idVehiculo,0,0,pn_totalHoras,pn_idItinerario);

			/*-----------------Todo bien, todo correcto------------*/
			pcMensaje := 'Vehiculo rentado con éxito';
			pbOcurreError := FALSE;
			--COMMIT;
			RETURN;
		END;
	$BODY$
	LANGUAGE plpgsql VOLATILE
	COST 100;

/*
Probando la función:
	
*/