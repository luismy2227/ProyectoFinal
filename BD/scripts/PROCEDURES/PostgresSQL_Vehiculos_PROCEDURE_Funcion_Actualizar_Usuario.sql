/*Procedimiento Agregar Usuario*/
	CREATE OR REPLACE FUNCTION Funcion_Actualizar_Usuario(
		IN 	pc_nombreUsuario	VARCHAR(45),
		IN 	pc_userPassword 	VARCHAR(45),
		IN 	pc_imagenRuta 		VARCHAR(45),

		IN pn_idUsuario			INTEGER,

		OUT pcMensaje 			VARCHAR(45),
		OUT pbOcurreError 		BOOLEAN
	)
	RETURNS RECORD AS
	$BODY$

		DECLARE
			contador 		INTEGER DEFAULT 0;
			var2			INTEGER DEFAULT 0;
			temMensaje 		VARCHAR(2000);
			auxiliarUsuario	INTEGER DEFAULT 0;

		BEGIN
			pbOcurreError:=TRUE;
			temMensaje := '';

			--Comprobando que el nombre de usuario  no sea null:
			IF pc_nombreUsuario = '' OR pc_nombreUsuario IS NULL THEN
				RAISE NOTICE 'El nombre de usuario no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'nombre de usuario, ');
			END IF;

			--Comprobando que la contraseña de usuario  no sea null:
			IF pc_userPassword = '' OR pc_userPassword IS NULL THEN
				RAISE NOTICE 'La contraseña no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'contraseña, ');
			END IF;

			--Comprobando que la ruta de imagen de usuario  no sea null:
			IF pc_imagenRuta = '' OR pc_imagenRuta IS NULL THEN
				RAISE NOTICE 'La ruta de imagen no  puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje, 'ruta de imagen, ');
			END IF;

			IF temMensaje<>'' THEN
				pcMensaje := CONCAT('Campos requeridos para poder realizar la matrícula:',temMensaje);
				RETURN;
			END IF;

			--Comprobando que el nombre de usuario no se duplique
			SELECT COUNT(*) INTO contador FROM tbl_Usuario 
			WHERE  tbl_Usuario.nombreUsuario = pc_nombreUsuario;
			
	 		IF contador > 0 THEN
	 			SELECT tbl_Usuario.idUsuario INTO var2 FROM tbl_Usuario 
				WHERE  tbl_Usuario.nombreUsuario = pc_nombreUsuario;
				IF var2 <> pn_idUsuario THEN
					RAISE NOTICE 'Valor unico en la tabla Usuario ya existe ( % )', pc_nombreUsuario;
					pcMensaje := 'El nombre de usUario "'|| pc_nombreUsuario ||'" ya existe';
					RETURN;
				END IF;
			END IF;

			-- Insertando usuario
			
			UPDATE tbl_Usuario SET nombreUsuario = pc_nombreUsuario, userPassword = pc_userPassword, imagenRuta = pc_imagenRuta
			WHERE tbl_Usuario.idUsuario = pn_idUsuario;

			pcMensaje := 'Usuario actualizado con éxito';
			pbOcurreError := FALSE;
			--COMMIT;
			RETURN;
		END;
	$BODY$
	LANGUAGE plpgsql VOLATILE
	COST 100;

/*Probando la función:
	SELECT public.funcion_actualizar_usuario('margarito1', 'margarito1', 'uploaded\u23.png', 23);
*/