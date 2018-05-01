/*Procedimiento Agegar vehículo empresa*/
	CREATE OR REPLACE FUNCTION Funcion_Pagar_Renta(
		IN pn_idVehiculo		INTEGER,
		IN pn_idCliente			INTEGER,
		IN pn_idUsuario			INTEGER,
		IN pn_idDescuento		INTEGER,
		IN pn_idFormaPago		INTEGER,

		IN pd_fechaEntrega		DATE,
		IN pd_fechaDevolucion	DATE,
		IN pn_totalHoras		INTEGER,

		OUT pbOcurreError 		BOOLEAN,
		OUT pcMensaje			VARCHAR(2000)
	)
	RETURNS RECORD AS
	$BODY$
		DECLARE
			temMensaje 					VARCHAR(1000);
			contador   					INTEGER DEFAULT 0;
			auxiliarVehiculo   			BOOLEAN;
			auxiliarEmpleado   			INTEGER DEFAULT 0;
			auxiliarFactura				INTEGER DEFAULT 0;
			auxiliarMonto				INTEGER DEFAULT 0;
			solicitudComodin			INTEGER DEFAULT 31;
			vehiculoEmpresaComodin 		INTEGER DEFAULT 46;
			vehiculoClienteComodin 		INTEGER DEFAULT 16;
			tipoMantenimientoComodin 	INTEGER DEFAULT 16;
			pc_auxiliarDescuento		VARCHAR(1);
			pn_auxiliarDescuento		DECIMAL(10,2);

			itinerarioComodin			INTEGER DEFAULT 31;
			pbOcurreErrorVenta			BOOLEAN;
			pcMensajeVenta				VARCHAR(2000);

			pbOcurreErrorRenta			BOOLEAN;
			pcMensajeRenta				VARCHAR(2000);

			pbOcurreErrorMantenimiento	BOOLEAN;
			pcMensajeMantenimiento		VARCHAR(2000);
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

			--Comprobando que el idCliente no sea null:
			IF pn_idCliente IS NULL THEN
				RAISE NOTICE 'El Cliente no puede ser un campo vacío';
				temMensaje := CONCAT(temMensaje,'Cliente, ');
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

			SELECT COUNT(*) INTO contador FROM tbl_VehiculoEmpresa WHERE idVehiculoEmpresa = pn_idVehiculo;
			IF contador <> 1 THEN
				pcMensaje := 'El vehículo seleccionado no existe.';
				RETURN;
			END IF;

			SELECT COUNT(*) INTO contador FROM tbl_Cliente WHERE idCliente = pn_idCliente;
			IF contador <> 1 THEN
				pcMensaje := 'El cliente seleccionado no existe.';
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

			SELECT tbl_Empleado.idEmpleado INTO auxiliarEmpleado FROM tbl_Usuario 
			INNER JOIN tbl_Empleado ON tbl_Empleado.idUsuario = tbl_Usuario.idUsuario
			WHERE tbl_Usuario.idUsuario = pn_idUsuario; --Consiguiendo el idEmpleado a partir del idUsuario


			/*---------------------Comprobaciones lógicas---------------*/

			SELECT seRenta INTO auxiliarVehiculo FROM tbl_VehiculoEmpresa WHERE idVehiculoEmpresa = pn_idVehiculo;
			IF auxiliarVehiculo = FALSE THEN
				pcMensaje := 'El vehículo seleccionado no está en renta.';
				RETURN;
			END IF;

			SELECT vendido INTO auxiliarVehiculo FROM tbl_VehiculoEmpresa WHERE idVehiculoEmpresa = pn_idVehiculo;
			IF auxiliarVehiculo = TRUE THEN
				pcMensaje := 'El vehículo seleccionado ya está vendido.';
				RETURN;
			END IF;

			SELECT estado INTO pc_auxiliarDescuento FROM tbl_Descuento WHERE idDescuento = pn_idDescuento;
			IF pc_auxiliarDescuento = 'I' OR pc_auxiliarDescuento = 'i' THEN
				pn_auxiliarDescuento = 8;
			ELSE
				pn_auxiliarDescuento = pn_idDescuento;
			END IF;

			/*-------------------Insertando---------------------------*/

			SELECT MAX(idFactura) INTO auxiliarFactura FROM tbl_Factura;
			auxiliarFactura:=auxiliarFactura+1;

			INSERT INTO tbl_Factura(idFactura, fecha, observaciones, idImpuesto, idCliente, idEmpleado)
			VALUES(auxiliarFactura, CURRENT_DATE, 'Ninguna Observación', 1, pn_idCliente, auxiliarEmpleado);

			INSERT INTO tbl_DescuentoPorFactura(idFactura, idDescuento)
			VALUES(auxiliarFactura, pn_auxiliarDescuento);

			--Procedimiento almacenado de insertar venta:
			SELECT * INTO pbOcurreErrorRenta, pcMensajeRenta
			FROM Funcion_Agregar_Renta(auxiliarFactura, pn_idVehiculo, pd_fechaEntrega, pd_fechaDevolucion, pn_totalHoras);

			IF pbOcurreErrorRenta = TRUE THEN
				pcMensaje := pcMensajeRenta;
				RETURN;
			END IF;

			--Procedimiento almacenado de insertar comodín de Venta:
			SELECT * INTO pbOcurreErrorVenta, pcMensajeVenta
			FROM Funcion_Agregar_Venta_Comodin(auxiliarFactura);

			IF pbOcurreErrorVenta = TRUE THEN
				pcMensaje := pcMensajeVenta;
				RETURN;
			END IF;

			--Procedimiento almacenado de insertar comodín de mantenimiento:
			SELECT * INTO pbOcurreErrorMantenimiento, pcMensajeMantenimiento
			FROM Funcion_Agregar_Mantenimiento_Comodin(auxiliarFactura);

			IF pbOcurreErrorMantenimiento = TRUE THEN
				pcMensaje := pcMensajeMantenimiento;
				RETURN;
			END IF;

			/*SELECT total INTO auxiliarMonto FROM vv_detalle_factura 
			WHERE idFactura = auxiliarFactura;*/
			SELECT CAST(((tbl_VehiculoEmpresa.precioRentaHora-(tbl_VehiculoEmpresa.precioRentaHora*tbl_Descuento.valor/100)
				+(tbl_VehiculoEmpresa.precioRentaHora*tbl_Impuesto.porcentaje/100)) * tbl_Renta.totalHoras)
				AS DECIMAL (10,2)) INTO auxiliarMonto FROM tbl_VehiculoEmpresa
			INNER JOIN tbl_Renta ON tbl_Renta.idVehiculoEmpresa = tbl_VehiculoEmpresa.idVehiculoEmpresa
			INNER JOIN tbl_Factura ON tbl_Factura.idFactura = tbl_Renta.idFactura
			INNER JOIN tbl_DescuentoPorFactura ON tbl_DescuentoPorFactura.idFactura = tbl_Factura.idFactura
			INNER JOIN tbl_Descuento ON tbl_Descuento.idDescuento = tbl_DescuentoPorFactura.idDescuento
			INNER JOIN tbl_Impuesto ON tbl_Impuesto.idImpuesto = tbl_Factura.idImpuesto
			WHERE tbl_VehiculoEmpresa.idVehiculoEmpresa = pn_idVehiculo
			GROUP BY  tbl_VehiculoEmpresa.precioRentaHora, tbl_Descuento.valor, tbl_Impuesto.porcentaje, tbl_Renta.totalHoras;

			INSERT INTO tbl_FormaPagoPorFactura(idFactura, idFormaPago, monto)
			VALUES(auxiliarFactura, pn_idFormaPago, auxiliarMonto);

			/*-----------------Todo bien, todo correcto------------*/
			pcMensaje := 'Vehiculo rentado con éxito';
			pbOcurreError := FALSE;
			--COMMIT;
			RETURN;
		END;
	$BODY$
	LANGUAGE plpgsql VOLATILE
	COST 100;

/*
Probando la función:
	SELECT public.funcion_pagar_renta(
	8, 
	6, 
	23, 
	1, 
	1, 
	'2018/05/01', 
	'2018/05/02', 
	24
);
*/