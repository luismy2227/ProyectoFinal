/*Procedimiento Agegar vehículo empresa*/
	CREATE OR REPLACE FUNCTION Funcion_Pagar_Mantenimiento(
		IN pn_idMantenimiento	INTEGER,
		IN pn_idUsuario			INTEGER,
		IN pn_idDescuento		INTEGER,
		IN pn_idFormaPago		INTEGER,

		OUT pbOcurreError 		BOOLEAN,
		OUT pcMensaje			VARCHAR(2000)
	)
	RETURNS RECORD AS
	$BODY$
		DECLARE
			temMensaje 			VARCHAR(1000);
			contador   			INTEGER DEFAULT 0;
			auxiliarVehiculo   	BOOLEAN;
			auxiliarEmpleado   	INTEGER DEFAULT 0;
			auxiliarFactura		INTEGER DEFAULT 0;
			auxiliarMonto		INTEGER DEFAULT 0;
			auxiliarCliente		INTEGER DEFAULT 0;
			pc_auxiliarDescuento	VARCHAR(1);
			pn_auxiliarDescuento	INTEGER DEFAULT 0;
			pcMensajeVenta			VARCHAR(2000);
			pbOcurreErrorVenta		BOOLEAN;
			pcMensajeRenta			VARCHAR(2000);
			pbOcurreErrorRenta		BOOLEAN;
		BEGIN
			pbOcurreError:=TRUE;
			auxiliarVehiculo:=FALSE;
			temMensaje := '';

			/*----------------------Comprobaciones NULL------------------------*/
			--Comprobando que el idVehiculo no sea null:
			IF pn_idMantenimiento IS NULL THEN
				RAISE NOTICE 'El Mantenimiento no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Mantenimiento, ');
			END IF;

			--Comprobando que el idUsuario no sea null:
			IF pn_idUsuario IS NULL THEN
				RAISE NOTICE 'El Usuario no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Usuario, ');
			END IF;

			--Comprobando que el idDescuento no sea null:
			IF pn_idDescuento IS NULL THEN
				RAISE NOTICE 'El Descuento no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Descuento, ');
			END IF;

			--Comprobando que el idFormaPago no sea null:
			IF pn_idFormaPago IS NULL THEN
				RAISE NOTICE 'La Forma de Pago no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Forma de Pago, ');
			END IF;

			IF temMensaje<>'' THEN
				pcMensaje := CONCAT('Campos requeridos para poder realizar la venta: ',temMensaje);
				RETURN;
			END IF;

			/*----------------------Comprobaciones de existencia------------------------*/

			SELECT COUNT(*) INTO contador FROM tbl_Mantenimiento WHERE idMantenimiento = pn_idMantenimiento;
			IF contador <> 1 THEN
				pcMensaje := 'El mantenimiento seleccionado no existe.';
				RETURN;
			END IF;

			SELECT COUNT(*) INTO contador FROM tbl_Descuento WHERE idDescuento = pn_idDescuento;
			IF contador <> 1 THEN
				pcMensaje := 'El descuento seleccionado no existe.';
				RETURN;
			END IF;

			SELECT COUNT(*) INTO contador FROM tbl_FormaPago WHERE idFormaPago = pn_idFormaPago;
			IF contador <> 1 THEN
				pcMensaje := 'La forma de pago seleccionada no existe.';
				RETURN;
			END IF;

			SELECT COUNT(*) INTO contador FROM tbl_Usuario 
			INNER JOIN tbl_Empleado ON tbl_Empleado.idUsuario = tbl_Usuario.idUsuario
			WHERE tbl_Usuario.idUsuario = pn_idUsuario;
			IF contador <> 1 THEN
				pcMensaje := 'El empleado seleccionado no existe.';
				RETURN;
			END IF;

			SELECT estado INTO pc_auxiliarDescuento FROM tbl_Descuento WHERE idDescuento = pn_idDescuento;
			IF pc_auxiliarDescuento = 'I' OR pc_auxiliarDescuento = 'i' THEN
				pn_auxiliarDescuento = 8;
			ELSE
				pn_auxiliarDescuento = pn_idDescuento;
			END IF;

			SELECT tbl_Empleado.idEmpleado INTO auxiliarEmpleado FROM tbl_Usuario 
			INNER JOIN tbl_Empleado ON tbl_Empleado.idUsuario = tbl_Usuario.idUsuario
			WHERE tbl_Usuario.idUsuario = pn_idUsuario; --Consiguiendo el idEmpleado a partir del idUsuario

			/*-------------------Insertando---------------------------*/

			SELECT MAX(idFactura) INTO auxiliarFactura FROM tbl_Factura;
			auxiliarFactura:=auxiliarFactura+1;

			SELECT tbl_VehiculoCliente.idClientePertenece INTO auxiliarCliente FROM tbl_Mantenimiento
			INNER JOIN tbl_SolicitudMantenimiento ON tbl_SolicitudMantenimiento.idSolicitudMantenimiento = tbl_Mantenimiento.idSolicitudMantenimiento
			INNER JOIN tbl_VehiculoCliente ON tbl_VehiculoCliente.idVehiculoCliente = tbl_SolicitudMantenimiento.idVehiculoCliente
			WHERE tbl_Mantenimiento.idMantenimiento = pn_idMantenimiento;

			INSERT INTO tbl_Factura(idFactura, fecha, observaciones, idImpuesto, idCliente, idEmpleado)
			VALUES(auxiliarFactura, CURRENT_DATE, 'Ninguna Observación', 1, auxiliarCliente, auxiliarEmpleado);

			INSERT INTO tbl_FacturaPorMantenimiento(idMantenimiento, idFactura)
			VALUES(pn_idMantenimiento, auxiliarFactura);

			INSERT INTO tbl_DescuentoPorFactura(idFactura, idDescuento)
			VALUES(auxiliarFactura, pn_auxiliarDescuento);

			--Procedimiento almacenado de insertar comodín de Venta:
			SELECT * INTO pbOcurreErrorVenta, pcMensajeVenta
			FROM Funcion_Agregar_Venta_Comodin(auxiliarFactura);

			IF pbOcurreErrorVenta = TRUE THEN
				pcMensaje := pcMensajeVenta;
				RETURN;
			END IF;

			--Procedimiento almacenado de insertar comodín de renta:
			SELECT * INTO pbOcurreErrorRenta, pcMensajeRenta
			FROM Funcion_Agregar_Renta_Comodin(auxiliarFactura);

			IF pbOcurreErrorRenta = TRUE THEN
				pcMensaje := pcMensajeRenta;
				RETURN;
			END IF;

			SELECT CAST((tbl_TipoMantenimiento.costo-(tbl_TipoMantenimiento.costo*tbl_Descuento.valor/100)
				+(tbl_TipoMantenimiento.costo*tbl_Impuesto.porcentaje/100)) AS DECIMAL(10,2)) INTO auxiliarMonto FROM tbl_TipoMantenimiento
			INNER JOIN tbl_Mantenimiento ON tbl_Mantenimiento.idTipoMantenimiento = tbl_TipoMantenimiento.idTipoMantenimiento
			INNER JOIN tbl_FacturaPorMantenimiento ON tbl_FacturaPorMantenimiento.idMantenimiento = tbl_Mantenimiento.idMantenimiento
			INNER JOIN tbl_Factura ON tbl_Factura.idFactura = tbl_FacturaPorMantenimiento.idFactura
			INNER JOIN tbl_DescuentoPorFactura ON tbl_DescuentoPorFactura.idFactura = tbl_Factura.idFactura
			INNER JOIN tbl_Descuento ON tbl_Descuento.idDescuento = tbl_DescuentoPorFactura.idDescuento
			INNER JOIN tbl_Impuesto ON tbl_Impuesto.idImpuesto = tbl_Factura.idImpuesto
			WHERE tbl_Mantenimiento.idMantenimiento = pn_idMantenimiento
			GROUP BY tbl_TipoMantenimiento.costo,tbl_Descuento.valor,tbl_Impuesto.porcentaje;

			INSERT INTO tbl_FormaPagoPorFactura(idFactura, idFormaPago, monto)
			VALUES(auxiliarFactura, pn_idFormaPago, auxiliarMonto);

			/*-----------------Todo bien, todo correcto------------*/
			pcMensaje := 'Mantenimiento cancelado con éxito';
			pbOcurreError := FALSE;
			--COMMIT;
			RETURN;
		END;
	$BODY$
	LANGUAGE plpgsql VOLATILE
	COST 100;

/*
Probando la función:
	SELECT public.funcion_pagar_mantenimiento(
	1, 
	23, 
	1, 
	1
);
*/