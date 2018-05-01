/*Procedimiento Agegar vehículo empresa*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Mantenimiento_Comodin(
    IN pn_idFactura     INTEGER,

    OUT pbOcurreError     BOOLEAN,
    OUT pcMensaje     VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje          VARCHAR(1000);
      contador            INTEGER DEFAULT 0;
      auxiliarMantenimiento   INTEGER DEFAULT 0;
    BEGIN
      pbOcurreError:=TRUE;
      temMensaje := '';

      /*----------------------Comprobaciones NULL------------------------*/
      --Comprobando que el idFactura no sea null:
      IF pn_idFactura IS NULL THEN
        RAISE NOTICE 'El Factura no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'Factura, ');
      END IF;

      IF temMensaje<>'' THEN
        pcMensaje := CONCAT('Campos requeridos para poder realizar la venta: ',temMensaje);
        RETURN;
      END IF;

      /*----------------------Comprobaciones de existencia------------------------*/

      SELECT COUNT(*) INTO contador FROM tbl_Factura WHERE idFactura = pn_idFactura;
      IF contador <> 1 THEN
        pcMensaje := 'La factura seleccionado no existe.';
        RETURN;
      END IF;

      /*-------------------Insertando---------------------------*/

      SELECT MAX(idMantenimiento) INTO auxiliarMantenimiento FROM tbl_Mantenimiento;
      auxiliarMantenimiento:= auxiliarMantenimiento+1;
      INSERT INTO tbl_Mantenimiento(idMantenimiento,fechaIngreso,fechaSalida,estado,
                idSolicitudMantenimiento,idEmpleado,idTipoMantenimiento, idRepuesto, idTaller)
      VALUES(auxiliarMantenimiento,'2018-01-12','2018-01-12','E',31,1,16,1,16);

      INSERT INTO tbl_FacturaPorMantenimiento(idFactura, idMantenimiento)
      VALUES(pn_idFactura, auxiliarMantenimiento);

      /*-----------------Todo bien, todo correcto------------*/
      pcMensaje := 'Comodín de mantenimiento exitoso';
      pbOcurreError := FALSE;
      --COMMIT;
      RETURN;
    END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;