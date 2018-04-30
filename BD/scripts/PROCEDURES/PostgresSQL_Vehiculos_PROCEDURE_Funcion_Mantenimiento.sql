/*Procedimiento Agegar vehículo cliente*/
	CREATE OR REPLACE FUNCTION Funcion_Mantenimiento(
		
		IN pc_FechaSalida			    DATE,
		IN pc_FechaEntrada			    DATE,
		IN pn_idTipoMantenimiento	    INTEGER,
		IN pn_vehiculo                  integer,
	    IN pn_empleado                  integer,
	    IN pn_idtaller                  integer,
	    IN pn_idrepuesto                integer,
		

		OUT pbOcurreErrorCliente 		BOOLEAN,
		OUT pcMensajeCliente			VARCHAR(2000)
	)
	RETURNS RECORD AS
	$BODY$
		DECLARE
			temMensaje 			        VARCHAR(1000);
			contador   			        INTEGER DEFAULT 0;
			vb_OcurreErrorMantenimiento	BOOLEAN;
			vc_MensajeMantenimiento		VARCHAR(2000);
			auxiliarMantenimiento       INTEGER DEFAULT 0;
			auxiliarMantenimiento2   	INTEGER DEFAULT 0;
		BEGIN
			pbOcurreErrorCliente:=TRUE;
			temMensaje := '';

			--Comprobando que la pn_clientePertence no sea null:
			IF pn_empleado IS NULL THEN
				RAISE NOTICE 'id cliente no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'idCliente, ');
			END IF;

			IF temMensaje<>'' THEN
				pcMensajeCliente := CONCAT('Campos requeridos para poder realizar el Mantenimiento: ',temMensaje);
				RETURN;
			END IF;

			SELECT pbOcurreError,pcMensaje INTO vb_OcurreErrorMantenimiento, vc_MensajeMantenimiento
			FROM Funcion_Solicitud_Mantenimiento(pc_FechaEntrada,pc_FechaSalida,pn_idTipoMantenimiento,pn_vehiculo,pn_empleado,pn_idtaller);
			
			-- Verificando que el proceso Agregar Vehiculo haya sido exitoso
			IF vb_OcurreErrorMantenimiento = TRUE THEN
				pcMensajeCliente := vc_MensajeMantenimiento;
				RETURN;
			END IF;

			-- Insertando:
			SELECT MAX(idMantenimiento) INTO auxiliarMantenimiento FROM tbl_Mantenimiento; 
			SELECT idMantenimiento INTO auxiliarMantenimiento2 FROM tbl_SolicitudMantenimiento WHERE idSolicitudMantenimiento = pn_idTipoMantenimiento; --Obteniendo el idVehiculo
			INSERT INTO tbl_Mantenimiento(idVehiculoMantenimiento,descripcion,fechaIngreso, fechaSalida, estado, idSolicitudMantenimiento,idEmpleado,idTipoMantenimiento,idrepuesto,idtaller);
			VALUES(auxiliarVehiculo+1,'Falla Mecanica', CURRENT_DATE,CURRENT_DATE,'E',pn_idTipoMantenimiento,pn_empleado,pn_idTipoMantenimiento,pn_idrepuesto,pn_idtaller);

			pcMensajeCliente := 'Mantenimiento insertado con éxito';
			pbOcurreErrorCliente := FALSE;
			--COMMIT;
			RETURN;
		END;
	$BODY$
	LANGUAGE plpgsql VOLATILE
	COST 100;

/*
Probando la función:
	SELECT Funcion_Agregar_Vehiculo_Cliente('verde', '131315','2017-02-02','tercera generacion', 
								'a5as7sf4a54g5s7s5g',1800,1,1,1,1,1,1,1, '2017-02-02',1);
*/