/*Procedimiento Agragar Persona*/
	CREATE OR REPLACE FUNCTION Funcion_Actualizar_Persona(
		IN pc_identidad 		VARCHAR(45),
		IN pc_primerNombre 		VARCHAR(45),
		IN pc_segundoNombre 	VARCHAR(45), 
		IN pc_primerApellido 	VARCHAR(45), 
		IN pc_segundoApellido 	VARCHAR(45),
		IN pc_telefono 			VARCHAR(45),
		IN pc_correoElectronico VARCHAR(45),
		IN pc_departamento 		VARCHAR(45),
		IN pc_municipio 		VARCHAR(45),
		IN pc_colonia 			VARCHAR(45),
		IN pc_sector 			VARCHAR(45),
		IN pc_numeroCasa 		VARCHAR(45),
		IN pn_genero 			INTEGER,

		IN pn_idUsuario			INTEGER,

		OUT pcMensaje 			VARCHAR(45),
		OUT pbOcurreError 		BOOLEAN
	)
	RETURNS RECORD AS
	$BODY$
		DECLARE
			contador 			INTEGER DEFAULT 0;
			contador2 			INTEGER DEFAULT 0;
			auxiliarDireccion 	INTEGER DEFAULT 0;
			auxiliarPersona 	INTEGER DEFAULT 0;
			auxiliarTelefono 	INTEGER DEFAULT 0;
			auxiliarCorreo 		INTEGER DEFAULT 0;
			temMensaje 			VARCHAR(2000);

		BEGIN
			pbOcurreError:=TRUE;
			temMensaje := '';
			--Comprobando que la identidad no sea null:
			IF pc_identidad = '' OR pc_identidad IS NULL THEN
				RAISE NOTICE 'La identidad no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'identidad, ');
			END IF;
						
			--Comprobando que el primer nombre no sea null:
			IF pc_primerNombre = '' OR pc_primerNombre IS NULL THEN
				RAISE NOTICE 'El primer nombre no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'primer nombre, ');
			END IF;
			
			--Comprobando que el primer apellido no sea null:
			IF pc_primerApellido = '' OR pc_primerApellido IS NULL THEN
				RAISE NOTICE 'El primer apellido no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'primer apellido, ');
			END IF;
			
			--Comprobando que el telefono no sea null:
			IF pc_telefono = '' OR pc_telefono IS NULL THEN
				RAISE NOTICE 'El telefono no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'telefono, ');
			END IF;
			
			--Comprobando que el departamento  no sea null:
			IF pc_departamento = '' OR pc_departamento IS NULL THEN
				RAISE NOTICE 'El departamento no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'departamento, ');
			END IF;
			
			--Comprobando que el municipio  no sea null:
			IF  pc_municipio = '' OR pc_municipio IS NULL THEN
				RAISE NOTICE 'El municipio no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'municipio, ');
			END IF;
			
			--Comprobando que la colonia  no sea null:
			IF pc_colonia = '' OR pc_colonia IS NULL THEN
				RAISE NOTICE 'La colonia  no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'colonia, ');
			END IF;
			
			--Comprobando que el sector  no sea null:
			IF pc_sector = '' OR pc_sector IS NULL THEN
				RAISE NOTICE 'El sector no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'sector, ');
			END IF;
			
			--Comprobando que el numerocasa  no sea null:
			IF pc_numeroCasa = '' OR pc_numeroCasa IS NULL THEN
				RAISE NOTICE 'El numero casa no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'numero casa, ');
			END IF;

			IF temMensaje<>'' THEN
				pcMensaje := CONCAT('Campos requeridos para poder realizar la matrícula:',temMensaje);
				RETURN;
			END IF;
			
			--Comprobando que el genero no sea null ni incorrecto:
			IF (pn_genero = NULL OR pn_genero NOT IN (1,2)) THEN
				RAISE NOTICE 'El genero es incorrecto';
				pcMensaje := 'El genero es incorrecto';
				RETURN;
			END IF;

			--Comprobando que la identidad no se duplique
			SELECT COUNT(*) INTO contador FROM tbl_Persona 
			INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
			INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario
			WHERE  tbl_Persona.identidad = pc_identidad;

	 		IF contador > 0 THEN
	 			SELECT COUNT(*) INTO contador2 FROM tbl_Persona 
				INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
				INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario
				WHERE  tbl_Persona.identidad = pc_identidad AND tbl_Usuario.idUsuario = pn_idUsuario;

				IF contador2 <> 0 THEN
					RAISE NOTICE 'Valor unico en la tabla Persona ya existe ( % )', pc_identidad;
					pcMensaje := 'La identidad "'|| pc_identidad ||'" ya está siendo utilizado';
					RETURN;
				END IF;
			END IF;

			--Comprobando que el telefono no se duplique
			SELECT COUNT(*) INTO contador FROM tbl_Telefono 
			INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Telefono.idPersona 
			INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
			INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario 
			WHERE  tbl_Telefono.telefono = pc_telefono;

	 		IF contador > 0 THEN
	 			SELECT COUNT(*) INTO contador2 FROM tbl_Telefono 
				INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Telefono.idPersona 
				INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
				INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario 
				WHERE  tbl_Telefono.telefono = pc_telefono AND tbl_Usuario.idUsuario = pn_idUsuario;
				IF contador2 <> 0 THEN
					RAISE NOTICE 'Valor unico en la tabla Telefono ya existe ( % )', pc_telefono;
					pcMensaje := 'El numero de telefono "'|| pc_telefono ||'" ya esta siendo utilizado';
					RETURN;
				END IF;
			END IF;
				
				--Comprobando que el correo electronico  no se duplique
			SELECT COUNT(*) INTO contador FROM tbl_CorreoElectronico  
			INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Telefono.idPersona 
			INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
			INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario 
			WHERE  tbl_CorreoElectronico.correoElectronico = pc_correoElectronico;

	 		IF contador > 0 THEN
	 			SELECT COUNT(*) INTO contador2 FROM tbl_CorreoElectronico  
				INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Telefono.idPersona 
				INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
				INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario 
				WHERE  tbl_CorreoElectronico.correoElectronico = pc_correoElectronico AND tbl_Usuario.idUsuario = pn_idUsuario;

				IF contador2 <> 0 THEN
					RAISE NOTICE 'Valor unico en la tabla Correo Electronico ya existe ( % )', pc_correoElectronico;
					pcMensaje := 'El correo Electronico "'|| pc_correoElectronico ||'" ya esta siendo utilizado';
					RETURN;
				END IF;
			END IF;
			
			--Insertando la direccion:
			SELECT tbl_Direccion.idDireccion INTO auxiliarDireccion FROM tbl_Direccion
			INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Telefono.idPersona 
			INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
			INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario 
			WHERE tbl_Usuario.idUsuario = pn_idUsuario; --Obtener el idDireccion

			UPDATE tbl_Direccion SET departamento = pc_departamento, municipio = pc_municipio, colonia = pc_colonia, 
			sector = pc_sector, numeroCasa = pc_numeroCasa
			WHERE idDireccion = auxiliarDireccion;
			
			--Insertando persona:
			SELECT tbl_Persona.idPersona INTO auxiliarPersona FROM tbl_Persona
			INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
			INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario
			WHERE tbl_Usuario.idUsuario = pn_idUsuario; --Obtener el idPersona

			UPDATE tbl_Persona SET identidad = pc_identidad, primerNombre = pc_primerNombre, segundoNombre = pc_segundoNombre, 
			primerApellido = pc_primerApellido, segundoApellido = pc_segundoApellido, idDireccion = auxiliarDireccion, idGenero = pn_genero
			WHERE tbl_Persona.idPersona = auxiliarPersona;
			
			--Insertando telefono:
			SELECT idTelefono INTO auxiliarTelefono FROM tbl_Telefono
			INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Telefono.idPersona 
			INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
			INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario
			WHERE tbl_Usuario.idUsuario = pn_idUsuario; --Obtener el idTelefono

			UPDATE tbl_Telefono SET telefono = pc_telefono, idPersona = auxiliarPersona
			WHERE tbl_Telefono.idTelefono = auxiliarTelefono;
			
			--Insertando correo:
			SELECT idCorreoElectronico INTO auxiliarCorreo FROM tbl_CorreoElectronico
			INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Telefono.idPersona 
			INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
			INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario
			WHERE tbl_Usuario.idUsuario = pn_idUsuario; --Obtener el idCorreo

			UPDATE tbl_CorreoElectronico SET correoElectronico = pc_correoElectronico, idPersona = auxiliarPersona
			WHERE tbl_CorreoElectronico.idCorreoElectronico = auxiliarCorreo;
			
			pcMensaje := 'Persona Actualizada con éxito';
			pbOcurreError := FALSE;
			--COMMIT;
			RETURN;
		END;
	$BODY$
	LANGUAGE plpgsql VOLATILE
	COST 100;

/*Prueba de la función:
	SELECT Funcion_Agregar_Persona('0801199707679', 'Marcos', 'Miguel', 'Andino', 'Andrade', 
	'96068545', 'luismy2227@gmail.com', 'Francisco Morazán', 'DC', 'Centro América', 'Sector 2', 'Casa 4',2);
*/