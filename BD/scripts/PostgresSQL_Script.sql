/*Creación de Tablas*/
	/*Módulo de Personas*/
		/*Tabla Telefono*/
      CREATE TABLE tbl_Direccion(
        idDireccion INTEGER NOT NULL,
        departamento VARCHAR(45) NOT NULL,
        municipio VARCHAR(45) NOT NULL,
        colonia VARCHAR(45) NOT NULL,
        sector VARCHAR(45) NOT NULL,
        numeroCasa VARCHAR(45) NOT NULL,
        CONSTRAINT Pk_Direccion_idDireccion PRIMARY KEY (idDireccion)
      );

    /*Tabla Genero*/
      CREATE TABLE tbl_Genero(
        idGenero INTEGER NOT NULL,
        descripcion VARCHAR(45) NOT NULL,
        CONSTRAINT Pk_Genero_idGenero PRIMARY KEY (idGenero)
      );

      /*Tabla Persona*/
        CREATE TABLE tbl_Persona(
          idPersona INTEGER NOT NULL,
          identidad VARCHAR(45) NOT NULL UNIQUE,
          primerNombre VARCHAR(45) NOT NULL,
          segundoNombre VARCHAR(45) NULL,
          primerApellido VARCHAR(45) NOT NULL,
          segundoApellido VARCHAR(45) NULL,
          idDireccion INTEGER NOT NULL,
          idGenero INTEGER NOT NULL,
          CONSTRAINT Pk_Persona_idPersona PRIMARY KEY (idPersona),
          CONSTRAINT Fk_Genero_idGenero FOREIGN KEY (idGenero) REFERENCES tbl_Genero (idGenero)
          ON DELETE NO ACTION
          ON UPDATE NO ACTION,
          CONSTRAINT Fk_Direccion_idDireccion FOREIGN KEY (idDireccion) REFERENCES tbl_Direccion (idDireccion)
          ON DELETE NO ACTION
          ON UPDATE NO ACTION
        );

      /*Tabla Telefono*/
        CREATE TABLE tbl_Telefono(
          idTelefono INTEGER NOT NULL,
          telefono VARCHAR(45) NOT NULL UNIQUE,
          idPersona INTEGER NOT NULL,
          CONSTRAINT Pk_Telefono_idTelefono PRIMARY KEY (idTelefono),
          CONSTRAINT Fk_Persona_idPersona FOREIGN KEY (idPersona) REFERENCES tbl_Persona (idPersona)
          ON DELETE NO ACTION
          ON UPDATE NO ACTION
        );

      /*Tabla CorreoElectronico*/
        CREATE TABLE tbl_CorreoElectronico(
          idCorreoElectronico INTEGER NOT NULL,
          correoElectronico VARCHAR(45) NOT NULL UNIQUE,
          idPersona INTEGER NOT NULL,
          CONSTRAINT Pk_CorreoElectronico_idCorreoElectronico PRIMARY KEY (idCorreoElectronico),
          CONSTRAINT Fk_Persona_idPersona FOREIGN KEY (idPersona) REFERENCES tbl_Persona (idPersona)
          ON DELETE NO ACTION
          ON UPDATE NO ACTION
        );

      /*Tabla Cargo*/
        CREATE TABLE tbl_Cargo(
          idCargo INTEGER NOT NULL,
          descripcion VARCHAR(45) NOT NULL,
          CONSTRAINT Pk_Cargo_idCargo PRIMARY KEY (idCargo)
        );

        /*Tabla Usuario*/
          CREATE TABLE tbl_Usuario(
            idUsuario INTEGER NOT NULL,
            nombreUsuario VARCHAR(45) NOT NULL UNIQUE,
            userPassword VARCHAR(128) NOT NULL,
            imagenRuta VARCHAR(100) NOT NULL,
            CONSTRAINT Pk_Usuario_idUsuario PRIMARY KEY (idUsuario)
          );

        /*Tabla Cliente*/
          CREATE TABLE tbl_Cliente(
            idCliente INTEGER NOT NULL,
            rtn VARCHAR(45) NOT NULL UNIQUE,
            idPersona INTEGER NOT NULL,
            idUsuario INTEGER NOT NULL,
            CONSTRAINT Pk_Cliente_idCliente PRIMARY KEY (idCliente),
            CONSTRAINT Fk_Persona_idPersona FOREIGN KEY (idPersona) REFERENCES tbl_Persona (idPersona)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Usuario_idUsuario FOREIGN KEY (idUsuario) REFERENCES tbl_Usuario (idUsuario)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla Empleado*/
          CREATE TABLE tbl_Empleado(
            idEmpleado INTEGER NOT NULL,
            fechaContratacion DATE NOT NULL,
            idPersona INTEGER NOT NULL,
            idCargo INTEGER NOT NULL,
            idUsuario INTEGER NOT NULL,
            idEmpleadoSuperior INTEGER NOT NULL,
            fechaPromocion DATE NOT NULL,
            CONSTRAINT Pk_Empleado_idEmpleado PRIMARY KEY (idEmpleado),
            CONSTRAINT Fk_Persona_idPersona FOREIGN KEY (idPersona) REFERENCES tbl_Persona (idPersona)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Cargo_idCargo FOREIGN KEY (idCargo) REFERENCES tbl_Cargo (idCargo)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Usuario_idUsuario FOREIGN KEY (idUsuario) REFERENCES tbl_Usuario (idUsuario)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Empleado_idEmpleadoSuperior FOREIGN KEY (idEmpleadoSuperior) REFERENCES tbl_Empleado (idEmpleado)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

      /*Módulo de Vehículos*/
        /*Tabla Marca*/
          CREATE TABLE tbl_Marca(
            idMarca INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            logoRuta VARCHAR(100) NOT NULL,
            CONSTRAINT Pk_Marca_idMarca PRIMARY KEY (idMarca)
          );

        /*Tabla Modelo*/
          CREATE TABLE tbl_Modelo(
            idModelo INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            idMarca INTEGER NOT NULL,
            CONSTRAINT Pk_Modelo_idModelo PRIMARY KEY (idModelo),
            CONSTRAINT Fk_Marca_idMarca FOREIGN KEY (idMarca) REFERENCES tbl_Marca (idMarca)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla Version*/
          CREATE TABLE tbl_Version(
            idVersion INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            idModelo INTEGER NOT NULL,
            CONSTRAINT Pk_Version_idVersion PRIMARY KEY (idVersion),
            CONSTRAINT Fk_Modelo_idModelo FOREIGN KEY (idModelo) REFERENCES tbl_Modelo (idModelo)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla Transmision*/
          CREATE TABLE tbl_Transmision(
            idTransmision INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            CONSTRAINT Pk_Transmision_idTransmision PRIMARY KEY (idTransmision)
          );

        /*Tabla TipoGasolina*/
          CREATE TABLE tbl_TipoGasolina(
            idTipoGasolina INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            CONSTRAINT Pk_TipoGasolina_idTipoGasolina PRIMARY KEY (idTipoGasolina)
          );

        /*Tabla Estado*/
          CREATE TABLE tbl_Estado(
            idEstado INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            CONSTRAINT Pk_Estado_idEstado PRIMARY KEY (idEstado)
          );

        /*Tabla Cilindraje*/
          CREATE TABLE tbl_Cilindraje(
            idCilindraje INTEGER NOT NULL,
            descripcion INTEGER NOT NULL,
            CONSTRAINT Pk_Cilindraje_idCilindraje PRIMARY KEY (idCilindraje)
          );

        /*Tabla Seguro*/
          CREATE TABLE tbl_Seguro(
            idSeguro INTEGER NOT NULL,
            estado VARCHAR(1) NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            montoAsegurado DECIMAL(10,2) NULL,
            fechaInicio DATE NULL,
            fechaFin DATE NULL,
            CONSTRAINT Pk_Seguro_idSeguro PRIMARY KEY (idSeguro)
          );

        /*Tabla Sucursal*/
          CREATE TABLE tbl_Sucursal(
            idSucursal INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            idDireccion INTEGER NOT NULL,
            rutaFoto VARCHAR(100) NOT NULL,
            CONSTRAINT Pk_Sucursal_idSucursal PRIMARY KEY (idSucursal),
            CONSTRAINT Fk_Direccion_idDireccion FOREIGN KEY (idDireccion) REFERENCES tbl_Direccion (idDireccion)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla Garage*/
          CREATE TABLE tbl_Garage(
            idGarage INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            idSucursal INTEGER NOT NULL,
            CONSTRAINT Pk_Garage_idGarage PRIMARY KEY (idGarage),
            CONSTRAINT Fk_Sucursal_idSucursal FOREIGN KEY (idSucursal) REFERENCES tbl_Sucursal (idSucursal)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla Vehiculo*/
          CREATE TABLE tbl_Vehiculo(
            idVehiculo INTEGER NOT NULL,
            color VARCHAR(45) NOT NULL,
            placa VARCHAR(8) NOT NULL,
            anio DATE NOT NULL,
            generacion VARCHAR(45) NULL,
            serie_vin VARCHAR(45) NOT NULL UNIQUE,
            tipoMotor DECIMAL(10,2) NOT NULL,
            idMarca INTEGER NOT NULL,
            idTransmision INTEGER NOT NULL,
            idTipoGasolina INTEGER NOT NULL,
            idGarage INTEGER NOT NULL,
            idCilindraje INTEGER NOT NULL,
            idModelo INTEGER NOT NULL,
            idVersion INTEGER NOT NULL,
            CONSTRAINT Pk_Vehiculo_idVehiculo PRIMARY KEY (idVehiculo),
            CONSTRAINT Fk_Marca_idMarca FOREIGN KEY (idMarca) REFERENCES tbl_Marca (idMarca)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Transmision_idTransmision FOREIGN KEY (idTransmision) REFERENCES tbl_Transmision (idTransmision)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_TipoGasolina_idTipoGasolina FOREIGN KEY (idTipoGasolina) REFERENCES tbl_TipoGasolina (idTipoGasolina)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Garage_idGarage FOREIGN KEY (idGarage) REFERENCES tbl_Garage (idGarage)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Cilindraje_idCilindraje FOREIGN KEY (idCilindraje) REFERENCES tbl_Cilindraje (idCilindraje)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Modelo_idModelo FOREIGN KEY (idModelo) REFERENCES tbl_Modelo (idModelo)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Version_idVersion FOREIGN KEY (idVersion) REFERENCES tbl_Version (idVersion)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla VehiculoCliente*/
          CREATE TABLE tbl_VehiculoCliente(
            idVehiculoCliente INTEGER NOT NULL,
            fechaRegistro DATE NOT NULL,
            idVehiculo INTEGER NOT NULL,
            idClientePertenece INTEGER NOT NULL,
            CONSTRAINT Pk_VehiculoCliente_idVehiculoCliente PRIMARY KEY (idVehiculoCliente),
            CONSTRAINT Fk_Vehiculo_idVehiculo FOREIGN KEY (idVehiculo) REFERENCES tbl_Vehiculo (idVehiculo)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Cliente_idCliente FOREIGN KEY (idClientePertenece) REFERENCES tbl_Cliente (idCliente)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
            );

        /*Tabla VehiculoEmpresa*/
          CREATE TABLE tbl_VehiculoEmpresa(
            idVehiculoEmpresa INTEGER NOT NULL,
            fechaAdquisicion DATE NOT NULL,
            idVehiculo INTEGER NOT NULL,
            idSeguro INTEGER NOT NULL,
            idEstado INTEGER NOT NULL,
            precioVenta DECIMAL(10,2) NULL,
            precioRentaHora DECIMAL(10,2) NULL,
            seVende BOOLEAN NULL,
            seRenta BOOLEAN NULL,
            estadoMatricula VARCHAR(1),
            montoMatricula DECIMAL(10,2),
            vendido BOOLEAN NOT NULL DEFAULT FALSE,
            CONSTRAINT Pk_VehiculoEmpresa_idVehiculoEmpresa PRIMARY KEY (idVehiculoEmpresa),
            CONSTRAINT Fk_Vehiculo_idVehiculo FOREIGN KEY (idVehiculo) REFERENCES tbl_Vehiculo (idVehiculo)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Seguro_idSeguro FOREIGN KEY (idSeguro) REFERENCES tbl_Seguro (idSeguro)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Estado_idEstado FOREIGN KEY (idEstado) REFERENCES tbl_Estado (idEstado)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
            );

        /*Tabla Foto*/
          CREATE TABLE tbl_Foto(
            idFoto INTEGER NOT NULL,
            rutaFoto VARCHAR(100) NOT NULL,
            idVehiculo INTEGER NOT NULL,
            CONSTRAINT Pk_Foto_idFoto PRIMARY KEY (idFoto),
            CONSTRAINT Fk_Vehiculo_idVehiculo FOREIGN KEY (idVehiculo) REFERENCES tbl_Vehiculo (idVehiculo)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

      /*Módulo de Mantenimiento*/
        /*Tabla MarcaRepuesto*/
          CREATE TABLE tbl_MarcaRepuesto(
            idMarcaRepuesto INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            CONSTRAINT Pk_MarcaRepuesto_idMarcaRepuesto PRIMARY KEY (idMarcaRepuesto)
          );

        /*Tabla CategoriaRePuesto*/
          CREATE TABLE tbl_CategoriaRepuesto(
            idCategoriaRepuesto INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            CONSTRAINT Pk_CategoriaRepuesto_idCategoriaRepuesto PRIMARY KEY (idCategoriaRepuesto)
          );

        /*Tabla Proveedor*/
          CREATE TABLE tbl_Proveedor(
            idProveedor INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            rtn VARCHAR(45) NOT NULL UNIQUE,
            CONSTRAINT Pk_Proveedor_idProveedor PRIMARY KEY (idProveedor)
          );

        /*Tabla CorreoElectronicoProveedor*/
          CREATE TABLE tbl_CorreoElectronicoProveedor(
            idCorreoElectronico INTEGER NOT NULL,
            correoElectronico VARCHAR(45) NOT NULL UNIQUE,
            idProveedor INTEGER NOT NULL,
            CONSTRAINT Pk_CorreoElectronicoProveedor_idCorreoElectronico PRIMARY KEY (idCorreoElectronico),
            CONSTRAINT Fk_Proveedor_idProveedor FOREIGN KEY (idProveedor) REFERENCES tbl_Proveedor (idProveedor)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla TelefonoProveedor*/
          CREATE TABLE tbl_TelefonoProveedor(
            idTelefono INTEGER NOT NULL,
            telefono VARCHAR(45) NOT NULL UNIQUE,
            idProveedor INTEGER NOT NULL,
            CONSTRAINT Pk_TelefonoProveedor_idTelefono PRIMARY KEY (idTelefono),
            CONSTRAINT Fk_Proveedor_idProveedor FOREIGN KEY (idProveedor) REFERENCES tbl_Proveedor (idProveedor)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla SolicitudMantenimiento*/
          CREATE TABLE tbl_SolicitudMantenimiento(
            idSolicitudMantenimiento INTEGER NOT NULL,
            fechaSolicitud DATE NOT NULL,
            estado VARCHAR(1) NOT NULL,
            observacion VARCHAR(300) NOT NULL,
            idEmpleado INTEGER NOT NULL,
            idVehiculoCliente INTEGER NOT NULL,
            CONSTRAINT Pk_SolicitudMantenimiento_idSolicitudMantenimiento PRIMARY KEY (idSolicitudMantenimiento),
            CONSTRAINT Fk_Empleado_idEmpleado FOREIGN KEY (idEmpleado) REFERENCES tbl_Empleado (idEmpleado)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_VehiculoCliente_idVehiculoCliente FOREIGN KEY (idVehiculoCliente)
            REFERENCES tbl_VehiculoCliente (idVehiculoCliente)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla TipoMantenimiento*/
          CREATE TABLE tbl_TipoMantenimiento(
            idTipoMantenimiento INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            costo DECIMAL(10,2) NOT NULL,
            CONSTRAINT Pk_TipoMantenimiento_idTipoMantenimiento PRIMARY KEY (idTipoMantenimiento)
          );

        /*Tabla Repuesto*/
          CREATE TABLE tbl_Repuesto(
            idRepuesto INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            existencia INTEGER NOT NULL,
            precio DECIMAL(10,2) NOT NULL,
            idCategoriaRepuesto INTEGER NOT NULL,
            idMarcaRepuesto INTEGER NOT NULL,
            CONSTRAINT Pk_Repuesto_idRepuesto PRIMARY KEY (idRepuesto),
            CONSTRAINT Fk_CategoriaRepuesto_idCategoriaRepuesto FOREIGN KEY (idCategoriaRepuesto)
            REFERENCES tbl_CategoriaRepuesto (idCategoriaRepuesto)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_MarcaRepuesto_idMarcaRepuesto FOREIGN KEY (idMarcaRepuesto)
            REFERENCES tbl_MarcaRepuesto (idMarcaRepuesto)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla Taller*/
          CREATE TABLE tbl_Taller(
            idTaller INTEGER NOT NULL,
            estado VARCHAR(1) NOT NULL,
            idSucursal INTEGER NOT NULL,
            CONSTRAINT Pk_Taller_idTaller PRIMARY KEY (idTaller),
            CONSTRAINT Fk_Sucursal_idSucursal FOREIGN KEY (idSucursal) REFERENCES tbl_Sucursal (idSucursal)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla Mantenimiento*/
          CREATE TABLE tbl_Mantenimiento(
            idMantenimiento INTEGER NOT NULL,
            fechaIngreso DATE NOT NULL,
            fechaSalida DATE NULL,
            estado VARCHAR(1) NOT NULL,
            idSolicitudMantenimiento INTEGER NOT NULL,
            idEmpleado INTEGER NOT NULL,
            idTipoMantenimiento INTEGER NOT NULL,
            idRepuesto INTEGER NOT NULL,
            idTaller INTEGER NOT NULL,
            CONSTRAINT Pk_Mantenimiento_idMantenimiento PRIMARY KEY (idMantenimiento),
            CONSTRAINT Fk_SolicitudMantenimiento_idSolicitudMantenimiento FOREIGN KEY (idSolicitudMantenimiento)
            REFERENCES tbl_SolicitudMantenimiento (idSolicitudMantenimiento)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Empleado_idEmpleado FOREIGN KEY (idEmpleado) REFERENCES tbl_Empleado (idEmpleado)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_TipoMantenimiento_idTipoMantenimiento FOREIGN KEY (idTipoMantenimiento)
            REFERENCES tbl_TipoMantenimiento (idTipoMantenimiento)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Repuesto_idRepuesto FOREIGN KEY (idRepuesto) REFERENCES tbl_Repuesto(idRepuesto)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Taller_idTaller FOREIGN KEY (idTaller) REFERENCES tbl_Taller(idTaller)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*CompraRepuesto*/
          CREATE TABLE tbl_CompraRepuesto(
            idProveedor INTEGER NOT NULL,
            idRepuesto INTEGER NOT NULL,
            cantidad INTEGER NOT NULL,
            fecha DATE NOT NULL,
            idEmpleado INTEGER NOT NULL,
            CONSTRAINT Fk_Emleado_idEmpleado FOREIGN KEY (idEmpleado)
            REFERENCES tbl_Empleado (idEmpleado)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Proveedor_idProveedor FOREIGN KEY (idProveedor) REFERENCES tbl_Proveedor (idProveedor)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Repuesto_idRepuesto FOREIGN KEY (idRepuesto) REFERENCES tbl_Repuesto (idRepuesto)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

      /*Módulo de Facturación*/
        /*Tabla Descuento*/
          CREATE TABLE tbl_Descuento(
            idDescuento INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            valor DECIMAL(10,2) NOT NULL,
            estado VARCHAR(1) NOT NULL,
            CONSTRAINT Pk_Descuento_idDescuento PRIMARY KEY (idDescuento)
          );

        /*Tabla Impuesto*/
          CREATE TABLE tbl_Impuesto(
            idImpuesto INTEGER NOT NULL,
            porcentaje DECIMAL(10,2) NOT NULL,
            CONSTRAINT Pk_Impuesto_idImpuesto PRIMARY KEY (idImpuesto)
          );

        /*FormaPago*/
          CREATE TABLE tbl_FormaPago(
            idFormaPago INTEGER NOT NULL,
            descripcion VARCHAR(45) NOT NULL,
            CONSTRAINT Pk_FormaPago_idFormaPago PRIMARY KEY (idFormaPago)
          );

        /*Tabla Factura*/
          CREATE TABLE tbl_Factura(
            idFactura INTEGER NOT NULL,
            fecha DATE NOT NULL,
            observaciones VARCHAR(300) NULL,
            idImpuesto INTEGER NOT NULL,
            idCliente INTEGER NOT NULL,
            idEmpleado INTEGER NOT NULL,
            CONSTRAINT Pk_Factura_idFactura PRIMARY KEY (idFactura),
            CONSTRAINT Fk_Impuesto_idImpuesto FOREIGN KEY (idImpuesto) REFERENCES tbl_Impuesto (idImpuesto)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Empleado_idEmpleado FOREIGN KEY (idEmpleado) REFERENCES tbl_Empleado (idEmpleado)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Cliente_idCliente FOREIGN KEY (idCliente) REFERENCES tbl_Cliente (idCliente)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla FormaPagoPorFactura*/
          CREATE TABLE tbl_FormaPagoPorFactura(
            idFactura INTEGER NOT NULL,
            idFormaPago INTEGER NOT NULL,
            monto DECIMAL(10,2) NOT NULL,
            CONSTRAINT Fk_Factura_idFactura FOREIGN KEY (idFactura) REFERENCES tbl_Factura (idFactura)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_FormaPago_idFormaPago FOREIGN KEY (idFormaPago) REFERENCES tbl_FormaPago (idFormaPago)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla DescuentoPorFactura*/
          CREATE TABLE tbl_DescuentoPorFactura(
            idFactura INTEGER NOT NULL,
            idDescuento INTEGER NOT NULL,
            CONSTRAINT Pk_DescuentoPorFactura_idDescuentoPorFactura PRIMARY KEY (idFactura, idDescuento),
            CONSTRAINT Fk_Factura_idFactura FOREIGN KEY (idFactura) REFERENCES tbl_Factura (idFactura)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Descuento_idDescuento FOREIGN KEY (idDescuento) REFERENCES tbl_Descuento (idDescuento)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla Itinerario*/
          CREATE TABLE tbl_Itinerario(
            idItinerario INTEGER NOT NULL,
            fechaReserva DATE NOT NULL,
            fechaEntrega DATE NOT NULL,
            fechaDevolucion DATE NOT NULL,
            CONSTRAINT Pk_idItinerario PRIMARY KEY (idItinerario)
          );

        /*Tabla Renta*/
          CREATE TABLE tbl_Renta(
            idFactura INTEGER NOT NULL,
            idVehiculoEmpresa INTEGER NOT NULL,
            anticipo DECIMAL(10,2) NOT NULL,
            mora DECIMAL(10,2) NOT NULL,
            totalHoras INTEGER NOT NULL,
            idItinerario INTEGER NOT NULL,
            CONSTRAINT Fk_Factura_idFactura FOREIGN KEY (idFactura) REFERENCES tbl_Factura (idFactura)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_VehiculoEmpresa_idVehiculoEmpresa FOREIGN KEY (idVehiculoEmpresa)
            REFERENCES tbl_VehiculoEmpresa (idVehiculoEmpresa)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Itinerario_idItinerario FOREIGN KEY (idItinerario) REFERENCES tbl_Itinerario (idItinerario)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
            );

        /*Tabla Venta*/
          CREATE TABLE tbl_Venta(
            idFactura INTEGER NOT NULL,
            idVehiculoEmpresa INTEGER NOT NULL,
            CONSTRAINT Fk_Factura_idFactura FOREIGN KEY (idFactura) REFERENCES tbl_Factura (idFactura)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_VehiculoEmpresa_idVehiculoEmpresa FOREIGN KEY (idVehiculoEmpresa)
            REFERENCES tbl_VehiculoEmpresa (idVehiculoEmpresa)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

        /*Tabla Factura por mantenimiento*/
          CREATE TABLE tbl_FacturaPorMantenimiento(
            idMantenimiento INTEGER NOT NULL,
            idFactura INTEGER NOT NULL,
            CONSTRAINT Fk_Mantenimiento_idMantenimiento FOREIGN KEY (idMantenimiento) REFERENCES tbl_Mantenimiento (idMantenimiento)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            CONSTRAINT Fk_Factura_idFactura FOREIGN KEY (idFactura) REFERENCES tbl_Factura (idFactura)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          );

/*Creando vistas*/
  /*Relacionadas a la facturación*/
    /*Vista de Subtotal de venta*/
      /*Descripción:*/
        /* Esta vista almacena la sumatoria de precioVenta 
        de todos los vehículos que se registren en una misma factura*/

      /*Script:*/
        CREATE OR REPLACE VIEW vv_Subtotal_Venta (idFactura, Subtotal) AS (
          SELECT tbl_Venta.idFactura, SUM(tbl_VehiculoEmpresa.precioVenta) Subtotal FROM tbl_Venta
          INNER JOIN tbl_VehiculoEmpresa ON tbl_VehiculoEmpresa.idVehiculoEmpresa = tbl_Venta.idVehiculoEmpresa
          INNER JOIN tbl_Factura ON tbl_Factura.idFactura = tbl_Venta.idFactura
          GROUP BY tbl_Venta.idFactura, tbl_VehiculoEmpresa.precioVenta
          ORDER BY tbl_Venta.idFactura
        );

    /*Vista de Subtotal de renta*/
      /*Descripción:*/
        /*Esta vista almacena la sumatoria de precioRentaHora
        de todos los vehículos que se registren en una misma factura*/

      /*Script:*/
        CREATE OR REPLACE VIEW vv_Subtotal_Renta (idFactura, Subtotal) AS (
          SELECT tbl_Renta.idFactura idFactura,  (SUM(tbl_Renta.totalHoras * tbl_VehiculoEmpresa.precioRentaHora) + tbl_Renta.mora - tbl_Renta.anticipo) Subtotal FROM tbl_Renta
          INNER JOIN tbl_VehiculoEmpresa ON tbl_VehiculoEmpresa.idVehiculoEmpresa = tbl_Renta.idVehiculoEmpresa
          INNER JOIN tbl_Factura ON tbl_Factura.idFactura = tbl_Renta.idFactura
          GROUP BY tbl_Renta.idFactura, tbl_Renta.totalHoras, tbl_VehiculoEmpresa.precioRentaHora, tbl_Renta.mora, tbl_Renta.anticipo
          ORDER BY tbl_Renta.idFactura
          );

    /*Vista de Subtotal de mantenimiento*/
      /*Descripción:*/
        /*Esta vista almacena la sumatoria de costo de mantenimiento
        de todos los vehículos que se registren en una misma factura*/

      /*Script:*/
        CREATE OR REPLACE VIEW vv_Subtotal_Mantenimiento (idFactura, Subtotal) AS(
          SELECT tbl_FacturaPorMantenimiento.idFactura idFactura, SUM(tbl_TipoMantenimiento.costo) Subtotal FROM tbl_Factura
          INNER JOIN tbl_FacturaPorMantenimiento ON tbl_FacturaPorMantenimiento.idFactura = tbl_Factura.idFactura
          INNER JOIN tbl_Mantenimiento ON tbl_Mantenimiento.idMantenimiento = tbl_FacturaPorMantenimiento.idMantenimiento
          INNER JOIN tbl_TipoMantenimiento ON tbl_TipoMantenimiento.idTipoMantenimiento = tbl_Mantenimiento.idTipoMantenimiento
          GROUP BY tbl_FacturaPorMantenimiento.idFactura
          ORDER BY tbl_FacturaPorMantenimiento.idFactura
        );

    /*Vsita de Subtotal*/
      /*Descripción: */
        /*Esta vista suma los subtotales*/

      /*Script:*/
        CREATE OR REPLACE VIEW vv_Subtotal (idFactura, Venta, Renta, Mantenimiento, Subtotal) AS(
          SELECT tbl_Factura.idFactura idFactura, vv_Subtotal_Venta.Subtotal Venta, vv_Subtotal_Renta.Subtotal Renta, vv_Subtotal_Mantenimiento.Subtotal Mantenimiento, 
          vv_Subtotal_Venta.Subtotal + vv_Subtotal_Renta.Subtotal + vv_Subtotal_Mantenimiento.Subtotal Subtotal FROM tbl_Factura
          INNER JOIN vv_Subtotal_Venta ON vv_Subtotal_Venta.idFactura = tbl_Factura.idFactura
          INNER JOIN vv_Subtotal_Renta ON vv_Subtotal_Renta.idFactura = tbl_Factura.idFactura
          INNER JOIN vv_Subtotal_Mantenimiento ON vv_Subtotal_Mantenimiento.idFactura = tbl_Factura.idFactura
        );

    /*Vista de Total de descuentos*/
      /*Descripción:*/
        /*Esta vista suma los descuentos disponibles que se le aplican a una factura*/

      /*Script:*/
        CREATE OR REPLACE VIEW vv_Total_Descuento (idFactura, TotalDescuento) AS(
          SELECT tbl_DescuentoPorFactura.idFactura idFactura, SUM(tbl_Descuento.Valor) TotalDescuento FROM tbl_DescuentoPorFactura
          INNER JOIN tbl_Descuento ON tbl_Descuento.idDescuento = tbl_DescuentoPorFactura.idDescuento
          INNER JOIN tbl_Factura ON tbl_Factura.idFactura = tbl_DescuentoPorFactura.idFactura
          WHERE tbl_Descuento.estado = 'A'
          GROUP BY tbl_DescuentoPorFactura.idFactura
          ORDER BY tbl_DescuentoPorFactura.idFactura
        );

    /*Vista de Total de la Factura*/
      /*Descripción:*/
        /*Cálculo del subtotal + impuesto - descuento*/

      /*Script:*/
        CREATE OR REPLACE VIEW vv_Total(idFactura, Total) AS (
          SELECT tbl_Factura.idFactura, CAST((vv_Subtotal.Subtotal + (vv_Subtotal.Subtotal * (tbl_Impuesto.porcentaje/100)) - 
          (vv_Subtotal.Subtotal * (vv_Total_Descuento.TotalDescuento/100))) AS DECIMAL(10,2)) Total FROM tbl_Factura
          INNER JOIN vv_Subtotal ON vv_Subtotal.idFactura = tbl_Factura.idFactura
          INNER JOIN tbl_Impuesto ON tbl_Impuesto.idImpuesto = tbl_Factura.idImpuesto
          INNER JOIN vv_Total_Descuento ON vv_Total_Descuento.idFactura = tbl_Factura.idFactura
          GROUP BY tbl_Factura.idFactura, vv_Subtotal.Subtotal, tbl_Impuesto.porcentaje, vv_Total_Descuento.TotalDescuento
          ORDER BY tbl_Factura.idFactura
        );

    /*Vista de Total de formas de pago por factura*/
      /*Descripción:*/
        /*Suma los montos de cada tipo de forma de pago por factura*/

      /*Script*/
        CREATE OR REPLACE VIEW vv_TotalFormaPago_Factura (idFactura, FormaPago, Monto) AS (
          SELECT tbl_Factura.idFactura idFactura, tbl_FormaPago.descripcion FormaPago, SUM(tbl_FormaPagoPorFactura.monto) Monto FROM tbl_Factura
          INNER JOIN tbl_FormaPagoPorFactura ON tbl_FormaPagoPorFactura.idFactura = tbl_Factura.idFactura
          INNER JOIN tbl_FormaPago ON tbl_FormaPago.idFormaPago = tbl_FormaPagoPorFactura.idFormaPago
          GROUP BY tbl_Factura.idFactura, tbl_FormaPago.descripcion
          ORDER BY tbl_Factura.idFactura
        );

      /*Vista de Detalle de factura*/
      /*Descripción:*/
        /*seleciona los elementos claves de factura*/

      /*Script*/
        CREATE OR REPLACE VIEW vv_Detalle_Factura (idFactura, Subtotal, Impuesto, Descuento, Total) AS (
          SELECT tbl_Factura.idFactura idFactura, vv_Subtotal.Subtotal Subtotal, CAST((vv_Subtotal.Subtotal * (tbl_Impuesto.porcentaje/100)) AS DECIMAL(10,2)) 
          Impuesto, CAST((vv_Subtotal.Subtotal *(vv_Total_Descuento.TotalDescuento/100)) AS DECIMAL(10,2)) Descuento, vv_Total.Total Total FROM tbl_Factura
          INNER JOIN vv_Subtotal ON vv_Subtotal.idFactura = tbl_Factura.idFactura
          INNER JOIN tbl_Impuesto ON tbl_Impuesto.idImpuesto = tbl_Factura.idImpuesto
          INNER JOIN vv_Total_Descuento ON vv_Total_Descuento.idFactura = tbl_Factura.idFactura
          INNER JOIN vv_Total ON vv_Total.idFactura = tbl_Factura.idFactura
          GROUP BY tbl_Factura.idFactura, vv_Subtotal.Subtotal, tbl_Impuesto.porcentaje, vv_Total_Descuento.TotalDescuento, vv_Total.Total
          ORDER BY tbl_Factura.idFactura
        );

  /*Relacionadas al mantenimiento*/
    /*Vista de mantenimientos por vehículo*/
      /*Descripción:*/
        /*Muestra el detalle de mantenimientos por vehículo*/

      /*Script:*/
        CREATE OR REPLACE VIEW vv_Mantenimiento_Vehiculo (vehiculoCliente, idSolicitudMantenimiento, fechaSolicitud, observacion, idMantenimiento, fechaIngreso, fehcaSalida, idEmpleado, descripcion) AS(
          SELECT tbl_SolicitudMantenimiento.idVehiculoCliente, tbl_SolicitudMantenimiento.idSolicitudMantenimiento, tbl_SolicitudMantenimiento.fechaSolicitud,
          tbl_SolicitudMantenimiento.observacion, tbl_Mantenimiento.idMantenimiento,tbl_Mantenimiento.fechaIngreso, tbl_Mantenimiento.fechaSalida, 
          tbl_Mantenimiento.idEmpleado, tbl_TipoMantenimiento.descripcion FROM tbl_SolicitudMantenimiento
          INNER JOIN tbl_Mantenimiento ON tbl_Mantenimiento.idSolicitudMantenimiento = tbl_SolicitudMantenimiento.idSolicitudMantenimiento
          INNER JOIN tbl_TipoMantenimiento ON tbl_TipoMantenimiento.idTipoMantenimiento = tbl_Mantenimiento.idTipoMantenimiento
          WHERE tbl_SolicitudMantenimiento.idSolicitudMantenimiento != 31
          ORDER BY tbl_SolicitudMantenimiento.idVehiculoCliente
        );

  /*Relacionadas a vehiculos*/
    /*Vista de detalle de vehiculos*/
      /*Descripción*/
        /*Detalle de vehiculos*/

      /*Script*/
        CREATE OR REPLACE VIEW vv_Detalle_Vehiculos AS (
          SELECT tbl_Vehiculo.idVehiculo idVehiculo, tbl_Vehiculo.placa Placa, tbl_Marca.descripcion Marca, tbl_Modelo.descripcion Modelo, tbl_Version.descripcion ModeloVersion, tbl_Vehiculo.color Color, 
          EXTRACT(YEAR FROM tbl_Vehiculo.anio) Anio, tbl_Vehiculo.generacion Generacion, tbl_Vehiculo.serie_vin Serie, tbl_Vehiculo.tipoMotor TipoMotor, 
          tbl_Cilindraje.descripcion Cilindraje, tbl_Transmision.descripcion Transmision,
          tbl_TipoGasolina.descripcion TipoGasolina FROM tbl_Vehiculo
          INNER JOIN tbl_Marca ON tbl_Marca.idMarca = tbl_Vehiculo.idMarca
          INNER JOIN tbl_Modelo ON tbl_Modelo.idModelo = tbl_Vehiculo.idModelo 
          INNER JOIN tbl_Version ON tbl_Version.idVersion = tbl_Vehiculo.idVersion
          INNER JOIN tbl_Transmision ON tbl_Transmision.idTransmision = tbl_Vehiculo.idTransmision
          INNER JOIN tbl_TipoGasolina ON tbl_TipoGasolina.idTipoGasolina = tbl_Vehiculo.idTipoGasolina
          INNER JOIN tbl_Cilindraje ON tbl_Cilindraje.idCilindraje = tbl_Vehiculo.idCilindraje
          WHERE tbl_Vehiculo.idVehiculo != 61
          ORDER BY tbl_Vehiculo.idVehiculo
        );

    /*Vista de vehículos por garage y por sucursal*/
      /*Descripción:*/
        /*Esta vista muestra los vehículos agrupados por garage y sucursal*/

      /*Script:*/
        CREATE OR REPLACE VIEW vv_Vehiculos_Sucursal AS (
          SELECT tbl_Sucursal.descripcion Sucursal, tbl_Garage.descripcion Garage, vv_Detalle_Vehiculos.* FROM tbl_Sucursal
          INNER JOIN tbl_Garage ON tbl_Garage.idSucursal = tbl_Sucursal.idSucursal
          INNER JOIN tbl_Vehiculo ON tbl_Vehiculo.idGarage = tbl_Garage.idGarage
          INNER JOIN vv_Detalle_Vehiculos ON vv_Detalle_Vehiculos.idVehiculo = tbl_Vehiculo.idVehiculo
          ORDER BY tbl_Sucursal.descripcion
        );

  /*Relacionadas con las personas*/
    /*Vista de cruce de empleados y datos personales*/
      /*Descripción:*/
        /*Lista información personal de los empleados*/

      /*Script:*/
        CREATE OR REPLACE VIEW vv_Informacion_Empleado (idUsuario, idEmpleado, primerNombre, segundoNombre, primerApellido, segundoApellido, rutaFoto,
          fechaContratacion, cargo, fechaPromocion, nombreUsuario, telefono, correoElectronico) AS(
          SELECT tbl_Usuario.idUsuario usuario, tbl_Empleado.idEmpleado idEmpleado, tbl_Persona.primerNombre primerNombre, tbl_Persona.segundoNombre segundoNombre, tbl_Persona.primerApellido primerApellido, 
          tbl_Persona.segundoApellido segundoApellido, tbl_Usuario.imagenRuta rutaFoto, tbl_Empleado.fechaContratacion fechaContratacion, tbl_Cargo.descripcion cargo, tbl_Empleado.fechaPromocion fechaPromocion, 
          tbl_Usuario.nombreUsuario nombreUsuario, tbl_Telefono.telefono telefono, tbl_CorreoElectronico.correoElectronico correoElectronico FROM tbl_Usuario
          INNER JOIN tbl_Empleado ON tbl_Empleado.idUsuario = tbl_Usuario.idUsuario
          INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Empleado.idPersona
          INNER JOIN tbl_Cargo ON tbl_Cargo.idCargo = tbl_Empleado.idCargo
          INNER JOIN tbl_Telefono ON tbl_Telefono.idPersona = tbl_Persona.idPersona
          INNER JOIN tbl_CorreoElectronico ON tbl_CorreoElectronico.idPersona = tbl_Persona.idPersona
        );
    
    /*Vista de cruce de clientes y datos personales*/
      /*Descripción:*/
        /*Lista información personal de los clientes*/

      /*Script:*/
        CREATE OR REPLACE VIEW vv_Informacion_Cliente (idUsuario, idCliente, primerNombre, segundoNombre, primerApellido, 
          segundoApellido, rutaFoto, nombreUsuario, telefono, correoElectronico) AS(
          SELECT tbl_Usuario.idUsuario usuario, tbl_Cliente.idCliente idCliente, tbl_Persona.primerNombre primerNombre, tbl_Persona.segundoNombre segundoNombre, 
          tbl_Persona.primerApellido primerApellido, tbl_Persona.segundoApellido segundoApellido, tbl_Usuario.imagenRuta rutaFoto, tbl_Usuario.nombreUsuario nombreUsuario, 
          tbl_Telefono.telefono telefono, tbl_CorreoElectronico.correoElectronico correoElectronico FROM tbl_Usuario
          INNER JOIN tbl_Cliente ON tbl_Cliente.idUsuario = tbl_Usuario.idUsuario
          INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Cliente.idPersona
          INNER JOIN tbl_Telefono ON tbl_Telefono.idPersona = tbl_Persona.idPersona
          INNER JOIN tbl_CorreoElectronico ON tbl_CorreoElectronico.idPersona = tbl_Persona.idPersona
        );

/*Insertando registros*/
  /*Módulo de Persona*/
    /*Tabla Genero*/
      INSERT INTO tbl_Genero(idGenero, descripcion) 
        VALUES(1, 'Femenino'),
            (2, 'Masculino');

    /*Direcciones*/
      INSERT INTO tbl_Direccion(idDireccion, departamento, municipio, colonia, sector, numeroCasa) 
        VALUES(1, 'Francisco Morazán', 'Distrito Central', 'El Hato', '3', '1965'),
            (2, 'Francisco Morazán', 'Distrito Central', 'El Hato', '5', '2058'),
            (3, 'Francisco Morazán', 'Distrito Central', 'El Hato', '1', '1587'),
            (4, 'Francisco Morazán', 'Distrito Central', 'El Hato', '2', '1258'),
            (5, 'Francisco Morazán', 'Distrito Central', 'El Hato', '3', '1987'),
            (6, 'Francisco Morazán', 'Distrito Central', 'Kennedy', '1', '1546'),
            (7, 'Francisco Morazán', 'Distrito Central', 'Kennedy', '1', '2369'),
            (8, 'Francisco Morazán', 'Distrito Central', 'Kennedy', '5', '1325'),
            (9, 'Francisco Morazán', 'Distrito Central', 'Kennedy', '3', '1589'),
            (10, 'Francisco Morazán', 'Distrito Central', 'Honduras', '1', '2587'),
            (11, 'Francisco Morazán', 'Distrito Central', 'Carrizal', '3', '9854'),
            (12, 'Francisco Morazán', 'Distrito Central', 'Quezada', '2', '2164'),
            (13, 'Francisco Morazán', 'Distrito Central', '21 de Febrero', '3', '2422'),
            (14, 'Francisco Morazán', 'Distrito Central', 'Kennedy', '6', '2313'),
            (15, 'Francisco Morazán', 'Distrito Central', 'Centro América', '1', '2584'),
            (16, 'Francisco Morazán', 'Distrito Central', 'Villa Unión', '3', '2452'),
            (17, 'Francisco Morazán', 'Distrito Central', 'Kennedy', '1', '2974'),
            (18, 'Francisco Morazán', 'Distrito Central', 'Cerro Grande', '8', '1645'),
            (19, 'Francisco Morazán', 'Distrito Central', 'Villa Franca', '1', '1458'),
            (20, 'Francisco Morazán', 'Distrito Central', 'Kennedy', '4', '1121'),
            (21, 'Francisco Morazán', 'Distrito Central', 'Divagna', '1', '2774'),
            (22, 'Francisco Morazán', 'Distrito Central', 'Centroamericana', '1', '2423'),
            (23, 'Francisco Morazán', 'Distrito Central', '3 de Mayo', '1', '2154'),
            (24, 'Francisco Morazán', 'Distrito Central', 'Las Mercedes', '2', '2313'),
            (25, 'Francisco Morazán', 'Distrito Central', 'Las Crucitas', '1', '2221'),
            (26, 'Francisco Morazán', 'Distrito Central', 'Los Profesores', '1', '2312'),
            (27, 'Francisco Morazán', 'Distrito Central', 'Lempira', '2', '1234'),
            (28, 'Francisco Morazán', 'Distrito Central', 'El Chile', '3', '1233'),
            (29, 'Francisco Morazán', 'Distrito Central', 'Prados Universitarios', '1', '2397'),
            (30, 'Francisco Morazán', 'Distrito Central', 'Las Brisas', '2', '1724'),
            (31, 'Francisco Morazán', 'Distrito Central', 'La Granja', '1', '2247'),
            (32, 'Francisco Morazán', 'Distrito Central', 'Los Hidalgos', '1', '1973');

    /*Tabla Persona*/
      INSERT INTO tbl_Persona (idPersona,identidad,primerNombre,segundoNombre,primerApellido,segundoApellido,idDireccion,idGenero) 
        VALUES (1,'0801-1980-9802','Zephania','George','Robles','Hernandez',1,2),
             (2,'0801-1990-6406','Hakeem','Flynn','Compton','Ortega',2,2),
             (3,'0801-1996-1194','Tucker','Simon','Walker','Craig',3,2),
             (4,'0801-1965-7887','Ali','Jarrod','Murphy','Hansen',4,2),
             (5,'0801-1962-4092','Buckminster','Valentine','Oneal','Strickland',5,2),
             (6,'0801-1985-5370','Zeus','Elmo','Dickson','Meyer',6,2),
             (7,'0801-1987-5237','Jin','Hoyt','Le','Pollard',7,2),
             (8,'0801-1987-6751','Addison','Xenos','Harrington','Bradford',8,2),
             (9,'0801-1969-5125','Ignatius','Lucius','Henderson','Mcdonald',9,2),
             (10,'0801-1992-9752','Leonard','Bruce','Potter','Mcmahon',10,2),
             (11,'0801-1991-2251','Jack','Vincent','Clarke','Guerrero',11,2),
             (12,'0801-1965-4747','Josiah','Arsenio','Christian','Perry',12,2),
             (13,'0801-1978-4068','Buckminster','James','Dodson','Hammond',13,2),
             (14,'0801-1986-7478','Zeus','Allen','Oliver','Velez',14,2),
             (15,'0801-1962-2584','Dean','Carson','Harrington','Hernandez',15,2),
             (16,'0801-1989-2762','Eugenia','Chava','Douglas','Vang',16,1),
             (17,'0801-1987-6399','Rosalyn','Pearl','Burks','Hicks',17,1),
             (18,'0801-1990-1154','Alice','Michelle','Livingston','Kaufman',18,1),
             (19,'0801-1965-7014','Brenda','Nevada','Guerrero','Clayton',19,1),
             (20,'0801-1969-7426','Yuri','Latifah','Meyer','Pearson',20,1),
             (21,'0801-1976-3250','Lara','Shelly','Olson','Howell',21,1),
             (22,'0801-1990-0573','Adria','Minerva','Wells','Sexton',22,1),
             (23,'0801-1992-3719','Wanda','Ebony','Campos','Walter',23,1),
             (24,'0801-1987-3139','Rama','Jana','Gamble','Ballard',24,1),
             (25,'0801-1979-8842','Bethany','Aurora','Rush','Mills',25,1),
             (26,'0801-1982-3823','Raven','Inga','Ballard','Valenzuela',26,1),
             (27,'0801-1993-2763','Hedda','Robin','Sandoval','Berg',27,1),
             (28,'0801-1977-2738','Sydney','Deanna','Gallegos','Whitehead',28,1),
             (29,'0801-1996-5689','Amity','Nerea','Holmes','Stewart',29,1),
             (30,'0801-1999-9709','Emma','Winifred','Mcclure','Mcmahon',30,1),
             (31,'COMODIN','COMODIN','COMODIN','COMODIN','COMODIN',1,1);


    /*Tabla Telefono*/
      INSERT INTO tbl_Telefono (idTelefono,telefono,idPersona) 
        VALUES (1,'+504-9175-6813',1),
             (2,'+504-3479-3934',2),
             (3,'+504-9974-4267',3),
             (4,'+504-9028-3159',4),
             (5,'+504-9048-5832',5),
             (6,'+504-3420-1067',6),
             (7,'+504-9499-8923',7),
             (8,'+504-9960-6230',8),
             (9,'+504-9028-3980',9),
             (10,'+504-3465-6776',10),
             (11,'+504-3494-1250',11),
             (12,'+504-3375-6121',12),
             (13,'+504-3065-6461',13),
             (14,'+504-9604-7135',14),
             (15,'+504-9614-7211',15),
             (16,'+504-3898-3310',16),
             (17,'+504-9830-1714',17),
             (18,'+504-3394-3443',18),
             (19,'+504-3352-8853',19),
             (20,'+504-3073-5522',20),
             (21,'+504-3572-1089',21),
             (22,'+504-3465-6855',22),
             (23,'+504-3335-9573',23),
             (24,'+504-3759-4262',24),
             (25,'+504-3425-4623',25),
             (26,'+504-9283-1726',26),
             (27,'+504-3505-5303',27),
             (28,'+504-3463-3745',28),
             (29,'+504-9748-5779',29),
             (30,'+504-9571-2503',30),
             (31,'+504-3535-5196',1),
             (32,'+504-3551-6763',2),
             (33,'+504-3137-8372',3),
             (34,'+504-9199-3532',4),
             (35,'+504-3156-2507',5),
             (36,'+504-9324-1000',6),
             (37,'+504-9998-1647',7),
             (38,'+504-3468-2892',8),
             (39,'+504-9163-2910',9),
             (40,'+504-9128-3418',10),
             (41,'+504-9458-9499',11),
             (42,'+504-9038-4956',12),
             (43,'+504-3076-9390',13),
             (44,'+504-3061-2589',14),
             (45,'+504-3178-8316',15),
             (46,'+504-3147-4384',16),
             (47,'+504-3329-9302',17),
             (48,'+504-3673-8423',18),
             (49,'+504-3341-2382',19),
             (50,'+504-9946-8064',20),
             (51,'+504-9112-2857',21),
             (52,'+504-3242-8610',22),
             (53,'+504-9014-3941',23),
             (54,'+504-3837-1247',24);

    /*Tabla CorreoElectronico*/
      INSERT INTO tbl_CorreoElectronico (idCorreoElectronico,correoElectronico,idPersona) 
        VALUES (1,'neque@convalliserateget.net',1),
             (2,'mauris@est.ca',2),
             (3,'Mauris@SedmolestieSed.com',3),
             (4,'quam.vel.sapien@magnuadavel.co.uk',4),
             (5,'Vestibulum@justonecante.co.uk',5),
             (6,'varius@Curabitur.com',6),
             (7,'mi.enim@nulla.com',7),
             (8,'diam.at@interdumNuncsollicitudin.ca',8),
             (9,'massa.rutrum@eltaeerat.org',9),
             (10,'semper@ami.net',10),
             (11,'accumsan.laorem@sociisnatopenatibus.edu',11),
             (12,'non.dui@commodoauctorvelit.org',12),
             (13,'orci@dolordolortempus.org',13),
             (14,'molestie@feugiatnec.edu',14),
             (15,'eleifend.Cras.sed@Nunc.com',15),
             (16,'Aenean@at.org',16),
             (17,'erat@Quisquevarius.ca',17),
             (18,'sapien@liberolacus.co.uk',18),
             (19,'arcu.Aliquam@justo.net',19),
             (20,'Phasellus@vitaeodiosagittis.com',20),
             (21,'pharetra.felis@sedpede.co.uk',21),
             (22,'Fusce@tristiquesenectus.co.uk',22),
             (23,'nunc.interdum.feugiat@velconvallisin.ca',23),
             (24,'Aenean.nunc@tellusjustosit.co.uk',24),
             (25,'diam.vel.arcu@urnaconvallis.co.uk',25),
             (26,'vel.@temporarcuVestibulum.net',26),
             (27,'Etiam.laoreet@placerat.net',27),
             (28,'consequat@utnisia.co.uk',28),
             (29,'metus.In@dapibusligula.com',29),
             (30,'ac.nulla@laciniavitae.co.uk',30),
             (31,'nascetur.ridiculus.mus@et.net',1),
             (32,'vestibulum.magna@aliquetmagnaa.co.uk',2),
             (33,'feugiat@porttitor.ca',3),
             (34,'molestie.orci@lentesquemassa.net',4),
             (35,'aliquet.vel@cursus.edu',5),
             (36,'Mauris@loremDonec.edu',6),
             (37,'aliquam.arcu@eratinconsectetuer.com',7),
             (38,'nulla.magna@euismod.net',8),
             (39,'sit@amet.com',9),
             (40,'enim.Suspendisse@liberolacus.org',10),
             (41,'eu@Aliquamfringilla.org',11),
             (42,'rutrum.eu.ultrices@montes.ca',12),
             (43,'egestas@apurus.edu',13),
             (44,'iaculis@odio.com',14),
             (45,'metus.vitae.velit@duiinsodales.ca',15),
             (46,'dui@non.net',16),
             (47,'arcu@Nam.net',17),
             (48,'lobortis.Class@utsemNulla.co.uk',18),
             (49,'fermentum@Etiamgravidamolestie.net',19),
             (50,'non@necmetusfacilisis.net',20),
             (51,'semper.rutrum@enim.net',21),
             (52,'Mauris@convallisin.net',22),
             (53,'non@ut.net',23);

    /*Tabla Cargo*/
      INSERT INTO tbl_Cargo (idCargo, descripcion)
        VALUES (1,'Gerente General'),
             (2,'Gerente de Sucursal'),
             (3,'Asesor de Ventas'),
             (4,'Mecánico'),
             (5,'Conductor'),
             (6,'Guardia de Seguridad'),
             (7,'Conserge'),
             (8,'Contador'),
             (9,'Publicista'),
             (10,'Cajero');

    /*Tabla Usuario*/
      INSERT INTO tbl_Usuario(idUsuario, nombreUsuario, userPassword, imagenRuta)
        VALUES(1,'user1','bc547750b92797f955b36112cc9bdd5cddf7d0862151d03a167ada8995aa24a9ad24610b36a68bc02da24141ee51670aea13ed6469099a4453f335cb239db5da', 'uploaded\u1.png'),
            (2,'user2','92a891f888e79d1c2e8b82663c0f37cc6d61466c508ec62b8132588afe354712b20bb75429aa20aa3ab7cfcc58836c734306b43efd368080a2250831bf7f363f', 'uploaded\u2.png'),
            (3,'user3','2a64d6563d9729493f91bf5b143365c0a7bec4025e1fb0ae67e307a0c3bed1c28cfb259fc6be768ab0a962b1e2c9527c5f21a1090a9b9b2d956487eb97ad4209', 'uploaded\u3.png'),
            (4,'user4','11961811bd4e11f23648afbd2d5c251d2784827147f1731be010adaf0ab38ae18e5567c6fd1bee50a4cd35fb544b3c594e7d677efa7ca01c2a2cb47f8fb12b17', 'uploaded\u4.png'),
            (5,'user5','39c6f5329e959b2af0deb0f8dacbcdf5418204f46baed50388f62b047c9223c66ff470031ecd653a49f6eff6fa876811e46f0c269390a8bf61f4f983729e1083', 'uploaded\u5.png'),
            (6,'user6','011324228a766d0d06e56bd4c61fa8bffa4bc1dd01eb6892f906ef93cb9ba3f4a4243fe40f3e54314115bf0c0eac80bc630ed4dccf7ba6f22b12d9261cca7daa', 'uploaded\u6.png'),
            (7,'user7','a7d785790aecb79a4a3bcd5197301ae76897f83a2424a9b84160ed12a5def47f66d5a88ce5e6032be7e0e91b912d92e1b64f97b1d13a5096eec097470dee7764', 'uploaded\u7.png'),
            (8,'user8','219aab6b2cf738d9f370e197ce0151be42ae6095e0d72fa49592865c9d2dde5d2fa72e908ac374cba55426e6d0ed39324fd6de1d5da2641cc7f4491f5edd931f', 'uploaded\u8.png'),
            (9,'user9','26e261e3003a175c800a2c48f96972793676e8ab464d0e73da50b1c8d359ed4bac5ee660bfe3ee9a9362ad42ca3c9aa793ab4f707b163dfea4d89b64fae0a0b9', 'uploaded\u9.png'),
            (10,'user10','2ce5f635d25b791d37a92c99f0af6df02a68fa695b74f90685e7d93ed3f5a61a715168541954b4c2feec9fd39fcc4df74fef1b9211e12ca96dc03efba2e6a31e', 'uploaded\u10.png'),
            (11,'user11','f272bde3a05d1e2beacff0852af0935518c8e5977ac79413fa89d169c461f6b5d60eeefd6b128470c36c14e4f5a1cf192d01f93caa01dcb55ce6fedf8008173c', 'uploaded\u11.png'),
            (12,'user12','552dc2e616c351e1a6ffaadb32dbacbaaeeb8359a9f6ec33668e9265997c8aa8fa8b501c6759b989742bf0b4e566ecf2079f9359d3224ecef116ce42c4ec07ad', 'uploaded\u12.png'),
            (13,'user13','34ca329b0e0e8310bf012bc3cfd56e2ddf1ac6e734baab744a87fae59ada3e510306d9a701515e99770b20f42e5097a9b476be4835f8e599e3e38ddce521a4fb', 'uploaded\u13.png'),
            (14,'user14','6c83e3c2b8a035bf55c774f4d9e150bfa292b61754883e188b0013a92ef3594e113f087854e3704d14f78079dbb37068c981159e2621f934018496cf730146dc', 'uploaded\u14.png'),
            (15,'user15','5644ed5463aeb778f5a41b5d25ad30dd4813300fec5e79ac82ae2777e59d596775958947a1607938d2162d3c011321fb876dc69c9345dcecce0df94b1cc601b7', 'uploaded\u15.png'),
            (16,'user16','33378b7b66c511efa8340d2f9101260739a0c512348bfe67b348876c874665d332c770d4ea528d9002496c1f574ed916ebdceb6870b5bea9366dc174bc0a7c5c', 'uploaded\u16.png'),
            (17,'user17','3bcb5691e05414034706c825ae61c62ef66d5db3647846e9570ee333c2cf31124b9c106c740d288be78eff4134251d748fbeef175d6ff587d38f8ecc3a3eb31d', 'uploaded\u17.png'),
            (18,'user18','62eb450f0c46e2fe24002cdcf6c8d3d45a4a7fb01737b7e2df2f9c535ca2e082c7dbd58a91ffd01ece48414862ab49d1e31272e036e34038b9fa69b3b0c92afb', 'uploaded\u18.png'),
            (19,'user19','3942229e706b3510f1151e84e49b027d76e06392ce9a7be977977d6b9b70a9e6cb2208dc13f4afeac8ecfd55babcd9af3dc1cc00c13f2a3b648df2ec52cd2488', 'uploaded\u19.png'),
            (20,'user20','99344ceebc98e13a61869b7f8fd5fa20017e70859be61a08c84c72ed797b3e19d7a7770d1821e91de5db655132acd09bff0473861d00964ba73c8c024f9565d5', 'uploaded\u29.png'),
            (21,'user21','17c8f5af0e37ff674f470d12c00d11eee86b09b83bbda028f2f0679ea2312174cc9bf59e9629112b7b3c3192908e9353d2a98c9ad803de9b56eda7420f1e2c30', 'uploaded\u21.png'),
            (22,'user22','ba39897ea8127a48594bf673648c82d051abe4bdb91187c1b642f2b2cd05f4d0afb43fe548443d4cf90a2c9bc50fd3e43dae899424966e4b43273594aba8f6c2', 'uploaded\u22.png'),
            (23,'user23','5b823f600bb6dfbb7f479b26c4e46e13a44ee07088eb44bf65b47d44aa0ef5624331fa6f7dbe1bbc91958b3c9d4293fd3c018c1ef35069374232fb90b314171e', 'uploaded\u23.png'),
            (24,'user24','c2ab49664f8d430d287158bf59512def097d9ad726181863aaf0b2a825972548d0c231b6bce5bc87895da32c030b4b4c49144aa437bfa1e7d193208081948601', 'uploaded\u24.png'),
            (25,'user25','d485052dc979fe091e4b59e67d35856e1c0fd8237ee47aa6d5751babc553043c8584ed6847df9b9480b0841b67e21c4ceb71ab180d1b9a580cdcf0b6881da547', 'uploaded\u25.png'),
            (26,'user26','41c6ece128b8ab6b0b36295d9ec0c7eacbb69c04878547f8836271154be22da6199958c7e181b2bfcde1a421650b133ada72bc39bbb6ebcdb17e333a50ed6dab', 'uploaded\u26.png'),
            (27,'user27','4c8a5ed406fdd416137f0544d55b176f12d85d3279ac00c7023318b1219f18ff482653eefdb8fcdb5751861c2b727140bd4649ffb096595224dadc3ec2effa9a', 'uploaded\u27.png'),
            (28,'user28','3f2676c76dbff5f7b62d8bfb70e86e683db61e10d89a3cca32b71b48be44770c07da50c10ab09e5026167f5a7e228581bb159d6cb20445cf9f1235858bdce38b', 'uploaded\u28.png'),
            (29,'user29','6941ea4d1ce5e2ca8b771e5af18a4485392269cc72c92aef0e2e34c104045ca34ca99d11d9f14cd28d19ce21f44fe1a0ff15bba365754f413075c76b266a6707', 'uploaded\u29.png'),
            (30,'user30','b97f5ad2c29c48a6f5bc82ed15b21688aae7c90c03768c01b0b91ae718aee2d57131fecfc37adfe07747d5952f6d89d3c134e1539b77789ec50b59037f0c7e8b', 'uploaded\u30.png'),
            (31,'COMODIN','54ed3572010646a17777d03fda394070e82a47172e96dddc15736aaf38ba54d7dd40b2db2c39121e1e74095c88162c5e4b503b6f591a55a5730b95e437d84873', 'C:\VehiculosFiles\Pics\Users\COMODIN.jpg');

    /*Tabla Cliente*/
      INSERT INTO tbl_Cliente(idCliente,rtn,idPersona,idUsuario)
        VALUES(1,'0801-1980-98025',1,16),
            (2,'0801-1990-64064',2,17),
            (3,'0801-1996-11942',3,18),
            (4,'0801-1965-78874',4,19),
            (5,'0801-1962-40926',5,20),
            (6,'0801-1985-53702',6,21),
            (7,'0801-1987-52375',7,22),
            (8,'0801-1989-27621',16,1),
            (9,'0801-1987-63994',17,2),
            (10,'0801-1990-11547',18,3),
            (11,'0801-1965-70146',19,4),
            (12,'0801-1969-74262',20,5),
            (13,'0801-1976-32507',21,6),
            (14,'0801-1990-05733',22,7),
            (15,'0801-1992-37192',23,8),
            (16,'COMODIN',31,31);

    /*Tabla Empleado*/
      INSERT INTO tbl_Empleado(idEmpleado, fechaContratacion, idPersona, idCargo, idUsuario, idEmpleadoSuperior, fechaPromocion)
        VALUES(1,'2010/01/01',8,1,23,1,'2010/01/01'),
            (2,'2010/01/01',9,2,24,1,'2010/01/01'),
            (3,'2010/01/01',10,2,25,1,'2010/01/01'),
            (4,'2010/01/01',11,4,26,2,'2010/01/01'),
            (5,'2010/01/01',12,4,27,2,'2010/01/01'),
            (6,'2010/01/01',13,4,28,3,'2010/01/01'),
            (7,'2010/01/01',14,4,29,3,'2010/01/01'),
            (8,'2010/01/01',15,7,30,1,'2010/01/01'),
            (9,'2010/01/01',24,10,9,2,'2010/01/01'),
            (10,'2010/01/01',25,10,10,3,'2010/01/01'),
            (11,'2010/01/01',26,8,11,2,'2010/01/01'),
            (12,'2010/01/01',27,8,12,3,'2010/01/01'),
            (13,'2010/01/01',28,3,13,2,'2010/01/01'),
            (14,'2010/01/01',29,3,14,3,'2010/01/01'),
            (15,'2010/01/01',30,9,15,1,'2010/01/01');

  /*Módulo de Vehiculo*/
    /*Tabla Marca*/
    INSERT INTO tbl_Marca(idMarca, descripcion, logoruta) 
    VALUES(1, 'Honda', 'uploaded\m1.png'),
          (2, 'Ford', 'uploaded\m2.png'),
          (3, 'Toyota', 'uploaded\m3.png'),
          (4, 'WolksWagen', 'uploaded\m4.png'),
          (5, 'Lexus', 'uploaded\m5.png'),
          (6, 'Jeep', 'uploaded\m6.png'),
          (7, 'BMW', 'uploaded\m7.png'),
          (8, 'Mazda', 'uploaded\m8.png'),
          (9, 'AstonMartin', 'uploaded\m9.png'),
          (10, 'Chevrolet', 'uploaded\m10.png'),
          (11, 'Mitsubishi', 'uploaded\m11.png'),
          (12, 'Suzuki', 'uploaded\m12.png'),
          (13, 'Chrysler', 'uploaded\m13.png'),
          (14, 'Dodge', 'uploaded\m14.png'),
          (15, 'Nissan', 'uploaded\m15.png');

    /*Tabla Modelo*/
      INSERT INTO tbl_Modelo(idModelo, descripcion, idMarca)
      VALUES(1, 'Civic', 1),
            (2, 'Accord', 1),
            (3, 'CR-V',1),
            (4, 'Element', 1),
            (5, 'Fit', 1),
            (6, 'Focus', 2),
            (7, 'Fusion', 2),
            (8, 'Renger', 2),
            (9, 'Escape', 2),
            (10, 'Mustang', 2),
            (11, 'Tacoma', 3),
            (12, 'Hilux', 3),
            (13, 'Rav4', 3),
            (14, 'Corrolla', 3),
            (15, '4Runner', 3),
            (16, 'Beetle', 4),
            (17, 'Eos', 4),
            (18, 'GTI', 4),
            (19, 'Jetta', 4),
            (20, 'Passat', 4),
            (21, 'ES-350', 5),
            (22, 'GS350', 5),
            (23, 'ISF', 5),
            (24, 'IS250', 5),
            (25, 'LS460', 5),
            (26, 'Commander', 6),
            (27, 'Compass', 6),
            (28, 'Grand Patriot', 6),
            (29, 'Grand Cheeroke', 6),
            (30, 'Liberty', 6),
            (31, 'Patriot', 6),
            (32, 'x5', 7),
            (33, 'M3', 7),
            (34, 'M4', 7),
            (35, 'M5', 7),
            (36, 'M6', 7),
            (37, 'Z4', 7),
            (38, 'MX-S Miata', 8),
            (39, '3', 8),
            (40, '5', 8),
            (41, '6', 8),
            (42, 'B400', 8),
            (43, 'BB9', 9),
            (44, 'DBS', 9),
            (45, 'V8 Vantage', 9),
            (46, 'Avalanche', 10),
            (47, 'Aveo', 10),
            (48, 'Impala', 10),
            (49, 'Corvette', 10),
            (50, 'Colorado', 10),
            (51, 'Eclipse', 11),
            (52, 'Galant', 11),
            (53, 'Lancer', 11),
            (54, 'Endeavor', 11),
            (55, 'Raider', 11),
            (56, 'Reno', 12),
            (57, 'SX-4', 12),
            (58, 'XL-7', 12),
            (59, 'Reno', 12),
            (60, 'Grand Vitara', 12),
            
            (61,'Aspen',13),
            (62,'Crossfire',13),
            (63,'Pacifica',13),
            (64,'PtCruiser',13),
            (65,'RAM-2500',14),
            (66,'RAM-3500',14),
            (67,'Vipe',14),
            (68,'Durango',14),
            (69,'Avenger',14),
            (70,'350Z',15),
            (71,'Altima',15),
            (72,'Pathfinder',15),
            (73,'Frontier',15),
            (74,'Xterra',15);
            

    /*Tabla Version*/
      INSERT INTO tbl_Version(idVersion, descripcion, idModelo)
      VALUES(1, 'Sedan', 1),
             (2, 'Sedan', 1),
            (3, 'Camioneta',1),
            (4, 'Camioneta', 1),
            (5, 'Sedan', 1),
            (6, 'Sedan', 2),
            (7, 'Turismo', 2),
            (8, 'Pickup', 2),
            (9, 'Camioneta', 2),
            (10, 'Deportivo', 2),
            (11, 'Pickup', 3),
            (12, 'Pickup', 3),
            (13, 'Camioneta', 3),
            (14, 'Sedan', 3),
            (15, 'Camioneta', 3),
            (16, 'Sedan', 4),
            (17, 'Convertible', 4),
            (18, 'Deportivo', 4),
            (19, 'Sedan', 4),
            (20, 'Sedan', 4),
            (21, 'Sedan', 5),
            (22, 'Sedan', 5),
            (23, 'Sedan', 5),
            (24, 'Sedan', 5),
            (25, 'Sedan', 5),
            (26, 'Camioneta', 6),
            (27, 'Camioneta', 6),
            (28, 'Camioneta', 6),
            (29, 'Camioneta', 6),
            (30, 'Camioneta', 6),
            (31, 'Camioneta', 6),
            (32, 'Camioneta', 7),
            (33, 'Sedan', 7),
            (34, 'Sedan', 7),
            (35, 'Sedan', 7),
            (36, 'Sedan', 7),
            (37, 'Deportivo', 7),
            (38, 'Deportivo', 8),
            (39, 'Sedan', 8),
            (40, 'Sedan', 8),
            (41, 'Sedan', 8),
            (42, 'Pickup', 8),
            (43, 'Deportivo', 9),
            (44, 'Deportivo', 9),
            (45, 'Deportivo', 9),
            (46, 'Camioneta', 10),
            (47, 'Sedan', 10),
            (48, 'Sedan', 10),
            (49, 'Deportivo', 10),
            (50, 'Camioneta', 10),
            (51, 'Sedan', 11),
            (52, 'Sedan', 11),
            (53, 'Sedan', 11),
            (54, 'Camioneta', 11),
            (55, 'Pickup', 11),
            (56, 'Sedan', 12),
            (57, 'Sedan', 12),
            (58, 'Sedan', 12),
            (59, 'Reno', 12),
            (60, 'Camioneta', 12),
            
            (61,'Camioneta Deportiva',13),
            (62,'Turismo',13),
            (63,'Camioneta',13),
            (64,'Sedan C',13),
            (65,'Camioneta',14),
            (66,'Camioneta',14),
            (67,'Deportivo',14),
            (68,'Durango',14),
            (69,'Deportivo',14),
            (70,'Deportivo',15),
            (71,'Sedan',15),
            (72,'Camioneta',15),
            (73,'Camioneta',15),
            (74,'Camioneta',15);

    /*Tabla Transmision*/
      INSERT INTO tbl_Transmision(idTransmision, descripcion)
      VALUES(1, 'Automatica'),
            (2, 'Mecanica'),
            (3, 'Triptónica');

    /*Tabla TipoGasolina*/
      INSERT INTO tbl_TipoGasolina(idTipoGasolina, descripcion)
      VALUES(1, 'Diesel'),
            (2, 'Regular'),
            (3, 'Superior'),
            (4, 'Gas LPG');

    /*Tabla Estado*/
      INSERT INTO tbl_Estado(idEstado, descripcion)
      VALUES(1, 'Nuevo'),
            (2, 'Semi nuevo'),
            (3, 'Usado'),
            (4, 'Chocado'),
            (5, 'Reparado por dueño'),
            (6, 'Reparado por fábrica');

    /*Tabla Cilindraje*/
      INSERT INTO tbl_Cilindraje(idCilindraje, descripcion)
      VALUES(1, 4),
            (2, 6),
            (3, 8),
            (4, 10),
            (5, 12),
            (6, 14),
            (7, 16);

    /*Tabla Sucursal*/
      INSERT INTO tbl_Sucursal(idsucursal, descripcion, iddireccion, rutaFoto)
      VALUES(1, 'Tegucigalpa 1', 31, 'uploaded\Sucursales\Sucursal1.jpg'),
            (2, 'Tegucigalpa 2', 32, 'uploaded\Sucursales\Sucursal2.jpg'),
            (3, 'Comayagua 1',3, 'uploaded\Sucursales\Sucursal3.jpg'),
            (4, 'Comayagua 2', 4, 'uploaded\Sucursales\Sucursal4.jpg'),
            (5, 'San Pedro Sula 1', 5, 'uploaded\Sucursales\Sucursal5.jpg'),
            (6, 'San Pedro Sula 2', 6, 'uploaded\Sucursales\Sucursal6.jpg'),
            (7, 'Tela 1', 7, 'uploaded\Sucursales\Sucursal7.jpg'),
            (8, 'Tela 2', 8, 'uploaded\Sucursales\Sucursal8.jpg'),
            (9, 'Ceiba 1', 9, 'uploaded\Sucursales\Sucursal9.jpg'),
            (10, 'Ceiba 2', 10, 'uploaded\Sucursales\Sucursal10.jpg'),
            (11, 'Trujillo 1', 11, 'uploaded\Sucursales\Sucursal11.jpg'),
            (12, 'Trujillo 2', 12, 'uploaded\Sucursales\Sucursal12.jpg'),
            (13, 'Cholute 1', 13, 'uploaded\Sucursales\Sucursal13.jpg'),
            (14, 'Choluteca 2', 14, 'uploaded\Sucursales\Sucursal14.jpg'),
            (15, 'Danlí', 15, 'uploaded\Sucursales\Sucursal15.jpg');

    /*Tabla Garage*/
      INSERT INTO tbl_Garage(idGarage, descripcion, idsucursal)
      VALUES(1, 'Tamaño 20 vehiculos', 1),
            (2, 'Tamaño 20 vehiculo', 2),
            (3, 'Tamaño 50 vehiculo ',3),
            (4, 'Tamaño 20 vehiculo de tierra', 4),
            (5, 'Tamaño 20 vehiculo en construccion', 5),
            (6, 'Tamaño 20 vehiculo en construccion', 6),
            (7, 'Tamaño 20 vehiculo techado', 7),
            (8, 'Tamaño 50 vehiculo tamaño grande', 8),
            (9, 'Tamaño 20 vehiculo tamaño pequeño', 9),
            (10, 'Tamaño 100 vehiculo techado', 10),
            (11, 'Tamaño 20 vehiculo en mantenimiento', 11),
            (12, 'Tamaño 20 vehiculo solo de dia', 12),
            (13, 'Tamaño 20 vehiculo solo de dia ', 13),
            (14, 'Tamaño 20 vehiculo de tierra', 14),
            (15, 'Tamaño 20 vehiculo techado', 15);

    /*Tabla Seguro*/
      INSERT INTO tbl_Seguro(idseguro, estado,descripcion,montoasegurado,fechainicio,fechafin)
      VALUES(1, 'A', 'seguro completo',100000,'2017/01/01','2018/01/01'),
            (2, 'A', 'seguro completo',100000,'2017/01/01','2018/01/01'),
            (3, 'A', 'seguro completo',890000,'2017/01/01','2018/01/01'),
            (4,  'A','seguro completo',900000,'2017/01/01','2018/01/01'),
            (5, 'A', 'seguro completo',500000,'2017/01/01','2018/01/01'),
            (6, 'A', 'seguro completo',150000,'2017/01/01','2018/01/01'),
            (7, 'A', 'seguro completo',120000,'2017/01/01','2018/01/01'),
            (8, 'A', 'seguro completo',130000,'2017/01/01','2018/01/01'),
            (9, 'A', 'seguro completo',140000,'2017/01/01','2018/01/01'),
            (10, 'A','seguro completo',100000,'2017/01/01','2018/01/01'),
            (11, 'A','seguro completo',800000,'2017/01/01','2018/01/01'),
            (12, 'A','seguro completo',100000,'2017/01/01','2018/01/01'),
            (13, 'A','seguro completo',100000,'2017/01/01','2018/01/01'),
            (14,'A', 'seguro completo',200000,'2017/01/01','2018/01/01'),
            (15, 'A', 'seguro completo',300000,'2017/01/01','2018/01/01');

    /*Tabla Vehiculo*/
      INSERT INTO tbl_vehiculo(idvehiculo, color, placa,anio,generacion,serie_vin,
                  tipomotor,idmarca,idtransmision,idtipogasolina,idgarage,idcilindraje,idmodelo, idVersion)
      VALUES(1,  'Blanco','PCU28959','2017/01/01','novena generacion','PXLW34575N',1800,1,1,1,1,1,1,1),
            (2,  'Negro','PCU28959','2017/01/01','novena generacion','VPNMS83032',1800,1,2,2,2,2,2,2),
            (3,  'Blanco','JKL90432','2017/01/01','primera generacion','HSI2293022',1800,1,3,3,3,3,3,3),
            (4,  'Azul','ANM89233','2017/01/01','primera generacion','PJWKQI9302',1800,1,1,4,4,4,4,4),
            (5,  'Amarillo','QUWJ2839','2017/01/01','cuarta generacion','PREYW29323',1800,1,1,2,5,5,5,5),
            (6,  'Negro','CKL87392','2017/01/01','primera generacion','BEIW8DU200',1800,2,1,2,6,6,6,6),
            (7,  'Blanco','PKS34940','2017/01/01','primera generacion','AVHS78E933',1800,2,1,3,7,7,7,7),
            (8,  'Negro','PKJUE829','2017/01/01','primera generacion','PCBKSO9390',1800,2,1,2,8,1,8,8),
            (9,  'Blanco','WERT3829','2017/01/01','quinta generacion','OPEKWU3990',2000,2,1,2,9,1,9,9),
            (10, 'Rojo','IOP00292','2017/01/01','sexta generacion','RTWH7839HE',2400,2,1,1,1,3,10,10),
            (11, 'Rojo','UIE793J2','2017/01/01','primera generacion','SBJEIU0322',1800,3,1,1,11,3,11,11),
            (12, 'Negro','2YWHJD88','2017/01/01','primera generacion','OPWJEH6372',3000,3,1,1,12,3,12,12),
            (13, 'Blanco','LKI89772','2017/01/01','primera generacion','ANJS32893J',1800,3,1,1,13,3,13,13),
            (14, 'Azul','KLIO0383','2017/01/01','primera generacion','DJJSJDBB3N',1300,3,1,1,14,3,14,14),
            (15, 'Negro','PCWHEE24','2017/01/01','octava generacion','BMXKWI3902',2000,3,1,1,15,3,15,15),
            (16,  'Rojo','PCU28959','2017/01/01','novena generacion','PXLLWLEMEM',1800,4,1,1,1,1,16,16),
            (17,  'Blanco','PCU28959','2017/01/01','novena generacion','VPNMS830303',1800,4,2,2,2,2,17,17),
            (18,  'Blanco','JKL90432','2017/01/01','primera generacion','HSI2293024',1800,4,3,3,3,3,18,18),
            (19,  'Azul','ANM89233','2017/01/01','primera generacion','PJWKQI9305',1800,4,1,4,4,4,18,18),
            (20,  'Negro','QUWJ2839','2017/01/01','cuarta generacion','PREYW29326',1800,4,1,2,5,5,19,19),
            (21,  'Blanco','CKL87392','2017/01/01','primera generacion','BEIW8DU207',1800,5,1,2,6,6,20,20),
            (22,  'Azul','PKS34940','2017/01/01','primera generacion','AVHS78E938',1800,5,1,3,7,7,21,21),
            (23,  'Blanco','PKJUE829','2017/01/01','primera generacion','PCBKSO9399',1800,5,1,2,8,2,22,22),
            (24,  'Gris','WERT3829','2017/01/01','quinta generacion','OPEKWU3911',2000,5,1,2,9,2,23,23),
            (25, 'Rojo','IOP00292','2017/01/01','sexta generacion','RTWH7839TY',2400,5,1,1,1,4,24,24),
            (26, 'Naranja','UIE793J2','2017/01/01','primera generacion','SBJEIU03IO',1800,6,1,1,11,4,25,25),
            (27, 'Naranja','2YWHJD88','2017/01/01','primera generacion','OPWJEH63PR',3000,6,1,1,12,4,26,26),
            (28, 'Negro','LKI89772','2017/01/01','primera generacion','ANJS32893Z',1800,6,1,1,13,4,27,27),
            (29, 'Azul','KLIO0383','2017/01/01','primera generacion','DJJSJDBB38',1300,6,1,1,14,4,28,28),
            (30, 'Azul','PCWHEE24','2017/01/01','octava generacion','BMXKWI390H',2000,6,1,1,15,4,29,29),
            (31,  'Rojo','PCU28959','2017/01/01','novena generacion','PXLLWLEME7',1800,7,1,1,1,1,30,30),
            (32,  'Rojo','PCU28959','2017/01/01','novena generacion','VPNMS830306',1800,7,2,2,2,2,31,31),
            (33,  'Blanco','JKL90432','2017/01/01','primera generacion','HSI2293025',1800,7,3,3,3,3,32,32),
            (34,  'Azul','ANM89233','2017/01/01','primera generacion','PJWKQI9304',1800,7,1,4,4,4,33,33),
            (35,  'Gris','QUWJ2839','2017/01/01','cuarta generacion','PREYW29325',1800,7,1,2,5,5,34,34),
            (36,  'Rojo','CKL87392','2017/01/01','primera generacion','BEIW8DU202',1800,8,1,2,6,6,35,35),
            (37,  'Negro','PKS34940','2017/01/01','primera generacion','AVHS78E939',1800,8,1,3,7,7,36,36),
            (38,  'Azul','PKJUE829','2017/01/01','primera generacion','PCBKSO9398',1800,8,1,2,8,2,37,37),
            (39,  'Negro','WERT3829','2017/01/01','quinta generacion','OPEKWU3917',2000,8,1,2,9,2,38,38),
            (40, 'Blanco','IOP00292','2017/01/01','sexta generacion','RTWH7839TY6',2400,8,1,1,1,4,39,39),
            (41, 'Negro','UIE793J2','2017/01/01','primera generacion','SBJEIU03IO5',1800,9,1,1,11,4,40,41),
            (42, 'Negro','2YWHJD88','2017/01/01','primera generacion','OPWJEH63P4',3000,9,1,1,12,4,42,42),
            (43, 'Amarillo','LKI89772','2017/01/01','primera generacion','ANJS328933',1800,9,1,1,13,4,43,43),
            (44, 'Naranja','KLIO0383','2017/01/01','primera generacion','DJJSJDBB32',1300,9,1,1,14,4,43,43),
            (45, 'Blanco','PCWHEE24','2017/01/01','octava generacion','BMXKWI3901',2000,9,1,1,15,4,43,43),
            (46,  'Naranja','PCU28959','2017/01/01','novena generacion','PAHDLWLEME7',1800,10,1,1,1,1,44,44),
            (47,  'Rojo','PCU28959','2017/01/01','novena generacion','VHGFS830306',1800,10,2,2,2,2,45,45),
            (48,  'Blanco','JKL90432','2017/01/01','primera generacion','HHF12293025',1800,10,3,3,3,3,46,46),
            (49,  'Azul','ANM89233','2017/01/01','primera generacion','PJWKHGF59304',1800,10,1,4,4,4,47,47),
            (50,  'Azul','QUWJ2839','2017/01/01','cuarta generacion','PREWR529325',1800,10,1,2,5,5,48,48),
            (51,  'Blanco','CKL87392','2017/01/01','primera generacion','BEIW8DUS5D02',1800,11,1,2,6,6,49,49),
            (52,  'Rojo','PKS34940','2017/01/01','primera generacion','AVHS7SDF939',1800,11,1,3,7,7,50,50),
            (53,  'Negro','PKJUE829','2017/01/01','primera generacion','PCBK58S398',1800,11,1,2,8,2,51,51),
            (54,  'Blancoperla','WERT3829','2017/01/01','quinta generacion','OGF56KWU3917',2000,11,1,2,9,2,52,52),
            (55, 'Rojo','IOP00292','2017/01/01','sexta generacion','RTWH7839TGFD5',2400,11,1,1,1,4,53,53),
            (56, 'Rojo','UIE793J2','2017/01/01','primera generacion','SBJEIUAG5AF3IO5',1800,12,1,1,11,4,54,54),
            (57, 'Verde','2YWHJD88','2017/01/01','primera generacion','OPWJGFA53P4',3000,12,1,1,12,4,55,55),
            (58, 'Azul','LKI89772','2017/01/01','primera generacion','ANJS32A565G3',1800,12,1,1,13,4,56,56),
            (59, 'Gris Oscuro','KLIO0383','2017/01/01','primera generacion','DJJSJDGA6D72',1300,12,1,1,14,4,57,57),
            (60, 'Negro','PCWHEE24','2017/01/01','octava generacion','BMXKGFD68A301',2000,12,1,1,15,4,58,58),
            (61, 'ninguno', 'COMODIN', '2000/01/01', 'ninguna', 'ninguna', 0,1,1,1,1,1,1,1);

            

    /*Tabla Foto*/
      INSERT INTO tbl_Foto(idFoto, rutaFoto, idVehiculo)
      VALUES(1, 'uploaded\v1.png', 1),
            (2, 'uploaded\v2.png', 2),
            (3, 'uploaded\v3.png', 3),
            (4, 'uploaded\v4.png', 4),
            (5, 'uploaded\v5.png', 5),
            (6, 'uploaded\v6.png', 6),
            (7, 'uploaded\v7.png', 7),
            (8, 'uploaded\v8.png', 8),
            (9, 'uploaded\v9.png', 9),
            (10,'uploaded\v10.png', 10),
            (11, 'uploaded\v11.png', 11),
            (12, 'uploaded\v12.png', 12),
            (13, 'uploaded\v13.png', 13),
            (14, 'uploaded\v14.png', 14),
            (15, 'uploaded\v15.png', 15),
            (16, 'uploaded\v16.png', 16),
            (17, 'uploaded\v17.png', 17),
            (18, 'uploaded\v18.png', 18),
            (19, 'uploaded\v19.png', 19),
            (20, 'uploaded\v20.png', 20),
            (21, 'uploaded\v21.png', 21),
            (22, 'uploaded\v22.png', 22),
            (23, 'uploaded\v23.png', 23),
            (24, 'uploaded\v24.png', 24),
            (25, 'uploaded\v25.png', 25),
            (26, 'uploaded\v26.png', 26),
            (27, 'uploaded\v27.png', 27),
            (28, 'uploaded\v28.png', 28),
            (29, 'uploaded\v29.png', 29),
            (30, 'uploaded\v30.png', 30),
            (31, 'uploaded\v31.png', 31),
            (32, 'uploaded\v32.png', 32),
            (33, 'uploaded\v33.png', 33),
            (34, 'uploaded\v34.png', 34),
            (35, 'uploaded\v35.png', 35),
            (36, 'uploaded\v36.png', 36),
            (37, 'uploaded\v37.png', 37),
            (38, 'uploaded\v38.png', 38),
            (39, 'uploaded\v39.png', 39),
            (40, 'uploaded\v40.png', 40),
            (41, 'uploaded\v41.png', 41),
            (42, 'uploaded\v42.png', 42),
            (43, 'uploaded\v43.png', 43),
            (44, 'uploaded\v44.png', 44),
            (45, 'uploaded\v45.png', 45),
            (46, 'uploaded\v46.png', 46),
            (47, 'uploaded\v47.png', 47),
            (48,'uploaded\v48.png', 48),
            (49, 'uploaded\v49.png', 49),
            (50, 'uploaded\v50.png', 50),
            (51, 'uploaded\v51.png', 51),
            (52, 'uploaded\v52.png', 52),
            (53, 'uploaded\v53.png', 53),
            (54, 'uploaded\v54.png', 54),
            (55, 'uploaded\v55.png', 55),
            (56, 'uploaded\v56.png', 56),
            (57, 'uploaded\v57.png', 57),
            (58, 'uploaded\v58.png', 58),
            (59, 'uploaded\v59.png', 59),
            (60, 'uploaded\v60.png', 60);

    /*Tabla Vehiculoempresa*/
      INSERT INTO tbl_VehiculoEmpresa(idVehiculoEmpresa, fechaAdquisicion,idvehiculo,idseguro,idEstado,
                  precioVenta,precioRentaHora,seVende,seRenta,estadoMatricula,montoMatricula, vendido)
      VALUES(1,'2017/01/01',1,1,1,156000,600,'t','t','P',2500,FALSE),
            (2,'2017/01/01',2,2,2,156000,600,'t','t','P',2500,FALSE),
            (3,'2017/01/01',3,3,3,190000,700,'t','t','P',2500,FALSE),
            (4,'2017/01/01',4,4,4,176000,400,'t','t','P',2500,FALSE),
            (5,'2017/01/01',5,5,5,156000,600,'t','t','P',2500,FALSE),
            (6,'2017/01/01',6,6,6,156000,600,'t','t','P',2500,FALSE),
            (7,'2017/01/01',7,7,1,156000,600,'t','t','P',2500,FALSE),
            (8,'2017/01/01',8,8,2,156000,800,'t','t','P',2500,FALSE),
            (9,'2017/01/01',9,9,3,156000,900,'t','t','P',2500,FALSE),
            (10,'2017/01/01',10,10,4,176000,300,'t','t','P',2500,FALSE),
            (11,'2017/01/01',11,11,5,156000,400,'t','t','P',2500,FALSE),
            (12,'2017/01/01',12,12,6,156000,600,'t','t','P',2500,FALSE),
            (13,'2017/01/01',13,13,1,158000,600,'t','t','P',2500,FALSE),
            (14,'2017/01/01',14,14,2,200000,800,'t','t','P',2500,FALSE),
            (15,'2017/01/01',15,15,3,189000,200,'t','t','P',2500,FALSE),
            (16,'2017/01/01',31,1,1,156000,600,'t','t','P',2500,FALSE),
            (17,'2017/01/01',32,2,2,156000,600,'t','t','P',2500,FALSE),
            (18,'2017/01/01',33,3,3,190000,700,'t','t','P',2500,FALSE),
            (19,'2017/01/01',34,4,4,176000,400,'t','t','P',2500,FALSE),
            (20,'2017/01/01',35,5,5,156000,600,'t','t','P',2500,FALSE),
            (21,'2017/01/01',36,6,6,156000,600,'t','t','P',2500,FALSE),
            (22,'2017/01/01',37,7,1,156000,600,'t','t','P',2500,FALSE),
            (23,'2017/01/01',38,8,2,156000,800,'t','t','P',2500,FALSE),
            (24,'2017/01/01',39,9,3,156000,900,'t','t','P',2500,FALSE),
            (25,'2017/01/01',40,10,4,176000,300,'t','t','P',2500,FALSE),
            (26,'2017/01/01',41,11,5,156000,400,'t','t','P',2500,FALSE),
            (27,'2017/01/01',42,12,6,156000,600,'t','t','P',2500,FALSE),
            (28,'2017/01/01',43,13,1,158000,600,'t','t','P',2500,FALSE),
            (29,'2017/01/01',44,14,2,200000,800,'t','t','P',2500,FALSE),
            (30,'2017/01/01',45,15,3,189000,200,'t','t','P',2500,FALSE),
            (31,'2017/01/01',46,1,1,156000,600,'t','t','P',2500,FALSE),
            (32,'2017/01/01',47,2,2,156000,600,'t','t','P',2500,FALSE),
            (33,'2017/01/01',48,3,3,190000,700,'t','t','P',2500,FALSE),
            (34,'2017/01/01',49,4,4,176000,400,'t','t','P',2500,FALSE),
            (35,'2017/01/01',50,5,5,156000,600,'t','t','P',2500,FALSE),
            (36,'2017/01/01',51,6,6,156000,600,'t','t','P',2500,FALSE),
            (37,'2017/01/01',52,7,1,156000,600,'t','t','P',2500,FALSE),
            (38,'2017/01/01',53,8,2,156000,800,'t','t','P',2500,FALSE),
            (39,'2017/01/01',54,9,3,156000,900,'t','t','P',2500,FALSE),
            (40,'2017/01/01',55,10,4,176000,300,'t','t','P',2500,FALSE),
            (41,'2017/01/01',56,11,5,156000,400,'t','t','P',2500,FALSE),
            (42,'2017/01/01',57,12,6,156000,600,'t','t','P',2500,FALSE),
            (43,'2017/01/01',58,13,1,158000,600,'t','t','P',2500,FALSE),
            (44,'2017/01/01',59,14,2,200000,800,'t','t','P',2500,FALSE),
            (45,'2017/01/01',60,15,3,189000,200,'t','t','P',2500,FALSE),
            (46,'2017/01/01',61,15,3,0,0,'t','t','P',0,FALSE);

       /*Tabla VehiculoCliente*/
         INSERT INTO tbl_VehiculoCliente(idVehiculoCliente, fechaRegistro, idVehiculo,idClientePertenece)
         VALUES(1,'2018/10/01',16,1),
            (2,'2015/08/01',17,2),
            (3,'2015/04/01',18,3),
            (4,'2018/10/01',19,4),
            (5,'2017/10/01',20,5),
            (6,'2017/10/01',21,6),
            (7,'2017/10/01',22,7),
            (8,'2017/10/01',23,8),
            (9,'2016/10/01',24,9),
            (10,'2016/10/01',25,10),
            (11,'2016/10/01',26,11),
            (12,'2018/10/01',27,12),
            (13,'2018/10/01',28,13),
            (14,'2018/10/01',29,14),
            (15,'2018/10/01',30,15),
            (16,'2018/10/01',61,16);

  /*Módulo de Mantenimiento*/
    /*Tablasolicitudmantenimiento*/
      INSERT INTO tbl_SolicitudMantenimiento(idSolicitudMantenimiento, fechaSolicitud, estado,observacion,idEmpleado,idVehiculoCliente) 
      VALUES(1, '2018-01-12','p','Falla mecánica',1,1),
            (2, '2018-02-06','p','Falla mecánica',2,2),
            (3, '2018-02-06','p','Falla mecánica',3,3),
            (4, '2018-02-06','p','Falla mecánica',4,4),
            (5, '2018-02-06','p','Falla mecánica',5,5),
            (6, '2018-02-06','p','Falla mecánica',6,6),
            (7, '2018-02-06','p','Falla mecánica',7,7),
            (8, '2018-02-06','p','Falla mecánica',8,8),
            (9, '2018-02-06','p','Falla mecánica',9,9),
            (10, '2018-02-06','p','Falla mecánica',10,10),
            (11, '2018-02-06','p','Falla mecánica',11,11),
            (12, '2018-02-06','p','Falla mecánica',12,12),
            (13, '2018-02-06','p','Falla mecánica',13,13),
            (14, '2018-02-06','p','Falla mecánica',14,14),
            (15, '2018-02-06','p','Falla mecánica',15,15),
            (16, '2018-02-06','p','Falla mecánica',1,1),
            (17, '2018-02-06','p','Falla mecánica',2,2),
            (18, '2018-02-06','p','Falla mecánica',3,3),
            (19, '2018-02-06','p','Falla mecánica',4,4),
            (20, '2018-02-06','p','Falla mecánica',5,5),
            (21, '2018-02-06','p','Falla mecánica',6,6),
            (22, '2018-02-06','p','Falla mecánica',7,7),
            (23, '2018-02-06','p','Falla mecánica',8,8),
            (24, '2018-02-06','p','Falla mecánica',9,9),
            (25, '2018-02-06','p','Falla mecánica',10,10),
            (26, '2018-02-06','p','Falla mecánica',11,11), 
            (27, '2018-02-06','p','Falla mecánica',12,12),
            (28, '2018-02-06','p','Falla mecánica',13,13),
            (29, '2018-02-06','p','Falla mecánica',14,14),
            (30, '2018-02-06','p','Falla mecánica',15,15),
            (31, '2018-01-12','p','Falla mecánica',1,16);

  /*Tabla TipoMantenimiento*/
      INSERT INTO tbl_TipoMantenimiento(idTipoMantenimiento, descripcion,costo) 
      VALUES(1,'Cambio de aceite',1500),
            (2,'Cambio de bujías',1500),
            (3,'Cambio de llantas',1500),
            (4,'Alineamiento',1500),
            (5,'Cambio de fricciones',1500),
            (6,'Cambio de bujes',1500),
            (7,'Cambio de tijeras',1500),
            (8,'Cambio de filtro de aire',1500),
            (9,'Cambio de barras estabilizadoras',1500),
            (10,'Cambio de rótulas',1500),
            (11,'Cambio de suspensión',1500),
            (12,'Cambio de batería',1500),
            (13,'Cambio de coolant',1500),
            (14,'Cambio de soporte',1500),
            (15,'Polarizado',1500),
            (16,'COMODIN',0);                     

  /*Tabla categoriarepuesto*/
      INSERT INTO tbl_categoriaRepuesto(idCategoriaRepuesto, descripcion) 
      VALUES(1,'Motor'),
            (2,'Arranque'),
            (3,'Neumáticos'),
            (4,'Dirección'),
            (5,'Frenos'),
            (6,'Dirección secundaria'),
            (7,'Dirección primaria'),
            (8,'Refrigeración de motor'),
            (9,'Suspensión secundaria'),
            (10,'Suspensión primaria'),
            (11,'Suspensión'),
            (12,'Eléctricos'),
            (13,'Refrigeración'),
            (14,'Motos soportes'),
            (15,'Polarizado');
                        
  /*Tabla marcarepuesto*/
    INSERT INTO tbl_MarcaRepuesto(idMarcaRepuesto, descripcion) 
    VALUES(1,'YKS'),
          (2,'777 Five'),
          (3,'OEM'),
          (4,'Falcon'),
          (5,'Dunlop'),
          (6,'Castrol'),
          (7,'Chevron'),
          (8,'NGK'),
          (9,'YKS taiwanesa'),
          (10,'OM Brand'),
          (11,'Mobil'),
          (12,'original yukita'),
          (13,'Tokito'),
          (14,'Monroe'),
          (15,'KYB');
                        
  /*Tabla Repuesto*/
    INSERT INTO tbl_Repuesto(idRepuesto,descripcion, existencia, precio, idCategoriarepuesto, idMarcaRepuesto) 
    VALUES(1,'Filtro de aceite',15,450,1,1),
          (2,'Filtro de aire',15,450,2,2),
          (3,'Bujías',15,450,3,3),
          (4,'Bujes',15,450,4,4),
          (5,'Llantas',15,450,5,5),
          (6,'Aceite de motor',15,450,6,6),
          (7,'Aceite de caja',15,450,7,7),
          (8,'Liquido de frenos',15,450,8,8),
          (9,'Liquido hidráulico',15,450,9,9),
          (10,'Fricciones',15,450,10,10),
          (11,'Tijeras',15,450,11,11),
          (12,'Soportes de motor',15,450,12,12),
          (13,'Cadena de tiempo',15,450,13,13),
          (14,'Soporte de amortiguación',15,450,14,14),
          (15,'Dirección completa',15,450,15,15);

  /*Tabla proveedor*/
    INSERT INTO tbl_Proveedor(idProveedor, descripcion, rtn) 
    VALUES(1,'Alpha','080293043832120'),
          (2,'Auto suspensión','080293043832121'),
          (3,'Repuestos la quezada','080293043832122'),
          (4,'Auto repuestos','080293043832123'),
          (5,'RSA autoparts','080293043832124'),
          (6,'Americanos autoparts','080293043832125'),
          (7,'Autoparts Honduras','080293043832126'),
          (8,'Repuestos los dos hermanos','080293043832127'),
          (9,'La casa del tornillo','092381938219188'),
          (10,'Repuestos para alternadores','092381938219189'),
          (11,'MECA','092381938219180'),
          (12,'Ichi','092381938219181'),
          (13,'Suplidora Honda','092381938219182'),
          (14,'Todo repuestos','092381938219183'),
          (15,'Auto mundo','092381938219184');

  /*Tabla TelefonoProveedor*/
    INSERT INTO tbl_TelefonoProveedor(idTelefono,telefono,idProveedor) 
    VALUES(1,'9899-99-00',1),
          (2,'9899-99-01 ',2),
          (3,'9899-99-02',3),
          (4,'3194-93-70',4),
          (5,'9980-09-89',5),
          (6,'9846-09-11',6),
          (7,'9876-12-22',7),
          (8,'22232-12-33',8),
          (9,'22232-12-34',9),
          (10,'2223-13-35',10),
          (11,'8928-34-36',11),
          (12,'2345-09-37 ',12),
          (13,'2345-09-38 ',13),
          (14,'2345-09-39',14),
          (15,'2345-09-56',15);

  /*Tabla correoproveedorr*/
    INSERT INTO tbl_CorreoelEctronicoProveedor(idCorreoelEctronico,correoElectronico,idProveedor) 
    VALUES(1,'cwpa@gmail.com',1),
          (2,'paz_lio@yahoo.es',2),
          (3,'lol@hotmai.com',3),
          (4,'cwflores~@unah.hn',4),
          (5,'mamut@gmail.com',5),
          (6,'mamit@gmail.com',6),
          (7,'cristianl@yahoo.es',7),
          (8,'locaj@gmail.com',8),
          (9,'millenu@gmail.com',9),
          (10,'kjaksj@gmail.hn',10),
          (11,'joh@gmail.hn',11),
          (12,'espafuera@gmail.hn ',12),
          (13,'julys@gmail.hn ',13),
          (14,'eljuliseum@gmail.hn',14),
          (15,'latiajyly@gmail.hn',15);

 /*Tabla Compra de Repuesto*/
    INSERT INTO tbl_CompraRepuesto(idProveedor,idRepuesto,cantidad,fecha,idEmpleado) 
    VALUES(1,1,5,'2018-01-12',1),
          (2,2,5,'2018-01-12',2),
          (3,3,5,'2018-01-12',3),
          (4,4,5,'2018-01-12',4),
          (5,5,5,'2018-01-12',5),
          (6,6,5,'2018-01-12',6),
          (7,7,5,'2018-01-12',7),
          (8,8,5,'2018-01-12',8),
          (9,9,5,'2018-01-12',9),
          (10,10,5,'2018-01-12',10),
          (11,11,5,'2018-01-12',11),
          (12,12,5,'2018-01-12',12),
          (13,13,5,'2018-01-12',13),
          (14,14,5,'2018-01-12',14),
          (15,15,5,'2018-01-12',15),
          (1,1,5,'2018-01-12',1),
          (2,2,5,'2018-01-12',2),
          (3,3,5,'2018-01-12',3),
          (4,4,5,'2018-01-12',4),
          (5,5,5,'2018-01-12',5),
          (6,6,5,'2018-01-12',6),
          (7,7,5,'2018-01-12',7),
          (8,8,5,'2018-01-12',8),
          (9,9,5,'2018-01-12',9),
          (10,10,5,'2018-01-12',10),
          (11,11,5,'2018-01-12',11),
          (12,12,5,'2018-01-12',12),
          (13,13,5,'2018-01-12',13),
          (14,14,5,'2018-01-12',14),
          (15,15,5,'2018-01-12',15);

  /*Tabla Taller*/
    INSERT INTO tbl_Taller(idTaller, estado, idSucursal)
    VALUES (1, 'D', 1),
           (2, 'D', 2),
           (3, 'D', 3),
           (4, 'D', 4),
           (5, 'D', 5),
           (6, 'D', 6),
           (7, 'D', 7),
           (8, 'D', 8),
           (9, 'D', 9),
           (10, 'D', 10),
           (11, 'D', 11),
           (12, 'D', 12),
           (13, 'D', 13),
           (14, 'D', 14),
           (15, 'D', 15),
           (16, 'N', 15);

  /*Tabla Mantenimiento*/
    INSERT INTO tbl_Mantenimiento(idMantenimiento, fechaIngreso,fechaSalida,estado,
                idSolicitudMantenimiento,idEmpleado,idTipoMantenimiento, idRepuesto, idTaller) 
    VALUES(1 ,'2018-01-12','2018-01-12','E',1,1,1,1,1),
          (2 ,'2018-01-12','2018-01-12','E',2,2,2,2,2),
          (3 ,'2018-01-12','2018-01-12','E',3,3,3,3,1),
          (4 ,'2018-01-12','2018-01-12','E',4,4,4,4,2),
          (5 ,'2018-01-12','2018-01-12','E',5,5,5,5,1),
          (6 ,'2018-01-12','2018-01-12','E',6,6,6,6,2),
          (7 ,'2018-01-12','2018-01-12','E',7,7,7,7,1),
          (8 ,'2018-01-12','2018-01-12','E',8,8,8,8,2),
          (9 ,'2018-01-12','2018-01-12','E',9,9,9,9,1),
          (10 ,'2018-01-12','2018-01-12','E',10,10,10,10,2),
          (11 ,'2018-01-12','2018-01-12','E',11,11,11,11,1),
          (12 ,'2018-01-12','2018-01-12','E',12,12,12,12,2),
          (13 ,'2018-01-12','2018-01-12','E',13,13,13,13,1),
          (14 ,'2018-01-12','2018-01-12','E',14,14,14,14,2),
          (15 ,'2018-01-12','2018-01-12','E',15,15,15,15,1),
          (16 ,'2018-01-12','2018-01-12','E',16,1,1,1,2),
          (17 ,'2018-01-12','2018-01-12','E',17,2,2,2,1),
          (18 ,'2018-01-12','2018-01-12','E',18,3,3,3,2),
          (19 ,'2018-01-12','2018-01-12','E',19,4,4,4,1),
          (20 ,'2018-01-12','2018-01-12','E',20,5,5,5,2),
          (21 ,'2018-01-12','2018-01-12','E',21,6,6,6,1),
          (22 ,'2018-01-12','2018-01-12','E',22,7,7,7,2),
          (23 ,'2018-01-12','2018-01-12','E',23,8,8,8,1),
          (24 ,'2018-01-12','2018-01-12','E',24,9,9,9,2),
          (25 ,'2018-01-12','2018-01-12','E',25,10,10,10,1),
          (26 ,'2018-01-12','2018-01-12','E',26,11,11,11,2),
          (27 ,'2018-01-12','2018-01-12','E',27,12,12,12,1),
          (28 ,'2018-01-12','2018-01-12','E',28,13,13,13,2),
          (29 ,'2018-01-12','2018-01-12','E',29,14,14,14,1),
          (30 ,'2018-01-12','2018-01-12','E',30,15,15,15,2),
          (31 ,'2018-01-12','2018-01-12','E',31,1,16,1,16),
          (32 ,'2018-01-12','2018-01-12','E',31,2,16,2,16),
          (33 ,'2018-01-12','2018-01-12','E',31,3,16,3,16),
          (34 ,'2018-01-12','2018-01-12','E',31,4,16,4,16),
          (35 ,'2018-01-12','2018-01-12','E',31,5,16,5,16),
          (36 ,'2018-01-12','2018-01-12','E',31,6,16,6,16),
          (37 ,'2018-01-12','2018-01-12','E',31,7,16,7,16),
          (38 ,'2018-01-12','2018-01-12','E',31,8,16,8,16),
          (39 ,'2018-01-12','2018-01-12','E',31,9,16,9,16),
          (40 ,'2018-01-12','2018-01-12','E',31,10,16,10,16),
          (41 ,'2018-01-12','2018-01-12','E',31,11,16,11,16),
          (42 ,'2018-01-12','2018-01-12','E',31,12,16,12,16),
          (43 ,'2018-01-12','2018-01-12','E',31,13,16,13,16),
          (44 ,'2018-01-12','2018-01-12','E',31,14,16,14,16),
          (45 ,'2018-01-12','2018-01-12','E',31,15,16,15,16),
          (46 ,'2018-01-12','2018-01-12','E',31,1,16,1,16),
          (47 ,'2018-01-12','2018-01-12','E',31,2,16,2,16),
          (48 ,'2018-01-12','2018-01-12','E',31,3,16,3,16),
          (49 ,'2018-01-12','2018-01-12','E',31,4,16,4,16),
          (50 ,'2018-01-12','2018-01-12','E',31,5,16,5,16),
          (51 ,'2018-01-12','2018-01-12','E',31,6,16,6,16),
          (52 ,'2018-01-12','2018-01-12','E',31,7,16,7,16),
          (53 ,'2018-01-12','2018-01-12','E',31,8,16,8,16),
          (54 ,'2018-01-12','2018-01-12','E',31,9,16,9,16),
          (55 ,'2018-01-12','2018-01-12','E',31,10,16,10,16),
          (56 ,'2018-01-12','2018-01-12','E',31,11,16,11,16),
          (57 ,'2018-01-12','2018-01-12','E',31,12,16,12,16),
          (58 ,'2018-01-12','2018-01-12','E',31,13,16,13,16),
          (59 ,'2018-01-12','2018-01-12','E',31,14,16,14,16),
          (60 ,'2018-01-12','2018-01-12','E',31,15,16,15,16),
          (61 ,'2018-01-12','2018-01-12','E',31,1,16,1,16),
          (62 ,'2018-01-12','2018-01-12','E',31,2,16,2,16),
          (63 ,'2018-01-12','2018-01-12','E',31,3,16,3,16),
          (64 ,'2018-01-12','2018-01-12','E',31,4,16,4,16),
          (65 ,'2018-01-12','2018-01-12','E',31,5,16,5,16),
          (66 ,'2018-01-12','2018-01-12','E',31,6,16,6,16),
          (67 ,'2018-01-12','2018-01-12','E',31,7,16,7,16),
          (68 ,'2018-01-12','2018-01-12','E',31,8,16,8,16),
          (69 ,'2018-01-12','2018-01-12','E',31,9,16,9,16),
          (70 ,'2018-01-12','2018-01-12','E',31,10,16,10,16),
          (71 ,'2018-01-12','2018-01-12','E',31,11,16,11,16),
          (72 ,'2018-01-12','2018-01-12','E',31,12,16,12,16),
          (73 ,'2018-01-12','2018-01-12','E',31,13,16,13,16),
          (74 ,'2018-01-12','2018-01-12','E',31,14,16,14,16),
          (75 ,'2018-01-12','2018-01-12','E',31,15,16,15,16),
          (76 ,'2018-01-12','2018-01-12','E',31,1,16,1,16),
          (77 ,'2018-01-12','2018-01-12','E',31,2,16,2,16),
          (78 ,'2018-01-12','2018-01-12','E',31,3,16,3,16),
          (79 ,'2018-01-12','2018-01-12','E',31,4,16,4,16),
          (80 ,'2018-01-12','2018-01-12','E',31,5,16,5,16),
          (81 ,'2018-01-12','2018-01-12','E',31,6,16,6,16),
          (82 ,'2018-01-12','2018-01-12','E',31,7,16,7,16),
          (83 ,'2018-01-12','2018-01-12','E',31,8,16,8,16),
          (84 ,'2018-01-12','2018-01-12','E',31,9,16,9,16),
          (85 ,'2018-01-12','2018-01-12','E',31,10,16,10,16),
          (86 ,'2018-01-12','2018-01-12','E',31,11,16,11,16),
          (87 ,'2018-01-12','2018-01-12','E',31,12,16,12,16),
          (88 ,'2018-01-12','2018-01-12','E',31,13,16,13,16),
          (89 ,'2018-01-12','2018-01-12','E',31,14,16,14,16),
          (90 ,'2018-01-12','2018-01-12','E',31,15,16,15,16);

  /*Módulo de Facturación*/
    /*Tabla Impuesto*/
      INSERT INTO tbl_Impuesto (idImpuesto, porcentaje)
      VALUES (1, 15);

    /*Tabla FormaPago*/
      INSERT INTO tbl_FormaPago (idFormaPago, descripcion)
      VALUES (1, 'Efectivo'),
           (2, 'Tarjeta de débito'),
           (3, 'Tarjeta de crédito'),
           (4, 'Cheque'),
           (5, 'Financiamiento');

    /*Tabla Descuento*/
      INSERT INTO tbl_Descuento (idDescuento, descripcion, valor, estado)
      VALUES (1, 'General', 5, 'I'),
           (2, 'Tercera edad', 10, 'A'),
           (3, 'Black friday', 10, 'I'),
           (4, 'Navideño', 10, 'I'),
           (5, 'Año nuevo', 5, 'I'),
           (6, 'Verano', 5, 'I'),
           (7, 'Familiares y amigos', 10, 'A'),
           (8, 'Ninguno', 0, 'A');

    /*Tabla Factura*/
      INSERT INTO tbl_Factura (idFactura, fecha, Observaciones, idImpuesto, idCliente, idEmpleado)
      VALUES (1, '2017-06-01', 'Ninguna', 1,1,9),
             (2, '2017-06-01', 'Ninguna', 1,2,10),
             (3, '2017-06-01', 'Ninguna', 1,3,9),
             (4, '2017-06-01', 'Ninguna', 1,4,10),
             (5, '2017-06-01', 'Ninguna', 1,5,9),
             (6, '2017-06-01', 'Ninguna', 1,6,10),
             (7, '2017-06-01', 'Ninguna', 1,7,9),
             (8, '2017-06-01', 'Ninguna', 1,8,10),
             (9, '2017-06-01', 'Ninguna', 1,9,9),
             (10, '2017-06-01', 'Ninguna', 1,10,10),
             (11, '2017-06-01', 'Ninguna', 1,11,9),
             (12, '2017-06-01', 'Ninguna', 1,12,10),
             (13, '2017-06-01', 'Ninguna', 1,13,9),
             (14, '2017-06-01', 'Ninguna', 1,14,10),
             (15, '2017-06-01', 'Ninguna', 1,15,9),
             (16, '2017-06-01', 'Ninguna', 1,1,10),
             (17, '2017-06-01', 'Ninguna', 1,2,9),
             (18, '2017-06-01', 'Ninguna', 1,3,10),
             (19, '2017-06-01', 'Ninguna', 1,4,9),
             (20, '2017-06-01', 'Ninguna', 1,5,10),
             (21, '2017-06-01', 'Ninguna', 1,6,9),
             (22, '2017-06-01', 'Ninguna', 1,7,10),
             (23, '2017-06-01', 'Ninguna', 1,8,9),
             (24, '2017-06-01', 'Ninguna', 1,9,10),
             (25, '2017-06-01', 'Ninguna', 1,10,9),
             (26, '2017-06-01', 'Ninguna', 1,11,10),
             (27, '2017-06-01', 'Ninguna', 1,12,9),
             (28, '2017-06-01', 'Ninguna', 1,13,10),
             (29, '2017-06-01', 'Ninguna', 1,14,9),
             (30, '2017-06-01', 'Ninguna', 1,15,10),
             (31, '2017-06-01', 'Ninguna', 1,1,9),
             (32, '2017-06-01', 'Ninguna', 1,2,10),
             (33, '2017-06-01', 'Ninguna', 1,3,9),
             (34, '2017-06-01', 'Ninguna', 1,4,10),
             (35, '2017-06-01', 'Ninguna', 1,5,9),
             (36, '2017-06-01', 'Ninguna', 1,6,10),
             (37, '2017-06-01', 'Ninguna', 1,7,9),
             (38, '2017-06-01', 'Ninguna', 1,8,10),
             (39, '2017-06-01', 'Ninguna', 1,9,9),
             (40, '2017-06-01', 'Ninguna', 1,10,10),
             (41, '2017-06-01', 'Ninguna', 1,11,9),
             (42, '2017-06-01', 'Ninguna', 1,12,10),
             (43, '2017-06-01', 'Ninguna', 1,13,9),
             (44, '2017-06-01', 'Ninguna', 1,14,10),
             (45, '2017-06-01', 'Ninguna', 1,15,9),
             (46, '2017-06-01', 'Ninguna', 1,1,10),
             (47, '2017-06-01', 'Ninguna', 1,2,9),
             (48, '2017-06-01', 'Ninguna', 1,3,10),
             (49, '2017-06-01', 'Ninguna', 1,4,9),
             (50, '2017-06-01', 'Ninguna', 1,5,10),
             (51, '2017-06-01', 'Ninguna', 1,6,9),
             (52, '2017-06-01', 'Ninguna', 1,7,10),
             (53, '2017-06-01', 'Ninguna', 1,8,9),
             (54, '2017-06-01', 'Ninguna', 1,9,10),
             (55, '2017-06-01', 'Ninguna', 1,10,9),
             (56, '2017-06-01', 'Ninguna', 1,11,10),
             (57, '2017-06-01', 'Ninguna', 1,12,9),
             (58, '2017-06-01', 'Ninguna', 1,13,10),
             (59, '2017-06-01', 'Ninguna', 1,14,9),
             (60, '2017-06-01', 'Ninguna', 1,15,10),
             (61, '2017-06-01', 'Ninguna', 1,1,9),
             (62, '2017-06-01', 'Ninguna', 1,2,10),
             (63, '2017-06-01', 'Ninguna', 1,3,9),
             (64, '2017-06-01', 'Ninguna', 1,4,10),
             (65, '2017-06-01', 'Ninguna', 1,5,9),
             (66, '2017-06-01', 'Ninguna', 1,6,10),
             (67, '2017-06-01', 'Ninguna', 1,7,9),
             (68, '2017-06-01', 'Ninguna', 1,8,10),
             (69, '2017-06-01', 'Ninguna', 1,9,9),
             (70, '2017-06-01', 'Ninguna', 1,10,10),
             (71, '2017-06-01', 'Ninguna', 1,11,9),
             (72, '2017-06-01', 'Ninguna', 1,12,10),
             (73, '2017-06-01', 'Ninguna', 1,13,9),
             (74, '2017-06-01', 'Ninguna', 1,14,10),
             (75, '2017-06-01', 'Ninguna', 1,15,9),
             (76, '2017-06-01', 'Ninguna', 1,1,10),
             (77, '2017-06-01', 'Ninguna', 1,2,9),
             (78, '2017-06-01', 'Ninguna', 1,3,10),
             (79, '2017-06-01', 'Ninguna', 1,4,9),
             (80, '2017-06-01', 'Ninguna', 1,5,10),
             (81, '2017-06-01', 'Ninguna', 1,6,9),
             (82, '2017-06-01', 'Ninguna', 1,7,10),
             (83, '2017-06-01', 'Ninguna', 1,8,9),
             (84, '2017-06-01', 'Ninguna', 1,9,10),
             (85, '2017-06-01', 'Ninguna', 1,10,9),
             (86, '2017-06-01', 'Ninguna', 1,11,10),
             (87, '2017-06-01', 'Ninguna', 1,12,9),
             (88, '2017-06-01', 'Ninguna', 1,13,10),
             (89, '2017-06-01', 'Ninguna', 1,14,9),
             (90, '2017-06-01', 'Ninguna', 1,15,10);

    /*Tabla Descuento por factura*/
      INSERT INTO tbl_DescuentoPorFactura (idFactura, idDescuento)
      VALUES(1,2),
            (2,2),
            (3,2),
            (4,2),
            (5,7),
            (6,2),
            (7,2),
            (8,2),
            (9,2),
            (10,2),
            (11,7),
            (12,2),
            (13,2),
            (14,2),
            (15,2),
            (16,2),
            (17,2),
            (18,2),
            (19,2),
            (20,7),
            (21,2),
            (22,2),
            (23,2),
            (24,2),
            (25,2),
            (26,7),
            (27,7),
            (28,2),
            (29,2),
            (30,2),
            (31,8),
            (32,8),
            (33,8),
            (34,8),
            (35,8),
            (36,8),
            (37,8),
            (38,8),
            (39,8),
            (40,8),
            (41,8),
            (42,8),
            (43,8),
            (44,8),
            (45,8),
            (46,8),
            (47,8),
            (48,8),
            (49,8),
            (50,8),
            (51,8),
            (52,8),
            (53,8),
            (54,8),
            (55,8),
            (56,8),
            (57,8),
            (58,8),
            (59,8),
            (60,8),
            (61,8),
            (62,8),
            (63,8),
            (64,8),
            (65,8),
            (66,8),
            (67,8),
            (68,8),
            (69,8),
            (70,8),
            (71,8),
            (72,8),
            (73,8),
            (74,8),
            (75,8),
            (76,8),
            (77,8),
            (78,8),
            (79,8),
            (80,8),
            (81,8),
            (82,8),
            (83,8),
            (84,8),
            (85,8),
            (86,8),
            (87,8),
            (88,8),
            (89,8),
            (90,8);

    /*Tabla Itinerario*/
        INSERT INTO tbl_Itinerario (idItinerario, fechaReserva, fechaEntrega, fechaDevolucion)
        VALUES  (1,'2017-08-05', '2017-08-08', '2017-08-09'),
                (2,'2017-08-05', '2017-08-09', '2017-08-10'),
                (3,'2017-08-05', '2017-08-08', '2017-08-09'),
                (4,'2017-08-05', '2017-08-09', '2017-08-10'),
                (5,'2017-08-05', '2017-08-08', '2017-08-09'),
                (6,'2017-08-05', '2017-08-09', '2017-08-10'),
                (7,'2017-08-05', '2017-08-08', '2017-08-09'),
                (8,'2017-08-05', '2017-08-09', '2017-08-10'),
                (9,'2017-08-05', '2017-08-08', '2017-08-09'),
                (10,'2017-08-05', '2017-08-09', '2017-08-10'),
                (11,'2017-08-05', '2017-08-08', '2017-08-09'),
                (12,'2017-08-05', '2017-08-09', '2017-08-10'),
                (13,'2017-08-05', '2017-08-08', '2017-08-09'),
                (14,'2017-08-05', '2017-08-09', '2017-08-10'),
                (15,'2017-08-05', '2017-08-08', '2017-08-09'),
                (16,'2017-08-05', '2017-08-09', '2017-08-10'),
                (17,'2017-08-05', '2017-08-08', '2017-08-09'),
                (18,'2017-08-05', '2017-08-09', '2017-08-10'),
                (19,'2017-08-05', '2017-08-08', '2017-08-09'),
                (20,'2017-08-05', '2017-08-09', '2017-08-10'),
                (21,'2017-08-05', '2017-08-08', '2017-08-09'),
                (22,'2017-08-05', '2017-08-09', '2017-08-10'),
                (23,'2017-08-05', '2017-08-08', '2017-08-09'),
                (24,'2017-08-05', '2017-08-09', '2017-08-10'),
                (25,'2017-08-05', '2017-08-08', '2017-08-09'),
                (26,'2017-08-05', '2017-08-09', '2017-08-10'),
                (27,'2017-08-05', '2017-08-08', '2017-08-09'),
                (28,'2017-08-05', '2017-08-09', '2017-08-10'),
                (29,'2017-08-05', '2017-08-08', '2017-08-09'),
                (30,'2017-08-05', '2017-08-09', '2017-08-10'),
                (31,'2017-08-05', '2017-08-08', '2017-08-09'); -- Comodín!

    /*Tabla Renta*/
      INSERT INTO tbl_Renta (idVehiculoEmpresa, idFactura, anticipo, mora, totalHoras, idItinerario)
      VALUES (1,1, 1000,0,24,1),
             (1,2, 1000,0,24,2),
             (2,3, 1000,0,24,3),
             (2,4, 1000,0,24,4),
             (3,5, 1000,0,24,5),
             (3,6, 1000,0,24,6),
             (4,7, 1000,0,24,7),
             (4,8, 1000,0,24,8),
             (5,9, 1000,0,24,9),
             (5,10, 1000,0,24,10),
             (6,11, 1000,0,24,11),
             (6,12, 1000,0,24,12),
             (7,13, 1000,0,24,13),
             (7,14, 1000,0,24,14),
             (8,15, 1000,0,24,15),
             (8,16, 1000,0,24,16),
             (9,17, 1000,0,24,17),
             (9,18, 1000,0,24,18),
             (10,19, 1000,0,24,19),
             (10,20, 1000,0,24,20),
             (11,21, 1000,0,24,21),
             (11,22, 1000,0,24,22),
             (12,23, 1000,0,24,23),
             (12,24, 1000,0,24,24),
             (13,25, 1000,0,24,25),
             (13,26, 1000,0,24,26),
             (14,27, 1000,0,24,27),
             (14,28, 1000,0,24,28),
             (15,29, 1000,0,24,29),
             (15,30, 1000,0,24,30),
             (46,31, 0,0,0,31),
             (46,32, 0,0,0,31),
             (46,33, 0,0,0,31),
             (46,34, 0,0,0,31),
             (46,35, 0,0,0,31),
             (46,36, 0,0,0,31),
             (46,37, 0,0,0,31),
             (46,38, 0,0,0,31),
             (46,39, 0,0,0,31),
             (46,40, 0,0,0,31),
             (46,41, 0,0,0,31),
             (46,42, 0,0,0,31),
             (46,43, 0,0,0,31),
             (46,44, 0,0,0,31),
             (46,45, 0,0,0,31),
             (46,46, 0,0,0,31),
             (46,47, 0,0,0,31),
             (46,48, 0,0,0,31),
             (46,49, 0,0,0,31),
             (46,50, 0,0,0,31),
             (46,51, 0,0,0,31),
             (46,52, 0,0,0,31),
             (46,53, 0,0,0,31),
             (46,54, 0,0,0,31),
             (46,55, 0,0,0,31),
             (46,56, 0,0,0,31),
             (46,57, 0,0,0,31),
             (46,58, 0,0,0,31),
             (46,59, 0,0,0,31),
             (46,60, 0,0,0,31),
             (46,61, 0,0,0,31),
             (46,62, 0,0,0,31),
             (46,63, 0,0,0,31),
             (46,64, 0,0,0,31),
             (46,65, 0,0,0,31),
             (46,66, 0,0,0,31),
             (46,67, 0,0,0,31),
             (46,68, 0,0,0,31),
             (46,69, 0,0,0,31),
             (46,70, 0,0,0,31),
             (46,71, 0,0,0,31),
             (46,72, 0,0,0,31),
             (46,73, 0,0,0,31),
             (46,74, 0,0,0,31),
             (46,75, 0,0,0,31),
             (46,76, 0,0,0,31),
             (46,77, 0,0,0,31),
             (46,78, 0,0,0,31),
             (46,79, 0,0,0,31),
             (46,80, 0,0,0,31),
             (46,81, 0,0,0,31),
             (46,82, 0,0,0,31),
             (46,83, 0,0,0,31),
             (46,84, 0,0,0,31),
             (46,85, 0,0,0,31),
             (46,86, 0,0,0,31),
             (46,87, 0,0,0,31),
             (46,88, 0,0,0,31),
             (46,89, 0,0,0,31),
             (46,90, 0,0,0,31);

    /*Tabla Venta*/
      INSERT INTO tbl_Venta (idFactura, idVehiculoEmpresa)
      VALUES (1,46),
             (2,46),
             (3,46),
             (4,46),
             (5,46),
             (6,46),
             (7,46),
             (8,46),
             (9,46),
             (10,46),
             (11,46),
             (12,46),
             (13,46),
             (14,46),
             (15,46),
             (16,46),
             (17,46),
             (18,46),
             (19,46),
             (20,46),
             (21,46),
             (22,46),
             (23,46),
             (24,46),
             (25,46),
             (26,46),
             (27,46),
             (28,46),
             (29,46),
             (30,46),

             (31,16),
             (32,17),
             (33,18),
             (34,19),
             (35,20),
             (36,21),
             (37,22),
             (38,23),
             (39,24),
             (40,25),
             (41,26),
             (42,27),
             (43,28),
             (44,29),
             (45,30),
             (46,31),
             (47,32),
             (48,33),
             (49,34),
             (50,35),
             (51,36),
             (52,37),
             (53,38),
             (54,39),
             (55,40),
             (56,41),
             (57,42),
             (58,43),
             (59,44),
             (60,45),

             (61,46),
             (62,46),
             (63,46),
             (64,46),
             (65,46),
             (66,46),
             (67,46),
             (68,46),
             (69,46),
             (70,46),
             (71,46),
             (72,46),
             (73,46),
             (74,46),
             (75,46),
             (76,46),
             (77,46),
             (78,46),
             (79,46),
             (80,46),
             (81,46),
             (82,46),
             (83,46),
             (84,46),
             (85,46),
             (86,46),
             (87,46),
             (88,46),
             (89,46),
             (90,46);

      /*Tabla FacturaPorMantenimiento*/
        INSERT INTO tbl_FacturaPorMantenimiento (idMantenimiento, idFactura)
        VALUES(31,1),
              (32,2),
              (33,3),
              (34,4),
              (35,5),
              (36,6),
              (37,7),
              (38,8),
              (39,9),
              (40,10),
              (41,11),
              (42,12),
              (43,13),
              (44,14),
              (45,15),
              (46,16),
              (47,17),
              (48,18),
              (49,19),
              (50,20),
              (51,21),
              (52,22),
              (53,23),
              (54,24),
              (55,25),
              (56,26),
              (57,27),
              (58,28),
              (59,29),
              (60,30),
              (61,31),
              (62,32),
              (63,33),
              (64,34),
              (65,35),
              (66,36),
              (67,37),
              (68,38),
              (69,39),
              (70,40),
              (71,41),
              (72,42),
              (73,43),
              (74,44),
              (75,45),
              (76,46),
              (77,47),
              (78,48),
              (79,49),
              (80,50),
              (81,51),
              (82,52),
              (83,53),
              (84,54),
              (85,55),
              (86,56),
              (87,57),
              (88,58),
              (89,59),
              (90,60),

              (1,61),
              (2,62),
              (3,63),
              (4,64),
              (5,65),
              (6,66),
              (7,67),
              (8,68),
              (9,69),
              (10,70),
              (11,71),
              (12,72),
              (13,73),
              (14,74),
              (15,75),
              (16,76),
              (17,77),
              (18,78),
              (19,79),
              (20,80),
              (21,81),
              (22,82),
              (23,83),
              (24,84),
              (25,85),
              (26,86),
              (27,87),
              (28,88),
              (29,89),
              (30,90);

      /*Tabla Formas de pago por factura*/
        INSERT INTO tbl_FormaPagoPorFactura (idFactura, idFormaPago, monto)
        VALUES(1,1,600),
              (2,2,600),
              (3,3,700),
              (4,4,400),
              (5,1,600),
              (6,2,600),
              (7,3,600),
              (8,4,800),
              (9,1,900),
              (10,2,300),
              (11,3,400),
              (12,4,600),
              (13,1,600),
              (14,2,800),
              (15,3,200),
              (16,1,156000),
              (17,2,156000),
              (18,3,190000),
              (19,4,176000),
              (20,5,156000),
              (21,1,156000),
              (22,2,156000),
              (23,3,156000),
              (24,4,156000),
              (25,5,176000),
              (26,1,156000),
              (27,2,156000),
              (28,3,158000),
              (29,4,200000),
              (30,5,189000),
              (31,1,156000),
              (32,2,156000),
              (33,3,190000),
              (34,4,176000),
              (35,5,156000),
              (36,1,156000),
              (37,2,156000),
              (38,3,156000),
              (39,4,156000),
              (40,5,176000),
              (41,1,156000),
              (42,2,156000),
              (43,3,158000),
              (44,4,200000),
              (45,1,189000),
              (46,2,1500),
              (47,3,1500),
              (48,4,1500),
              (49,1,1500),
              (50,2,1500),
              (51,3,1500),
              (52,4,1500),
              (53,1,1500),
              (54,2,1500),
              (55,3,1500),
              (56,4,1500),
              (57,1,1500),
              (58,2,1500),
              (59,3,1500),
              (60,4,1500),
              (61,1,1500),
              (62,2,1500),
              (63,3,1500),
              (64,4,1500),
              (65,1,1500),
              (67,2,1500),
              (68,3,1500),
              (69,4,1500),
              (70,1,1500),
              (71,2,1500),
              (72,3,1500),
              (73,4,1500),
              (74,1,1500),
              (75,2,1500),
              (76,3,1500),
              (77,4,1500),
              (78,1,1500),
              (79,2,1500),
              (80,3,1500),
              (81,4,1500),
              (82,1,1500),
              (83,2,1500),
              (84,3,1500),
              (85,4,1500),
              (86,1,1500),
              (87,2,1500),
              (88,3,1500),
              (89,4,1500),
              (90,1,1500),
              (15,2,1500);

/*Procedimientos Almacenados*/
  /*Procedimiento Agragar Persona*/
  CREATE OR REPLACE FUNCTION Funcion_Actualizar_Persona(
    IN pc_identidad     VARCHAR(45),
    IN pc_primerNombre    VARCHAR(45),
    IN pc_segundoNombre   VARCHAR(45), 
    IN pc_primerApellido  VARCHAR(45), 
    IN pc_segundoApellido   VARCHAR(45),
    IN pc_telefono      VARCHAR(45),
    IN pc_correoElectronico VARCHAR(45),
    IN pc_departamento    VARCHAR(45),
    IN pc_municipio     VARCHAR(45),
    IN pc_colonia       VARCHAR(45),
    IN pc_sector      VARCHAR(45),
    IN pc_numeroCasa    VARCHAR(45),
    IN pn_genero      INTEGER,

    IN pn_idUsuario     INTEGER,

    OUT pcMensaje       VARCHAR(45),
    OUT pbOcurreError     BOOLEAN
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      contador      INTEGER DEFAULT 0;
      var2      INTEGER DEFAULT 0;
      auxiliarDireccion   INTEGER DEFAULT 0;
      auxiliarPersona   INTEGER DEFAULT 0;
      auxiliarTelefono  INTEGER DEFAULT 0;
      auxiliarCorreo    INTEGER DEFAULT 0;
      temMensaje      VARCHAR(2000);

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
        SELECT tbl_Usuario.idUsuario INTO var2 FROM tbl_Persona 
        INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
        INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario
        WHERE  tbl_Persona.identidad = pc_identidad;

        IF var2 <> pn_idUsuario THEN
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
        SELECT tbl_Usuario.idUsuario INTO var2 FROM tbl_Telefono 
        INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_Telefono.idPersona 
        INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
        INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario 
        WHERE  tbl_Telefono.telefono = pc_telefono;
        IF var2 <> pn_idUsuario THEN
          RAISE NOTICE 'Valor unico en la tabla Telefono ya existe ( % )', pc_telefono;
          pcMensaje := 'El numero de telefono "'|| pc_telefono ||'" ya esta siendo utilizado';
          RETURN;
        END IF;
      END IF;
        
        --Comprobando que el correo electronico  no se duplique
      SELECT COUNT(*) INTO contador FROM tbl_CorreoElectronico  
      INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_CorreoElectronico.idPersona 
      INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
      INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario 
      WHERE  tbl_CorreoElectronico.correoElectronico = pc_correoElectronico;

      IF contador > 0 THEN
        SELECT tbl_Usuario.idUsuario INTO var2 FROM tbl_CorreoElectronico  
        INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_CorreoElectronico.idPersona 
        INNER JOIN tbl_Empleado ON tbl_Empleado.idPersona = tbl_Persona.idPersona
        INNER JOIN tbl_Usuario ON tbl_Usuario.idUsuario = tbl_Empleado.idUsuario 
        WHERE  tbl_CorreoElectronico.correoElectronico = pc_correoElectronico;

        IF var2 <> pn_idUsuario THEN
          RAISE NOTICE 'Valor unico en la tabla Correo Electronico ya existe ( % )', pc_correoElectronico;
          pcMensaje := 'El correo Electronico "'|| pc_correoElectronico ||'" ya esta siendo utilizado';
          RETURN;
        END IF;
      END IF;
      
      --Insertando la direccion:
      SELECT tbl_Direccion.idDireccion INTO auxiliarDireccion FROM tbl_Direccion
      INNER JOIN tbl_Persona ON tbl_Persona.idDireccion = tbl_Direccion.idDireccion 
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
      INNER JOIN tbl_Persona ON tbl_Persona.idPersona = tbl_CorreoElectronico.idPersona 
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
  SELECT public.funcion_actualizar_persona(
  '0801-1987-6751', 
  'Margarito', 
  'Addison', 
  'Xenos', 
  'Harrington', 
  '+504-9960-6230', 
  'diam.at@interdumNuncsollicitudin.ca', 
  'Francisco Morazán', 
  'DC', 
  'Nueva Capital', 
  'Sector 3', 
  'Casa 143', 
  2, 
  23
);
*/

/*Procedimiento Agregar Usuario*/
  CREATE OR REPLACE FUNCTION Funcion_Actualizar_Usuario(
    IN  pc_nombreUsuario  VARCHAR(45),
    IN  pc_userPassword   VARCHAR(45),
    IN  pc_imagenRuta     VARCHAR(45),

    IN pn_idUsuario     INTEGER,

    OUT pcMensaje       VARCHAR(45),
    OUT pbOcurreError     BOOLEAN
  )
  RETURNS RECORD AS
  $BODY$

    DECLARE
      contador    INTEGER DEFAULT 0;
      var2      INTEGER DEFAULT 0;
      temMensaje    VARCHAR(2000);
      auxiliarUsuario INTEGER DEFAULT 0;

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

/*Procedimiento Agragar Usuario Empleado*/
  CREATE OR REPLACE FUNCTION Funcion_Actualizar_Usuario_Empleado(
    IN pc_identidad      VARCHAR(45),
    IN pc_primerNombre     VARCHAR(45),
    IN pc_segundoNombre    VARCHAR(45), 
    IN pc_primerApellido   VARCHAR(45), 
    IN pc_segundoApellido    VARCHAR(45),
    IN pc_telefono       VARCHAR(45),
    IN pc_correoElectronico  VARCHAR(45),
    IN pc_departamento     VARCHAR(45),
    IN pc_municipio      VARCHAR(45),
    IN pc_colonia        VARCHAR(45),
    IN pc_sector       VARCHAR(45),
    IN pc_numeroCasa     VARCHAR(45),
    IN pn_genero       INTEGER,

    IN pc_nombreUsuario    VARCHAR(45),
    IN pc_userPassword     VARCHAR(45),
    IN pc_imagenRuta     VARCHAR(45),

    IN pd_fechaContratacion  DATE,
    IN pn_idCargo        INTEGER,
    IN pn_idEmpleadoSuperior INTEGER,
    IN pd_fechaPromocion   DATE,

    IN pn_idUsuario     INTEGER,

    OUT pcMensajeEmpleado    VARCHAR(45),
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

/*Procedimiento Agragar Usuario Cliente*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Usuario_Cliente(
    IN pc_identidad     VARCHAR(45),
    IN pc_primerNombre    VARCHAR(45),
    IN pc_segundoNombre   VARCHAR(45), 
    IN pc_primerApellido  VARCHAR(45), 
    IN pc_segundoApellido   VARCHAR(45),
    IN pc_telefono      VARCHAR(45),
    IN pc_correoElectronico VARCHAR(45),
    IN pc_departamento    VARCHAR(45),
    IN pc_municipio     VARCHAR(45),
    IN pc_colonia       VARCHAR(45),
    IN pc_sector      VARCHAR(45),
    IN pc_numeroCasa    VARCHAR(45),
    IN pn_genero      INTEGER,

    IN pc_nombreUsuario   VARCHAR(45),
    IN pc_userPassword    VARCHAR(45),
    IN pc_imagenRuta    VARCHAR(45),

    IN pc_rtn         VARCHAR(45),

    OUT pcMensajeCliente  VARCHAR(45),
    OUT pbOcurreErrorCliente BOOLEAN
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      contador        INTEGER DEFAULT 0;
      temMensaje        VARCHAR(2000);
      auxiliarUsuario     INTEGER DEFAULT 0;
      auxiliarCliente     INTEGER DEFAULT 0;
      auxiliarPersona     INTEGER DEFAULT 0;
      vb_ocurreErrorPersona   BOOLEAN;
      vc_mensajePersona     VARCHAR(2000);
      vb_ocurreErrorUsuario   BOOLEAN;
      vc_mensajeUsuario     VARCHAR(2000);
    BEGIN
      pbOcurreErrorCliente:=TRUE;
      temMensaje := '';

      --Comprobando que el rtn  no sea null:
      IF pc_rtn = '' OR pc_rtn IS NULL THEN
        RAISE NOTICE 'El rtn no  puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje, 'rtn, ');
      END IF;

      IF temMensaje<>'' THEN
        pcMensajeCliente := CONCAT('Campos requeridos para poder realizar la matrícula:',temMensaje);
        RETURN;
      END IF;

      --Comprobando que el rtn no se duplique
      SELECT COUNT(*) INTO contador FROM tbl_Cliente WHERE  tbl_Cliente.rtn = pc_rtn;
      IF contador > 0 THEN
        RAISE NOTICE 'Valor unico en la tabla Cliente ya existe ( % )', pc_rtn;
        pcMensajeCliente := 'El rtn "'|| pc_rtn ||'" ya existe';
        RETURN;
      END IF;

      -- Utilizando el procedimiento Funcion_Agregar_Persona:
      SELECT pbOcurreError, pcMensaje INTO vb_ocurreErrorPersona, vc_mensajePersona 
      FROM Funcion_Agregar_Persona(pc_identidad, pc_primerNombre, pc_segundoNombre, pc_primerApellido, pc_segundoApellido, 
      pc_telefono, pc_correoElectronico, pc_departamento, pc_municipio, pc_colonia, pc_sector, pc_numeroCasa,pn_genero);

      -- Verificando que el proceso Agregar Persona haya sido exitoso
      IF vb_ocurreErrorPersona = TRUE THEN
        pcMensajeCliente := vc_mensajePersona;
        RETURN;
      END IF;
      
      SELECT pbOcurreError, pcMensaje INTO vb_ocurreErrorUsuario, vc_mensajeUsuario 
      FROM Funcion_Agregar_Usuario(pc_nombreUsuario, pc_userPassword,pc_imagenRuta);

      -- Verificando que el proceso Agregar Usuario haya sido exitoso
      IF vb_ocurreErrorUsuario = TRUE THEN
        pcMensajeCliente := vc_mensajeUsuario;
        RETURN;
      END IF;

      -- Insertando cliente
      SELECT MAX(idCliente) INTO auxiliarCliente FROM tbl_Cliente; -- Obtener el id de cliente
      SELECT idPersona INTO auxiliarPersona FROM tbl_Persona WHERE tbl_Persona.identidad = pc_identidad; -- Obtener el id de Persona
      SELECT idUsuario INTO auxiliarUsuario FROM tbl_Usuario WHERE tbl_Usuario.nombreUsuario = pc_nombreUsuario; -- Obtener el id de Usuario
      

      INSERT INTO tbl_Cliente (idCliente, rtn, idPersona, idUsuario)
      VALUES (auxiliarCliente+1, pc_rtn, auxiliarPersona, auxiliarUsuario);

      pcMensajeCliente := 'Usuario cliente insertado con éxito';
      pbOcurreErrorCliente := FALSE;
      --COMMIT;
      RETURN;
    END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

/*Prueba de la función:
  SELECT * FROM Funcion_Agregar_Usuario_Cliente( '02154985344633', 'Fernando', 'Carlos', 'Contreras', 'Valladares',
'gsg12aa', 'adg14aaa1@asdf', 'FM', 'DC', 'Kenedy', 'sector uno', 'casa 4', 2, 'fercar', 'fercar', 'rutaFer', '4342');
*/

/*Procedimiento Agegar vehículo empresa*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Itinerario(
    IN pd_fechaEntrega    DATE,
    IN pd_fechaDevolucion DATE,

    OUT pbOcurreError     BOOLEAN,
    OUT pcMensaje     VARCHAR(2000),
    OUT pn_idItinerario   INTEGER
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje          VARCHAR(1000);
      contador            INTEGER DEFAULT 0;
    BEGIN
      pbOcurreError:=TRUE;
      temMensaje := '';

      /*----------------------Comprobaciones NULL------------------------*/
      --Comprobando que ela FechaEntrega no sea null:
      IF pd_fechaEntrega IS NULL THEN
        RAISE NOTICE 'La Fecha de entrega no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'Fecha de entrega, ');
      END IF;

      --Comprobando que ela FechaDevolucion no sea null:
      IF pd_fechaDevolucion IS NULL THEN
        RAISE NOTICE 'La Fecha de devolucion no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'Fecha de devolucion, ');
      END IF;

      IF temMensaje<>'' THEN
        pcMensaje := CONCAT('Campos requeridos para poder realizar la venta: ',temMensaje);
        RETURN;
      END IF;

      /*-------------------Insertando---------------------------*/

      SELECT MAX(idItinerario) INTO contador FROM tbl_Itinerario;
      contador:=contador+1;
      pn_idItinerario :=contador;
      INSERT INTO tbl_Itinerario(idItinerario, fechaReserva, fechaEntrega, fechaDevolucion)
      VALUES(contador, CURRENT_DATE, pd_fechaEntrega, pd_fechaDevolucion);

      /*-----------------Todo bien, todo correcto------------*/
      pcMensaje := 'Itinerario agregado con éxito';
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

/*
Probando la función:

*/

/*Procedimiento Agragar Persona*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Persona(
    IN pc_identidad     VARCHAR(45),
    IN pc_primerNombre    VARCHAR(45),
    IN pc_segundoNombre   VARCHAR(45), 
    IN pc_primerApellido  VARCHAR(45), 
    IN pc_segundoApellido   VARCHAR(45),
    IN pc_telefono      VARCHAR(45),
    IN pc_correoElectronico VARCHAR(45),
    IN pc_departamento    VARCHAR(45),
    IN pc_municipio     VARCHAR(45),
    IN pc_colonia       VARCHAR(45),
    IN pc_sector      VARCHAR(45),
    IN pc_numeroCasa    VARCHAR(45),
    IN pn_genero      INTEGER,
    OUT pcMensaje       VARCHAR(45),
    OUT pbOcurreError     BOOLEAN
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      contador      INTEGER DEFAULT 0;
      auxiliarDireccion   INTEGER DEFAULT 0;
      auxiliarPersona   INTEGER DEFAULT 0;
      auxiliarTelefono  INTEGER DEFAULT 0;
      auxiliarCorreo    INTEGER DEFAULT 0;
      temMensaje      VARCHAR(2000);

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
      SELECT COUNT(*) INTO contador FROM tbl_Persona WHERE  tbl_Persona.identidad = pc_identidad;
      IF contador > 0 THEN
        RAISE NOTICE 'Valor unico en la tabla Persona ya existe ( % )', pc_identidad;
        pcMensaje := 'La identidad "'|| pc_identidad ||'" ya esta siendo utilizado';
        RETURN;
      END IF;

      --Comprobando que el telefono no se duplique
      SELECT COUNT(*) INTO contador FROM tbl_Telefono WHERE  tbl_Telefono.telefono = pc_telefono;
      IF contador > 0 THEN
        RAISE NOTICE 'Valor unico en la tabla Telefono ya existe ( % )', pc_telefono;
        pcMensaje := 'El numero de telefono "'|| pc_telefono ||'" ya esta siendo utilizado';
        RETURN;
      END IF;
        
        --Comprobando que el correo electronico  no se duplique
      SELECT COUNT(*) INTO contador FROM tbl_CorreoElectronico  WHERE  tbl_CorreoElectronico.correoElectronico = pc_correoElectronico;
      IF contador > 0 THEN
        RAISE NOTICE 'Valor unico en la tabla Correo Electronico ya existe ( % )', pc_correoElectronico;
        pcMensaje := 'El correo Electronico "'|| pc_correoElectronico ||'" ya esta siendo utilizado';
        RETURN;
      END IF;
      
      --Insertando la direccion:
      SELECT MAX(idDireccion) INTO auxiliarDireccion FROM tbl_Direccion; --Obtener el idDireccion
      INSERT INTO tbl_Direccion(idDireccion, departamento, municipio, colonia, sector, numeroCasa)
      VALUES(auxiliarDireccion+1, pc_departamento, pc_municipio, pc_colonia, pc_sector, pc_numeroCasa);
      
      --Insertando persona:
      SELECT MAX(idPersona) INTO auxiliarPersona FROM tbl_Persona; --Obtener el idPersona 
      INSERT INTO tbl_Persona(idPersona, identidad, primerNombre, segundoNombre, primerApellido, segundoApellido, idDireccion, idGenero)
      VALUES(auxiliarPersona+1,pc_identidad,pc_primerNombre,pc_segundoNombre,pc_primerApellido,pc_segundoApellido, auxiliarDireccion+1, pn_genero);
      
      --Insertando telefono:
      SELECT MAX(idTelefono) INTO auxiliarTelefono FROM tbl_Telefono; --Obtener el idTelefono
      INSERT INTO tbl_Telefono(idTelefono, telefono, idPersona)
      VALUES(auxiliarTelefono+1, pc_telefono, auxiliarPersona+1);
      
      --Insertando correo:
      SELECT MAX(idCorreoElectronico) INTO auxiliarCorreo FROM tbl_CorreoElectronico; --Obtener el idCorreo
      INSERT INTO tbl_CorreoElectronico(idCorreoElectronico, correoElectronico, idPersona)
      VALUES(auxiliarCorreo+1, pc_correoElectronico, auxiliarPersona+1);
      
      pcMensaje := 'Persona insertada con éxito';
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

/*Procedimiento Agegar vehículo empresa*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Renta(
    IN pn_idFactura     INTEGER,
    IN pn_idVehiculo    INTEGER,

    IN pd_fechaEntrega    DATE,
    IN pd_fechaDevolucion DATE,
    IN pn_totalHoras    INTEGER,

    OUT pbOcurreError     BOOLEAN,
    OUT pcMensaje     VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje          VARCHAR(1000);
      contador            INTEGER DEFAULT 0;
      auxiliarVehiculo        BOOLEAN;

      pbOcurreErrorItinerario   BOOLEAN;
      pcMensajeItinerario     VARCHAR(2000);
      pn_idItinerario       INTEGER;

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

      --Comprobando que ela FechaEntrega no sea null:
      IF pd_fechaEntrega IS NULL THEN
        RAISE NOTICE 'La Fecha de entrega no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'Fecha de entrega, ');
      END IF;

      --Comprobando que ela FechaDevolucion no sea null:
      IF pd_fechaDevolucion IS NULL THEN
        RAISE NOTICE 'La Fecha de devolucion no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'Fecha de devolucion, ');
      END IF;

      --Comprobando que el total de horas no sea null:
      IF pn_totalHoras IS NULL THEN
        RAISE NOTICE 'El total de horas no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'Total horas, ');
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

      /*-------------------Insertando---------------------------*/

      SELECT * INTO pbOcurreErrorItinerario, pcMensajeItinerario, pn_idItinerario 
      FROM Funcion_Agregar_Itinerario(pd_fechaEntrega, pd_fechaDevolucion);
      IF pbOcurreErrorItinerario = TRUE THEN
        pcMensaje := pcMensajeItinerario;
        RETURN;
      END IF;

      
      INSERT INTO tbl_Renta(idFactura, idVehiculoEmpresa, anticipo, mora, totalHoras, idItinerario)
      VALUES(pn_idFactura, pn_idVehiculo,0,0,pn_totalHoras,pn_idItinerario);

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
  
*/

/*Procedimiento Agegar vehículo empresa*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Renta_Comodin(
    IN pn_idFactura     INTEGER,

    OUT pbOcurreError     BOOLEAN,
    OUT pcMensaje     VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje          VARCHAR(1000);
      contador            INTEGER DEFAULT 0;
    BEGIN
      pbOcurreError:=TRUE;
      temMensaje := '';

      /*----------------------Comprobaciones NULL------------------------*/
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
      SELECT COUNT(*) INTO contador FROM tbl_Factura WHERE idFactura = pn_idFactura;
      IF contador <> 1 THEN
        pcMensaje := 'La factura seleccionado no existe.';
        RETURN;
      END IF;

      /*-------------------Insertando---------------------------*/

      INSERT INTO tbl_Renta(idFactura, idVehiculoEmpresa, anticipo, mora, totalHoras, idItinerario)
      VALUES(pn_idFactura, 46,0,0,0,31);

      /*-----------------Todo bien, todo correcto------------*/
      pcMensaje := 'Comodín de renta exitoso';
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

/*Procedimiento Agregar Usuario*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Usuario(
    IN  pc_nombreUsuario  VARCHAR(45),
    IN  pc_userPassword   VARCHAR(45),
    IN  pc_imagenRuta     VARCHAR(45),

    OUT pcMensaje       VARCHAR(45),
    OUT pbOcurreError     BOOLEAN
  )
  RETURNS RECORD AS
  $BODY$

    DECLARE
      contador    INTEGER DEFAULT 0;
      temMensaje    VARCHAR(2000);
      auxiliarUsuario INTEGER DEFAULT 0;

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
      SELECT COUNT(*) INTO contador FROM tbl_Usuario WHERE  tbl_Usuario.nombreUsuario = pc_nombreUsuario;
      IF contador > 0 THEN
        RAISE NOTICE 'Valor unico en la tabla Usuario ya existe ( % )', pc_nombreUsuario;
        pcMensaje := 'El nombre de usUario "'|| pc_nombreUsuario ||'" ya existe';
        RETURN;
      END IF;

      -- Insertando usuario
      SELECT MAX(idUsuario) INTO auxiliarUsuario FROM tbl_Usuario; -- Obtener el id de usuario
      INSERT INTO tbl_Usuario (idUsuario, nombreUsuario, userPassword, imagenRuta)
      VALUES (auxiliarUsuario+1, pc_nombreUsuario,pc_userPassword, pc_imagenRuta);

      pcMensaje := 'Usuario insertado con éxito';
      pbOcurreError := FALSE;
      --COMMIT;
      RETURN;
    END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

/*Probando la función:
  SELECT Funcion_Agregar_Usuario('prueba', 'prueba', 'ruta2');
*/

/*Procedimiento Agragar Usuario Cliente*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Usuario_Cliente(
    IN pc_identidad     VARCHAR(45),
    IN pc_primerNombre    VARCHAR(45),
    IN pc_segundoNombre   VARCHAR(45), 
    IN pc_primerApellido  VARCHAR(45), 
    IN pc_segundoApellido   VARCHAR(45),
    IN pc_telefono      VARCHAR(45),
    IN pc_correoElectronico VARCHAR(45),
    IN pc_departamento    VARCHAR(45),
    IN pc_municipio     VARCHAR(45),
    IN pc_colonia       VARCHAR(45),
    IN pc_sector      VARCHAR(45),
    IN pc_numeroCasa    VARCHAR(45),
    IN pn_genero      INTEGER,

    IN pc_nombreUsuario   VARCHAR(45),
    IN pc_userPassword    VARCHAR(45),
    IN pc_imagenRuta    VARCHAR(45),

    IN pc_rtn         VARCHAR(45),

    OUT pcMensajeCliente  VARCHAR(45),
    OUT pbOcurreErrorCliente BOOLEAN
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      contador        INTEGER DEFAULT 0;
      temMensaje        VARCHAR(2000);
      auxiliarUsuario     INTEGER DEFAULT 0;
      auxiliarCliente     INTEGER DEFAULT 0;
      auxiliarPersona     INTEGER DEFAULT 0;
      vb_ocurreErrorPersona   BOOLEAN;
      vc_mensajePersona     VARCHAR(2000);
      vb_ocurreErrorUsuario   BOOLEAN;
      vc_mensajeUsuario     VARCHAR(2000);
    BEGIN
      pbOcurreErrorCliente:=TRUE;
      temMensaje := '';

      --Comprobando que el rtn  no sea null:
      IF pc_rtn = '' OR pc_rtn IS NULL THEN
        RAISE NOTICE 'El rtn no  puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje, 'rtn, ');
      END IF;

      IF temMensaje<>'' THEN
        pcMensajeCliente := CONCAT('Campos requeridos para poder realizar la matrícula:',temMensaje);
        RETURN;
      END IF;

      --Comprobando que el rtn no se duplique
      SELECT COUNT(*) INTO contador FROM tbl_Cliente WHERE  tbl_Cliente.rtn = pc_rtn;
      IF contador > 0 THEN
        RAISE NOTICE 'Valor unico en la tabla Cliente ya existe ( % )', pc_rtn;
        pcMensajeCliente := 'El rtn "'|| pc_rtn ||'" ya existe';
        RETURN;
      END IF;

      -- Utilizando el procedimiento Funcion_Agregar_Persona:
      SELECT pbOcurreError, pcMensaje INTO vb_ocurreErrorPersona, vc_mensajePersona 
      FROM Funcion_Agregar_Persona(pc_identidad, pc_primerNombre, pc_segundoNombre, pc_primerApellido, pc_segundoApellido, 
      pc_telefono, pc_correoElectronico, pc_departamento, pc_municipio, pc_colonia, pc_sector, pc_numeroCasa,pn_genero);

      -- Verificando que el proceso Agregar Persona haya sido exitoso
      IF vb_ocurreErrorPersona = TRUE THEN
        pcMensajeCliente := vc_mensajePersona;
        RETURN;
      END IF;
      
      SELECT pbOcurreError, pcMensaje INTO vb_ocurreErrorUsuario, vc_mensajeUsuario 
      FROM Funcion_Agregar_Usuario(pc_nombreUsuario, pc_userPassword,pc_imagenRuta);

      -- Verificando que el proceso Agregar Usuario haya sido exitoso
      IF vb_ocurreErrorUsuario = TRUE THEN
        pcMensajeCliente := vc_mensajeUsuario;
        RETURN;
      END IF;

      -- Insertando cliente
      SELECT MAX(idCliente) INTO auxiliarCliente FROM tbl_Cliente; -- Obtener el id de cliente
      SELECT idPersona INTO auxiliarPersona FROM tbl_Persona WHERE tbl_Persona.identidad = pc_identidad; -- Obtener el id de Persona
      SELECT idUsuario INTO auxiliarUsuario FROM tbl_Usuario WHERE tbl_Usuario.nombreUsuario = pc_nombreUsuario; -- Obtener el id de Usuario
      

      INSERT INTO tbl_Cliente (idCliente, rtn, idPersona, idUsuario)
      VALUES (auxiliarCliente+1, pc_rtn, auxiliarPersona, auxiliarUsuario);

      pcMensajeCliente := 'Usuario cliente insertado con éxito';
      pbOcurreErrorCliente := FALSE;
      --COMMIT;
      RETURN;
    END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

/*Prueba de la función:
  SELECT * FROM Funcion_Agregar_Usuario_Cliente( '02154985344633', 'Fernando', 'Carlos', 'Contreras', 'Valladares',
'gsg12aa', 'adg14aaa1@asdf', 'FM', 'DC', 'Kenedy', 'sector uno', 'casa 4', 2, 'fercar', 'fercar', 'rutaFer', '4342');
*/

/*Procedimiento Agragar Usuario Empleado*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Usuario_Empleado(
    IN pc_identidad      VARCHAR(45),
    IN pc_primerNombre     VARCHAR(45),
    IN pc_segundoNombre    VARCHAR(45), 
    IN pc_primerApellido   VARCHAR(45), 
    IN pc_segundoApellido    VARCHAR(45),
    IN pc_telefono       VARCHAR(45),
    IN pc_correoElectronico  VARCHAR(45),
    IN pc_departamento     VARCHAR(45),
    IN pc_municipio      VARCHAR(45),
    IN pc_colonia        VARCHAR(45),
    IN pc_sector       VARCHAR(45),
    IN pc_numeroCasa     VARCHAR(45),
    IN pn_genero       INTEGER,

    IN pc_nombreUsuario    VARCHAR(45),
    IN pc_userPassword     VARCHAR(45),
    IN pc_imagenRuta     VARCHAR(45),

    IN pd_fechaContratacion  DATE,
    IN pn_idCargo        INTEGER,
    IN pn_idEmpleadoSuperior INTEGER,
    IN pd_fechaPromocion   DATE,

    OUT pcMensajeEmpleado    VARCHAR(45),
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
      FROM Funcion_Agregar_Persona(pc_identidad, pc_primerNombre, pc_segundoNombre, pc_primerApellido, pc_segundoApellido, 
      pc_telefono, pc_correoElectronico, pc_departamento, pc_municipio, pc_colonia, pc_sector, pc_numeroCasa,pn_genero);

      -- Verificando que el proceso Agregar Persona haya sido exitoso
      IF vb_ocurreErrorPersona = TRUE THEN
        pcMensajeEmpleado := vc_mensajePersona;
        RETURN;
      END IF;
      
      SELECT pbOcurreError, pcMensaje INTO vb_ocurreErrorUsuario, vc_mensajeUsuario 
      FROM Funcion_Agregar_Usuario(pc_nombreUsuario, pc_userPassword,pc_imagenRuta);

      -- Verificando que el proceso Agregar Usuario haya sido exitoso
      IF vb_ocurreErrorUsuario = TRUE THEN
        pcMensajeEmpleado := vc_mensajeUsuario;
        RETURN;
      END IF;

      -- Insertando Empleado
      SELECT MAX(idEmpleado) INTO auxiliarEmpleado FROM tbl_Empleado; -- Obtener el id de empleado
      SELECT idPersona INTO auxiliarPersona FROM tbl_Persona WHERE tbl_Persona.identidad = pc_identidad; -- Obtener el id de Persona
      SELECT idUsuario INTO auxiliarUsuario FROM tbl_Usuario WHERE tbl_Usuario.nombreUsuario = pc_nombreUsuario; -- Obtener el id de Usuario
      

      INSERT INTO tbl_Empleado (idEmpleado, fechaContratacion, idPersona, idCargo, 
      idUsuario, idEmpleadoSuperior, fechaPromocion)
      VALUES (auxiliarEmpleado+1, pd_fechaContratacion, auxiliarPersona, pn_idCargo,
      auxiliarUsuario, pn_idEmpleadoSuperior, pd_fechaPromocion);

      pcMensajeEmpleado := 'Empleado insertado con éxito';
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

/*Procedimiento Agegar vehículo*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Vehiculo(
    IN pc_color       VARCHAR(45),
    IN pc_placa       VARCHAR(8),
    IN pc_anio        DATE,
    IN pc_generacion    VARCHAR(45),
    IN pc_serie_vin     VARCHAR(45),
    IN pn_tipoMotor     DECIMAL(10,2),
    IN pn_idMarca       INTEGER,
    IN pn_idTransmision   INTEGER,
    IN pn_idTipoGasolina  INTEGER,
    IN pn_idGarage      INTEGER,
    IN pn_idCilindraje    INTEGER,
    IN pn_idModelo      INTEGER,
    IN pn_idVersion     INTEGER,

    OUT pbOcurreError     BOOLEAN,
    OUT pcMensaje     VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje      VARCHAR(1000);
      contador        INTEGER DEFAULT 0;
      auxiliarVehiculo    INTEGER DEFAULT 0;
    BEGIN
      pbOcurreError:=TRUE;
      temMensaje := '';

      --Comprobando que el color no sea null:
      IF pc_color = '' OR pc_color IS NULL THEN
        RAISE NOTICE 'El color no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'color, ');
      END IF;

      --Comprobando que la placa no sea null:
      IF pc_placa = '' OR pc_placa IS NULL THEN
        RAISE NOTICE 'La placa no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'placa, ');
      END IF;

      --Comprobando que EL AÑO no sea null:
      IF pc_anio IS NULL THEN
        RAISE NOTICE 'El año no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'año, ');
      END IF;

      --Comprobando que la serie no sea null:
      IF pc_serie_vin = '' OR pc_serie_vin IS NULL THEN
        RAISE NOTICE 'La serie no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'serie, ');
      END IF;

      --Comprobando que el tipo de motor no sea null:
      IF pn_tipoMotor IS NULL THEN
        RAISE NOTICE 'El tamaño del motor no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'tipoMotor, ');
      END IF;

      --Comprobando que la marca no sea null:
      IF pn_idMarca IS NULL THEN
        RAISE NOTICE 'El marca no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'marca, ');
      END IF;

      --Comprobando que la transmision no sea null:
      IF pn_idTransmision IS NULL THEN
        RAISE NOTICE 'La transmision no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'transmision, ');
      END IF;

      --Comprobando que la gasolina no sea null:
      IF pn_idTipoGasolina IS NULL THEN
        RAISE NOTICE 'La gasolina no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'gasolina, ');
      END IF;

      --Comprobando que el garage no sea null:
      IF pn_idGarage IS NULL THEN
        RAISE NOTICE 'El garage no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'garage, ');
      END IF;

      --Comprobando que el cilindraje no sea null:
      IF pn_idCilindraje IS NULL THEN
        RAISE NOTICE 'El cilindraje no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'cilindraje, ');
      END IF;

      --Comprobando que el modelo no sea null:
      IF pn_idModelo IS NULL THEN
        RAISE NOTICE 'El modelo no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'modelo, ');
      END IF;

      --Comprobando que la version no sea null:
      IF pn_idVersion IS NULL THEN
        RAISE NOTICE 'la version no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'version, ');
      END IF;

      IF temMensaje<>'' THEN
        pcMensaje := CONCAT('Campos requeridos para poder realizar la matrícula:',temMensaje);
        RETURN;
      END IF;

      --Comprobando que la placa no se duplique
      SELECT COUNT(*) INTO contador FROM tbl_Vehiculo WHERE  tbl_Vehiculo.placa = pc_placa;
      IF contador > 0 THEN
        RAISE NOTICE 'Valor unico en la tabla Vehiculo ya existe ( % )', pc_placa;
        pcMensaje := 'La placa "'|| pc_placa ||'" ya existe';
        RETURN;
      END IF;

      -- Comprobando que la serie no se duplique
      SELECT COUNT(*) INTO contador FROM tbl_Vehiculo WHERE  tbl_Vehiculo.serie_vin = pc_serie_vin;
      IF contador > 0 THEN
        RAISE NOTICE 'Valor unico en la tabla Vehiculo ya existe ( % )', pc_serie_vin;
        pcMensaje := 'La serie "'|| pc_serie_vin ||'" ya existe';
        RETURN;
      END IF;
      
      -- Insertando:
      SELECT MAX(idVehiculo) INTO auxiliarVehiculo FROM tbl_Vehiculo; -- Obteniendo el idVehiculo
      INSERT INTO tbl_Vehiculo(idVehiculo, color, placa, anio,generacion, serie_vin, tipoMotor, idMarca, 
      idTransmision, idTipoGasolina, idGarage, idCilindraje, idModelo, idVersion)
      VALUES(auxiliarVehiculo+1, pc_color, pc_placa, pc_anio,pc_generacion, pc_serie_vin, pn_tipoMotor, pn_idMarca, 
      pn_idTransmision, pn_idTipoGasolina, pn_idGarage, pn_idCilindraje, pn_idModelo, pn_idVersion);

      pcMensaje := 'Vehiculo insertado con éxito';
      pbOcurreError := FALSE;
      --COMMIT;
      RETURN;
    END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

/*
Probando la función:
  SELECT Funcion_Agregar_Vehiculo('verde', 's5f7s5','2017-02-02','tercera generacion', 'a5as7sf4a54g5sg7s5g',1800,1,1,1,1,1,1,1);
*/

/*Procedimiento Agegar vehículo cliente*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Vehiculo_Cliente(
    IN pc_color       VARCHAR(45),
    IN pc_placa       VARCHAR(8),
    IN pc_anio        DATE,
    IN pc_generacion    VARCHAR(45),
    IN pc_serie_vin     VARCHAR(45),
    IN pn_tipoMotor     DECIMAL(10,2),
    IN pn_idMarca       INTEGER,
    IN pn_idTransmision   INTEGER,
    IN pn_idTipoGasolina  INTEGER,
    IN pn_idGarage      INTEGER,
    IN pn_idCilindraje    INTEGER,
    IN pn_idModelo      INTEGER,
    IN pn_idVersion     INTEGER,

    IN pn_clientePertence INTEGER,

    IN pc_rutaFoto      VARCHAR(100),

    OUT pbOcurreErrorCliente    BOOLEAN,
    OUT pcMensajeCliente      VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje      VARCHAR(1000);
      contador        INTEGER DEFAULT 0;
      auxiliarVehiculo    INTEGER DEFAULT 0;
      auxiliarVehiculo2     INTEGER DEFAULT 0;
      vb_OcurreErrorVehiculo  BOOLEAN;
      vc_MensajeVehiculo    VARCHAR(2000);
      auxiliarFoto      INTEGER DEFAULT 0;
    BEGIN
      pbOcurreErrorCliente:=TRUE;
      temMensaje := '';

      --Comprobando que la pn_clientePertence no sea null:
      IF pn_clientePertence IS NULL THEN
        RAISE NOTICE 'id cliente no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'idCliente, ');
      END IF;

      --Comprobando que la rutaFoto no sea null:
      IF pc_rutaFoto IS NULL OR pc_rutaFoto ='' THEN
        RAISE NOTICE 'La foto no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'rutaFoto, ');
      END IF;

      IF temMensaje<>'' THEN
        pcMensajeCliente := CONCAT('Campos requeridos para poder realizar la matrícula: ',temMensaje);
        RETURN;
      END IF;

      SELECT pbOcurreError,pcMensaje INTO vb_OcurreErrorVehiculo, vc_MensajeVehiculo
      FROM Funcion_Agregar_Vehiculo(pc_color,pc_placa,pc_anio,pc_generacion,pc_serie_vin,
      pn_tipoMotor,pn_idMarca,pn_idTransmision,pn_idTipoGasolina,pn_idGarage,pn_idCilindraje,pn_idModelo,pn_idVersion);
      
      -- Verificando que el proceso Agregar Vehiculo haya sido exitoso
      IF vb_OcurreErrorVehiculo = TRUE THEN
        pcMensajeCliente := vc_mensajeVehiculo;
        RETURN;
      END IF;

      -- Insertando:



      SELECT MAX(idVehiculoCliente) INTO auxiliarVehiculo FROM tbl_VehiculoCliente; -- Obteniendo el idVehiculoCliente
      SELECT idVehiculo INTO auxiliarVehiculo2 FROM tbl_Vehiculo WHERE placa = pc_placa; --Obteniendo el idVehiculo

      SELECT MAX(idFoto) INTO auxiliarFoto FROM tbl_Foto;
      INSERT INTO tbl_Foto(idFoto, rutaFoto, idVehiculo)
      VALUES(auxiliarFoto+1, pc_rutaFoto, auxiliarVehiculo2);

      INSERT INTO tbl_VehiculoCliente(idVehiculoCliente, fechaRegistro, idVehiculo, idClientePertenece)
      VALUES(auxiliarVehiculo+1, CURRENT_DATE, auxiliarVehiculo2,pn_clientePertence);

      pcMensajeCliente := 'Vehiculo Cliente insertado con éxito';
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

/*Procedimiento Agegar vehículo empresa*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Vehiculo_Empresa(
    IN pc_color       VARCHAR(45),
    IN pc_placa       VARCHAR(8),
    IN pc_anio        DATE,
    IN pc_generacion    VARCHAR(45),
    IN pc_serie_vin     VARCHAR(45),
    IN pn_tipoMotor     DECIMAL(10,2),
    IN pn_idMarca       INTEGER,
    IN pn_idTransmision   INTEGER,
    IN pn_idTipoGasolina  INTEGER,
    IN pn_idGarage      INTEGER,
    IN pn_idCilindraje    INTEGER,
    IN pn_idModelo      INTEGER,
    IN pn_idVersion     INTEGER,

    IN pd_fechaAdquisicion  DATE,
    IN pn_montoAsegurado  DECIMAL(10,2),
    IN pn_idEstado      INTEGER,
    IN pn_precioVenta   DECIMAL(10,2),
    IN pn_precioRenta   DECIMAL(10,2),
    IN pb_seVende     BOOLEAN,
    IN pb_seRenta     BOOLEAN,
    IN pc_estadoMatricula VARCHAR(1),
    IN pn_montoMatricula  DECIMAL(10,2),

    IN pc_rutaFoto      VARCHAR(100),

    OUT pbOcurreErrorEmpresa    BOOLEAN,
    OUT pcMensajeEmpresa      VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje      VARCHAR(1000);
      contador        INTEGER DEFAULT 0;
      auxiliarVehiculo    INTEGER DEFAULT 0;
      auxiliarVehiculo2     INTEGER DEFAULT 0;
      vb_OcurreErrorVehiculo  BOOLEAN;
      vc_MensajeVehiculo    VARCHAR(2000);
      auxiliarSeguro    INTEGER DEFAULT 0;
      auxiliarFoto      INTEGER DEFAULT 0;
    BEGIN
      pbOcurreErrorEmpresa:=TRUE;
      temMensaje := '';

      --Comprobando que la pd_fechaAdquisicion no sea null:
      IF pd_fechaAdquisicion IS NULL THEN
        RAISE NOTICE 'la FECHA DE ADQUISICION no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'fecha adquisicion, ');
      END IF;

      --Comprobando que la pn_montoAsegurado no sea null:
      IF pn_montoAsegurado IS NULL THEN
        RAISE NOTICE 'Seguro no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'idSeguro, ');
      END IF;

      --Comprobando que la pn_idEstado no sea null:
      IF pn_idEstado IS NULL THEN
        RAISE NOTICE 'id estado no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'idEstado, ');
      END IF;

      --Comprobando que la pn_precioVenta no sea null:
      IF pn_precioVenta IS NULL THEN
        RAISE NOTICE 'precioVenta no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'precioVenta, ');
      END IF;

      --Comprobando que la pn_precioRenta no sea null:
      IF pn_precioRenta IS NULL THEN
        RAISE NOTICE 'precioRenta no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'precioRenta, ');
      END IF;

      --Comprobando que la pb_seVende no sea null:
      IF pb_seVende IS NULL THEN
        RAISE NOTICE 'seVende no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'seVende, ');
      END IF;

      --Comprobando que la pb_seRenta no sea null:
      IF pb_seRenta IS NULL THEN
        RAISE NOTICE 'seRenta no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'seRenta, ');
      END IF;

      --Comprobando que la pc_estadoMatricula no sea null:
      IF pc_estadoMatricula IS NULL THEN
        RAISE NOTICE 'estadoMatricula no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'estadoMatricula, ');
      END IF;

      --Comprobando que la pn_montoMatricula no sea null:
      IF pn_montoMatricula IS NULL THEN
        RAISE NOTICE 'montoMatricula no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'montoMatricula, ');
      END IF;

      --Comprobando que la rutaFoto no sea null:
      IF pc_rutaFoto IS NULL OR pc_rutaFoto ='' THEN
        RAISE NOTICE 'La foto no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'rutaFoto, ');
      END IF;

      IF temMensaje<>'' THEN
        pcMensajeEmpresa := CONCAT('Campos requeridos para poder realizar la matrícula:',temMensaje);
        RETURN;
      END IF;

      SELECT pbOcurreError,pcMensaje INTO vb_OcurreErrorVehiculo, vc_MensajeVehiculo
      FROM Funcion_Agregar_Vehiculo(pc_color,pc_placa,pc_anio,pc_generacion,pc_serie_vin,
      pn_tipoMotor,pn_idMarca,pn_idTransmision,pn_idTipoGasolina,pn_idGarage,pn_idCilindraje,pn_idModelo,pn_idVersion);
      
      -- Verificando que el proceso Agregar Vehiculo haya sido exitoso
      IF vb_OcurreErrorVehiculo = TRUE THEN
        pcMensajeEmpresa := vc_mensajeVehiculo;
        RETURN;
      END IF;

      -- Insertando:
      SELECT MAX(idSeguro) INTO auxiliarSeguro FROM tbl_Seguro;
      INSERT INTO tbl_Seguro (idSeguro, estado, descripcion, montoAsegurado, fechaInicio, fechaFin)
      VALUES(auxiliarSeguro+1, 'A', 'Seguro Completo', pn_montoAsegurado, '2017/01/01', '2020/01/01');

      SELECT MAX(idVehiculoEmpresa) INTO auxiliarVehiculo FROM tbl_VehiculoEmpresa; -- Obteniendo el idVehiculoEmpresa
      SELECT idVehiculo INTO auxiliarVehiculo2 FROM tbl_Vehiculo WHERE placa = pc_placa; --Obteniendo el idVehiculo

      SELECT MAX(idFoto) INTO auxiliarFoto FROM tbl_Foto;
      INSERT INTO tbl_Foto(idFoto, rutaFoto, idVehiculo)
      VALUES(auxiliarFoto+1, pc_rutaFoto, auxiliarVehiculo2);

      INSERT INTO tbl_VehiculoEmpresa(idVehiculoEmpresa, fechaAdquisicion, idVehiculo, idSeguro, idEstado, 
      precioVenta, precioRentaHora, seVende, seRenta, estadoMatricula, montoMatricula)
      VALUES(auxiliarVehiculo+1, pd_fechaAdquisicion, auxiliarVehiculo2,auxiliarSeguro+1, pn_idEstado, 
      pn_precioVenta, pn_precioRenta, pb_seVende, pb_seRenta, pc_estadoMatricula, pn_montoMatricula);

      pcMensajeEmpresa := 'Vehiculo Empresa insertado con éxito';
      pbOcurreErrorEmpresa := FALSE;
      --COMMIT;
      RETURN;
    END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

/*
Probando la función:
  SELECT Funcion_Agregar_Vehiculo_Empresa('verde', 'a1fsf','2017-02-02','tercera generacion', 
  'a1g1s4gs2g45s2g2s',1800,1,1,1,1,1,1,1, '2017-02-02',1,1,600000,0,TRUE,FALSE,'P', 20000)S
*/

/*Procedimiento Agegar vehículo empresa*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Venta(
    IN pn_idFactura     INTEGER,
    IN pn_idVehiculo    INTEGER,

    OUT pbOcurreError     BOOLEAN,
    OUT pcMensaje     VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje          VARCHAR(1000);
      contador            INTEGER DEFAULT 0;
      auxiliarVehiculo        BOOLEAN;
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

/*Procedimiento Agegar vehículo empresa*/
  CREATE OR REPLACE FUNCTION Funcion_Agregar_Venta_Comodin(
    IN pn_idFactura     INTEGER,

    OUT pbOcurreError     BOOLEAN,
    OUT pcMensaje     VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje          VARCHAR(1000);
      contador            INTEGER DEFAULT 0;
    BEGIN
      pbOcurreError:=TRUE;
      temMensaje := '';

      /*----------------------Comprobaciones NULL------------------------*/
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


      SELECT COUNT(*) INTO contador FROM tbl_Factura WHERE idFactura = pn_idFactura;
      IF contador <> 1 THEN
        pcMensaje := 'La factura seleccionado no existe.';
        RETURN;
      END IF;

      /*-------------------Insertando---------------------------*/

      INSERT INTO tbl_Venta(idFactura, idVehiculoEmpresa)
      VALUES(pn_idFactura, 46);

      /*-----------------Todo bien, todo correcto------------*/
      pcMensaje := 'Comodín de renta exitoso';
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

/*Procedimiento Login*/
  CREATE OR REPLACE FUNCTION Funcion_Login(
    IN pc_usuario     VARCHAR(45),
    IN pc_userPassword  VARCHAR(45),
    OUT pcMensaje     VARCHAR(2000),
    OUT pbOcurreError   BOOLEAN
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje      VARCHAR(1000);
      vn_existeUsuario  INTEGER DEFAULT 0;
      vn_existePassword   INTEGER DEFAULT 0;

    BEGIN
      pbOcurreError:=TRUE;
      temMensaje := '';
      --Comprobando que el nombre de usuario no sea null:
      IF pc_usuario = '' OR pc_usuario IS NULL THEN
        RAISE NOTICE 'El nombre de usuario no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'usuario, ');
      END IF;

      --Comprobando que la contraseña no sea null:
      IF pc_userPassword = '' OR pc_userPassword IS NULL THEN
        RAISE NOTICE 'La contraseña no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'contraseña, ');
      END IF;

      IF temMensaje<>'' THEN
        pcMensaje := CONCAT('Campos requeridos para poder realizar la matrícula:',temMensaje);
        RETURN;
      END IF;

      SELECT COUNT(*) INTO vn_existeUsuario FROM tbl_Usuario
      INNER JOIN tbl_Empleado ON tbl_Empleado.idUsuario = tbl_Usuario.idUsuario
      WHERE tbl_Usuario.nombreUsuario = pc_usuario;

      IF vn_existeUsuario = 0 THEN
        pcMensaje := CONCAT('No existe el usuario ',pc_usuario);
        RETURN;
      END IF;

      IF vn_existeUsuario = 1 THEN
        SELECT COUNT(*) INTO vn_existePassword FROM tbl_Usuario
        INNER JOIN tbl_Empleado ON tbl_Empleado.idUsuario = tbl_Usuario.idUsuario
        WHERE tbl_Usuario.nombreUsuario = pc_usuario AND tbl_Usuario.userPassword = pc_userPassword;

        IF vn_existePassword <> 1 THEN
          pcMensaje := 'Password incorrecta';
          RETURN;
        END IF;
      END IF;

      IF vn_existeUsuario = 1 AND vn_existePassword = 1 THEN
        pcMensaje := 'Usuario y contraseña correctos';
        pbOcurreError:=FALSE;
        RETURN;
      END IF;
    END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  /*Procedimiento Login*/
  CREATE OR REPLACE FUNCTION Funcion_Login_Cliente(
    IN pc_usuario     VARCHAR(45),
    IN pc_userPassword  VARCHAR(45),
    OUT pcMensaje     VARCHAR(2000),
    OUT pbOcurreError   BOOLEAN
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje      VARCHAR(1000);
      vn_existeUsuario  INTEGER DEFAULT 0;
      vn_existePassword   INTEGER DEFAULT 0;

    BEGIN
      pbOcurreError:=TRUE;
      temMensaje := '';
      --Comprobando que el nombre de usuario no sea null:
      IF pc_usuario = '' OR pc_usuario IS NULL THEN
        RAISE NOTICE 'El nombre de usuario no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'usuario, ');
      END IF;

      --Comprobando que la contraseña no sea null:
      IF pc_userPassword = '' OR pc_userPassword IS NULL THEN
        RAISE NOTICE 'La contraseña no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje,'contraseña, ');
      END IF;

      IF temMensaje<>'' THEN
        pcMensaje := CONCAT('Campos requeridos para poder realizar la matrícula:',temMensaje);
        RETURN;
      END IF;

      SELECT COUNT(*) INTO vn_existeUsuario FROM tbl_Usuario
      INNER JOIN tbl_Cliente ON tbl_Cliente.idUsuario = tbl_Usuario.idUsuario
      WHERE tbl_Usuario.nombreUsuario = pc_usuario;

      IF vn_existeUsuario = 0 THEN
        pcMensaje := CONCAT('No existe el usuario ',pc_usuario);
        RETURN;
      END IF;

      IF vn_existeUsuario = 1 THEN
        SELECT COUNT(*) INTO vn_existePassword FROM tbl_Usuario
        INNER JOIN tbl_Cliente ON tbl_Cliente.idUsuario = tbl_Usuario.idUsuario
        WHERE tbl_Usuario.nombreUsuario = pc_usuario AND tbl_Usuario.userPassword = pc_userPassword;

        IF vn_existePassword <> 1 THEN
          pcMensaje := 'Password incorrecta';
          RETURN;
        END IF;
      END IF;

      IF vn_existeUsuario = 1 AND vn_existePassword = 1 THEN
        pcMensaje := 'Usuario y contraseña correctos';
        pbOcurreError:=FALSE;
        RETURN;
      END IF;
    END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

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

/*
Probando la función:
  SELECT Funcion_Agregar_Vehiculo_Cliente('verde', '131315','2017-02-02','tercera generacion', 
                'a5as7sf4a54g5s7s5g',1800,1,1,1,1,1,1,1, '2017-02-02',1);
*/

/*Procedimiento Agegar vehículo empresa*/
  CREATE OR REPLACE FUNCTION Funcion_Pagar_Mantenimiento(
    IN pn_idMantenimiento INTEGER,
    IN pn_idUsuario     INTEGER,
    IN pn_idDescuento   INTEGER,
    IN pn_idFormaPago   INTEGER,

    OUT pbOcurreError     BOOLEAN,
    OUT pcMensaje     VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje      VARCHAR(1000);
      contador        INTEGER DEFAULT 0;
      auxiliarVehiculo    BOOLEAN;
      auxiliarEmpleado    INTEGER DEFAULT 0;
      auxiliarFactura   INTEGER DEFAULT 0;
      auxiliarMonto   INTEGER DEFAULT 0;
      auxiliarCliente   INTEGER DEFAULT 0;
      pc_auxiliarDescuento  VARCHAR(1);
      pn_auxiliarDescuento  INTEGER DEFAULT 0;
      pcMensajeVenta      VARCHAR(2000);
      pbOcurreErrorVenta    BOOLEAN;
      pcMensajeRenta      VARCHAR(2000);
      pbOcurreErrorRenta    BOOLEAN;
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

      UPDATE tbl_Mantenimiento SET estado = 'P' WHERE idMantenimiento = pn_idMantenimiento;

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

/*Procedimiento Agegar vehículo empresa*/
  CREATE OR REPLACE FUNCTION Funcion_Pagar_Renta(
    IN pn_idVehiculo    INTEGER,
    IN pn_idCliente     INTEGER,
    IN pn_idUsuario     INTEGER,
    IN pn_idDescuento   INTEGER,
    IN pn_idFormaPago   INTEGER,

    IN pd_fechaEntrega    DATE,
    IN pd_fechaDevolucion DATE,
    IN pn_totalHoras    INTEGER,

    OUT pbOcurreError     BOOLEAN,
    OUT pcMensaje     VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje          VARCHAR(1000);
      contador            INTEGER DEFAULT 0;
      auxiliarVehiculo        BOOLEAN;
      auxiliarEmpleado        INTEGER DEFAULT 0;
      auxiliarFactura       INTEGER DEFAULT 0;
      auxiliarMonto       INTEGER DEFAULT 0;
      solicitudComodin      INTEGER DEFAULT 31;
      vehiculoEmpresaComodin    INTEGER DEFAULT 46;
      vehiculoClienteComodin    INTEGER DEFAULT 16;
      tipoMantenimientoComodin  INTEGER DEFAULT 16;
      pc_auxiliarDescuento    VARCHAR(1);
      pn_auxiliarDescuento    DECIMAL(10,2);

      itinerarioComodin     INTEGER DEFAULT 31;
      pbOcurreErrorVenta      BOOLEAN;
      pcMensajeVenta        VARCHAR(2000);

      pbOcurreErrorRenta      BOOLEAN;
      pcMensajeRenta        VARCHAR(2000);

      pbOcurreErrorMantenimiento  BOOLEAN;
      pcMensajeMantenimiento    VARCHAR(2000);
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

/*Procedimiento Agegar vehículo empresa*/
  CREATE OR REPLACE FUNCTION Funcion_Pagar_Venta(
    IN pn_idVehiculo    INTEGER,
    IN pn_idCliente     INTEGER,
    IN pn_idUsuario     INTEGER,
    IN pn_idDescuento   INTEGER,
    IN pn_idFormaPago   INTEGER,

    OUT pbOcurreError     BOOLEAN,
    OUT pcMensaje     VARCHAR(2000)
  )
  RETURNS RECORD AS
  $BODY$
    DECLARE
      temMensaje          VARCHAR(1000);
      contador            INTEGER DEFAULT 0;
      auxiliarVehiculo        BOOLEAN;
      auxiliarEmpleado        INTEGER DEFAULT 0;
      auxiliarFactura       INTEGER DEFAULT 0;
      auxiliarMonto       INTEGER DEFAULT 0;
      solicitudComodin      INTEGER DEFAULT 31;
      vehiculoEmpresaComodin    INTEGER DEFAULT 46;
      vehiculoClienteComodin    INTEGER DEFAULT 16;
      tipoMantenimientoComodin  INTEGER DEFAULT 16;
      pc_auxiliarDescuento    VARCHAR(1);
      pn_auxiliarDescuento    DECIMAL(10,2);

      itinerarioComodin     INTEGER DEFAULT 31;
      pbOcurreErrorVenta      BOOLEAN;
      pcMensajeVenta        VARCHAR(2000);

      pbOcurreErrorRenta      BOOLEAN;
      pcMensajeRenta        VARCHAR(2000);

      pbOcurreErrorMantenimiento  BOOLEAN;
      pcMensajeMantenimiento    VARCHAR(2000);
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
      SELECT * INTO pbOcurreErrorVenta, pcMensajeVenta
      FROM Funcion_Agregar_Venta(auxiliarFactura, pn_idVehiculo);

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

      --Procedimiento almacenado de insertar comodín de mantenimiento:
      SELECT * INTO pbOcurreErrorMantenimiento, pcMensajeMantenimiento
      FROM Funcion_Agregar_Mantenimiento_Comodin(auxiliarFactura);

      IF pbOcurreErrorMantenimiento = TRUE THEN
        pcMensaje := pcMensajeMantenimiento;
        RETURN;
      END IF;

      /*SELECT total INTO auxiliarMonto FROM vv_detalle_factura 
      WHERE idFactura = auxiliarFactura;*/
      SELECT CAST((tbl_VehiculoEmpresa.precioVenta-(tbl_VehiculoEmpresa.precioVenta*tbl_Descuento.valor/100)
        +(tbl_VehiculoEmpresa.precioVenta*tbl_Impuesto.porcentaje/100)) 
        AS DECIMAL (10,2)) INTO auxiliarMonto FROM tbl_VehiculoEmpresa
      INNER JOIN tbl_Venta ON tbl_Venta.idVehiculoEmpresa = tbl_VehiculoEmpresa.idVehiculoEmpresa
      INNER JOIN tbl_Factura ON tbl_Factura.idFactura = tbl_Venta.idFactura
      INNER JOIN tbl_DescuentoPorFactura ON tbl_DescuentoPorFactura.idFactura = tbl_Factura.idFactura
      INNER JOIN tbl_Descuento ON tbl_Descuento.idDescuento = tbl_DescuentoPorFactura.idDescuento
      INNER JOIN tbl_Impuesto ON tbl_Impuesto.idImpuesto = tbl_Factura.idImpuesto
      WHERE tbl_VehiculoEmpresa.idVehiculoEmpresa = pn_idVehiculo
      GROUP BY  tbl_VehiculoEmpresa.precioVenta, tbl_Descuento.valor, tbl_Impuesto.porcentaje;

      INSERT INTO tbl_FormaPagoPorFactura(idFactura, idFormaPago, monto)
      VALUES(auxiliarFactura, pn_idFormaPago, auxiliarMonto);

      UPDATE tbl_VehiculoEmpresa SET vendido = TRUE
      WHERE idVehiculoEmpresa = pn_idVehiculo;

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
  SELECT public.funcion_pagar_venta(
  6, 
  5, 
  23, 
  1, 
  1
);
*/

CREATE OR REPLACE FUNCTION public.funcion_solicitud_mantenimiento(
  IN pn_vehiculo    integer,
  IN pn_empleado    integer,
  OUT pcMensaje     VARCHAR(1000),
  OUT pbOcurreerror   boolean
)
    RETURNS RECORD AS 
  $BODY$
    DECLARE
      temMensaje      VARCHAR(1000);
      contador        INTEGER DEFAULT 0;
          auxiliarVehiculo    INTEGER DEFAULT 0;
    BEGIN
      pbOcurreError:=TRUE;
      temMensaje := '';

      --Comprobando que el rtn  no sea null:
      IF  pn_vehiculo IS NULL THEN
        RAISE NOTICE 'El Vehiculo np puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje, 'Vehiculo, ');
      END IF;

          IF  pn_empleado IS NULL THEN
        RAISE NOTICE 'El Empleado  no puede ser un campo vacío';
        temMensaje := CONCAT(temMensaje, 'Vehiculo, ');
      END IF;

      IF temMensaje<>'' THEN
        pcMensaje := CONCAT('Campos requeridos para poder realizar la Solicitud:',temMensaje);
        RETURN;
      END IF;

      SELECT COUNT(*) INTO contador FROM tbl_VehiculoCliente WHERE  tbl_VehiculoCliente.idVehiculoCliente = pn_Vehiculo;
      IF contador = 0 THEN
        RAISE NOTICE 'No existe el vehículo ( % )', pn_Vehiculo;
        pcMensaje := 'El Vehiculo "'|| pn_Vehiculo ||'" no existe';
        RETURN;
      END IF;

          SELECT COUNT(*) INTO contador FROM tbl_Empleado WHERE  tbl_Empleado.idEmpleado = pn_Empleado;
      IF contador = 0 THEN
        RAISE NOTICE 'No existe el empleado( % )', pn_Empleado;
        pcMensaje := 'El Empleado "'|| pn_Empleado ||'" no existe';
        RETURN;
      END IF;

      SELECT MAX(idSolicitudMantenimiento) INTO auxiliarVehiculo FROM tbl_SolicitudMantenimiento; -- Obteniendo el idVehiculo
      
      INSERT INTO tbl_SolicitudMantenimiento(idsolicitudMantenimiento,fechaSolicitud,estado,observacion,idempleado,idVehiculoCliente)
      VALUES(auxiliarVehiculo+1,CURRENT_DATE,'P','Ninguna',pn_Empleado,pn_Vehiculo);

      pcMensaje:= 'Solicitud insertado con éxito';
      pbOcurreError:= FALSE;

      RETURN;
    END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
