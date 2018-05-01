/*Procedimiento Agegar vehículo empresa*/
	CREATE OR REPLACE FUNCTION Funcion_Agregar_Itinerario(
		IN pd_fechaEntrega		DATE,
		IN pd_fechaDevolucion	DATE,

		OUT pbOcurreError 		BOOLEAN,
		OUT pcMensaje			VARCHAR(2000),
		OUT pn_idItinerario		INTEGER
	)
	RETURNS RECORD AS
	$BODY$
		DECLARE
			temMensaje 					VARCHAR(1000);
			contador   					INTEGER DEFAULT 0;
		BEGIN
			pbOcurreError:=TRUE;
			temMensaje := '';

			/*----------------------Comprobaciones NULL------------------------*/
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

			IF temMensaje<>'' THEN
				pcMensaje := CONCAT('Campos requeridos para poder realizar la venta: ',temMensaje);
				RETURN;
			END IF;

			/*-------------------Insertando---------------------------*/

			SELECT MAX(idItinerario) INTO contador FROM tbl_Itinerario;
			contador:=contador+1;
			pn_idItinerario :=contador;
			INSERT INTO tbl_Itinerario(idItinerario, fechaReserva, fechaEntrega, fechaDevolucion)
			VALUES(contador, CURRENT_DATE, pd_fechaEntrega, pd_fechaDevolucion);

			/*-----------------Todo bien, todo correcto------------*/
			pcMensaje := 'Itinerario agregado con éxito';
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