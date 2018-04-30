/*Procedimiento Agragar Usuario Empleado*/
	CREATE OR REPLACE FUNCTION Funcion_Actualizar_Usuario_Empleado(
		IN pc_identidad 		 VARCHAR(45),
		IN pc_primerNombre 		 VARCHAR(45),
		IN pc_segundoNombre 	 VARCHAR(45), 
		IN pc_primerApellido 	 VARCHAR(45), 
		IN pc_segundoApellido 	 VARCHAR(45),
		IN pc_telefono 			 VARCHAR(45),
		IN pc_correoElectronico  VARCHAR(45),
		IN pc_departamento 		 VARCHAR(45),
		IN pc_municipio 		 VARCHAR(45),
		IN pc_colonia 			 VARCHAR(45),
		IN pc_sector 			 VARCHAR(45),
		IN pc_numeroCasa 		 VARCHAR(45),
		IN pn_genero 			 INTEGER,

		IN pc_nombreUsuario 	 VARCHAR(45),
		IN pc_userPassword 		 VARCHAR(45),
		IN pc_imagenRuta 		 VARCHAR(45),

		IN pd_fechaContratacion  DATE,
		IN pn_idCargo 			 INTEGER,
		IN pn_idEmpleadoSuperior INTEGER,
		IN pd_fechaPromocion 	 DATE,

		IN pn_idUsuario			INTEGER,

		OUT pcMensajeEmpleado 	 VARCHAR(45),
		OUT pbOcurreErrorEmpleado BOOLEAN
	)
	RETURNS RECORD AS
	$BODY$
		DECLARE
			contador INTEGER DEFAULT 0;
			temMensaje VARCHAR(2000);
			auxiliarUsuario INTEGER DEFAULT 0;
			auxiliarEmpleado INTEGER DEFAULT 0;
			auxiliarPersona INTEGER DEFAULT 0;
			vb_ocurreErrorPersona BOOLEAN;
			vc_mensajePersona VARCHAR(2000);
			vb_ocurreErrorUsuario BOOLEAN;
			vc_mensajeUsuario VARCHAR(2000);
		BEGIN
			pbOcurreErrorEmpleado:=TRUE;
			temMensaje := '';

			--Comprobando que la fecha de contratacion  no sea null:
			IF pd_fechaContratacion IS NULL THEN
				RAISE NOTICE 'La fecha de contratacion no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'fecha contratacion, ');
			END IF;

			--Comprobando que idcargo  no sea null:
			IF pn_idCargo IS NULL THEN
				RAISE NOTICE 'El cargo no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'cargo, ');
			END IF;

			--Comprobando que pn_idEmpleadoSuperior  no sea null:
			IF pn_idEmpleadoSuperior IS NULL THEN
				RAISE NOTICE 'El jefe no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'jefe, ');
			END IF;

			--Comprobando que pd_fechaPromocion  no sea null:
			IF pd_fechaPromocion IS NULL THEN
				RAISE NOTICE 'La fecha de promoción no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'fecha promoción, ');
			END IF;

			IF temMensaje<>'' THEN
				pcMensajeEmpleado := CONCAT('Campos requeridos para poder realizar la matrícula:',temMensaje);
				RETURN;
			END IF;

			-- Utilizando el procedimiento Funcion_Agregar_Persona:
			SELECT pbOcurreError, pcMensaje INTO vb_ocurreErrorPersona, vc_mensajePersona 
			FROM Funcion_Actualizar_Persona(pc_identidad, pc_primerNombre, pc_segundoNombre, pc_primerApellido, pc_segundoApellido, 
			pc_telefono, pc_correoElectronico, pc_departamento, pc_municipio, pc_colonia, pc_sector, pc_numeroCasa,pn_genero, pn_idUsuario);

			-- Verificando que el proceso Agregar Persona haya sido exitoso
			IF vb_ocurreErrorPersona = TRUE THEN
				pcMensajeEmpleado := vc_mensajePersona;
				RETURN;
			END IF;
			
			SELECT pbOcurreError, pcMensaje INTO vb_ocurreErrorUsuario, vc_mensajeUsuario 
			FROM Funcion_Actualizar_Usuario(pc_nombreUsuario, pc_userPassword,pc_imagenRuta, pn_idUsuario);

			-- Verificando que el proceso Agregar Usuario haya sido exitoso
			IF vb_ocurreErrorUsuario = TRUE THEN
				pcMensajeEmpleado := vc_mensajeUsuario;
				RETURN;
			END IF;

			-- Insertando Empleado
			SELECT tbl_Empleado.idEmpleado INTO auxiliarEmpleado FROM tbl_Empleado
			INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario
			WHERE tbl_Usuario.idUsuario = pn_idUsuario; -- Obtener el id de empleado

			SELECT tbl_Persona.idPersona INTO auxiliarPersona FROM tbl_Persona
			INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
			INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario
			WHERE tbl_Usuario.idUsuario = pn_idUsuario; -- Obtener el id de Persona	

			UPDATE tbl_Empleado SET fechaContratacion = pd_fechaContratacion, idPersona = auxiliarPersona, idCargo = pn_idCargo, 
			idEmpleadoSuperior= pn_idEmpleadoSuperior, fechaPromocion = pd_fechaPromocion
			WHERE idUsuario = pn_idUsuario;

			pcMensajeEmpleado := 'Empleado actualizado con éxito';
			pbOcurreErrorEmpleado := FALSE;
			--COMMIT;
			RETURN;
		END;
	$BODY$
	LANGUAGE plpgsql VOLATILE
	COST 100;

/*Prueba de la función:
	SELECT * FROM Funcion_Agregar_Usuario_Empleado( '646354985344633', 'Pedro', 'Felipe', 'Perez', 'Valladares',
'97542158', 'gagagsgg225@asdf', 'FM', 'DC', 'Kenedy', 'sector uno', 'casa 4', 2, 'pedper', 'pedper', 
'rutaperez', '2017-02-02',1,1,'2017-02-02');
*/