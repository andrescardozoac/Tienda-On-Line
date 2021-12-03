-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd_tiendaonline
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_tiendaonline
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_tiendaonline` DEFAULT CHARACTER SET latin1 ;
USE `bd_tiendaonline` ;

-- -----------------------------------------------------
-- Table `bd_tiendaonline`.`clasificacion_pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_tiendaonline`.`clasificacion_pelicula` (
  `Codigo_CP` VARCHAR(10) NOT NULL,
  `Nombre_CP` VARCHAR(30) NOT NULL,
  `Estado_CP` CHAR(3) NULL DEFAULT 'HAB',
  PRIMARY KEY (`Codigo_CP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bd_tiendaonline`.`genero_pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_tiendaonline`.`genero_pelicula` (
  `Codigo_MP` VARCHAR(10) NOT NULL,
  `Nombre_MP` VARCHAR(30) NOT NULL,
  `Estado_MP` CHAR(3) NULL DEFAULT 'HAB',
  PRIMARY KEY (`Codigo_MP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bd_tiendaonline`.`pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_tiendaonline`.`pelicula` (
  `Codigo_P` VARCHAR(10) NOT NULL,
  `Codigo_CP` VARCHAR(10) NOT NULL,
  `Codigo_MP` VARCHAR(10) NOT NULL,
  `Titulo_P` VARCHAR(100) NOT NULL,
  `Descripcion_P` VARCHAR(300) NOT NULL,
  `Precio_P` DECIMAL(10,0) NOT NULL,
  `Stock_P` INT(11) NULL DEFAULT 0,
  `Imagen_P` VARCHAR(100) NULL DEFAULT NULL,
  `Estado_P` CHAR(3) NULL DEFAULT 'HAB',
  PRIMARY KEY (`Codigo_P`),
  INDEX `FK_Codigo_CP` (`Codigo_CP` ASC) VISIBLE,
  INDEX `FK_Codigo_MP` (`Codigo_MP` ASC) VISIBLE,
  CONSTRAINT `FK_Codigo_CP`
    FOREIGN KEY (`Codigo_CP`)
    REFERENCES `bd_tiendaonline`.`clasificacion_pelicula` (`Codigo_CP`),
  CONSTRAINT `FK_Codigo_MP`
    FOREIGN KEY (`Codigo_MP`)
    REFERENCES `bd_tiendaonline`.`genero_pelicula` (`Codigo_MP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bd_tiendaonline`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_tiendaonline`.`usuario` (
  `Codigo_U` VARCHAR(10) NOT NULL,
  `Nombres_U` VARCHAR(50) NOT NULL,
  `Apellidos_U` VARCHAR(50) NOT NULL,
  `Dni_U` CHAR(10) NOT NULL,
  `Email_U` VARCHAR(50) NOT NULL,
  `Direccion1_U` VARCHAR(50) NOT NULL,
  `Telefono_U` VARCHAR(10) NOT NULL,
  `Id_U` VARCHAR(30) NOT NULL,
  `Clave_U` VARCHAR(20) NOT NULL,
  `Tipo_U` VARCHAR(15) NOT NULL,
  `Estado_U` CHAR(3) NULL DEFAULT 'INH',
  PRIMARY KEY (`Codigo_U`),
  UNIQUE INDEX `U_Id_U` (`Id_U` ASC) VISIBLE,
  UNIQUE INDEX `U_Dni_U` (`Dni_U` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bd_tiendaonline`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_tiendaonline`.`venta` (
  `Codigo_V` VARCHAR(20) NOT NULL,
  `Codigo_U` VARCHAR(10) NOT NULL,
  `Total` DECIMAL(10,0) NOT NULL,
  `Fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(),
  `Modo_Pago` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Codigo_V`),
  INDEX `FK_Codigo_U` (`Codigo_U` ASC) VISIBLE,
  CONSTRAINT `FK_Codigo_U`
    FOREIGN KEY (`Codigo_U`)
    REFERENCES `bd_tiendaonline`.`usuario` (`Codigo_U`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bd_tiendaonline`.`detalle_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_tiendaonline`.`detalle_venta` (
  `Codigo_V` VARCHAR(20) NOT NULL,
  `Codigo_P` VARCHAR(10) NOT NULL,
  `Precio` DECIMAL(10,2) NOT NULL,
  `Cantidad` DECIMAL(10,2) NOT NULL,
  `Descuento` DECIMAL(10,2) NOT NULL,
  `SubTotal` DECIMAL(10,2) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  INDEX `FK_Codigo_V` (`Codigo_V` ASC) VISIBLE,
  INDEX `FK_Codigo_P` (`Codigo_P` ASC) VISIBLE,
  CONSTRAINT `FK_Codigo_P`
    FOREIGN KEY (`Codigo_P`)
    REFERENCES `bd_tiendaonline`.`pelicula` (`Codigo_P`),
  CONSTRAINT `FK_Codigo_V`
    FOREIGN KEY (`Codigo_V`)
    REFERENCES `bd_tiendaonline`.`venta` (`Codigo_V`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bd_tiendaonline`.`tienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_tiendaonline`.`tienda` (
  `codTienda` VARCHAR(10) NOT NULL,
  `nombreTienda` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`codTienda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `bd_tiendaonline` ;

-- -----------------------------------------------------
-- procedure BUSCAR_PELICULA_CODIGO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_PELICULA_CODIGO`(IN CCodigo_P varchar(10))
BEGIN
	SELECT P.Codigo_P, CP.Nombre_CP, MP.Nombre_MP, P.Titulo_P ,P.Descripcion_P, P.Precio_P, P.Imagen_P, P.Estado_P FROM PELICULA P
	INNER JOIN clasificacion_pelicula CP ON CP.Codigo_CP = P.Codigo_CP
	INNER JOIN genero_pelicula MP ON MP.Codigo_MP = P.Codigo_MP
	WHERE P.Codigo_P = CCodigo_P and P.Estado_P = 'HAB' ORDER BY cp.Nombre_CP ASC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ELIMINAR_CLASIFICACION_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_CLASIFICACION_PELICULA`(
	IN CCodigo_CP VARCHAR(10)
)
begin
	update CLASIFICACION_PELICULA set Estado_CP='INH' where Codigo_CP=UPPER(CCodigo_CP);
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ELIMINAR_DETALLE_VENTA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_DETALLE_VENTA`(
	IN CCodigo_V VARCHAR(10)
)
BEGIN
	DELETE FROM DETALLE_VENTA WHERE Codigo_V = CCodigo_V;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ELIMINAR_GENERO_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_GENERO_PELICULA`(
	IN CCodigo_MP VARCHAR(10)
)
begin
	update GENERO_PELICULA set Estado_MP='INH' where Codigo_MP=CCodigo_MP;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ELIMINAR_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_PELICULA`(
	IN CCodigo_P VARCHAR(10)
)
begin
	update PELICULA set Estado_P='INH' where Codigo_P=CCodigo_P;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ELIMINAR_USUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_USUARIO`(
	IN CCodigo_U VARCHAR(10)
)
begin
	update USUARIO set Estado_U='INH' where Codigo_U=CCodigo_U;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ELIMINAR_VENTA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_VENTA`(
	IN CCodigo_V VARCHAR(10)
)
BEGIN
	DELETE FROM DETALLE_VENTA WHERE DETALLE_VENTA.Codigo_V=CCodigo_V;
    DELETE FROM VENTA WHERE VENTA.Codigo_V=CCodigo_V;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ENTREGAR_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ENTREGAR_PELICULA`(
	IN CCodigo_P VARCHAR(10),
    IN CCodigo_V VARCHAR(10)
)
begin
	update DETALLE_VENTA set Estado ='ENTREGADA' where Codigo_P=CCodigo_P and Codigo_V = CCodigo_V;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure LOGEAR_USUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `LOGEAR_USUARIO`(
	IN IId_U VARCHAR(30)
)
begin
	select Codigo_U,Id_U,Clave_U,Estado_U from USUARIO
    where Id_U = IId_U;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MODIFICAR_CLASIFICACION_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_CLASIFICACION_PELICULA`(
	IN CCodigo_CP VARCHAR(10), 
    IN NNombre_CP VARCHAR(30)
)
begin
	update CLASIFICACION_PELICULA set Nombre_CP=UPPER(NNombre_CP) where Codigo_CP=UPPER(CCodigo_CP);
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MODIFICAR_CLAVE_USUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_CLAVE_USUARIO`(
	IN CCodigo_U VARCHAR(10),
	IN CClave_U VARCHAR(20)
)
begin
	update USUARIO set Clave_U=CClave_U where Codigo_U=CCodigo_U;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MODIFICAR_EMAIL_USUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_EMAIL_USUARIO`(
	IN CCodigo_U VARCHAR(10),
	IN EEmail_U VARCHAR(50)
)
begin
	update USUARIO set Email_U=EEmail_U where Codigo_U=CCodigo_U;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MODIFICAR_GENERO_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_GENERO_PELICULA`(
	IN CCodigo_MP VARCHAR(10), 
    IN NNombre_MP VARCHAR(30)
)
begin
	update GENERO_PELICULA set Nombre_MP=UPPER(NNombre_MP) where Codigo_MP=CCodigo_MP;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MODIFICAR_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_PELICULA`(
	IN CCodigo_P VARCHAR(10),
 	IN NNombre_CP VARCHAR(30),
	IN NNombre_MP VARCHAR(30), 
    IN TTitulo_P VARCHAR(100),
    IN DDescripcion_P VARCHAR(300),
    IN PPrecio_P DECIMAL(10,0),
    IN IImagen_P VARCHAR(50)
)
begin
	declare CCodigo_CP varchar(10);
    declare CCodigo_MP varchar(10);
    
    set CCodigo_CP = (SELECT Codigo_CP FROM clasificacion_pelicula where Nombre_CP = NNombre_CP);
    set CCodigo_MP = (SELECT Codigo_MP FROM genero_pelicula where Nombre_MP = NNombre_MP);

	update PELICULA set Codigo_CP=UPPER(CCodigo_CP), Codigo_MP=UPPER(CCodigo_MP), Titulo_P=UPPER(TTitulo_P),Descripcion_P=UPPER(DDescripcion_P), Precio_P=UPPER(PPrecio_P), Imagen_P=IImagen_P where Codigo_P=UPPER(CCodigo_P);
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MODIFICAR_USUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_USUARIO`(
	IN CCodigo_U VARCHAR(10),
	IN NNombres_U VARCHAR(50),
    IN AApellidos_U VARCHAR(50),
    IN DDni_U CHAR(10),
    IN DDireccion1_U VARCHAR(50),
    IN TTelefono_U VARCHAR(10)
)
begin
	update USUARIO set Nombres_U=UPPER(NNombres_U), Apellidos_U=UPPER(AApellidos_U), Dni_U=UPPER(DDni_U), Direccion1_U=UPPER(DDireccion1_U), Telefono_U=TTelefono_U where Codigo_U=UPPER(CCodigo_U);
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_CLASIFICACION_PELICULAS_HABILITADAS
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CLASIFICACION_PELICULAS_HABILITADAS`()
BEGIN
	SELECT * FROM CLASIFICACION_PELICULA
    WHERE Estado_CP = 'HAB'
    ORDER BY Nombre_CP ASC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_CLASIFICACION_PELICULAS_INHABILITADAS
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CLASIFICACION_PELICULAS_INHABILITADAS`()
BEGIN
	SELECT * FROM CLASIFICACION_PELICULA
    WHERE Estado_CP = 'INH'
    ORDER BY Nombre_CP ASC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_CODIGO_CLASIFICACION_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_CLASIFICACION_PELICULA`()
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_CP) from CLASIFICACION_PELICULA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('CP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('CP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('CP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('CP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'CP0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_CP FROM CLASIFICACION_PELICULA;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_CODIGO_GENERO_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_GENERO_PELICULA`()
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_MP) from GENERO_PELICULA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('MP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('MP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('MP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('MP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'MP0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_MP FROM GENERO_PELICULA;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_CODIGO_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_PELICULA`()
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_P) from PELICULA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('P000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('P00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('P0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('P'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'P0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_P FROM PELICULA;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_CODIGO_USUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_USUARIO`()
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_U) from USUARIO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('U000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('U00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('U0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('U'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'U0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_U FROM USUARIO;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_CODIGO_VENTA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_CODIGO_VENTA`()
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_V) from VENTA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('V000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('V00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('V0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('V'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'V0001');
	end if;
    
    SELECT MAX(CCodigo) AS Codigo_V FROM VENTA;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_DATOS_TIENDA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_DATOS_TIENDA`()
BEGIN
    SELECT * FROM TIENDA;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_DETALLE_VENTA_POR_CODIGO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_DETALLE_VENTA_POR_CODIGO`(IN CCodigo_V VARCHAR(10))
BEGIN
	SELECT dv.Codigo_V, CONCAT(p.Titulo_P,' - ',m.Nombre_MP,' ',c.Nombre_CP) as Pelicula, dv.Precio, dv.Cantidad, dv.Descuento, dv.SubTotal
    FROM DETALLE_VENTA dv
    INNER JOIN PELICULA p ON p.Codigo_P = dv.Codigo_P
    INNER JOIN CLASIFICACION_PELICULA c ON c.Codigo_CP = p.Codigo_CP
    INNER JOIN GENERO_PELICULA m ON m.Codigo_MP = p.Codigo_MP
    WHERE dv.Codigo_V = CCodigo_V;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_GENERO_PELICULAS_HABILITADAS
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_GENERO_PELICULAS_HABILITADAS`()
begin
	SELECT * FROM GENERO_PELICULA
    where Estado_MP = 'HAB'
    ORDER BY Nombre_MP ASC;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_GENERO_PELICULAS_INHABILITADAS
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_GENERO_PELICULAS_INHABILITADAS`()
begin
	SELECT * FROM GENERO_PELICULA
    where Estado_MP = 'INH'
    ORDER BY Nombre_MP ASC;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_PELICULAS_ALQUILADAS
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_PELICULAS_ALQUILADAS`()
BEGIN
	SELECT dv.Codigo_V, dv.Codigo_P, CONCAT(p.Titulo_P,' - ',m.Nombre_MP,' ',c.Nombre_CP) as Pelicula, dv.Precio, dv.Cantidad, dv.Descuento, dv.SubTotal, dv.Estado, u.Dni_U as Codigo_U, concat(u.Nombres_U, " ",Apellidos_U) as Usuario
    FROM DETALLE_VENTA dv
    INNER JOIN PELICULA p ON p.Codigo_P = dv.Codigo_P
    INNER JOIN CLASIFICACION_PELICULA c ON c.Codigo_CP = p.Codigo_CP
    INNER JOIN GENERO_PELICULA m ON m.Codigo_MP = p.Codigo_MP
    INNER JOIN VENTA v ON  v.Codigo_V = dv.Codigo_V
    INNER JOIN USUARIO U ON u.Codigo_U = v.Codigo_U
    WHERE dv.ESTADO = "ALQUILADA";
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_PELICULAS_ALQUILADAS_USUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_PELICULAS_ALQUILADAS_USUARIO`(CCODIGO_U varchar(10))
BEGIN
	SELECT dv.Codigo_V, dv.Codigo_P, CONCAT(p.Titulo_P,' - ',m.Nombre_MP,' ',c.Nombre_CP) as Pelicula, dv.Precio, dv.Cantidad, dv.Descuento, dv.SubTotal, dv.Estado, u.Dni_U as Codigo_U, concat(u.Nombres_U, " ",Apellidos_U) as Usuario
    FROM DETALLE_VENTA dv
    INNER JOIN PELICULA p ON p.Codigo_P = dv.Codigo_P
    INNER JOIN CLASIFICACION_PELICULA c ON c.Codigo_CP = p.Codigo_CP
    INNER JOIN GENERO_PELICULA m ON m.Codigo_MP = p.Codigo_MP
    INNER JOIN VENTA v ON  v.Codigo_V = dv.Codigo_V
    INNER JOIN USUARIO U ON u.Codigo_U = v.Codigo_U and u.Codigo_U = CCODIGO_U
    WHERE dv.ESTADO = "ALQUILADA";
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_PELICULAS_ELIMINADAS
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_PELICULAS_ELIMINADAS`()
BEGIN
	SELECT P.Codigo_P, CP.Nombre_CP as Clase_P, MP.Nombre_MP as Marca_P, P.Titulo_P, P.Descripcion_P, P.Precio_P, P.Imagen_P, P.Estado_P FROM PELICULA P
	INNER JOIN clasificacion_pelicula CP ON CP.Codigo_CP = P.Codigo_CP
	INNER JOIN genero_pelicula MP ON MP.Codigo_MP = P.Codigo_MP
	WHERE P.Estado_P = 'INH' ORDER BY cp.Nombre_CP ASC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_PELICULAS_HABILITADAS
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_PELICULAS_HABILITADAS`()
BEGIN
	SELECT P.Codigo_P, CP.Nombre_CP as Clase_P, MP.Nombre_MP as Marca_P, P.Titulo_P, P.Descripcion_P, P.Precio_P, P.Imagen_P, P.Estado_P FROM PELICULA P
	INNER JOIN clasificacion_pelicula CP ON CP.Codigo_CP = P.Codigo_CP
	INNER JOIN genero_pelicula MP ON MP.Codigo_MP = P.Codigo_MP
	WHERE P.Estado_P = 'HAB' and CP.Estado_CP = 'HAB' and MP.Estado_MP = 'HAB' ORDER BY P.Titulo_P ASC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_PELICULAS_MAS_PEDIDAS
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_PELICULAS_MAS_PEDIDAS`()
BEGIN
SELECT P.Codigo_P as Codigo ,P.Titulo_P as Titulo, CP.Nombre_CP as Clasificacion, MP.Nombre_MP as Genero ,P.Descripcion_P as Sinopsis, P.Estado_P as Estado, count(P.Codigo_P) Cantidad 
FROM bd_tiendaonline.detalle_venta dv
INNER JOIN PELICULA P ON dv.Codigo_P = P.Codigo_P
INNER JOIN clasificacion_pelicula CP ON CP.Codigo_CP = P.Codigo_CP
INNER JOIN genero_pelicula MP ON MP.Codigo_MP = P.Codigo_MP
group by(P.Codigo_P)  ORDER BY Cantidad DESC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_USUARIOS_CLIENTES_HABILITADOS
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_USUARIOS_CLIENTES_HABILITADOS`()
begin
	select Codigo_U,Nombres_U,Apellidos_U,Dni_U,Email_U,Telefono_U,Id_U,Tipo_U,Estado_U from USUARIO
    where Tipo_U LIKE 'CLIENTE' and Estado_U = 'HAB'
    order by Nombres_U asc;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_USUARIOS_CLIENTES_INHABILITADOS
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_USUARIOS_CLIENTES_INHABILITADOS`()
begin
	select Codigo_U,Nombres_U,Apellidos_U,Dni_U,Email_U,Telefono_U,Id_U,Tipo_U,Estado_U from USUARIO
    where Tipo_U LIKE 'CLIENTE' and Estado_U = 'INH'
    order by Nombres_U asc;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_USUARIO_POR_CODIGO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_USUARIO_POR_CODIGO`(
	IN CCodigo_U VARCHAR(10)
)
begin
	select * from USUARIO
    where Codigo_U = CCodigo_U;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_VENTA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_VENTA`()
BEGIN
	SELECT Codigo_V, USUARIO.Codigo_U, concat(USUARIO.Nombres_U,', ', USUARIO.Apellidos_U) AS Cliente, Total, DATE_FORMAT(Fecha,'%d/%m/%Y a las %H:%i:%s horas') AS Fecha, Modo_Pago  FROM VENTA
    INNER JOIN USUARIO ON USUARIO.Codigo_U = VENTA.Codigo_U 
    ORDER BY Total desc;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_VENTAS_MES
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_VENTAS_MES`(FFECHA VARCHAR(10))
BEGIN
SELECT Codigo_V, USUARIO.Codigo_U, concat(USUARIO.Nombres_U,', ', USUARIO.Apellidos_U) AS Cliente, Total, DATE_FORMAT(Fecha,'%d/%m/%Y a las %H:%i:%s horas') AS Fecha, Modo_Pago  FROM VENTA
    INNER JOIN USUARIO ON USUARIO.Codigo_U = VENTA.Codigo_U 
    WHERE DATE_FORMAT(Fecha,'%m/%Y')  = FFECHA ORDER BY fecha asc;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_VENTA_MES_MAYOR
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_VENTA_MES_MAYOR`()
BEGIN
	SELECT DATE_FORMAT(Fecha,'%m/%Y') as Fecha, sum(total) as Total
	FROM Venta
	GROUP BY EXTRACT(YEAR_MONTH FROM fecha) order by fecha desc;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure MOSTRAR_VENTA_MES_MENOR
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_VENTA_MES_MENOR`()
BEGIN
SELECT DATE_FORMAT(Fecha,'%m/%Y') as Fecha, sum(total) as Total
FROM Venta
GROUP BY EXTRACT(YEAR_MONTH FROM fecha) order by fecha asc;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RECUPERAR_CLASIFIACION_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_CLASIFIACION_PELICULA`(
	IN CCodigo_CP VARCHAR(10)
)
begin
	update CLASIFICACION_PELICULA set Estado_CP='HAB' where Codigo_CP=UPPER(CCodigo_CP);
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RECUPERAR_GENERO_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_GENERO_PELICULA`(
	IN CCodigo_MP VARCHAR(10)
)
begin
	update GENERO_PELICULA set Estado_MP='HAB' where Codigo_MP=CCodigo_MP;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RECUPERAR_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_PELICULA`(
	IN CCodigo_P VARCHAR(10)
)
begin
	update PELICULA set Estado_P='HAB' where Codigo_P=CCodigo_P;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RECUPERAR_USUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RECUPERAR_USUARIO`(
	IN CCodigo_U VARCHAR(10)
)
begin
	update USUARIO set Estado_U='HAB' where Codigo_U=CCodigo_U;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure REGISTRAR_CLASIFICACION_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_CLASIFICACION_PELICULA`(
	IN NNombre_CP VARCHAR(30)
)
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_CP) from CLASIFICACION_PELICULA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('CP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('CP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('CP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('CP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'CP0001');
	end if;
    
    if not exists (select Codigo_CP,Nombre_CP,Estado_CP from CLASIFICACION_PELICULA where Codigo_CP=CCodigo or Nombre_CP=NNombre_CP and (Estado_CP='HAB' or Estado_CP='INH')) then
		insert into CLASIFICACION_PELICULA(Codigo_CP,Nombre_CP) values (UPPER(CCodigo) ,UPPER(NNombre_CP));
	end if;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure REGISTRAR_DETALLE_VENTA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_DETALLE_VENTA`(
	IN CCodigo_V VARCHAR(10),
    IN NNombre_P VARCHAR(100),
    IN PPrecio DECIMAL(10,2),
	IN CCantidad DECIMAL(10,2),
    IN DDescuento DECIMAL(10,2),
    IN SSubTotal DECIMAL(10,2)
)
BEGIN
	declare CCodigo_P varchar(10);
    
    set CCodigo_P = (SELECT Codigo_P FROM PELICULA P
    INNER JOIN clasificacion_pelicula CP ON CP.Codigo_CP = P.Codigo_CP
    INNER JOIN genero_pelicula MP ON MP.Codigo_MP = P.Codigo_MP
    WHERE P.Titulo_P = NNombre_P);
    
    INSERT INTO DETALLE_VENTA(Codigo_V, Codigo_P, Precio, Cantidad, Descuento, SubTotal, Estado) VALUES(UPPER(CCodigo_V),UPPER(CCodigo_P),PPrecio,CCantidad,DDescuento,SSubTotal,"ALQUILADA");
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure REGISTRAR_GENERO_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_GENERO_PELICULA`(
	IN NNombre_MP VARCHAR(30)
)
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_MP) from GENERO_PELICULA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('MP000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('MP00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('MP0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('MP'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'MP0001');
	end if;
    
    if not exists (select Codigo_MP,Nombre_MP,Estado_MP from GENERO_PELICULA where Codigo_MP=CCodigo or Nombre_MP=NNombre_MP and (Estado_MP='HAB' or Estado_MP='INH')) then
		insert into GENERO_PELICULA(Codigo_MP,Nombre_MP) values (UPPER(CCodigo) ,UPPER(NNombre_MP));
	end if;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure REGISTRAR_PELICULA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PELICULA`(
	IN NNombre_CP VARCHAR(30), 
	IN NNombre_MP VARCHAR(30),
    IN TTitulo_P VARCHAR(100),
    IN DDescripcion_P VARCHAR(300),
    IN PPrecio_P DECIMAL(10,0),
    IN IImagen_P VARCHAR(50)
)
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
    
    declare CCodigo_CP varchar(30);
    declare CCodigo_MP varchar(30);
	
    set max = (select MAX(Codigo_P) from PELICULA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('P000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('P00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('P0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('P'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'P0001');
	end if;
    
    set CCodigo_CP = (SELECT Codigo_CP FROM clasificacion_pelicula where Nombre_CP = NNombre_CP);
    set CCodigo_MP = (SELECT Codigo_MP FROM genero_pelicula where Nombre_MP = NNombre_MP);
    
    
    if not exists (select Codigo_P,Codigo_CP,Codigo_MP, Titulo_P, Descripcion_P,Precio_P,Estado_P from PELICULA
    where Codigo_P=CCodigo or Codigo_CP=CCodigo_CP and Codigo_MP = CCodigo_MP and Titulo_P = TTitulo_P and Descripcion_P = DDescripcion_P and Precio_P=PPrecio_P and (Estado_P='HAB' or Estado_P='INH')) then
		insert into PELICULA(Codigo_P, Codigo_CP, Codigo_MP, Titulo_P, Descripcion_P, Precio_P, Imagen_P) values (UPPER(CCodigo) ,UPPER(CCodigo_CP), UPPER(CCodigo_MP), UPPER(TTitulo_P), UPPER(DDescripcion_P), UPPER(PPrecio_P), IImagen_P);
	end if;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure REGISTRAR_TIENDA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_TIENDA`(IN `CCODIGO_T` VARCHAR(10), IN `CCODIGON_T` VARCHAR(10), IN `NNOMBRE_T` VARCHAR(100), IN `DDIRECCION_T` VARCHAR(200))
BEGIN
	
    if not exists (select codTienda from TIENDA where codTienda = CCODIGO_T ) then
		insert into TIENDA (CodTienda,NombreTienda,direccion) 
        values (UPPER(CCODIGON_T),UPPER(NNOMBRE_T),UPPER(DDIRECCION_T));
        else
        update TIENDA set Codtienda = UPPER(CCODIGON_T), nombreTienda = UPPER(NNOMBRE_T), direccion = UPPER(DDIRECCION_T) where codTienda = CCODIGO_T;
	end if;
    
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure REGISTRAR_USUARIO
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_USUARIO`(IN `NNombres_U` VARCHAR(50), IN `AApellidos_U` VARCHAR(50), IN `DDni_U` CHAR(10), IN `EEmail_U` VARCHAR(50), IN `DDireccion1_U` VARCHAR(50), IN `TTelefono_U` VARCHAR(10), IN `IId_U` VARCHAR(30), IN `CClave_U` VARCHAR(20), IN `TTIPO_U` VARCHAR(15))
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_U) from USUARIO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('U000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('U00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('U0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('U'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'U0001');
	end if;
    
    if not exists (select Id_U,Email_U from USUARIO where Id_U = IId_U and Email_U=EEmail_U) then
		insert into USUARIO(Codigo_U,Nombres_U,Apellidos_U,Dni_U,Email_U,Direccion1_U,Telefono_U,Id_U,Clave_U,Tipo_U,Estado_U) 
        values (UPPER(CCodigo),UPPER(NNombres_U),UPPER(AApellidos_U),DDni_U,EEmail_U,UPPER(DDireccion1_U),TTelefono_U,IId_U,CClave_U,UPPER(TTIPO_U),'HAB');
	end if;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure REGISTRAR_USUARIO_CLIENTE
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_USUARIO_CLIENTE`(
	IN NNombres_U VARCHAR(50),
    IN AApellidos_U VARCHAR(50),
    IN DDni_U CHAR(10),
    IN EEmail_U VARCHAR(50),
    IN DDireccion1_U VARCHAR(50),
    IN TTelefono_U VARCHAR(10),
    IN IId_U VARCHAR(30),
    IN CClave_U VARCHAR(20)
)
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
	
    set max = (select MAX(Codigo_U) from USUARIO);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('U000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('U00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('U0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('U'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'U0001');
	end if;
    
    if not exists (select Id_U,Email_U from USUARIO where Id_U = IId_U and Email_U=EEmail_U) then
		insert into USUARIO(Codigo_U,Nombres_U,Apellidos_U,Dni_U,Email_U,Direccion1_U,Telefono_U,Id_U,Clave_U,Tipo_U,Estado_U) 
        values (UPPER(CCodigo),UPPER(NNombres_U),UPPER(AApellidos_U),DDni_U,EEmail_U,UPPER(DDireccion1_U),TTelefono_U,IId_U,CClave_U,'CLIENTE','HAB');
	end if;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure REGISTRAR_VENTA
-- -----------------------------------------------------

DELIMITER $$
USE `bd_tiendaonline`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_VENTA`(
	IN NNombre_U VARCHAR(100),
    IN TTotal DECIMAL(10,2),
    IN VMODOPAGO VARCHAR(20)
)
BEGIN
	declare max varchar(10);
	declare num int;
	declare CCodigo varchar(10);
    
    declare CCodigo_U varchar(10);
	
    set max = (select MAX(Codigo_V) from VENTA);
	set num = (SELECT LTRIM(RIGHT(max,4)));
	if num>=1 and num <=8 then
		set num = num + 1;
		set CCodigo = (select concat('V000'  ,  CAST(num as CHAR)));
	elseif num>=9 and num <=98 then
		set num = num + 1;
		set CCodigo = (select concat('V00'  ,  CAST(num as CHAR)));
	elseif num>=99 and num <=998 then
		set num = num + 1;
		set CCodigo = (select concat('V0'  ,  CAST(num as CHAR)));
	elseif num>=999 and num <=9998 then
		set num = num + 1;
		set CCodigo = (select concat('V'  ,  CAST(num as CHAR)));
	else 
		set CCodigo=(select 'V0001');
	end if;
    
    set CCodigo_U = (SELECT Codigo_U FROM USUARIO WHERE concat(Nombres_U,', ',Apellidos_U)=NNombre_U);
    
    if not exists (select Codigo_V from VENTA where Codigo_V = CCodigo) then
		insert into VENTA(Codigo_V, Codigo_U, Total, Modo_Pago ) values (UPPER(CCodigo), UPPER(CCodigo_U), TTotal, VMODOPAGO );
	end if;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
