
  /*Procedimiento Agegar vehículo cliente*/
  CREATE OR REPLACE FUNCTION Funcion_Mantenimiento(
    
    IN pc_FechaSalida         DATE,
    IN pc_FechaEntrada          DATE,
    IN pn_TipoMantenimiento         INTEGER,
    IN pn_vehiculo                  INTEGER,
      IN pn_empleado                  INTEGER,
      IN pn_Taller                    INTEGER,
    In pn_Repuesto                  INTEGER,

    OUT pbOcurreError   BOOLEAN,
    OUT pcMensaje   VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje              VARCHAR(1000);
      contador                INTEGER DEFAULT 0;
      vb_OcurreErrorMantenimiento BOOLEAN;
      vc_MensajeMantenimiento   VARCHAR(2000);
      auxiliarMantenimiento       INTEGER DEFAULT 0;
      auxiliarMantenimiento2    INTEGER DEFAULT 0;
      codigoempleado              INTEGER DEFAULT 0;
    BEGIN
      pbOcurreError:=TRUE;
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
        pcMensaje := CONCAT('Campos requeridos para poder realizar el Mantenimiento: ',temMensaje);
        RETURN;
      END IF;

            SELECT e.idempleado INTO codigoempleado FROM tbl_empleado e
            INNER JOIN tbl_Usuario u on e.idusuario=u.idusuario
            WHERE u.idusuario=pn_empleado;

      SELECT * INTO vc_MensajeMantenimiento, vb_OcurreErrorMantenimiento
      FROM Funcion_Solicitud_Mantenimiento(pn_vehiculo, codigoempleado);
      
      -- Verificando que el proceso Agregar Vehiculo haya sido exitoso
      IF vb_OcurreErrorMantenimiento = TRUE THEN
        pcMensaje := vc_MensajeMantenimiento;
        RETURN;
      END IF;

      -- Insertando:
      SELECT MAX(idMantenimiento) INTO auxiliarMantenimiento FROM tbl_Mantenimiento;

      SELECT MAX(idSolicitudMantenimiento) INTO auxiliarMantenimiento2 
      FROM tbl_SolicitudMantenimiento ; --Obteniendo el idSolicitudMantenimiento

      INSERT INTO tbl_Mantenimiento(idMantenimiento,fechaIngreso, fechaSalida, estado, idSolicitudMantenimiento,idEmpleado,idTipoMantenimiento,idRepuesto,idtaller)
      VALUES(auxiliarMantenimiento+1, pc_FechaEntrada,pc_FechaSalida,'E',auxiliarMantenimiento2,codigoempleado,pn_TipoMantenimiento,pn_Repuesto,pn_taller);

      pcMensaje := 'Mantenimiento insertado con éxito';
      pbOcurreError := FALSE;
      --COMMIT;
      RETURN;
    END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;