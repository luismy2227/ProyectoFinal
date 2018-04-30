/*Procedimiento Agegar vehículo cliente*/
	CREATE OR REPLACE FUNCTION Funcion_Mantenimiento(
		
		IN pc_FechaSalida			    DATE,
		IN pc_FechaEntrada			    DATE,
		IN pn_TipoMantenimiento	        INTEGER,
		IN pn_vehiculo                  INTEGER,
	    IN pn_empleado                  INTEGER,
	    IN pn_Taller                    INTEGER,
		In pn_Repuesto                  INTEGER,

		OUT pbOcurreErrorMantenimiento 	BOOLEAN,
		OUT pcMensajeMantenimiento			VARCHAR(2000)
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
			codigoempleado              INTEGER DEFAULT 0;
		BEGIN
			pbOcurreErrorMantenimiento:=TRUE;
			temMensaje := '';

			--Comprobando que la pn_clientePertence no sea null:
			IF pn_empleado IS NULL THEN
				RAISE NOTICE 'id cliente no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'idEmpleado, ');
			END IF;

			IF pc_FechaSalida IS NULL  THEN
				RAISE NOTICE 'La Fecha Salida no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Fecha Salida, ');
			END IF;
			IF pc_FechaEntrada IS NULL  THEN
				RAISE NOTICE 'La Fecha Entrada no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Fecha Entrada, ');
			END IF;
			IF pn_Taller IS NULL THEN
				RAISE NOTICE 'id Taller no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'idTaller, ');
			END IF;
			IF pn_Repuesto IS NULL THEN
				RAISE NOTICE 'id Repuesto no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'idRepuesto, ');
			END IF;

			IF temMensaje<>'' THEN
				pcMensajeMantenimiento := CONCAT('Campos requeridos para poder realizar el Mantenimiento: ',temMensaje);
				RETURN;
			END IF;

            SELECT e.idempleado INTO codigoempleado FROM tbl_empleado e
            INNER JOIN tbl_Usuario u on e.idusuario=u.idusuario
            WHERE u.idusuario=pn_empleado;

			SELECT pbOcurreErrorMantenimiento,pcMensaje INTO vb_OcurreErrorMantenimiento, vc_MensajeMantenimiento
			FROM Funcion_Solicitud_Mantenimiento(pn_vehiculo, codigoempleado);
			
			-- Verificando que el proceso Agregar Vehiculo haya sido exitoso
			IF vb_OcurreErrorMantenimiento = TRUE THEN
				pcMensajeMantenimiento := vc_MensajeMantenimiento;
				RETURN;
			END IF;

			-- Insertando:
			SELECT MAX(idMantenimiento) INTO auxiliarMantenimiento FROM tbl_Mantenimiento; 
			SELECT idMantenimiento INTO auxiliarMantenimiento2 FROM tbl_SolicitudMantenimiento WHERE idSolicitudMantenimiento = pn_vehiculo; --Obteniendo el idVehiculo
			INSERT INTO tbl_Mantenimiento(idVehiculoMantenimiento,descripcion,fechaIngreso, fechaSalida, estado, idSolicitudMantenimiento,idEmpleado,idTipoMantenimiento,idtaller)
			VALUES(auxiliarVehiculo+1,'Falla Mecanica', CURRENT_DATE,CURRENT_DATE,'E',pn_idTipoMantenimiento,codigoempleado,pn_idTipoMantenimiento,pn_idtaller);

			pcMensajeMantenimiento := 'Mantenimiento insertado con éxito';
			pbOcurreErrorMantenimiento := FALSE;
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