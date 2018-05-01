/*Procedimiento Agegar vehículo empresa*/
	CREATE OR REPLACE FUNCTION Funcion_Agregar_Venta(
		IN pn_idFactura			INTEGER,
		IN pn_idVehiculo		INTEGER,

		OUT pbOcurreError 		BOOLEAN,
		OUT pcMensaje			VARCHAR(2000)
	)
	RETURNS RECORD AS
	$BODY$
		DECLARE
			temMensaje 					VARCHAR(1000);
			contador   					INTEGER DEFAULT 0;
			auxiliarVehiculo   			BOOLEAN;
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

			SELECT seVende INTO auxiliarVehiculo FROM tbl_VehiculoEmpresa WHERE idVehiculoEmpresa = pn_idVehiculo;
			IF auxiliarVehiculo = FALSE THEN
				pcMensaje := 'El vehículo seleccionado no está en venta.';
				RETURN;
			END IF;

			SELECT vendido INTO auxiliarVehiculo FROM tbl_VehiculoEmpresa WHERE idVehiculoEmpresa = pn_idVehiculo;
			IF auxiliarVehiculo = TRUE THEN
				pcMensaje := 'El vehículo seleccionado ya está vendido.';
				RETURN;
			END IF;

			/*-------------------Insertando---------------------------*/

			INSERT INTO tbl_Venta(idFactura, idVehiculoEmpresa)
			VALUES(pn_idFactura, pn_idVehiculo);

			/*-----------------Todo bien, todo correcto------------*/
			pcMensaje := 'Vehiculo vendido con éxito';
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